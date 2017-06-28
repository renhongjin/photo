package com.photo.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckUtils {

	/**检测邮箱是否合法*/
	public static boolean checkEmail(String email){
		Pattern pattern = Pattern.compile("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"); 
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}
	/**检测手机号码是否合法*/
	public static boolean checkMobile(String mobile){
		Pattern pattern = Pattern.compile("^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\\d{8})$"); 
		Matcher matcher = pattern.matcher(mobile);
		return matcher.matches();
	}
	/**检测座机*/
	public static boolean checkPhone(String phone){
		Pattern pattern = Pattern.compile("^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$"); 
		Matcher matcher = pattern.matcher(phone);
		return matcher.matches();
	}
	
	/**密码验证*/
	public static boolean checkPassword(String password){
		Pattern pattern = Pattern.compile("^(\\w){6,20}$"); 
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}
	
	public static void main(String[] args) {
		/*String email = "xx@qq.com";
		System.out.println(checkEmail(email));*/
		
		/*String mobile = "13547603709";
		System.out.println(checkMobile(mobile));*/
		/*String phone = "028-55555555";
		System.out.println(checkPhone(phone));*/
		String password = "rhj123rhj123rhj123rhj123";
		System.out.println(checkPassword(password));
	}
}
