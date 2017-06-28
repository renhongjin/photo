package com.photo.web.personal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.photo.bean.RoleType;
import com.photo.bean.UserFlag;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Deliver;
import com.photo.bean.mapper.DeliverLog;
import com.photo.bean.mapper.Personal;
import com.photo.bean.mapper.Recruit;
import com.photo.bean.mapper.Resume;
import com.photo.bean.view.DeliverRecordInfo;
import com.photo.service.ICmpService;
import com.photo.service.ICommonService;
import com.photo.service.IRecruitService;
import com.photo.service.IResumeService;
import com.photo.service.IUserService;
import com.photo.utils.CheckUtils;
import com.photo.utils.Page;
import com.photo.utils.PageUtils;
import com.photo.utils.PhotoWebUtils;

/**
 * 个人管理控制器
 * @author lenovo
 *
 */
@Controller
@RequestMapping("/personal")
public class PersonalManager{
  
  @Resource(name = "userService")
  private IUserService userService;
  
  @Resource(name = "commonService")
  private ICommonService commonService;
  
  @Resource(name = "recruitService")
  private IRecruitService recruitService;
  
  @Resource(name = "resumeService")
  private IResumeService resumeService; 
  
  @Resource(name = "cmpService")
  private ICmpService cmpService;
  /**
   * 修改密码
   * @param oldPsd
   * @param newPsd1
   * @param newPsd2
   * @param request
   * @return
   */
  @RequestMapping(value = "/changePsd")
  public String changePsd(String oldPsd,String newPsd1,String newPsd2,HttpServletRequest request){
    if(newPsd1!=null){
      if(!newPsd1.equals(newPsd2)){
        request.setAttribute("errMsg","两次输入的新密码不匹配！");
        return "personal/changePsd";
      }else{
        if(!CheckUtils.checkPassword(newPsd1)){
          request.setAttribute("errMsg","新密码格式错误！");
          return "personal/changePsd";
        }
      }
    }
    Personal personal = (Personal)request.getSession().getAttribute(UserFlag.USER);
    if(!personal.getPassword().equals(oldPsd)){
      request.setAttribute("errMsg","旧密码输入错误！");
      return "personal/changePsd";
    }
    if(!userService.updatePassword(newPsd1,personal.getId(),RoleType.PERSON)){
      request.setAttribute("errMsg","修改密码失败！");
      return "personal/changePsd";
    }
    return "redirect:/tologin.html";
  }
  
  @RequestMapping(value="/tochangePsd")
  public String tochangePsd(){
    return "personal/changePsd";
  }
  /**返回到我的作品页面**/
  @RequestMapping(value="/toMyworks")
  public ModelAndView toMyworks(HttpSession session){
    ModelAndView mv = new ModelAndView("personal/personalWorks");
    String userId = null;
    Personal p = userService.getCurrentPerson(session);
    if(p != null){
      userId = p.getId();
    }
    mv.addObject("imageList",commonService.getUserImage(userId));
    return mv;
  }
  
  @ResponseBody
  @RequestMapping(value="/deleteImage")
  public String deleteImage(String imageId,String page){
    commonService.deleteImage(imageId);
    return "success";
  }
  
  //投递状态
  @RequestMapping(value="/deliverStatus")
  public ModelAndView invitation(HttpSession session,HttpServletRequest request){
    ModelAndView mv = new ModelAndView("personal/deliverStatus");
    Personal personal = userService.getCurrentPerson(session);
    String personalId = personal.getId();
    //获取面试邀请列表
    Map<String,Object> params = new HashMap<String,Object>();
    
    Integer status = new Integer(-1);//默认查询全部
    try{
      status = Integer.valueOf(request.getParameter("status"));
    }catch(Exception e){}
    if(status != null && status != -1){
      params.put("status",status);
    }
    
    params.put("personalId",personalId);
    int num = recruitService.selectDeliverCount(params);
    
    Page page = PageUtils.getPage(request,num);//分页对象
    //分页参数
    params.put("pageIndex",PageUtils.getPageIndex(page));
    params.put("pageNum",page.getPageNum());
    List<Deliver> delivers = recruitService.selectDeliver(params);
    
    List<DeliverRecordInfo> dris = new ArrayList<DeliverRecordInfo>();
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("orderField","create_time_long");
    map.put("sortType","desc");
    map.put("pageIndex",0);
    map.put("pageNum",1);
    for(Deliver deliverRecord:delivers){
      
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
      
      map.put("deliverId",deliverRecord.getId());
      List<DeliverLog> deliverLog = recruitService.selectDeliverLogParams(map);
      String lastUpdateTime = null;
      if(deliverLog != null && deliverLog.size() >0){
        lastUpdateTime = deliverLog.get(0).getCreateDay()+" "+deliverLog.get(0).getCreateTime();
      }
      
      dri.setDeliverTime(deliverTime);
      dri.setIdealJobName(idealJobName);
      dri.setIdealPlace(idealPlace);
      dri.setResumeId(resumeId);
      dri.setPersonName(personName);
      dri.setRecruitId(recruitId);
      dri.setRecruitName(recruitName);
      dri.setState(deliverRecord.getStatus());
      dri.setId(deliverRecord.getId());
      
      String cmpId =  deliverRecord.getCmpId();
      Company cmp = cmpService.getById(cmpId);
      dri.setCmpId(cmpId);
      dri.setCompanyName(cmp.getName());
      dri.setCmpPlace(cmp.getCityName());
      
      if(lastUpdateTime == null || lastUpdateTime.trim().length()==0){
        lastUpdateTime = "暂未查看简历";
      }
      dri.setLastUpdateTime(lastUpdateTime);
      
      dris.add(dri);
    }
    mv.addObject("page",page);
    mv.addObject("deliverList",dris);
    PhotoWebUtils.deliever(request);
    return mv;
  }
}
