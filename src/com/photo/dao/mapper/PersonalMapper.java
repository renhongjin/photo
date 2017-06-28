package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.Personal;

public interface PersonalMapper {
    int deleteByPrimaryKey(String id);

    int insert(Personal record);

    int insertSelective(Personal record);

    Personal selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Personal record);

    int updateByPrimaryKey(Personal record);
    
    int selectCountByParams(Map<String, Object> inputData);
    
    List<Personal> selectByParams(Map<String, Object> inputData);
}