<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
		<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet"/>
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
			.way>a{
				font-size: 16px;
				padding-bottom: 3px;
			}
			.way_sel{
				color: #00838A;
				border-bottom: 2px solid #00838A;
			}
			.way>a:hover{
				border-bottom: 2px solid #00838A;
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
			.yzmdiv{
				height: 40px;
				width: 312px;
				margin-top: 20px;
				border-radius: 3px;
				display: inline-flex;
			}
			.yhxydiv{
				text-align: left;
				line-height: 16px;
				width: 300px;
				margin-top: 20px;
				border-radius: 3px;
			}
			.yhxydiv>a{color: #00838A;}
			.yzmdiv>input{
				width: 200px;
				height: 40px;
				background-color: #F8F8F8;
				border: 1px solid #F8F8F8;
				padding-left: 5px;
				padding-right: 5px;
				border-top-left-radius:3px;
				border-bottom-left-radius: 3px;
			}
			input:focus{
				border-color: #0A7276!important;
			}
			.btn{
				background-color: #5CC0C5;
				color: white;
				line-height: 40px;
				width: 140px;
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
			}
			.type{
				margin-top: 20px;
			}
			.type>input{
				background-color: white;
				border: 1px solid #DBCACA;
				width: 150px;
				line-height: 40px;
				border-radius: 3px;
			}
			.type>input.typesel{
				border: 1px solid #0A7276;	
			}
			.email{display: none;}
			form{width: 312px;}
			.phone,.email{
				text-align: center;
				margin: 0px auto;
				width: 312px;
			}
		</style>
	</head>
	<body>
		<div class="header"></div>
		<div class="reg_box">
			<div class="way">
				<a href="javascript:void(0);" style="margin-right: 50px;" class="way_sel" onclick="regType(this,'phone');"><i class="fa fa-mobile"></i>&nbsp;手机注册</a>
				<a href="javascript:void(0);" onclick="regType(this,'email');"><i class="fa fa-envelope-o"></i>&nbsp;邮箱注册</a>
			</div>
			<div class="phone">
					<form action="${PATH }/register.html" method="post" onsubmit="return telRegister();">
						<input type="text" name="telephone" id="telephone" placeholder="请输入你的手机号" value="${telephone}"/>
						<div class="yzmdiv">
							<input type="text" name="yzm" id="yzm" placeholder="请输入收到的验证码"/>
							<a href="javascript:void(0);" class="btn" onclick="sendCode(this);">发送验证码</a>						
						</div>
						<input type="password" name="password" id="password" placeholder="设置你的密码"/>
						<div class="type">
							<input type="button" value="求职" onclick="usertype(this,'p','phone');"/>
							<input type="button" value="招聘" onclick="usertype(this,'c','phone');"/>
							<input type="hidden" name="phoneType" id="phoneType" value="0"/>
							<input type="hidden" name="registerType" value="1"/>
						</div>
						<div class="yhxydiv">
							<input type="checkbox" name="telprotocol" id="telprotocol"/>
							<span>我已经阅读并且同意</span><a href="#">用户协议</a>						
						</div>
						<input type="submit" value="注  册" class="zc"/>
						<span style="color:red;">${errMsg }</span>
					</form>
			</div>
			<div class="email">
				<form action="${PATH }/register.html" method="post" onsubmit="return emailRegister();">
					<input type="text" id="email" name="email" value="${email}" placeholder="请输入你的常用邮箱" />
					<input type="password" id="emailpassword" name="password" placeholder="设置你的密码"/>
					<div class="type">
						<input type="button" value="求职" onclick="usertype(this,'p','email');"/>
						<input type="button" value="招聘" onclick="usertype(this,'c','email');"/>
						<input type="hidden" name="emailType" id="emailType" value="0"/>
						<input type="hidden" name="registerType" value="2"/>
					</div>
					<div class="yhxydiv">
						<input type="checkbox" id="emailprotocol"/>
						<span>我已经阅读并且同意</span><a href="#">用户协议</a>						
					</div>
					<input type="submit" value="注  册" class="zc"/>
				</form>
			</div>
		</div>
		<script type="text/javascript" src="${PATH }/statics/js/jquery-2.1.3.js" ></script>
		<script type="text/javascript" src="${PATH }/statics/layer/layer.js"></script>
		<script>
			function emailRegister(){
				var email = $('#email').val();
				var password = $('#emailpassword').val();
				var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
				if(!emailReg.test(email)){
					layer.tips('请输入有效的邮箱！', '#email');
				    return false; 
				}
				var psdreg=/^(\w){6,20}$/;   
				if (!psdreg.test(password)){
					layer.tips('密码规则：6-20个字母、数字、下划线', '#emailpassword');
					return false ;
				} 
				var emailType = $("#emailType").val();
				if(emailType == "0"){
					layer.msg('记得选择你是招聘或者求职哟！');
					return false;
				}
				if(!$("#emailprotocol").is(':checked')){
					layer.msg('记得阅读用户协议！');
					return false;
				}
				return true;
			}
			function telRegister(){
				var telephone = $('#telephone').val();
				var yzm = $('#yzm').val();
				var psd = $("#password").val();
				var telreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
				if(!telreg.test(telephone)) { 
					layer.tips('请输入有效的手机号码！', '#telephone');
				    return false; 
				}
				var psdreg=/^(\w){6,20}$/;   
				if (!psdreg.test(psd)){
					layer.tips('密码规则：6-20个字母、数字、下划线', '#password');
					return false ;
				} 
				var phoneType = $("#phoneType").val();
				if(phoneType == "0"){
					layer.msg('记得选择你是招聘或者求职哟！');
					return false;
				}
				if(!$("#telprotocol").is(':checked')){
					layer.msg('记得阅读用户协议！');
					return false;
				}
				return true;
			}
			function sendCode(tis){
				var i = 60;
				$(tis).attr("disabled", true); 
				var timer=setInterval(function(){
					$(tis).text(--i	+'秒后重试！');	
					if(i==0){
						clearInterval(timer);
						$(tis).text('重新发送验证码！');
						$(tis).attr("disabled", false); 
					}
				},1000);
			}
			function regType(regType,desc){
				$(".way_sel").removeClass('way_sel');
				$(regType).addClass('way_sel');
				if(desc == 'phone'){
					$('.email').hide();
					$('.phone').show();
				}else{
					$('.phone').hide();
					$('.email').show();
				}
			}
			function usertype(dom,type,way){
				$('.typesel').removeClass('typesel');
				$(dom).addClass('typesel');
				var type;
				if(type =='p'){
					type = 1;
				}else if(type == 'c'){
					type = 2;
				}else{
					type = 0;
				}
				if(way =='phone'){
					$("#phoneType").val(type);
				}else{
					$("#emailType").val(type);
				}
			}
		</script>
	</body>
</html>