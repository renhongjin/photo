package com.photo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.photo.bean.mapper.Resume;
import com.photo.dao.mapper.ResumeMapper;
import com.photo.service.IResumeService;

@Service("resumeService")
public class ResumeService implements IResumeService{
  private static final Log log = LogFactory.getLog(ResumeService.class);
  
  @Autowired
  private ResumeMapper resumeMapper;
  
  @Override
  public void addOrUpdate(Resume resume,boolean flag){
    if(flag){
      //添加简历
      resumeMapper.insert(resume);
    }else{
      //修改简历
      resumeMapper.updateByPrimaryKeySelective(resume);
    }
  }

  @Override
  public Resume getById(String id){
    return resumeMapper.selectByPrimaryKey(id);
  }

  @Override
  public Resume getByPersonalId(String personalId){
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("personalId",personalId);
    List<Resume> resumes = resumeMapper.selectByParams(map);
    if(resumes != null && resumes.size() == 1){
      return resumes.get(0);
    }else if(resumes == null){
      log.info("[getByPersonalId]不存在简历personalId=>"+personalId);
      return null;
    }else{
      log.error("[getByPersonalId]存在多份简历personalId=>"+personalId);
      return null;
    }
  }
}
