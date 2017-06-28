package com.photo.utils;


import nlf.plugin.mail.Email;

public class EmailUtils {

	/**
	 * 发送注册邮件
	 * @param email
	 * @param code 邮箱验证码
	 * @param roleType
	 * @throws Exception
	 */
	public static void sendRegisterEmail(String email,String code,int roleType) throws Exception{
		String url = "http://127.0.0.1:8080/photoRecruit/checkEmail.html?code="+code+roleType;
		String content = "欢迎加入</br>你的登录邮箱是："+email+"请点击以下链接验证你的邮箱地址，验证后就可以使用的所有功能啦! <a href='"+url+"'>"+url+"</a>";
		Email.create()
	    .smtp("smtp.qq.com",465)//qq作为发送  163作为发送：smtp.163.com  25
	    .auth("1126209371@qq.com","rhj1697878836")
	    .from("1126209371@qq.com")
	    .to(email)
	    .ssl()
	    .subject("欢迎加入，请验证登录邮箱")
	    .html(content)//发送文本邮件.html()发送网页，.file发送附件
	    .send();
	}
	
	public static void main(String[] args) {
		try {
			sendRegisterEmail("3121760544@qq.com","123456",0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
