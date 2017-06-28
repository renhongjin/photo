package com.photo.service.impl;

import org.springframework.stereotype.Service;
import com.photo.service.IHomeService;
@Service("homeService")
public class HomeService implements IHomeService{

  /*@Override
  public void saveImage(String userId,String path){
    String sql = "insert into t010_user_image(user_id,image_url,create_day,create_time,delete_flag,create_time_long) values(?,?,?,?,?,?)";
    List<Object> params = new ArrayList<Object>();
    Date now = new Date();
    params.add(userId);
    params.add(path);
    params.add(DateUtils.getDay(now));
    params.add(DateUtils.getTime(now));
    params.add(0);
    params.add(now.getTime());
    jdbcTemplate.update(sql,params.toArray());
  }

  @Override
  public List<UserImage> getUserImage(String userId){
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("",userId);
    String sql = "select * from t010_user_image where t.user_id = ? and t.delete_flag=0";
    List<UserImage> images = jdbcTemplate.query(sql,new Object[]{userId},new UserImageMap());
    return images;
  }*/
	
	
}