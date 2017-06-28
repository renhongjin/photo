package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.Province;

public interface ProvinceMapper {
    int deleteByPrimaryKey(String id);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);
    
    int selectCountByParams(Map<String, Object> inputData);
    
    List<Province> selectByParams(Map<String, Object> inputData);
}