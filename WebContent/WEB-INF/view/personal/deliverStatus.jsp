<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>面试邀请</title>
	<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/cmpmenu.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/input.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/zzsc.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/page.css" rel="stylesheet" type="text/css"/>
	<style>
		table{
			margin-top: 20px;
			margin-left: 30px;
		}
		td a{
			color: #00838A;
		}
		td a{
			margin-right: 7px;
		}
		td a i{
			margin-right: 2px;
		}
		.cz a:HOVER {
			background-color: #00838A;
			color: white;
		}
		.page,.search_area{
			margin-left: 34px;
		}
		.form-group{
			margin-right: 30px;
		}
		.btn-primary{
			background-color: #00838A;
			border-color: #00838A;
		}
	</style>
</head>
<body>
	<c:set var="headMenu" value="userworkbench" scope="request"/>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<c:set var="first_menu" value="resume" scope="request"/>
		<c:set var="second_menu" value="invitation" scope="request"/>
		<jsp:include page="./personalMenu.jsp"></jsp:include>
		<div class="right">
			<div class="search_area">
				<form class="form-inline" method="post" action="${PATH}/personal/deliverStatus.html">
				  <div class="form-group">
				    <label for="exampleInputName2">职位状态:</label>
				    <select class="form-control" name="status">
				      <option value="-1" ${status==-1 ? 'selected':''}>全部</option>
					  <option value="0" ${status==0 ? 'selected':''}>新投递</option>
					  <option value="1" ${status==1 ? 'selected':''}>企业已经查看</option>
					  <option value="2" ${status==2 ? 'selected':''}>已经通知面试</option>
					  <option value="3" ${status==3 ? 'selected':''}>不合适</option>
					</select>		
				  </div>
				  <button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
			<table class="table table-hover">
			      <thead>
			        <tr>
			          <th>状态</th>
					  <th>企业名称</th>
					  <th>职位</th>
			          <th>企业所在地区</th>
			          <th>投递时间 -企业处理简历时间</th>
			        </tr>
			      </thead>
			      <tbody>
			      	<c:forEach items="${deliverList }" var="deliver">
			      		<tr>
				          <td id="recour_status_${deliver.id }">
				          	<c:choose>
				          		<c:when test="${deliver.state eq 0  }">
				          			<span class="label label-default">新投递</span>
				          		</c:when>
				          		<c:when test="${deliver.state eq 1  }">
				          			<span class="label label-primary">企业已经查看</span>
				          		</c:when>
				          		<c:when test="${deliver.state eq 2  }">
				          			<span class="label label-success">已通知面试</span>
				          		</c:when>
				          		<c:when test="${deliver.state eq 3  }">
				          			<span class="label label-success">不匹配</span>
				          		</c:when>
				          	</c:choose>
				          </td>
				          <td>
				          	<a href="${PATH}/company/toCmpInfo.html?cmpId=${deliver.cmpId}" target="_blank">${deliver.companyName }</a>
				          </td>
				          <td>
				          	<a href="${PATH}/recruit/toRecruitPage.html?recruitId=${deliver.recruitId }" target="_blank">${deliver.recruitName }</a>
				          </td>
				          <td>
				          	${deliver.cmpPlace }
				          </td>
				          <td>${deliver.deliverTime } -  ${deliver.lastUpdateTime }</td>
				        </tr>
			      	</c:forEach>
			      </tbody>
		    </table>
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
		</div>
	</div>
	<script src="${PATH }/statics/js/cmpmenu.js"></script>
</body>
</html>