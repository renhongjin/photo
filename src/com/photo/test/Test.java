package com.photo.test;

import java.io.IOException;



public class Test {

  public static void main(String[] args) throws IOException{
    /*String file = "D:/imgs/photo/2016/07";
    File f = new File(file);
    if(!f.exists()){
      f.mkdirs();
    }*/
     String s ="D:/imgs/photo";
     System.out.println(s.substring(s.lastIndexOf('/')));
  }
  
}
