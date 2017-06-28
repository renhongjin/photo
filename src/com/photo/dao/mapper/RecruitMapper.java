package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.Recruit;

public interface RecruitMapper {
    int deleteByPrimaryKey(String id);

    int insert(Recruit record);

    int insertSelective(Recruit record);

    Recruit selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Recruit record);

    int updateByPrimaryKey(Recruit record);
    
    int selectCountByParams(Map<String, Object> inputData);
    
    List<Recruit> selectByParams(Map<String, Object> inputData);
    
    void addSendTimes(String id);
    void addScanTime(String id);
    
    /**
     * 查询招聘启事</br>
     * map查询参数如下</br>
     * state ： 职位的状态</br>
     * jobName : 职位名称</br>
     * jobPlace ： 工作地点</br>
     * workYear ： 工作年限</br>
     * degree ： 学历要求 </br>
     * workType ： 工作类型
     * @param map
     * @return
     */
    List<Recruit> searchRecruit(Map<String, Object> map);
    int searchRecruitCount(Map<String, Object> map);
    
}