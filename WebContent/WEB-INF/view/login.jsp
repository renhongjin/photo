<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
		<style>
			body{
				text-align: center;
			}
			.header{
				background-color: #00838A;
				height: 320px;
			}
			.reg_box{
				width: 500px;
				margin-top: -160px;
				margin-left: auto;
				margin-right: auto;
				background-color: white;
				border-radius: 3px;
				position: relative;
				box-shadow: 0 0 5px #8E8E8E;
				padding: 50px;
			}
			form>input[type="text"],form>input[type="password"]{
				display: block;
				height: 40px;
				background-color: #F8F8F8;
				border: 1px solid #F8F8F8;
				margin-top: 20px;
				border-radius: 3px;
				width: 300px;
				padding-left: 5px;
				padding-right: 5px;
			}
			.yhxydiv{
				text-align: right;
				line-height: 16px;
				width: 300px;
				margin-top: 20px;
			}
			.yhxydiv>a{color: #00838A;}
			input:focus{
				border-color: #0A7276!important;
			}
			.btn{
				background-color: #5CC0C5;
				color: white;
				line-height: 40px;
				width: 100px;
				border-top-right-radius:3px;
				border-bottom-right-radius: 3px;
			}
			.zc{
				margin-top: 5px;
				border: 0px;
				background-color: #5CC0C5;
				color: white;
				border-radius: 3px;
				line-height: 40px;
				width: 302px;
				cursor: pointer;
			}
			form{width: 312px;}
			.email{
				text-align: center;
				margin: 0px auto;
				width: 312px;
			}
		</style>
	</head>
	<body>
		<div class="header"></div>
		<div class="reg_box">
			<div class="email">
				<form action="${PATH }/login.html" method="post" onsubmit="return checkForm();">
					<input type="text" name="account" id="account" value="${account }" placeholder="请输入你已验证的手机或邮箱" />
					<input type="hidden" name="accountType" value="0" />
					<input type="password" name="password" id="password" placeholder="请输入你的密码"/>
					<div class="yhxydiv">
						<a href="#">忘记密码?</a>						
					</div>
					<input type="submit" value="登   录" class="zc"/>
					<span style="color: red;">${errMsg}</span>
				</form>
				<div class="yhxydiv">
						<span>还没有账号？</span><a href="${PATH }/toregister.html">立即注册</a>						
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${PATH }/statics/js/jquery-2.1.3.js" ></script>
		<script type="text/javascript" src="${PATH }/statics/layer/layer.js"></script>
		<script type="text/javascript">
			function checkForm(){
				var account = $.trim($('#account').val());
				var password = $.trim($('#password').val());
				var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
				if(emailReg.test(account)){
					$('input[name="accountType"]').val("2");
				}else{
					var telreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
					if(telreg.test(account)) { 
						$('input[name="accountType"]').val("1");
					}else{
						layer.tips('账号格式错误', '#account');
						return false;
					}
				}
				var psdreg=/^(\w){6,20}$/;   
				if (!psdreg.test(password)){
					layer.tips('密码规则：6-20个字母、数字、下划线', '#password');
					return false ;
				}
				return true;
			}
		</script>
	</body>
</html>