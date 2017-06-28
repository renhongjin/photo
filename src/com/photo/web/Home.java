package com.photo.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.photo.bean.AccountType;
import com.photo.bean.RecruitState;
import com.photo.bean.RoleType;
import com.photo.bean.UserFlag;
import com.photo.bean.mapper.City;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Personal;
import com.photo.bean.mapper.Province;
import com.photo.bean.mapper.Recruit;
import com.photo.bean.view.RecruitAndCmp;
import com.photo.service.ICmpService;
import com.photo.service.IRecruitService;
import com.photo.service.IUserService;
import com.photo.utils.EmailUtils;
import com.photo.utils.Page;
import com.photo.utils.PageUtils;
import com.photo.utils.PhotoWebUtils;
import com.photo.utils.StringUtils;
import com.photo.utils.UUIDUtils;

@Controller
public class Home{
  private static Log log = LogFactory.getLog(Home.class);
  
  @Resource(name = "userService")
  private IUserService userService;
  
  @Resource(name = "recruitService")
  private IRecruitService recruitService;
  
  @Resource(name = "cmpService")
  private ICmpService cmpService;
  
  /**
   * 首页
   * 
   * @return
   */
  @RequestMapping("/index")
  public ModelAndView index(){
    ModelAndView mv = new ModelAndView("index");
    List<RecruitAndCmp> rcs = new ArrayList<RecruitAndCmp>();
    List<Recruit> rs = recruitService.getHostRecruit();
    for(Recruit recruit:rs){
      RecruitAndCmp rc = new RecruitAndCmp();
      String cmpId = recruit.getCmpId();
      Company cmp = cmpService.getById(cmpId);
      rc.setCmp(cmp);
      rc.setRecruit(recruit);
      rcs.add(rc);
    }
    List<Province> provinces = cmpService.getProvince();
    mv.addObject("provinces",provinces);
    mv.addObject("rcs",rcs);
    return mv;
  }

  @RequestMapping("/logout")
  public String logOut(HttpServletRequest request){
    request.getSession().removeAttribute(UserFlag.USER);
    request.getSession().removeAttribute(UserFlag.FLAG);
    return "redirect:/index.html";
  }

  /**
   * 返回到注册页
   * 
   * @return
   */
  @RequestMapping("/toregister")
  public String toRegister(){
    return "register";
  }

  /**
   * 跳转到登录页
   * 
   * @return
   */
  @RequestMapping("/tologin")
  public String toLogin(){
    return "login";
  }

  /**
   * 登录
   */
  @RequestMapping("/login")
  public String login(String account,String password,int accountType,HttpServletRequest request){
    Personal personal = userService.loginPersonal(account,password,accountType);
    PhotoWebUtils.deliever(request);
    if(personal!=null){
      request.getSession().setAttribute(UserFlag.USER,personal);
      request.getSession().setAttribute(UserFlag.FLAG,"personal");
      return "redirect:/index.html";
    }else{
      Company cmp = userService.loginCmp(account,password,accountType);
      if(cmp!=null){
        request.getSession().setAttribute(UserFlag.USER,cmp);
        request.getSession().setAttribute(UserFlag.FLAG,"cmp");
        return "redirect:/workbench.html";
      }else{
        //不存在用户
        request.setAttribute("errMsg","账户信息错误！");
        return "login";
      }
    }
  }

  @RequestMapping("/checkEmail")
  public String checkEmail(String code,HttpServletRequest request){
    try{
      if(code!=null&&code.length()==25){
        int roleType = Integer.valueOf(code.substring(code.length()-1));
        code = code.substring(0,code.length()-1);
        String id = userService.checkEmail(code,roleType);
        if(id!=null){
          if(roleType==RoleType.CMP){
            Company cmp = userService.getCmp(id);
            request.getSession().setAttribute(UserFlag.USER,cmp);
            return "redirect:/workbench.html";
          }else{
            Personal personal = userService.getPersonal(id);
            request.getSession().setAttribute(UserFlag.USER,personal);
            return "redirect:/index.html";
          }
        }else{
          log.error("验证不存在的用户！");
        }
      }
    }catch(Exception e){
      log.error("邮箱验证出错：",e);
    }
    return "redirect:/index.html";
  }

  @RequestMapping("/register")
  public String register(HttpServletRequest request){
    int accountType = Integer.valueOf(request.getParameter("registerType"));
    PhotoWebUtils.deliever(request);
    String errMsg = "";
    try{
      String ip = PhotoWebUtils.getRemoteHost(request);
      String emailVaildCode = UUIDUtils.next();//邮箱认证码
      if(accountType==AccountType.TEL){//tel
        String tel = request.getParameter("telephone");
        String yzm = request.getParameter("yzm");
        String psd = request.getParameter("password");
        int phoneType = Integer.valueOf(request.getParameter("phoneType"));
        if(!"1".equals(yzm)){
          errMsg = "验证码错误！";
          log.debug("验证码错误！");
          request.setAttribute("errMsg",errMsg);
          return "register";
        }
        if(phoneType==RoleType.PERSON){
          //求职
          if(userService.isExistPhone(tel,RoleType.PERSON)){
            errMsg = "电话号码已经注册！";
            request.setAttribute("errMsg",errMsg);
            return "register";
          }
          if(StringUtils.notNullAndEmpty(tel)&&StringUtils.notNullAndEmpty(psd)){
            userService.savePersonRegisterInfo(tel,psd,accountType,ip,emailVaildCode);
          }else{
            errMsg = "注册信息不能为空！";
            request.setAttribute("errMsg",errMsg);
            return "register";
          }
        }else if(phoneType==RoleType.CMP){
          //招聘
          if(userService.isExistPhone(tel,RoleType.CMP)){
            errMsg = "电话号码已经注册";
            request.setAttribute("errMsg",errMsg);
            return "register";
          }
          if(StringUtils.notNullAndEmpty(tel)&&StringUtils.notNullAndEmpty(psd)){
            userService.saveCmpRegisterInfo(tel,psd,accountType,ip,emailVaildCode);
          }else{
            errMsg = "注册信息不能为空！";
            request.setAttribute("errMsg",errMsg);
            return "register";
          }
        }else{
          log.error("不存在的用户注册类型！");
          return "redirect:/index.html";
        }
      }else if(accountType==AccountType.EMAIL){//email
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int emailType = Integer.valueOf(request.getParameter("emailType"));
        //这里暂时没有用验证码
        if(RoleType.PERSON==emailType){
          //求职
          if(userService.isExistEmail(email,RoleType.PERSON)){
            errMsg = "该邮箱已经注册！";
            request.setAttribute("errMsg",errMsg);
            return "register";
          }
          if(StringUtils.notNullAndEmpty(email)&&StringUtils.notNullAndEmpty(password)){
            userService.savePersonRegisterInfo(email,password,accountType,ip,emailVaildCode);
            try{
              EmailUtils.sendRegisterEmail(email,emailVaildCode,RoleType.PERSON);
            }catch(Exception e){
              log.error(email+":个人注册认证邮件发送失败!");
            }
          }else{
            errMsg = "注册信息不能为空！";
            request.setAttribute("errMsg",errMsg);
            return "register";
          }
        }else if(RoleType.CMP==emailType){
          //招聘
          if(userService.isExistEmail(email,RoleType.CMP)){
            errMsg = "邮箱已经注册！";
            request.setAttribute("errMsg",errMsg);
            return "register";
          }
          if(StringUtils.notNullAndEmpty(email)&&StringUtils.notNullAndEmpty(password)){
            userService.saveCmpRegisterInfo(email,password,accountType,ip,emailVaildCode);
            try{
              EmailUtils.sendRegisterEmail(email,emailVaildCode,RoleType.CMP);
            }catch(Exception e){
              log.error(email+":企业注册认证邮件发送失败!");
            }
          }else{
            errMsg = "注册信息不能为空！";
            request.setAttribute("errMsg",errMsg);
            return "register";
          }
        }else{
          log.error("不存在的用户注册类型！");
          return "redirect:/index.html";
        }
      }
    }catch(Exception e){
      log.error("注册错误:",e);
      return "register";
    }
    return "redirect:/index.html";
  }

  @RequestMapping("/workbench")
  public String workbench(){
    return "company/workbench";
  }
  
  /**
   * 返回到job收索页面
   * @return
   */
  @RequestMapping("/toJobSearch")
  public ModelAndView toJobSearch(){
    ModelAndView mv = new ModelAndView("public/jobSearch");
    //查出省份信息
    List<Province> provinces = cmpService.getProvince();
    mv.addObject("provinces",provinces);
    //TODO:查出初始时候的职位列表
    return mv;
  }
  
  /**
   * 职位搜索
   * @return
   */
  @RequestMapping("/jobSearch")
  public ModelAndView jobSearch(HttpServletRequest request){
    ModelAndView mv = new ModelAndView("public/jobSearch");
    String cityName = (String)request.getParameter("cityName");
    String cityId = (String)request.getParameter("cityId");
    String provinceId = (String)request.getParameter("provinceId");
    String provinceName = (String)request.getParameter("provinceName");
    //保存用户搜索的省份城市信息
    if(StringUtils.notNullAndEmpty(cityId) && !"-1".equals(cityId)){
      request.getSession().setAttribute("cityId",cityId);
      request.getSession().setAttribute("cityName",cityName);
    }else{
      cityId = null; 
      request.getSession().removeAttribute("cityId");
      request.getSession().removeAttribute("cityName");
    }
    if(StringUtils.notNullAndEmpty(provinceId)  && !"-1".equals(cityId)){
      request.getSession().setAttribute("provinceId",provinceId);
      request.getSession().setAttribute("provinceName",provinceName);
    }else{
      provinceId = null;
      request.getSession().removeAttribute("provinceId");
      request.getSession().removeAttribute("provinceName");
    }
    
    String jobName = (String)request.getParameter("jobName");
    Integer workYear = Integer.valueOf(0);
    Integer degree = Integer.valueOf(0);
    Integer workType = Integer.valueOf(0);
    try{
      workYear =  Integer.valueOf(request.getParameter("workYear")==""?"0":request.getParameter("workYear"));
    }catch(Exception e){}
    try{
      degree = Integer.valueOf(request.getParameter("degree")==""?"0":request.getParameter("degree"));
    }catch(Exception e){}
    try{
      workType = Integer.valueOf(request.getParameter("workType")==""?"0":request.getParameter("workType"));
    }catch(Exception e){}
    List<RecruitAndCmp> rcs = new ArrayList<RecruitAndCmp>();
    Map<String,Object> map = new HashMap<String,Object>();
    if(StringUtils.notNullAndEmpty(jobName)){
      map.put("jobName",jobName);
    }
    if(StringUtils.notNullAndEmpty(cityName)){
      map.put("jobPlace",cityName);
    }
    if(workYear != 0){
      map.put("workAge",workYear);
    }
    if(degree != 0){
      map.put("edu",degree);
    }
    if(workType != 0){
      map.put("workWay",workType);
    }
    //处于发布状态的职位
    map.put("state",RecruitState.PUBLISH);
    int num = recruitService.searchCount(map);
    Page page = PageUtils.getPage(request,num);//分页对象
    //分页参数
    map.put("sortField","ADD_TIME_LONG");
    map.put("sortType","desc");
    map.put("pageIndex",PageUtils.getPageIndex(page));
    map.put("pageNum",page.getPageNum());
    List<Recruit> recruits = recruitService.search(map);
    for(Recruit recruit:recruits){
      RecruitAndCmp rc = new RecruitAndCmp();
      String cmpId = recruit.getCmpId();
      Company cmp = cmpService.getById(cmpId);
      rc.setCmp(cmp);
      rc.setRecruit(recruit);
      rcs.add(rc);
    }
    //查询当前的城市列表在职位搜索页面加载出该省份下的所有城市
    if(StringUtils.notNullAndEmpty(provinceId)){
      List<City> citys = cmpService.getCitys(provinceId);
      mv.addObject("citys",citys);
    }
    List<Province> provinces = cmpService.getProvince();
    mv.addObject("provinces",provinces);
    mv.addObject("rcs",rcs);
    mv.addObject("page",page);
    PhotoWebUtils.deliever(request);
    return mv;
  }
}
