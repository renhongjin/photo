package com.photo.utils;

import javax.servlet.http.HttpServletRequest;
/**
 * 分页工具类
 * @author lenovo
 *
 */
public class PageUtils{
  
  public static Page getPage(HttpServletRequest request,int totalNum){
    int currentPage = 1;
    try{
      currentPage = Integer.valueOf(request.getParameter("currentPage")); 
    }catch(Exception e){}
    Page p = new Page(totalNum,currentPage);
    return p;
  }
  
  public static int getPageIndex(Page page){
    if(page.getTotalPage() <= 0){
      return 0;
    }
    int pageIndex = (page.getCurrentPage() - 1) * page.getPageNum();
    if(page.getCurrentPage() == 1){
      pageIndex = 0;
    }
    return pageIndex;
  }
}
