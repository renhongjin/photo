package com.photo.utils;
/**
 * 分页信息对象
 * @author lenovo
 *
 */
public class Page{
  /**
   * 开始
   */
  private int start;
  /**
   * 结束
   */
  private int end;
  /**
   * 当前页
   */
  private int currentPage;
  /**
   * 总页数
   */
  private int totalPage;
  /**
   * 页的大小
   */
  private int pageNum = 2;
  /*
   * 显示页面的个数
   */
  private int showNum = 5;
  public Page(int totalNum,int currentPage){
    this.start = 1;
    this.end = 1;
    if(totalNum <= 0){
      totalPage = 1;
    }
    if(currentPage <= 0){
      currentPage = 1;
    }
    totalPage = totalNum / pageNum;
    if((totalNum % pageNum ) > 0){
      totalPage = totalPage + 1;
    }
    if(currentPage > totalPage){
      currentPage = totalPage;
    }
    this.currentPage = currentPage;
    
    if(totalPage > 1 && totalPage <= showNum){
      this.start = 1;
      this.end = totalPage;
    }
    
    if(totalPage > showNum){//处理只显示5个页码
      this.start = totalPage - (showNum/2);
      this.end = totalPage + (showNum/2);
      if(this.end > totalPage){
        this.end = totalPage;
      }
    }
    
  }
  public int getStart(){
    return start;
  }
  public void setStart(int start){
    this.start = start;
  }
  public int getEnd(){
    return end;
  }
  public void setEnd(int end){
    this.end = end;
  }
  public int getCurrentPage(){
    return currentPage;
  }
  public void setCurrentPage(int currentPage){
    this.currentPage = currentPage;
  }
  public int getTotalPage(){
    return totalPage;
  }
  public void setTotalPage(int totalPage){
    this.totalPage = totalPage;
  }
  public int getPageNum(){
    return pageNum;
  }
  public void setPageNum(int pageNum){
    this.pageNum = pageNum;
  }
  public int getShowNum(){
    return showNum;
  }
  public void setShowNum(int showNum){
    this.showNum = showNum;
  }
  
  
  @Override
  public String toString(){
    return "Page [start="+start+", end="+end+", currentPage="+currentPage+", totalPage="+totalPage+", pageNum="+pageNum+", showNum="+showNum+"]";
  }
  public static void main(String[] args){
    Page p = new Page(0,1);
    System.out.println(p);
  }
}
