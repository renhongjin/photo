package com.photo.utils;
/**
 * string类型参数的工具方法
 * @author rhj
 *
 */
public class StringUtils {
	/**
	 * 有内容返回 true<br/>
	 * 空字符串或者null则返回fasle
	 * @param s 目标字符串
	 * @return boolean
	 */
	public static boolean notNullAndEmpty(String s){
		if(s == null || "".equals(s)){
			return false;
		}
		return true;
	}
	
	/**
	 * 是null则返回true,否则返回false
	 * @param s
	 * @return boolean
	 */
	public static boolean isNull(String s){
		if(s == null){
			return true;
		}
		return false;
	}
	
	/**
	 * 字符串为空字符串的时候返回true,null时抛出异常，其它返回false
	 * @param s
	 * @return
	 */
	public static boolean isEmpty(String s){
		if(s == null){
			throw new NullPointerException();
		}
		if("".equals(s)){
			return true;
		}
		return false;
	}
}
