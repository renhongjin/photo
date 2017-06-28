package com.photo.bean;
/**
 * 招聘启事状态
 * @author lenovo
 *
 */
public class RecruitState{
  /**未发布*/
  public static int UN_PUBLISH = 0;
  /**待审核*/
  public static int WAIT_CHECK = 1;
  /**已发布*/
  public static int PUBLISH = 2;
  /**审核失败*/
  public static int CHECK_FAIL = 3;
  /**撤销*/
  public static int CANCEL = 4;
  /**删除*/
  public static int DELETE = 5;
}
