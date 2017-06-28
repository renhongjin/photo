package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.Deliver;

public interface DeliverMapper {
    int deleteByPrimaryKey(String id);

    int insert(Deliver record);

    int insertSelective(Deliver record);

    Deliver selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Deliver record);

    int updateByPrimaryKey(Deliver record);
    
    int selectCountByParams(Map<String, Object> inputData);
    
    List<Deliver> selectByParams(Map<String, Object> inputData);
}