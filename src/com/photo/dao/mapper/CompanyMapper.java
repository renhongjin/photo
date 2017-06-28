package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.Company;

public interface CompanyMapper {
    int deleteByPrimaryKey(String id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKeyWithBLOBs(Company record);

    int updateByPrimaryKey(Company record);
    
    int selectCountByParams(Map<String, Object> inputData);
    
    List<Company> selectByParams(Map<String, Object> inputData);
}