package com.photo.service;

import java.util.List;
import com.photo.bean.mapper.City;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Province;

/**
 * 企业服务接口
 * @author lenovo
 *
 */
public interface ICmpService {

	public Company addCmpInfo(Company cmp);
	public void updateCmpInfo(Company cmp);
	/**
	 * 获取省得城市
	 * @param proviceId
	 * @return
	 */
	public List<City> getCitys(String proviceId);
	public List<Province> getProvince();
	public Company getById(String cmpId);
	/**
	 * 列出所有的企业
	 * @return
	 */
	public List<Company> listCmp();
}
