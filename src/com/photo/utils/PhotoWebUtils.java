package com.photo.utils;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class PhotoWebUtils {

	/**
	 * 获取远程访问主机的ip地址
	 * @param request
	 * @return
	 */
	public static String getRemoteHost(HttpServletRequest request){
	    String ip = request.getHeader("x-forwarded-for");
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getRemoteAddr();
	    }
	    return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	}
	/**
	 * 把请求中的参数传回到页面
	 * @param request
	 */
	public static void deliever(HttpServletRequest request){
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String name = (String) params.nextElement();
			request.setAttribute(name, request.getParameter(name));
		}
	}
}
