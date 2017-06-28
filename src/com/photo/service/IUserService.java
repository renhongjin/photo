package com.photo.service;

import javax.servlet.http.HttpSession;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Personal;

public interface IUserService {
	/**
	 * 得到当前登录的企业用户
	 * @param session
	 * @return 存在登录企业用户则返回用户，否则返回null
	 */
  public Company getCurrentCmp(HttpSession session);
  
  /**
   * 得到当前登录的个人用户
   * @param session
   * @return 存在登录用户则返回用户，否则返回null
   */
  public Personal getCurrentPerson(HttpSession session); 
	/**
	 * 修改密码
	 * @param newPsd
	 * @param uid 当前登录用户的用户id
	 * @return
	 */
	public boolean updatePassword(String newPsd,String uid,int roleType);
	/**
	 * 如果不存在则返回null否则返回实体对象
	 * @param account 账号
	 * @param password 密码
	 * @param accountType  账号类型 tel email 
	 * @return
	 */
	public Personal loginPersonal(String account,String password,int accountType);
	public Company loginCmp(String account,String password,int accountType);
	
	
	/**
	 * 获取公司
	 * @param id
	 * @return
	 */
	public Company getCmp(String id);
	public Personal getPersonal(String id);
	
	/**
	 * 邮箱验证验证成功则返回用户id否则返回null
	 * @param code
	 * @param roleType
	 * @return
	 */
	public String checkEmail(String code,int roleType);
	
	
	/**
	 * 保存求职者基本的注册信息同时生成邮箱验证码
	 * @param account 账户账号
	 * @param password 登录密码
	 * @param type 账号的类型是电话号码还是邮箱
	 * @param ip 注册的ip地址
	 */
	public void savePersonRegisterInfo(String account,String password,int type,String ip,String emailVaildCode);
	
	
	/**
	 * 保存招聘者的基本的注册信息同时生成邮箱验证码
	 * @param account 账户账号
	 * @param password 登录密码
	 * @param type 账号的类型是电话号码还是邮箱
	 * @param ip 注册的ip地址
	 */
	public void saveCmpRegisterInfo(String account,String password,int type,String ip,String emailVaildCode);
	
	/**
	 * 电话号码是否已经注册
	 * @param phone
	 * @param roleType 个人或者公司
	 * @return
	 */
	public boolean isExistPhone(String phone,int roleType);
	
	/**
	 * 邮箱是否已经注册
	 * @param email
	 * @param roleType 个人或者公司
	 * @return
	 */
	public boolean isExistEmail(String email,int roleType);
}
