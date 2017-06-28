package com.photo.bean.view;

import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Recruit;

public class RecruitAndCmp{
  private Recruit recruit;
  private Company cmp;
  
  public Recruit getRecruit(){
    return recruit;
  }
  public void setRecruit(Recruit recruit){
    this.recruit = recruit;
  }
  public Company getCmp(){
    return cmp;
  }
  public void setCmp(Company cmp){
    this.cmp = cmp;
  }
  
}
