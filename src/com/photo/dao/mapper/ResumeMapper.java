package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.Resume;

public interface ResumeMapper {
    int deleteByPrimaryKey(String id);

    int insert(Resume record);

    int insertSelective(Resume record);

    Resume selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Resume record);

    int updateByPrimaryKey(Resume record);
    
    int selectCountByParams(Map<String, Object> inputData);
    
    List<Resume> selectByParams(Map<String, Object> inputData);
}