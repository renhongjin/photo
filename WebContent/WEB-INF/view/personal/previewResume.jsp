<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>简历预览</title>
		<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/bootstrap.css" rel="stylesheet" type="text/css"/>
		<style>
			.panel-heading{
				text-align: center;
			}
			.tag{
				font-weight: 700;
			}
			.info li{
				width: 50%;
				float: left;
				text-align: left;
				line-height: 40px;
			}
			.zp img{
				margin-left: 20px;
				margin-bottom: 10px;
			}
			.tx{
				position: absolute;
				left: 340px;
			}
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
		<div class="content">
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h3 class="panel-title">基本信息</h3>
			  </div>
			  <div class="panel-body">
			    <ul class="info">
			    	<li><span class='tag'>姓名 : </span>${resume.name }</li>
			    	<li style="position: relative;">
			    		<span class='tag'>性别 : </span>
			    		<c:choose>
			    			<c:when test="${resume.sex eq '1' }">男</c:when>
			    			<c:when test="${resume.sex eq '2' }">女</c:when>
			    		</c:choose>
			    		<img width="115px" height="125px" src="${imgPath}${me.head }" alt="头像" class="img-thumbnail tx"/>
			    	</li>
			    	<li><span class='tag'>手机号码 : </span>${resume.phone }</li>
			    	<li><span class='tag'>邮箱 : </span>${resume.email }</li>
			    	<li><span class='tag'>出生年月 : </span>${resume.birthday }</li>
			    	<li>
			    		<span class='tag'>婚姻状况 : </span>
			    		<c:choose>
			    			<c:when test="${resume.marriage eq '1' }">已婚</c:when>
			    			<c:when test="${resume.marriage eq '2' }">未婚</c:when>
			    			<c:when test="${resume.marriage eq '3' }">其它</c:when>
			    		</c:choose>
			    	</li>
			    	<li><span class='tag'>身高 : </span>${resume.height }cm</li>
			    	<li>
			    		<span class='tag'>最高学历 : </span>
			    		<c:choose>
			    			<c:when test="${resume.degree eq '1' }">小学</c:when>
			    			<c:when test="${resume.degree eq '2' }">初中</c:when>
			    			<c:when test="${resume.degree eq '3' }">高中</c:when>
			    			<c:when test="${resume.degree eq '4' }">中专</c:when>
			    			<c:when test="${resume.degree eq '5' }">高专</c:when>
			    			<c:when test="${resume.degree eq '6' }">专科</c:when>
			    			<c:when test="${resume.degree eq '7' }">本科</c:when>
			    			<c:when test="${resume.degree eq '8' }">本科以上</c:when>
			    		</c:choose>
			    	</li>
			    	<li><span class='tag'>现在居住地址 : </span>${resume.city }</li>
			    	<li><span class='tag'>籍贯 : </span>${resume.origin }</li>
			    </ul>
			  </div>
			</div>
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h3 class="panel-title">工作期望</h3>
			  </div>
			  <div class="panel-body">
			    <ul class="info">
			    	<li><span class='tag'>期望职位 : </span>${resume.idealJob }</li>
			    	<li>
			    		<span class='tag'>工作经验 : </span>
			    		<c:choose>
			    			<c:when test="${resume.workYear eq '1' }">实习</c:when>
			    			<c:when test="${resume.workYear eq '2' }">1-3年</c:when>
			    			<c:when test="${resume.workYear eq '3' }">3-5年</c:when>
			    			<c:when test="${resume.workYear eq '4' }">5-10</c:when>
			    			<c:when test="${resume.workYear eq '5' }">10年以上</c:when>
			    		</c:choose>
			    	</li>
			    	<li><span class='tag'>期望待遇 : </span>${resume.idealMoney }</li>
			    	<li>
			    		<span class='tag'>工作方式 : </span>
			    		<c:choose>
			    			<c:when test="${resume.workWay eq '1' }">工时</c:when>
			    			<c:when test="${resume.workWay eq '2' }">兼职</c:when>
			    			<c:when test="${resume.workWay eq '3' }">全职</c:when>
			    		</c:choose>
			    	</li>
			    	<li>
			    		<span class='tag'>报销路费 : </span>
			    		<c:choose>
			    			<c:when test="${resume.freeTravel eq '1' }">面议</c:when>
			    			<c:when test="${resume.freeTravel eq '2' }">报销</c:when>
			    			<c:when test="${resume.freeTravel eq '3' }">不报</c:when>
			    		</c:choose>
			    	</li>
			    	<li>
			    		<span class='tag'>提供吃住 : </span>
			    		<c:choose>
			    			<c:when test="${resume.proPlace eq '1' }">面议</c:when>
			    			<c:when test="${resume.proPlace eq '2' }">提供</c:when>
			    			<c:when test="${resume.proPlace eq '3' }">不提供</c:when>
			    		</c:choose>
			    	</li>
			    </ul>
			  </div>
			</div>
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h3 class="panel-title">个人简介</h3>
			  </div>
			  <div class="panel-body">
			    ${resume.workExp }
			  </div>
			</div>
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h3 class="panel-title">作品展示</h3>
			  </div>
			  <div class="panel-body">
			  	<div class="zp">
			  		<ul class="imgs">
	 					<c:forEach items="${ imageList}" var="img">
	 						<li class="imgitem" id="${img.id}">
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
		</div>
		<script src="${PATH }/statics/js/jquery-2.1.3.js"></script>
		<script src="${PATH }/statics/layer/layer.js" ></script>
		<script src="${PATH }/statics/js/public.js" ></script>
	</body>
</html>
