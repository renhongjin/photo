<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>我的作品</title>
	<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/cmpmenu.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/input.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		.imgitem{
			width:190px;
			float: left;
			margin: 5px;
		}
		.imgitem img{
			height : 180px;
			width : 180px;
		}
		
	</style>
</head>
<body>
	<c:set var="headMenu" value="userworkbench" scope="request"/>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<c:set var="first_menu" value="personalInfo" scope="request"/>
		<c:set var="second_menu" value="myzp" scope="request"/>
		<jsp:include page="./personalMenu.jsp"></jsp:include>
		<div class="right">
			<form id="submit_form" method="post" action="${PATH}/common/upload.html" target="exec_target" enctype="multipart/form-data">
			     <input type="file" name="upload_file" id="upload_file">        <!-- 添加上传文件 -->
			</form>
 			<iframe id="exec_target" name="exec_target" style="display: none;"></iframe>    <!-- 提交表单处理iframe框架 -->
 			<div id="feedback"><!-- 响应返回数据容器 -->
 				<ul class="imgs">
 					<c:forEach items="${ imageList}" var="img">
 						<li class="imgitem"  id="${img.id}">
		 					<a href="#">
			 					<img class="img-thumbnail" src="${imgPath}${img.imageUrl }" >
		 					</a>
		 					<a href="javascript:void(0);" onclick="deleteImage('${img.id}');">删除</a>
	 					</li>
 					</c:forEach>
 				</ul>
 			</div>    
		</div>
	</div>
	<script src="${PATH }/statics/js/jquery-2.1.3.js"></script>
	<script src="${PATH }/statics/js/cmpmenu.js"></script>
	<script src="${PATH }/statics/layer/layer.js"></script>
	<script src="${PATH }/statics/js/public.js" ></script>
	<script type="text/javascript">
	$(function() {
		   //选择文件成功则提交表单
		   $("#upload_file").change(function(){
		       if($("#upload_file").val() != '') $("#submit_form").submit();
		   });
		   //iframe加载响应，初始页面时也有一次，此时data为null。
		   $("#exec_target").load(function(){
		       var data = $(window.frames['exec_target'].document.body).html();
		       data = JSON.parse(data);
		       //若iframe携带返回数据，则显示在feedback中
		       if(data != null){
		    	   var dom = '';
		    	   for(var i=0;i<data.length;i++ ){
		    		   var img = '<li class="imgitem"> '+
				 				'	<a href="#">'+
				 				'		<img class="img-thumbnail"  src="${imgPath}'+data[i]+'" />'+
			 					'	</a>'+
								 '</li>';
		    		   dom = dom + img;
		    	   }
		           $(".imgs").append(dom);
		           $("#upload_file").val('');
		       }
		   });
	})
	</script>
</body>
</html>