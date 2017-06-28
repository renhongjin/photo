package com.photo.web.personal;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.photo.bean.DeliverStatus;
import com.photo.bean.mapper.Personal;
import com.photo.bean.mapper.Resume;
import com.photo.service.ICommonService;
import com.photo.service.IRecruitService;
import com.photo.service.IResumeService;
import com.photo.service.IUserService;
import com.photo.utils.UUIDUtils;

/**
 * 处理简历相关的请求
 * @author lenovo
 *
 */
@Controller
@RequestMapping(value="/resume")
public class ResumeManager{
  @Resource(name = "commonService")
  private ICommonService commonService;
  
  @Resource(name = "resumeService")
  private IResumeService resumeService;
  
  @Resource(name = "userService")
  private IUserService userService;
  
  @Resource(name = "recruitService")
  private IRecruitService recruitService;
  
  private static Log log = LogFactory.getLog(ResumeManager.class);
  /**
   *  添加或者修改简历 
   * @return
   */
  @RequestMapping("/add")
  @ResponseBody
  public Map<String,String> addOrUpdate(Resume resume,HttpSession session){
    Map<String,String> result = new HashMap<String,String>();
    Personal personal = userService.getCurrentPerson(session);
    String personalId = personal.getId();
    resume.setPersonalId(personalId);
    try{
      if(resume.getId()!=null && resume.getId().length()!=0){
        //update
        resumeService.addOrUpdate(resume,false);
        result.put("flag","success");
      }else{
        //add
        String id = UUIDUtils.next();
        resume.setId(id);
        resumeService.addOrUpdate(resume,true);
        result.put("flag","success");
        result.put("id",id);
      }
    }catch(Exception e){
      log.error("简历操作失败",e);
      e.printStackTrace();
    }
    return result;
  }
  
  /**
   * 简历预览
   * resumeId :简历id 用与企业查看用户简历的时候
   */
  @RequestMapping(value = "/preview")
  public ModelAndView preview(Resume resume,HttpSession session,String resumeId,String recordId){
    ModelAndView mv = new ModelAndView();
    if(resumeId == null){
      //用户自己预览简历
      mv.addObject("resume",resume);
    }else{
     //TODO 企业查看用户简历，这里可以做限制比如隐藏简历中的电话号码
      resume = resumeService.getById(resumeId);
      recruitService.updateDeliverRecordState(recordId,DeliverStatus.CMP_SEE);
      mv.addObject("resume",resume);
    }
    String userId = resume.getPersonalId();
    mv.addObject("imageList",commonService.getUserImage(userId));
    mv.setViewName("personal/previewResume");
    return mv;
  }
  
  /**
   * 跳转到简历修改页面
   * @return
   */
  @RequestMapping("/tomyworkbench")
  public ModelAndView toaddOrUpdate(HttpSession session){
    ModelAndView mv = new ModelAndView("/personal/myworkbench"); 
    Personal personal = userService.getCurrentPerson(session);
    Resume resume = resumeService.getByPersonalId(personal.getId());
    mv.addObject("resume",resume);
    return mv;
  }
}
