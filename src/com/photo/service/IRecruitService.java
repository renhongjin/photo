package com.photo.service;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.Deliver;
import com.photo.bean.mapper.DeliverLog;
import com.photo.bean.mapper.Recruit;

/**
 * 招聘的服务接口
 * @author lenovo
 *
 */
public interface IRecruitService{
  
  /**
   * 更新投递职位的状态
   * 投递记录的状态，0：新投递，1：企业已经查看，2：通知面试
   * @param recordId
   * @param status
   */
  public void updateDeliverRecordState(String recordId,Integer status);
  /**
   * 根据参数查看投递情况</br>
   * id</br>
    personalId </br>
    recruitId </br>
    status</br>
    cmpId</br>
    createTime</br> 
    createDay</br>
    分页参数
    pageIndex 开始记录的索引
    pageNum 页的数量 
   * @param params
   * @return
   */
  public List<Deliver> selectDeliver(Map<String,Object> params);
  public int selectDeliverCount(Map<String,Object> params);
 /**
  * 投递职位
  * @param deliverRecord
  */
  public void deliver(Deliver deliverRecord);
  /**
   * 发布职位
   * @param recruit 招聘启事的内容
   * @param cmpId 发布招聘的企业id
   */
  public void publish(Recruit recruit,String cmpId);
  /**
   * 得到招聘职位
   * @param cmpId 企业id
   * @return
   */
  public List<Recruit> getRecruitsByCmpId(String cmpId);
  
  /**
   * 更新招聘启事状态
   * @param recruitId
   * @param status 状态
   */
  public void updateRecruitStatues(String recruitId,int status);
  
  public Recruit getById(String recruitId);
  
  /**
   * 得到默认的热门职位查看20条
   * @return
   */
  public List<Recruit> getHostRecruit();
  
  /**
   * 职位的浏览次数增加一
   */
  public void addScanTime(String recruitId);
  
  /**
   * 增加职位的投递次数
   * @param recruitId
   */
  public void addSendTime(String recruitId);
  
  /**
   * 搜索职位
   * @param jobName 工作名称
   * @param jobPlace 工作地点
   * @param workYear 工作年限
   * @param degree 学历
   * @param workType 工作类型
   * @return List<Recruit>
   */
  public List<Recruit> search(Map<String,Object> map);
  public int searchCount(Map<String,Object> map);
  
  /**
   * 条件查询投递记录的状态修改日志
   * bean的字段名称
   * orderField 
   * sortType
   * pageIndex
   * pageNum
   * @param inputData
   * @return
   */
  public List<DeliverLog> selectDeliverLogParams(Map<String,Object> map);
  
}
