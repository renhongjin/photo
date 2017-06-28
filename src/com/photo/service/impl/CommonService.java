package com.photo.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Personal;
import com.photo.bean.mapper.UserImage;
import com.photo.dao.mapper.CompanyMapper;
import com.photo.dao.mapper.PersonalMapper;
import com.photo.dao.mapper.UserImageMapper;
import com.photo.service.ICommonService;
import com.photo.utils.DateUtils;
import com.photo.utils.UUIDUtils;
@Service("commonService")
public class CommonService implements ICommonService{

  @Autowired
  private UserImageMapper userImageMapper;
  
  @Autowired
  private CompanyMapper companyMapper;
  
  @Autowired
  private PersonalMapper personalMapper; 
  @Override
  public void saveImage(String userId,String path){
    UserImage image = new UserImage();
    Date now  = new Date();
    String createDay = DateUtils.getDay(now);
    String createTime = DateUtils.getTime(now);
    String createTimeLong = DateUtils.getLongTime(now)+"";
    String id = UUIDUtils.next();
    image.setCreateDay(createDay);
    image.setCreateTimeLong(createTimeLong);
    image.setCreateTime(createTime);
    image.setDeleteFlag(0);
    image.setId(id);
    image.setImageUrl(path);
    image.setUserId(userId);
    userImageMapper.insert(image);
  }

  @Override
  public List<UserImage> getUserImage(String userId){
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("userId",userId);
    return userImageMapper.selectByParams(map);
  }

  @Override
  public boolean deleteImage(String imageId){
    UserImage image= new UserImage();
    image.setId(imageId);
    image.setDeleteFlag(1);
    int num = userImageMapper.updateByPrimaryKeySelective(image);
    return num == 1 ? true : false;
  }

  @Override
  public void saveHeadImage(String userType,String userId,String url){
    if("cmp".equals(userType)){
      Company cmp = new Company();
      cmp.setId(userId);
      cmp.setHead(url);
      companyMapper.updateByPrimaryKeySelective(cmp);
    }else if("personal".equals(userType)){
      Personal p = new Personal();
      p.setId(userId);
      p.setHead(url);
      personalMapper.updateByPrimaryKeySelective(p);
    }
  }
}
