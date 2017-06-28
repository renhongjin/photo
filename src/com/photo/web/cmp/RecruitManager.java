package com.photo.web.cmp;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.photo.bean.DeliverStatus;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Deliver;
import com.photo.bean.mapper.Personal;
import com.photo.bean.mapper.Recruit;
import com.photo.bean.mapper.Resume;
import com.photo.bean.view.DeliverRecordInfo;
import com.photo.service.ICmpService;
import com.photo.service.IRecruitService;
import com.photo.service.IResumeService;
import com.photo.service.IUserService;
import com.photo.utils.DateUtils;
import com.photo.utils.Page;
import com.photo.utils.PageUtils;
import com.photo.utils.PhotoWebUtils;
import com.photo.utils.StringUtils;
import com.photo.utils.UUIDUtils;

/**
 * 招聘管理
 * @author lenovo
 *
 */
@Controller
@RequestMapping("/recruit")
public class RecruitManager{
  private static Log log = LogFactory.getLog(RecruitManager.class);
  
  @Resource(name = "userService")
  private IUserService userService;
  
  @Resource(name = "recruitService")
  private IRecruitService recruitService;
  
  @Resource(name = "cmpService")
  private ICmpService cmpService;
  
  @Resource(name = "resumeService")
  private IResumeService resumeService; 
  /**
   * 职位预览
   */
  @RequestMapping(value = "/preview")
  public ModelAndView preview(Recruit recruit,HttpSession session){
    ModelAndView mv = new ModelAndView();
    if(recruit.getId() == null){
      //刚刚添加的时候
      Date now = new Date();
      recruit.setAddDay(DateUtils.getDay(now));
      recruit.setAddTime(DateUtils.getTime(now));
      recruit.setScanTime(0);
      recruit.setDeliverTimes(0);
    }else{
      //已经发布的招聘信息
      recruit =  recruitService.getById(recruit.getId());
    }
    mv.addObject("recruit",recruit);
    Company cmp = userService.getCurrentCmp(session);
    if(cmp != null){
      mv.addObject("cmp",cmp);
    }else{
      log.error("在预览发布职位的时候未发现登录的企业用户");
    }
    mv.setViewName("recruit/preview");
    return mv;
  }

  /**
   * 到发布页面
   */
  @RequestMapping(value = "/topublish")
  public String toPublish(){
    return "recruit/publish";
  }
  
  @RequestMapping(value = "/changeStatus")
  @ResponseBody
  public Map<String,String> changeDeliverStatus(String recordId,Integer status){
    Map<String,String> result = new HashMap<String,String>();
    try{
      if(!StringUtils.notNullAndEmpty(recordId)){
        result.put("flag","fail");
        result.put("msg","不存在的投递记录");
      }
      if(status == DeliverStatus.NOT_MATCH){
        //不匹配
        
      }else if(status == DeliverStatus.NOTICE_INTERVIEW){
        //TODO 通知面试 发送短信或者邮件等
        
      }
      recruitService.updateDeliverRecordState(recordId,status);
      result.put("flag","success");
    }catch(Exception e){
      log.error("[修改投递记录状态]错误e:"+e);
    }
    return result;
  }
  
  /**
   * 投递职位
   * @param recruitId
   * @param session
   * @return
   */
  @RequestMapping(value = "/deliver")
  @ResponseBody
  public Map<String,String> deliver(String recruitId,HttpSession session){
    Map<String,String> result = new HashMap<String,String>();
    if(!StringUtils.notNullAndEmpty(recruitId)){
      result.put("flag","fail");
    }
    Personal personal = userService.getCurrentPerson(session);
    Recruit recruit = recruitService.getById(recruitId);
    if(recruit == null){
      result.put("flag","fail");
      result.put("msg","不存在的招聘职位");
    }else{
      Deliver deliver = new Deliver();
      Date now = new Date();
      deliver.setCmpId(recruit.getCmpId());
      deliver.setCreateDay(DateUtils.getDay(now));
      deliver.setCreateTime(DateUtils.getTime(now));
      deliver.setCreateTimeLong(now.getTime()+"");
      deliver.setId(UUIDUtils.next());
      deliver.setPersonalId(personal.getId());
      deliver.setRecruitId(recruitId);
      deliver.setStatus(new Integer(0));
      recruitService.deliver(deliver);
      //增加职位的投递次数
      recruitService.addSendTime(recruitId);
      result.put("flag","success");
    }
    return result;
  }
  /**
   * 获取求职申请
   * @return
   */
  @RequestMapping(value = "/getdeliverList")
  public ModelAndView getdeliverList(HttpSession session,HttpServletRequest request){
    ModelAndView mv = new ModelAndView("company/deliverList");
    Company cmp = userService.getCurrentCmp(session);
    Map<String,Object> params = new HashMap<String,Object>();
    params.put("cmpId",cmp.getId());
    
    Integer status = new Integer(-1);//默认查询全部
    try{
      status = Integer.valueOf(request.getParameter("status"));
    }catch(Exception e){}
    if(status != null && status != -1){
      params.put("status",status);
    }
    int num = recruitService.selectDeliverCount(params);
    Page page = PageUtils.getPage(request,num);//分页对象
    //分页参数
    params.put("pageIndex",PageUtils.getPageIndex(page));
    params.put("pageNum",page.getPageNum());
    List<Deliver> deliverRecords = recruitService.selectDeliver(params);
    List<DeliverRecordInfo> dris = new ArrayList<DeliverRecordInfo>();
    for(Deliver deliverRecord:deliverRecords){
      //封装信息
      DeliverRecordInfo dri = new DeliverRecordInfo();
      String deliverTime = deliverRecord.getCreateDay() + " " + deliverRecord.getCreateTime();
      String personId = deliverRecord.getPersonalId();
      Resume resume = resumeService.getByPersonalId(personId);
      String personName = resume.getName();
      String idealJobName = resume.getIdealJob();
      String idealPlace = resume.getIdealPlace();
      String resumeId = resume.getId();
      
      String recruitId = deliverRecord.getRecruitId();
      Recruit recruit = recruitService.getById(recruitId);
      String recruitName = recruit.getJobName();
      
      dri.setDeliverTime(deliverTime);
      dri.setIdealJobName(idealJobName);
      dri.setIdealPlace(idealPlace);
      dri.setResumeId(resumeId);
      dri.setPersonName(personName);
      dri.setRecruitId(recruitId);
      dri.setRecruitName(recruitName);
      dri.setState(deliverRecord.getStatus());
      dri.setId(deliverRecord.getId());
      
      dris.add(dri);
    }
    mv.addObject("deliverList",dris);
    mv.addObject("page",page);
    PhotoWebUtils.deliever(request);
    return mv;
  }
  /**
   * 到管理置顶页面
   */
  @RequestMapping(value = "/toTop")
  public ModelAndView toTop(HttpSession session){
    ModelAndView mv = new ModelAndView("company/top");
    Company cmp = userService.getCurrentCmp(session);
    List<Recruit> recruits = recruitService.getRecruitsByCmpId(cmp.getId());
    mv.addObject("recruits",recruits);
    return mv;
  }
  
  /**
   * 返回到招聘页面
   * @return
   */
  @RequestMapping(value = "/toRecruitPage")
  public ModelAndView toRecruitPage(String recruitId){
    ModelAndView mv = new ModelAndView("recruit/recruitmentPage");
    Recruit recruit = recruitService.getById(recruitId);
    String cmpId = recruit.getCmpId();
    Company cmp = cmpService.getById(cmpId);
    mv.addObject("cmp",cmp);
    mv.addObject("recruit",recruit);
    //TODO 这里可以考虑插入浏览者的信息 暂时只是简单的增加次数
    recruitService.addScanTime(recruitId);
    return mv;
  }
  /**
   * 更新职位的状态
   */
  @RequestMapping(value = "/updateRecruit")
  @ResponseBody
  public Map<String,String> updateRecruit(String recruitId,Integer statues){
    Map<String,String> result = new HashMap<String,String>();
    if(!StringUtils.notNullAndEmpty(recruitId)){
      result.put("flag","fail");
      return result;
    }
    recruitService.updateRecruitStatues(recruitId,statues);
    result.put("flag","success");
    return result;
  }
  /**
   * 发布职位
   */
  @RequestMapping(value = "/publish")
  @ResponseBody
  public Map<String,String> publish(Recruit recruit,HttpSession session,HttpServletRequest request){
    String cmpId = null;
    Map<String,String> result = new HashMap<String,String>();
    try{
      PhotoWebUtils.deliever(request);
      Company cmp = userService.getCurrentCmp(session);
      cmpId = cmp.getId();
      //验证数据
      recruit.setJobPlace(cmp.getCityName());
      recruitService.publish(recruit,cmpId);
    }catch(Exception e){
      e.printStackTrace();
      log.error(cmpId+"公司发布职位失败："+e);
      result.put("flag","fail");
    }
    result.put("flag","success");
    return result;
  }
}
