package com.photo.dao.mapper;

import java.util.List;
import java.util.Map;
import com.photo.bean.mapper.UserImage;

public interface UserImageMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserImage record);

    int insertSelective(UserImage record);

    UserImage selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserImage record);

    int updateByPrimaryKey(UserImage record);
    
    List<UserImage> selectByParams(Map<String,Object> map);
}