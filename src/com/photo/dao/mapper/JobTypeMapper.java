package com.photo.dao.mapper;

import com.photo.bean.mapper.JobType;

public interface JobTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(JobType record);

    int insertSelective(JobType record);

    JobType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JobType record);

    int updateByPrimaryKey(JobType record);
}