package com.photo.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.photo.bean.AccountType;
import com.photo.bean.RoleType;
import com.photo.bean.UserFlag;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Personal;
import com.photo.dao.mapper.CompanyMapper;
import com.photo.dao.mapper.PersonalMapper;
import com.photo.service.IUserService;
import com.photo.utils.CheckUtils;
import com.photo.utils.DateUtils;
import com.photo.utils.UUIDUtils;

@Service("userService")
public class UserService implements IUserService{
  private final static Log log = LogFactory.getLog(UserService.class);
  
  @Autowired
  private PersonalMapper personalMapper; 
  @Autowired
  private CompanyMapper companyMapper;

  @Transactional
  @Override
  public void savePersonRegisterInfo(String account,String password,int type,String ip,String emailVaildCode){
    Personal p = new Personal(); 
    if(type==AccountType.TEL){
      p.setMobile(account);
    }else if(type==AccountType.EMAIL){
      p.setEmail(account);
    }
    Date date = new Date();
    String id = UUIDUtils.next();
    String createDay = DateUtils.getDay(date);
    String createTime = DateUtils.getTime(date);
    String createTimeLong = DateUtils.getLongTime(date)+"";
    p.setId(id);
    p.setCreateDay(createDay);
    p.setCreateTime(createTime);
    p.setCreateLong(createTimeLong);
    p.setCreateIp(ip);
    p.setPassword(password);
    p.setValidMd5(emailVaildCode);
    personalMapper.insert(p);
  }

  @Transactional
  @Override
  public void saveCmpRegisterInfo(String account,String password,int type,String ip,String emailVaildCode){
    Date date = new Date();
    Company company = new Company();
    String id = UUIDUtils.next();
    String createDay = DateUtils.getDay(date);
    String createTime = DateUtils.getTime(date);
    String createTimeLong = DateUtils.getLongTime(date)+"";
    company.setId(id);
    company.setCreateDay(createDay);
    company.setCreateLong(createTimeLong);
    company.setCreateTime(createTime);
    company.setCreateIp(ip);
    company.setPassword(password);
    company.setValidMd5(emailVaildCode);
    if(type==AccountType.TEL){
      company.setMobile(account);
    }else if(type==AccountType.EMAIL){
      company.setEmail(account);
    }
    companyMapper.insert(company);
  }
  
  @Override
  public boolean isExistPhone(String phone,int roleType){
    int num = 0;
    Map<String,Object> map = new HashMap<String,Object>();
    if(roleType==RoleType.CMP){
      map.put("mobile",phone);
      num = companyMapper.selectCountByParams(map);
    }else if(roleType==RoleType.PERSON){
      map.put("mobile",phone);
      num = personalMapper.selectCountByParams(map);
    }
    return num==1?true:false;
  }

  @Override
  public boolean isExistEmail(String email,int roleType){
    int num = 0;
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("email",email);
    if(roleType==RoleType.CMP){
      num = companyMapper.selectCountByParams(map);
    }else if(roleType==RoleType.PERSON){
      num = personalMapper.selectCountByParams(map);
    }
    return num==1?true:false;
  }

  @Override
  public String checkEmail(String code,int roleType){
    String id = null;
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("validMd5",code);
    map.put("valid",0);
    if(RoleType.CMP==roleType){
      List<Company> companys = companyMapper.selectByParams(map);
      if(companys != null && companys.size() == 1){
        id = companys.get(0).getId();
      }else{
        log.error("[checkEmail]company有多个code=>"+code);
      }
    }else{
      List<Personal> personals = personalMapper.selectByParams(map);
      if(personals != null && personals.size() == 1){
        id = personals.get(0).getId();
      }else{
        log.error("[checkEmail]personal有多个code=>"+code);
      }
    }
    if(id != null ){
      //更新为已经验证
      updateValidateStatus(id,roleType);
    }
    return id;
  }

  @Override
  public Company getCmp(String id){
    return companyMapper.selectByPrimaryKey(id);
  }

  @Override
  public Personal getPersonal(String id){
    return personalMapper.selectByPrimaryKey(id);
  }

  /**
   * 更新邮箱验证成功的账户
   * 
   * @param id
   * @param type
   */
  public void updateValidateStatus(String id,int roleType){
    if(RoleType.CMP==roleType){
      Company company = new Company();
      company.setId(id);
      company.setValid(1);
      companyMapper.updateByPrimaryKeySelective(company);
    }else{
      Personal p = new Personal();
      p.setId(id);
      p.setValid(1);
      personalMapper.updateByPrimaryKeySelective(p);
    }
  }

  @Override
  public Personal loginPersonal(String account,String password,int accountType){
    try{
      Map<String,Object> map = new HashMap<String,Object>();
      
      if(accountType==AccountType.EMAIL){
        if(CheckUtils.checkEmail(account)&&CheckUtils.checkPassword(password)){
          map.put("email",account);
        }else{
          log.info("个人账户登录验证失败："+account+"/"+password);
          return null;
        }
      }else if(accountType==AccountType.TEL){
        if(CheckUtils.checkMobile(account)&&CheckUtils.checkPassword(password)){
          map.put("mobile",account);
        }else{
          log.info("个人账户登录验证失败："+account+"/"+password);
          return null;
        }
      }else{
        log.info("错误的账户类型！");
        return null;
      }
      map.put("password",password);
      List<Personal> personals = personalMapper.selectByParams(map);
      if(personals == null || personals.size() == 0){
        return null;
      }else if(personals.size() > 1){
        log.error("系统中存在账号和密码相同的多个个人用户：{account=>"+account+",password=>"+password+"}");
        return null;
      }
      return personals.get(0);
    }catch(Exception e){
      log.error("个人用户类型查询错误：",e);
      e.printStackTrace();
      return null;
    }
  }

  @Override
  public Company loginCmp(String account,String password,int accountType){
    try{
      Map<String,Object> map = new HashMap<String,Object>();
      if(accountType==AccountType.EMAIL){
        if(CheckUtils.checkEmail(account)&&CheckUtils.checkPassword(password)){
          map.put("email",account);
        }else{
          log.info("企业账户登录验证失败："+account+"/"+password);
          return null;
        }
      }else if(accountType==AccountType.TEL){
        if(CheckUtils.checkMobile(account)&&CheckUtils.checkPassword(password)){
          map.put("mobile",account);
        }else{
          log.info("企业账户登录验证失败："+account+"/"+password);
          return null;
        }
      }else{
        log.info("企业账户登录遇到不合法的账户类型");
        return null;
      }
      
      map.put("password",password);
      List<Company> companys = companyMapper.selectByParams(map);
      if(companys == null || companys.size() == 0){
        return null;
      }else if(companys.size() > 1){
        log.error("系统中存在账号和密码相同的多个企业用户：{account=>"+account+",password=>"+password+"}");
        return null;
      }
      return companys.get(0);
    }catch(Exception e){
      log.error("企业用户类型查询错误：",e);
      e.printStackTrace();
      return null;
    }
  }

  @Override
  public boolean updatePassword(String newPsd,String uid,int roleType){
    try{
      int num = 0;
      if(roleType==RoleType.CMP){
        Company cmp = new Company();
        cmp.setId(uid);
        cmp.setPassword(newPsd);
        num = companyMapper.updateByPrimaryKeySelective(cmp);
      }else if(roleType==RoleType.PERSON){
        Personal p = new Personal();
        p.setId(uid);
        p.setPassword(newPsd);
        num = personalMapper.updateByPrimaryKeySelective(p);
      }
      return num==1?true:false;
    }catch(Exception e){
      log.error("密码修改错误：",e);
      return false;
    }
  }

  @Override
  public Company getCurrentCmp(HttpSession session){
    Company cmp = null;
    try{
      cmp = (Company)session.getAttribute(UserFlag.USER);
    }catch(Exception e){
      e.printStackTrace();
      log.error("获取当前登录的企业用户失败",e);
    }
    return cmp;
  }

  @Override
  public Personal getCurrentPerson(HttpSession session){
    Personal p = null;
    try{
      p = (Personal)session.getAttribute(UserFlag.USER);
    }catch(Exception e){
      e.printStackTrace();
      log.error("获取当前登录的个人用户失败",e);
    }
    return p;
  }
}
