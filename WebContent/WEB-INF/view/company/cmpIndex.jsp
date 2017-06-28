<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>企业列表页</title>
		<link href="${PATH }/statics/css/bootstrap.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
		<style>
			.info{
				margin-left: 20px;
			}
			.info li i{
				margin-right: 10px;
				color: #00838A;
			}
			.info li{
				text-align: left;
				line-height: 30px;
				font-size: 16px;
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
		<c:set var="headMenu" value="cmp" scope="request"/>
		<jsp:include page="../head.jsp"></jsp:include>
		<div class="content">
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h3 class="panel-title">企业基本信息</h3>
			  </div>
			  <div class="panel-body">
			  	<div style="display: inline-flex;">
				    <img src="${imgPath }${me.head}" width="125px" height="135px" />
				    <ul class="info">
				    	<li style="font-size: 20px;font-weight: bold;margin-bottom: 10px;"><i> </i>${cmp.name }</li>
				    	<li><i class="fa fa-fire"></i>10个在招职位</li>
				    	<li>
				    		<i class="fa fa-line-chart"></i>
				    		<c:choose>
								<c:when test="${cmp.stage eq 0}">初创型</c:when>
								<c:when test="${cmp.stage eq 1}">成长型</c:when>
								<c:when test="${cmp.stage eq 2}">成熟型</c:when>
								<c:when test="${cmp.stage eq 3}">已上市</c:when>
							</c:choose>
						</li>
				    	<li><i class="fa fa-map-marker"></i>${cmp.address }</li>
				    </ul>
				    <ul class="info" style="margin-left: 100px;max-width: 450px;">
				    	<li style="font-size: 20px;font-weight: bold;margin-bottom: 10px;"><i> </i></li>
				    	<li><i class="fa fa-area-chart"></i>
				    		<c:choose>
								<c:when test="${cmp.area eq 0}">200平米下</c:when>
								<c:when test="${cmp.area eq 1}">200-400平米</c:when>
								<c:when test="${cmp.area eq 2}">400-800平米</c:when>
								<c:when test="${cmp.area eq 3}">800以上</c:when>
							</c:choose>
				    	</li>
				    	<li><i class="fa fa-group"></i>
				    		<c:choose>
								<c:when test="${cmp.staffNum eq 0}">50人以下</c:when>
								<c:when test="${cmp.staffNum eq 1}">50-200人</c:when>
								<c:when test="${cmp.staffNum eq 2}">200-500人</c:when>
								<c:when test="${cmp.staffNum eq 3}">500-1000人</c:when>
								<c:when test="${cmp.staffNum eq 4}">1000人以上</c:when>
							</c:choose>
				    	</li>
				    	<li><i class="fa fa-hand-o-right"></i> ${cmp.slogan }</li>
				    </ul>
			  	</div>
			  </div>
			</div>
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h3 class="panel-title">企业介绍</h3>
			  </div>
			  <div class="panel-body">
			  	<div>
				    ${cmp.desc}
			  	</div>
			  </div>
			</div>
			<div class="panel panel-info">
			  <div class="panel-heading">
			    <h3 class="panel-title">企业照片</h3>
			  </div>
			  <div class="panel-body">
			  	<div>
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
	</body>
</html>
