package com.photo.aop;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.photo.bean.UserFlag;

public class UserLoginAop implements HandlerInterceptor{
  private List<String> excludedUrls;

  public void setExcludedUrls(List<String> excludedUrls){
    this.excludedUrls = excludedUrls;
  }

  @Override
  public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
    String requestUri = request.getRequestURI();
    for(String url:excludedUrls){
      if(requestUri.endsWith(url)){
        return true;
      }
    }
    HttpSession session = request.getSession();
    if(session.getAttribute(UserFlag.USER)==null){
      //重定向到登录页面
      response.sendRedirect(request.getContextPath()+"/tologin.html");
      return false;
    }else{
      return true;
    }
  }

  @Override
  public void postHandle(HttpServletRequest request,HttpServletResponse response,Object handler,ModelAndView modelAndView) throws Exception{}

  @Override
  public void afterCompletion(HttpServletRequest request,HttpServletResponse response,Object handler,Exception ex) throws Exception{}
}
