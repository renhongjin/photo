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
		</style>
	</head>
	<body>
	<c:set var="headMenu" value="workbench" scope="request"/>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<c:set var="first_menu" value="manager" scope="request"/>
		<c:set var="second_menu" value="top" scope="request"/>
		<jsp:include page="./cmpmenu.jsp"></jsp:include>
		<div class="right">
			<table class="table table-hover">
		      <thead>
		        <tr>
				  <th>招聘职位</th>
				  <th>职位状态</th>
		          <th>职位最后修改时间</th>
		          <th>操作</th>
		        </tr>
		      </thead>
		      <tbody>
		      	<c:forEach items="${recruits }" var="recruit">
		      		<tr>
			          <td><a target="_blank" href="${PATH}/recruit/preview.html?id=${recruit.id}">${recruit.jobName }</a></td>
			          <td>
			          	<c:choose>
			          		<c:when test="${recruit.state eq 0  }">
			          			<span class="label label-default">未发布</span>
			          		</c:when>
			          		<c:when test="${recruit.state eq 1  }">
			          			<span class="label label-primary">待审核</span>
			          		</c:when>
			          		<c:when test="${recruit.state eq 2  }">
			          			<span class="label label-success">已发布</span>
			          		</c:when>
			          		<c:when test="${recruit.state eq 3  }">
			          			<span class="label label-danger">审核失败</span>
			          		</c:when>
			          		<c:when test="${recruit.state eq 4  }">
			          			<span class="label label-warning">已撤销</span>
			          		</c:when>
			          	</c:choose>
			          </td>
			          <td>${recruit.addDay } ${recruit.addTime }</td>
			          <td>
			          	<!-- <a href="#" ><i class="fa fa-arrow-circle-up"></i>置顶</a>
			          	<a href="#" ><i class="fa fa-edit"></i>修改</a>-->
			          	<a href="javascript:void(0);" onclick="updateRecruit('${recruit.id}',4);"><i class="fa fa-undo"></i>撤销</a> 
			          	<a href="javascript:void(0);" onclick="updateRecruit('${recruit.id}',5);"><i class="fa fa-trash"></i>删除</a>
			          </td>
			        </tr>
		      	</c:forEach>
		      </tbody>
	    </table>
	    <!-- 暂时注释掉分页
	    <nav>
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav> -->
	</div>
	</div>
	<script src="${PATH}/statics/js/jquery-2.1.3.js"></script>
	<script src="${PATH }/statics/js/cmpmenu.js" type="text/javascript"></script>
	<script type="text/javascript" src="${PATH }/statics/layer/layer.js"></script>
	<script type="text/javascript">
		function updateRecruit(recruitId,statues){
			layer.confirm('是否确定撤销当前发布的招聘职位？', {
				  btn: ['是','否'] //按钮
				}, function(){
					$.ajax({
		                type: "POST",
		                url: "${PATH}/recruit/updateRecruit.html",
		                data: {'recruitId':recruitId,'statues':statues},
		                success: function(result) {
		                	result = $.parseJSON(result);
		                	if(result.flag=='success'){
		                		layer.msg("成功撤销");
		                	}
		                }
		            });
				}, function(){
				});
		}
	</script>
	</body>
</html>
