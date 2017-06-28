package com.photo.service;

import java.util.List;
import com.photo.bean.mapper.UserImage;

/**
 * 公共服务接口
 * @author lenovo
 *
 */
public interface ICommonService{
  /**
   * 保存用户上传的图片
   * @param userId
   * @param path
   */
  void saveImage(String userId,String path);
  
  /**
   * 获取用户的图片
   * @return
   */
  List<UserImage> getUserImage(String userId);
  
  /**
   * 逻辑删除图片
   * @param imageId
   * @return
   */
  boolean deleteImage(String imageId);

  /**
   * 保存用户或者企业的头像
   * @param userType
   * @param userId
   * @param url
   */
  void saveHeadImage(String userType,String userId,String url);
}
