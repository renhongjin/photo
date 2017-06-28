package com.photo.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 日期工具类<br/>
 * <b>注意:12小时和24小时制的差别当小时为hh时为12小时制，为kk时则为24小时制</b>
 * @author rhj
 *
 */
public class DateUtils {
	
	public static void main(String[] args) {
		Date d =  new Date();
		System.out.println(getTime(d));
	}
	public static String getDay(Date date){
		String dayAndTime = dateToString(date,"yyyy-MM-dd kk:mm:ss");
		return dayAndTime.substring(0, 10);
	}
	public static String getTime(Date date){
		String dayAndTime = dateToString(date,"yyyy-MM-dd kk:mm:ss");
		return dayAndTime.substring(11, dayAndTime.length());
	}
	public static long getLongTime(Date date){
		return date.getTime();
	}
	/**
	 * 日期字符串转换为Date类型<br/>
	 * @param source 2015-11-23 17:39:08
	 * @param pattern yyyy-MM-dd hh:mm:ss
	 * @return
	 * @throws ParseException
	 */
	public static Date stringToDate(String source,String pattern) throws ParseException{
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		return df.parse(source);
	}
	
	/**
	 * Date类型转换为string类型
	 * @param date  日期Date
	 * @param pattern 模式
	 * @return 返回Date类型
	 */
	public static String dateToString(Date date,String pattern){
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		return df.format(date);
	}
	
	/**
	 * 时间的长整形转换为日期的字符串显示
	 * @param date long类型
	 * @param pattern 转换的模式
	 * @return 日期的字符串显示
	 */
	public static String longToString(long date,String pattern){
		Date d = new Date(date);
		return dateToString(d,pattern);
	}
}
