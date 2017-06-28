package com.photo.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import com.photo.bean.mapper.Company;
import com.photo.bean.mapper.Personal;
import com.photo.service.ICommonService;
import com.photo.service.IUserService;
import com.photo.utils.DateUtils;
import com.photo.utils.LocalConfig;
import com.photo.utils.UUIDUtils;

@Controller
@RequestMapping("/common")
public class CommonController{
  
  private static Log log = LogFactory.getLog(CommonController.class);
  
  @Resource(name = "commonService")
  private ICommonService commonService;
  
  @Resource(name = "userService")
  private IUserService userService;
  /**
   * 列出企业的相册，或者个人的作品
   * @return
   */
  @RequestMapping(value="imageList")
  public ModelAndView imageList(HttpSession session){
    ModelAndView mv = new ModelAndView("company/imageList");
    String userId = null;
    Company cmp = userService.getCurrentCmp(session);
    Personal p = userService.getCurrentPerson(session);
    if(cmp != null){
      userId = cmp.getId();
    }
    if(p != null){
      userId = p.getId();
    }
    mv.addObject("imageList",commonService.getUserImage(userId));
    return mv;
  }
  
  @ResponseBody
  @RequestMapping("/uploadHeadImg") 
  public String uploadHead(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IllegalStateException, IOException{
    String url = null;
    String userId = null;
    String userType = null;
    Company cmp = userService.getCurrentCmp(session);
    Personal p = userService.getCurrentPerson(session);
    if(cmp!=null){
      userId = cmp.getId();
      userType = "cmp";
    }
    if(p!=null){
      userId = p.getId();
      userType = "personal";
    }
    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
    //判断 request 是否有文件上传,即多部分请求  
    if(multipartResolver.isMultipart(request)){
      //转换成多部分request    
      MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
      //取得request中的所有文件名  
      Iterator<String> iter = multiRequest.getFileNames();
      //上传图片的保存路径
      String imagePath = LocalConfig.readFromFileToMap().get("headImg");
      int len = imagePath.lastIndexOf('/');
      File direct = new File(imagePath);
      if(!direct.exists()&&!direct.isDirectory()){
        direct.mkdirs();
      }
      while(iter.hasNext()){
        //记录上传过程起始时的时间，用来计算上传时间  
        int pre = (int)System.currentTimeMillis();
        //取得上传文件  
        MultipartFile file = multiRequest.getFile(iter.next());
        if(file!=null){
          //取得当前上传文件的文件名称  
          String originFilename = file.getOriginalFilename();
          //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
          if(originFilename.trim()!=""){
            String extendName = originFilename.substring(originFilename.lastIndexOf('.')+1);//文件的后缀名称
            //重命名上传后的文件名  
            String fileName = UUIDUtils.next()+"."+extendName;
            String imgPath = imagePath+"/"+fileName;
            //定义上传路径  
            File imgFile = new File(imgPath);
            file.transferTo(imgFile);
            url = imgPath.substring(len);
            commonService.saveHeadImage(userType,userId,url);
          }
        }
        //记录上传该文件后的时间  
        int finaltime = (int)System.currentTimeMillis();
        log.info("上传文件时间："+(finaltime-pre));
      }
    }
    if(cmp != null){
      cmp.setHead(url);
    }else{
      p.setHead(url);
    }
    return url;
  }
  @ResponseBody
  @RequestMapping("/upload")  
  public List<String> upload2(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IllegalStateException,IOException{
    String userId = null;
    Company cmp = userService.getCurrentCmp(session);
    Personal p = userService.getCurrentPerson(session);
    if(cmp!=null){
      userId = cmp.getId();
    }
    if(p!=null){
      userId = p.getId();
    }
    //创建一个通用的多部分解析器
    List<String> urls = new ArrayList<String>();
    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
    //判断 request 是否有文件上传,即多部分请求  
    if(multipartResolver.isMultipart(request)){
      //转换成多部分request    
      MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
      //取得request中的所有文件名  
      Iterator<String> iter = multiRequest.getFileNames();
      //上传图片的保存路径
      String imagePath = LocalConfig.readFromFileToMap().get("imgPath");
      int len = imagePath.lastIndexOf('/');
      Date now = new Date();
      String[] time = DateUtils.getDay(now).split("-");
      String year = time[0];
      String month = time[1];
      String day = time[2];
      imagePath = imagePath+"/"+year+"/"+month+"/"+day;
      File direct = new File(imagePath);
      if(!direct.exists()&&!direct.isDirectory()){
        direct.mkdirs();
      }
      while(iter.hasNext()){
        //记录上传过程起始时的时间，用来计算上传时间  
        int pre = (int)System.currentTimeMillis();
        //取得上传文件  
        MultipartFile file = multiRequest.getFile(iter.next());
        if(file!=null){
          //取得当前上传文件的文件名称  
          String originFilename = file.getOriginalFilename();
          //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
          if(originFilename.trim()!=""){
            String extendName = originFilename.substring(originFilename.lastIndexOf('.')+1);//文件的后缀名称
            //重命名上传后的文件名  
            String fileName = UUIDUtils.next()+"."+extendName;
            String imgPath = imagePath+"/"+fileName;
            //定义上传路径  
            File imgFile = new File(imgPath);
            file.transferTo(imgFile);
            String url = imgPath.substring(len);
            urls.add(url);
            commonService.saveImage(userId,url);
          }
        }
        //记录上传该文件后的时间  
        int finaltime = (int)System.currentTimeMillis();
        log.info("上传文件时间："+(finaltime-pre));
      }
      return urls;
    }
    return urls;
  }
}
