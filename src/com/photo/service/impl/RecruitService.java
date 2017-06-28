package com.photo.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.photo.bean.RecruitState;
import com.photo.bean.mapper.Deliver;
import com.photo.bean.mapper.DeliverLog;
import com.photo.bean.mapper.Recruit;
import com.photo.dao.mapper.DeliverLogMapper;
import com.photo.dao.mapper.DeliverMapper;
import com.photo.dao.mapper.RecruitMapper;
import com.photo.service.IRecruitService;
import com.photo.utils.DateUtils;
import com.photo.utils.UUIDUtils;

@Service("recruitService")
public class RecruitService implements IRecruitService{
  
//  private static final Log log = LogFactory.getLog(RecruitService.class);
  
  @Autowired
  private RecruitMapper recruitMapper;
  
  @Autowired
  private DeliverMapper deliverMapper;
  
  @Autowired
  private DeliverLogMapper deliverLogMapper; 
  @Override
  public void publish(Recruit recruit,String cmpId){
    Date now = new Date();
    String id = UUIDUtils.next();
    //完善数据
    recruit.setId(id);
    recruit.setCmpId(cmpId);
    recruit.setAddDay(DateUtils.getDay(now));
    recruit.setAddTime(DateUtils.getTime(now));
    recruit.setAddTimeLong(DateUtils.getLongTime(now)+"");
    recruit.setState(RecruitState.PUBLISH);
    recruit.setScanTime(0);
    recruit.setDeliverTimes(0);
    addRecruit(recruit);
  }
  
  /**增加招聘信息到数据库**/
  private void addRecruit(Recruit recruit){
    recruitMapper.insert(recruit);
  }

  @Override
  public List<Recruit> getRecruitsByCmpId(String cmpId){
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("cmpId",cmpId);
    return recruitMapper.selectByParams(map);
  }

  @Override
  public void updateRecruitStatues(String recruitId,int status){
    Recruit r = new Recruit();
    r.setId(recruitId);
    r.setState(status);
    recruitMapper.updateByPrimaryKeySelective(r);
  }

  @Override
  public Recruit getById(String recruitId){
    return recruitMapper.selectByPrimaryKey(recruitId);
  }

  @Override
  public List<Recruit> getHostRecruit(){
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("state",RecruitState.PUBLISH);
    map.put("sortField","ADD_TIME_LONG");
    map.put("sortType","desc");
    map.put("pageIndex",0);
    map.put("pageNum",20);
    return recruitMapper.selectByParams(map);
  }

  @Override
  public void addScanTime(String recruitId){
    recruitMapper.addScanTime(recruitId);
  }

  @Override
  public void addSendTime(String recruitId){
    recruitMapper.addSendTimes(recruitId);
  }

  @Override
  public List<Recruit> search(Map<String,Object> map){
    return recruitMapper.searchRecruit(map);
  }
  
  @Override
  public int searchCount(Map<String,Object> map){
    return recruitMapper.searchRecruitCount(map);
  }
  
  @Override
  public void deliver(Deliver deliverRecord){
    deliverMapper.insert(deliverRecord);
  }

  @Override
  public List<Deliver> selectDeliver(Map<String,Object> params){
    return deliverMapper.selectByParams(params);
  }

  @Transactional
  @Override
  public void updateDeliverRecordState(String recordId,Integer status){
    Deliver record = new Deliver();
    record.setId(recordId);
    record.setStatus(status);
    deliverMapper.updateByPrimaryKeySelective(record);
    //记录状态修改日志
    DeliverLog log = new DeliverLog();
    Date now = new Date();
    String id = UUIDUtils.next();
    log.setChangestatus(status);
    log.setCreateDay(DateUtils.getDay(now));
    log.setCreateTime(DateUtils.getTime(now));
    log.setCreateTimeLong(now.getTime()+"");
    log.setDeliverId(recordId);
    log.setId(id);
    deliverLogMapper.insert(log);
  }

  @Override
  public List<DeliverLog> selectDeliverLogParams(Map<String,Object> map){
    return deliverLogMapper.selectByParams(map);
  }

  @Override
  public int selectDeliverCount(Map<String,Object> params){
    return deliverMapper.selectCountByParams(params);
  }
}

