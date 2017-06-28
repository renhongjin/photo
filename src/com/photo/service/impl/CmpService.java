package com.photo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.photo.bean.mapper.City;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Province;
import com.photo.dao.mapper.CityMapper;
import com.photo.dao.mapper.CompanyMapper;
import com.photo.dao.mapper.ProvinceMapper;
import com.photo.service.ICmpService;
import com.photo.service.IUserService;
import com.photo.utils.UUIDUtils;

@Service("cmpService")
public class CmpService implements ICmpService{
  private static Log log = LogFactory.getLog(CmpService.class);
  
  @Resource(name = "userService")
  private IUserService userService;
  
  @Autowired
  private CityMapper cityMapper;
  
  @Autowired
  private ProvinceMapper provinceMapper;
  
  @Autowired
  private CompanyMapper companyMapper; 
  
  @Override
  public List<City> getCitys(String proviceId){
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("proviceId",proviceId);
    return cityMapper.selectByParams(map);
  }

  @Override
  public List<Province> getProvince(){
    Map<String,Object> map = new HashMap<String,Object>();
    return provinceMapper.selectByParams(map);
  }

  @Override
  public Company addCmpInfo(Company cmp){
    String cmpId = addCmp(cmp);
    return userService.getCmp(cmpId);
  }

  @Override
  public void updateCmpInfo(Company cmp){
    if(cmp.getId()==null){
      log.error("更新不存在的企业对象id");
      throw new RuntimeException("更新不存在的企业对象id");
    }
    updateCmp(cmp);
  }

  /**
   * 插入数据库
   * 
   * @param cmp
   * @return 企业id
   */
  public String addCmp(Company cmp){
    String id = UUIDUtils.next();
    cmp.setId(id);
    companyMapper.insert(cmp);
    return id;
  }

  /**
   * 根据id更新信息
   * 
   * @param cmp
   */
  public void updateCmp(Company cmp){
    companyMapper.updateByPrimaryKeySelective(cmp);
  }

  @Override
  public Company getById(String cmpId){
    return companyMapper.selectByPrimaryKey(cmpId);
  }

  @Override
  public List<Company> listCmp(){
    Map<String,Object> map = new HashMap<String,Object>();
    return companyMapper.selectByParams(map);
  }
}
