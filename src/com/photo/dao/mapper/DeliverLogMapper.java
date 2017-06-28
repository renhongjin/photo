package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.DeliverLog;

public interface DeliverLogMapper {
    int deleteByPrimaryKey(String id);

    int insert(DeliverLog record);

    int insertSelective(DeliverLog record);

    DeliverLog selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DeliverLog record);

    int updateByPrimaryKey(DeliverLog record);
    
    int selectCountByParams(Map<String, Object> inputData);
    /**
     * bean的字段名称
     * orderField 
     * sortType
     * pageIndex
     * pageNum
     * @param inputData
     * @return
     */
    List<DeliverLog> selectByParams(Map<String, Object> inputData);
}