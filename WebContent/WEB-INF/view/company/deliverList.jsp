<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>职位管理置顶</title>
		<link href="${PATH }/statics/css/bootstrap.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
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
			.search_area{
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
	<c:set var="headMenu" value="workbench" scope="request"/>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<c:set var="first_menu" value="manager" scope="request"/>
		<c:set var="second_menu" value="deliverList" scope="request"/>
		<jsp:include page="./cmpmenu.jsp"></jsp:include>
		<div class="right">
			<div class="search_area">
				<form class="form-inline" method="post" action="${PATH}/recruit/getdeliverList.html">
				  <div class="form-group">
				    <label for="exampleInputName2">职位状态:</label>
				    <select class="form-control" name="status">
				      <option value="-1" ${status==-1 ? 'selected':''}>全部</option>
					  <option value="0" ${status==0 ? 'selected':''}>投递成功</option>
					  <option value="1" ${status==1 ? 'selected':''}>企业已查看</option>
					  <option value="2" ${status==2 ? 'selected':''}>通知面试</option>
					  <option value="3" ${status==3 ? 'selected':''}>不合适</option>
					</select>		
				  </div>
<!-- 				  <div class="form-group">
				    <label>职位名称:</label>
				    <input type="text" class="form-control" name="name" style="width: 100px;">
				  </div> -->
				  <button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
			<table class="table table-hover">
		      <thead>
		        <tr>
		          <th>状态</th>
				  <th>招聘职位</th>
				  <th>应聘人</th>
		          <th>期望职位</th>
		          <th>期望地区</th>
		          <th>时间</th>
		          <th>操作</th>
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
			          			<span class="label label-primary">已经查看</span>
			          		</c:when>
			          		<c:when test="${deliver.state eq 2  }">
			          			<span class="label label-success">已经通知面试</span>
			          		</c:when>
			          		<c:when test="${deliver.state eq 3  }">
			          			<span class="label label-success">不合适</span>
			          		</c:when>
			          	</c:choose>
			          </td>
			          <td>
			          	<a href="${PATH}/recruit/toRecruitPage.html?recruitId=${deliver.recruitId }" target="_blank">${deliver.recruitName }</a>
			          </td>
			          <td>
			          	${deliver.personName }
			          </td>
			          <td>${deliver.idealJobName }</td>
			          <td>${deliver.idealPlace }</td>
			          <td>
			          	${deliver.deliverTime }
			          </td>
			          <td class="cz">
			          	<a href="${PATH}/resume/preview.html?resumeId=${deliver.resumeId }&recordId=${deliver.id }" target="_blank">查看简历</a>
			          	<a href="javascript:void(0);" onclick="updateDeliver('${deliver.id }',3);">不匹配</a>
			          	<a href="javascript:void(0);" onclick="updateDeliver('${deliver.id }',2);">通知面试</a>
			          </td>
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
			      			<li><a href="${PATH}/recruit/getdeliverList.html?currentPage=${page.start-1}&status=${status}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
			      		</c:otherwise>
			      	</c:choose>
			      	
			      	<c:forEach begin="${page.start }" end="${page.end }" var="index">
			      		<li class="${page.currentPage == index ?'active':''}"><a href="${PATH}/recruit/getdeliverList.html?currentPage=${index }&status=${status}">${index }</a></li>
			      	</c:forEach>
			      	<c:choose>
			      		<c:when test="${page.end == page.totalPage}">
				      		<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			      		</c:when>
			      		<c:otherwise>
			      			<li><a href="${PATH}/recruit/getdeliverList.html?currentPage=${page.end+1}&status=${status}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			      		</c:otherwise>
			      	</c:choose>
			     </ul>
		   		</nav>
		   </div>
	</div>
	</div>
	<script src="${PATH}/statics/js/jquery-2.1.3.js"></script>
	<script src="${PATH }/statics/js/cmpmenu.js" type="text/javascript"></script>
	<script type="text/javascript" src="${PATH }/statics/layer/layer.js"></script>
	<script type="text/javascript">
	function updateDeliver(recordId,status){
		layer.confirm('是否继续该操作？', {
			  btn: ['是','否'] //按钮
			}, function(){
				$.ajax({
	                type: "POST",
	                url: "${PATH}/recruit/changeStatus.html",
	                data: {'recordId':recordId,'status':status},
	                success: function(result) {
	                	result = $.parseJSON(result);
	                	if(result.flag=='success'){
	                		if(status == 2){
		                		$('#recour_status_'+recordId).html('<span class="label label-success">已通知面试</span>');
	                		}else if(status == 3){
	                			$('#recour_status_'+recordId).html('<span class="label label-success">不匹配</span>');
	                		}
	                		layer.msg("操作成功");
	                	}
	                }
	            });
			}, function(){
			});
	}
	</script>
	</body>
</html>
