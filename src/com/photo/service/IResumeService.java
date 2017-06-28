package com.photo.service;

import com.photo.bean.mapper.Resume;

/**
 * 简历服务类
 * @author lenovo
 *
 */
public interface IResumeService{
  /**
   * 添加或者修改简历
   * @param resume
   * @param flag 
   *          true:添加简历，
   *          false:根据简历id修改简历
   */
  public void addOrUpdate(Resume resume,boolean flag);
  
  /**
   * 根据简历id返回简历
   * @param id：简历id
   * @return Resume
   */
  public Resume getById(String id);
  
  /**
   * 更加用户id查询简历
   * @param personalId
   * @return
   */
  public Resume getByPersonalId(String personalId);
}
