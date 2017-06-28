package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.Job;

public interface JobMapper {
    int deleteByPrimaryKey(String id);

    int insert(Job record);

    int insertSelective(Job record);

    Job selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
    
    int selectCountByParams(Map<String, Object> inputData);
    
    List<Job> selectByParams(Map<String, Object> inputData);
}