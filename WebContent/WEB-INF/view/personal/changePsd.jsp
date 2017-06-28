<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>修改密码</title>
	<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/cmpmenu.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/input.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/zzsc.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<c:set var="headMenu" value="userworkbench" scope="request"/>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<c:set var="first_menu" value="personalInfo" scope="request"/>
		<c:set var="second_menu" value="changePsd" scope="request"/>
		<jsp:include page="./personalMenu.jsp"></jsp:include>
		<div class="right">
			<form id="msform" action="${PATH }/personal/changePsd.html" method="post" onsubmit="return checkForm();">
				<fieldset>
					<h2 class="fs-title">密码修改</h2>
					<div class="form-group">
					    <div class="input-group">
					      <div class="input-group-addon">旧密码</div>
					      <input type="password" class="form-control" name="oldPsd" placeholder="旧密码">
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      <div class="input-group-addon">新密码</div>
					      <input type="password" class="form-control" name="newPsd1" placeholder="新密码">
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      <div class="input-group-addon">确认新密码</div>
					      <input type="password" class="form-control" name="newPsd2" placeholder="确认新密码">
					    </div>
					</div>
					<input type="submit" name="submit" class="submit action-button" value="确认修改">
					<p>${errMsg}</p>
				</fieldset>
			</form>
		</div>
	</div>
	<script src="${PATH }/statics/js/jquery-2.1.3.js"></script>
	<script src="${PATH }/statics/js/cmpmenu.js"></script>
	<script src="${PATH }/statics/layer/layer.js"></script>
	<script type="text/javascript">
		function checkForm(){
			var oldPsd = $.trim($("input[name='oldPsd']").val());
			var newPsd1 = $.trim($("input[name='newPsd1']").val());
			var newPsd2 = $.trim($("input[name='newPsd2']").val());
			var psdreg=/^(\w){6,20}$/;   
			if (!psdreg.test(oldPsd)){
				layer.tips('密码规则：6-20个字母、数字、下划线', "input[name='oldPsd']");
				return false ;
			}
			if (!psdreg.test(newPsd1)){
				layer.tips('密码规则：6-20个字母、数字、下划线', "input[name='newPsd1']");
				return false ;
			}
			if (!psdreg.test(newPsd2)){
				layer.tips('密码规则：6-20个字母、数字、下划线', "input[name='newPsd2']");
				return false ;
			}
			if(newPsd1 != newPsd2){
				layer.tips('两次的输入密码不同', "input[name='newPsd2']");
				return false ;
			}
			return true;
		}
	</script>
</body>
</html>