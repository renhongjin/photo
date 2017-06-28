package com.photo.bean;
/**
 * 职位投递状态
 * @author lenovo
 *
 */
public class DeliverStatus{
  /**0：新投递**/
  public static int NEW_DELIVER = 0;
  /**1：企业已经查看**/
  public static int CMP_SEE = 1;
  /**2：通知面试**/
  public static int NOTICE_INTERVIEW = 2;
  /**3：不匹配，不符合要求**/
  public static int NOT_MATCH = 3;
}
