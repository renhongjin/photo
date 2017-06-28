package com.photo.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;

/**
 * 读取配置文件的内容到Map<String,String>中</br>
 * 配置文件中不要使用双引号，双斜杠这样fastjson解析的时候会出错
 * @author lenovo
 *
 */
public class LocalConfig {
	private static final String configFileName = "config.json";
	private static Map<String,String> result = null;
	private static Log log = LogFactory.getLog(LocalConfig.class); 
	public static void main(String[] args) {
		Map<String,String> o = readFromFileToMap();
		log.debug(o.get("test"));
		//readFromFileToMap();
	}
	static{
		readFromFileToMap();
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> readFromFileToMap(){
		if(result != null){
			return result;
		}
		FileInputStream read = null;
		try {
			URL url = LocalConfig.class.getClassLoader().getResource(configFileName);
			read = new FileInputStream(url.getFile());
			int len = 1024;
			byte[] buff = new byte[1024];
			StringBuffer sb = new StringBuffer();
			while(read.read(buff, 0, len) != -1){
				String s = new String(buff);
				sb.append(s);
			}
			log.debug("读取配置文件内容：\n"+sb.toString());
			result = (Map<String, String>) JSON.parse(sb.toString().trim());
		}catch(Exception e){
			log.error("配置文件加载或者读取失败！");
		} finally{
			if(read != null){
				try {
					read.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
}
