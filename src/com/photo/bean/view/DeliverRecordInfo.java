package com.photo.bean.view;

/**
 * 企业查看求职申请信息封装
 * 
 * @author lenovo
 *
 */
public class DeliverRecordInfo{
  private String id;
  private Integer state;
  private String recruitId;
  private String recruitName;
  private String resumeId;
  private String personName;
  private String idealJobName;
  private String idealPlace;
  private String deliverTime;
  private String updateDay;
  private String updateTime;
  //个人端需要的信息
  private String companyName;
  private String cmpId;
  private String cmpPlace;
  private String lastUpdateTime;

  public String getLastUpdateTime(){
    return lastUpdateTime;
  }

  public void setLastUpdateTime(String lastUpdateTime){
    this.lastUpdateTime = lastUpdateTime;
  }

  public String getCmpId(){
    return cmpId;
  }

  public void setCmpId(String cmpId){
    this.cmpId = cmpId;
  }

  public String getCmpPlace(){
    return cmpPlace;
  }

  public void setCmpPlace(String cmpPlace){
    this.cmpPlace = cmpPlace;
  }

  public String getCompanyName(){
    return companyName;
  }

  public void setCompanyName(String companyName){
    this.companyName = companyName;
  }

  public String getUpdateDay(){
    return updateDay;
  }

  public void setUpdateDay(String updateDay){
    this.updateDay = updateDay;
  }

  public String getUpdateTime(){
    return updateTime;
  }

  public void setUpdateTime(String updateTime){
    this.updateTime = updateTime;
  }

  public String getId(){
    return id;
  }

  public void setId(String id){
    this.id = id;
  }

  public String getDeliverTime(){
    return deliverTime;
  }

  public void setDeliverTime(String deliverTime){
    this.deliverTime = deliverTime;
  }

  public Integer getState(){
    return state;
  }

  public void setState(Integer state){
    this.state = state;
  }

  public String getRecruitId(){
    return recruitId;
  }

  public void setRecruitId(String recruitId){
    this.recruitId = recruitId;
  }

  public String getRecruitName(){
    return recruitName;
  }

  public void setRecruitName(String recruitName){
    this.recruitName = recruitName;
  }



  public String getResumeId(){
    return resumeId;
  }

  public void setResumeId(String resumeId){
    this.resumeId = resumeId;
  }

  public String getPersonName(){
    return personName;
  }

  public void setPersonName(String personName){
    this.personName = personName;
  }

  public String getIdealJobName(){
    return idealJobName;
  }

  public void setIdealJobName(String idealJobName){
    this.idealJobName = idealJobName;
  }

  public String getIdealPlace(){
    return idealPlace;
  }

  public void setIdealPlace(String idealPlace){
    this.idealPlace = idealPlace;
  }

  @Override
  public String toString(){
    return "DeliverRecordInfo [state="+state+", recruitId="+recruitId+", recruitName="+recruitName+", resumeId="+resumeId+", personName="+personName+", idealJobName="+idealJobName+", idealPlace="+idealPlace+", deliverTime="+deliverTime+"]";
  }

}
