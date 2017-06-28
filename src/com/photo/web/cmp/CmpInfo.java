package com.photo.web.cmp;

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
import com.photo.bean.mapper.City;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Province;
import com.photo.bean.mapper.Recruit;
import com.photo.service.ICmpService;
import com.photo.service.ICommonService;
import com.photo.service.IHomeService;
import com.photo.service.IRecruitService;
import com.photo.service.IUserService;
import com.photo.utils.CheckUtils;

/**
 * 企业管理
 * 
 * @author lenovo
 *
 */
@Controller
@RequestMapping("/company")
public class CmpInfo{
  
  @Resource(name = "cmpService")
  private ICmpService cmpService;
  
  @Resource(name = "userService")
  private IUserService userService;
  
  @Resource(name = "recruitService")
  private IRecruitService recruitService;
  
  @Resource(name = "homeService")
  private IHomeService homeService;
  
  @Resource
  private ICommonService commonService;
  @RequestMapping(value = "/tochangePsd")
  public String tochangePsd(){
    return "company/changePsd";
  }
  
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
        return "company/changePsd";
      }else{
        if(!CheckUtils.checkPassword(newPsd1)){
          request.setAttribute("errMsg","新密码格式错误！");
          return "company/changePsd";
        }
      }
    }
    Company cmp = (Company)request.getSession().getAttribute(UserFlag.USER);
    if(!cmp.getPassword().equals(oldPsd)){
      request.setAttribute("errMsg","旧密码输入错误！");
      return "company/changePsd";
    }
    if(!userService.updatePassword(newPsd1,cmp.getId(),RoleType.CMP)){
      request.setAttribute("errMsg","修改密码失败！");
      return "company/changePsd";
    }
    return "redirect:/tologin.html";
  }

  /**
   * 根据省份id获取城市
   * @param proviceId
   * @return
   */
  @RequestMapping(value = "/city",produces = "text/html;charset=UTF-8")
  @ResponseBody
  public List<City> getCitys(String proviceId){
    List<City> citys = cmpService.getCitys(proviceId);
    return citys;
  }

  @RequestMapping(value = "/provice",produces = "text/html;charset=UTF-8")
  @ResponseBody
  public List<Province> getAllProvice(){
    List<Province> provinces = cmpService.getProvince();
    return provinces;
  }

  /**
   * 工作台里面完善企业信息
   * @param cmp
   * @param request
   * @return
   */
  @RequestMapping(value = "/add")
  @ResponseBody
  public String add(Company cmp,HttpServletRequest request){
    cmpService.updateCmpInfo(cmp);
    Company c = userService.getCmp(cmp.getId());
    request.getSession().setAttribute(UserFlag.USER,c);
    return "success";
  }
  
  /**
   *列出所有的企业 
   */
  @RequestMapping(value="listCmps")
  public ModelAndView listCmp(){
    ModelAndView mv = new ModelAndView("company/listallcmp");
    //保存企业id对应发布职位的个数
    Map<String,Integer> pubilshRecruit = new HashMap<String,Integer>();
    List<Company> cmps = cmpService.listCmp();
    for(Company company:cmps){
      String cmpId = company.getId();
      Integer value = new Integer(0);
      List<Recruit> recruits = recruitService.getRecruitsByCmpId(cmpId);
      if(recruits != null){
        value = recruits.size();
      }
      pubilshRecruit.put(cmpId,value);
    }
    mv.addObject("recruitNum",pubilshRecruit);
    mv.addObject("cmps",cmps);
    return mv;
  }
  
  /**到企业主页**/
  @RequestMapping(value="toCmpInfo")
  public ModelAndView toCmpInfo(String cmpId){
    ModelAndView mv = new ModelAndView("company/cmpIndex");
    Company cmp = cmpService.getById(cmpId);
    mv.addObject("imageList",commonService.getUserImage(cmpId));
    mv.addObject("cmp",cmp);
    return mv;
  }
  
  /**返回到我的作品页面**/
  @RequestMapping(value="/imageList")
  public ModelAndView toMyworks(HttpSession session){
    ModelAndView mv = new ModelAndView("company/imageList");
    String userId = null;
    Company cmp = userService.getCurrentCmp(session);
    if(cmp != null){
      userId = cmp.getId();
    }
    mv.addObject("imageList",commonService.getUserImage(userId));
    return mv;
  }
}
