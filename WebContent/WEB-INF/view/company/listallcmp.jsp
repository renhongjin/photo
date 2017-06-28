<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>婚纱影楼</title>
<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css" />
<link href="${PATH }/statics/css/index.css" rel="stylesheet" type="text/css" />
<link href="${PATH }/statics/css/slideBox.css" rel="stylesheet" type="text/css" />
<link href="${PATH }/statics/css/page.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	.cmp{
		width: 290px;
		height: 200px;
		display: inline;
		float: left;
		margin-top: 20px;
		margin-right: 10px;
		border: 1px solid rgb(240, 237, 237);
		border-radius: 5px;
		padding: 10px;
	}
	.cmp:hover{
		border: 1px solid #00838A;
	}
	.cmp img{
		border-radius: 5px;
		float: left;
	}
	.cmp_info_item{
		font-size: 16px;
		margin-left: 10px;
		float: left;
	}
	.cmp_info_item p{
		line-height: 35px;
	}
	.kouhao{
		clear: left;
		line-height: 25px;
		height: 50px;
		overflow-y: hidden;
	}
	i{
		color: #00838A;
	}
	.page{
		width: 1000px;
		height: 500px;
		text-align: center;
	}
</style>
</head>
<body>
	<body>
		<c:set var="headMenu" value="cmp" scope="request"/>
		<jsp:include page="../head.jsp"></jsp:include>
		<div class="content">
			<c:forEach items="${cmps }" var="cmp">
				<div class="cmp">
					<a target="_blank" href="${PATH}/company/toCmpInfo.html?cmpId=${cmp.id}"><img src="${imgPath }${cmp.head }" width="150px" /></a>
					<div class="cmp_info_item">
						<p><a target="_blank" href="${PATH}/company/toCmpInfo.html?cmpId=${cmp.id}">${cmp.name }</a></p>
						<p><a href="#">${recruitNum[cmp.id]}个在招的职位</a></p>
						<p><i class="fa fa-map-marker"></i>&nbsp;${cmp.cityName }</p>
						<p>
							<i class="fa fa-line-chart"></i>&nbsp;
							<c:choose>
								<c:when test="${cmp.stage eq 0}">初创型</c:when>
								<c:when test="${cmp.stage eq 1}">成长型</c:when>
								<c:when test="${cmp.stage eq 2}">成熟型</c:when>
								<c:when test="${cmp.stage eq 3}">已上市</c:when>
							</c:choose>
						</p>
					</div>
					<p class="kouhao"><i class="fa fa-hand-o-right"></i>&nbsp;${cmp.slogan }</p>
				</div>
			</c:forEach>
		</div>
		<!-- 注释分页 
		<div class="page">
			    <nav>
			      <ul class="pagination">
			      	<c:choose>
			      		<c:when test="${page.start == 1}">
				      		<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
			      		</c:when>
			      		<c:otherwise>
			      			<li><a href="${PATH}/personal/deliverStatus.html?currentPage=${page.start-1}&status=${status}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
			      		</c:otherwise>
			      	</c:choose>
			      	
			      	<c:forEach begin="${page.start }" end="${page.end }" var="index">
			      		<li class="${page.currentPage == index ?'active':''}"><a href="${PATH}/personal/deliverStatus.html?currentPage=${index }&status=${status}">${index }</a></li>
			      	</c:forEach>
			      	<c:choose>
			      		<c:when test="${page.end == page.totalPage}">
				      		<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			      		</c:when>
			      		<c:otherwise>
			      			<li><a href="${PATH}/personal/deliverStatus.html?currentPage=${page.end+1}&status=${status}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			      		</c:otherwise>
			      	</c:choose>
			     </ul>
		   </nav>
		 </div>
		 -->
	</body>
</body>
</html>