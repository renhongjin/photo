<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>招聘预览</title>
		<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
		<style>
			.content .left{
				width: 650px;
				padding: 20px;
				border-radius: 5px;
				float: left;
				background-color: rgb(250, 250, 250);
			}
			.content .right{
				float: right;
				width: 290px;
				border-radius: 5px;
				background-color: rgb(250, 250, 250);
				text-align: center;
			}
			.zpitem{
				display: inline-block;
				margin-bottom: 20px;
				padding: 10px;
				background-color: #5CC0C5;
				border-radius: 5px;
				color: white;
				-webkit-box-shadow: 4px 4px 3px rgba(0, 0, 0, 0.4);
				-moz-box-shadow: 4px 4px 3px rgba(0, 0, 0, 0.4);
				-o-box-shadow: 4px 4px 3px rgba(0, 0, 0, 0.4);
				box-shadow: 4px 4px 3px rgba(0, 0, 0, 0.4);
			}
			.zpitem .zpjob{
				margin-left: 10px;
				margin-top: 10px;
				font-size: 30px;
				line-height: 40px;
			}
			.zpitem i,.zpitem span{
				margin-right: 5px;
			}
			.zpinfo p{
				font-size: 16px;
				line-height: 26px;
			}
			.zpdesccontent{
				padding-left: 20px;
				color: #666666;
			}
			
			.btn{
				background-color: #5CC0C5;
				padding: 20px;
				color: white;
				border-radius: 3px;
				font-size: 18px;
			}
			a.btn:hover{
				color: white;
				background-color: #00838A;
			}
			.zpsubmit{
				text-align: right;
				color: #5CC0C5;
				margin-right: 20px;
				line-height: 50px;
				margin-top: 50px;
			}
			.cmpInfo{
				margin-top: 20px;
				margin-bottom: 20px;
			}
			.cmpInfo img{
				margin-bottom: 10px;
			}
			.cmpdesc{
				text-align: left;
				text-indent: 10px;
				margin-top: 20px;
			}
			.cmpdesc p{
				margin-bottom: 10px;
			}
			.cmpdesc .cmpdesc_tag{
				background-color: #DCDEDF;
				padding: 2px;
			}
			.zpdesccontent p{
				margin-bottom: 4px;
			}
		</style>
	</head>
	<body>
	<c:set var="headMenu" value="workbench" scope="request"/>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<div class="left">
			<div>
				<div class="zpitem">
					<p class="cmpname">${cmp.name }</p>
					<p class="zpjob">${recruit.jobName }</p>
				</div>
			</div>
			<div class="zpinfo">
				<div class="zpitem">
					<p>
						<i class="fa fa-heart"></i>
						<span>
							<c:choose>
								<c:when test="${recruit.salary eq 0 }">面议</c:when>
								<c:when test="${recruit.salary eq 1 }">1000以下</c:when>
								<c:when test="${recruit.salary eq 2 }">1000-2000</c:when>
								<c:when test="${recruit.salary eq 3 }">2000-3000</c:when>
								<c:when test="${recruit.salary eq 4 }">3000-4000</c:when>
								<c:when test="${recruit.salary eq 5 }">4000-5000</c:when>
								<c:when test="${recruit.salary eq 6 }">5000-6000</c:when>
								<c:when test="${recruit.salary eq 7 }">6000-7000</c:when>
								<c:when test="${recruit.salary eq 8 }">7000-8000</c:when>
								<c:when test="${recruit.salary eq 9 }">9000-10000</c:when>
								<c:when test="${recruit.salary eq 10 }">10000以上</c:when>
								<c:otherwise>面议</c:otherwise>
							</c:choose>                           
						</span>
						
						<i class="fa fa-map-marker"></i><span>${cmp.address }</span>
						
						<c:choose>
							<c:when test="${recruit.foodRoom eq 0 }"><i class="fa fa-tag"></i><span>面议</span></c:when>
							<c:when test="${recruit.foodRoom eq 1 }"><i class="fa fa-tag"></i><span>提供</span></c:when>
							<c:when test="${recruit.foodRoom eq 2 }"><i class="fa fa-tag"></i><span>不提供</span></c:when>
							<c:otherwise>面议</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${recruit.travelFee eq 0 }"><i class="fa fa-taxi"></i><span>面议</span></c:when>
							<c:when test="${recruit.travelFee eq 1 }"><i class="fa fa-taxi"></i><span>报销</span></c:when>
							<c:when test="${recruit.travelFee eq 2 }"><i class="fa fa-taxi"></i><span>不报销</span></c:when>
							<c:otherwise>面议</c:otherwise>
						</c:choose>
						
						<i class="fa fa-graduation-cap"></i>
						<span>
							<c:choose>
								<c:when test="${recruit.edu eq 0 }">不限</c:when>
								<c:when test="${recruit.edu eq 1 }">小学</c:when>
								<c:when test="${recruit.edu eq 2 }">初中</c:when>
								<c:when test="${recruit.edu eq 3 }">高中</c:when>
								<c:when test="${recruit.edu eq 4 }">中专</c:when>
								<c:when test="${recruit.edu eq 5 }">高专</c:when>
								<c:when test="${recruit.edu eq 6 }">专科</c:when>
								<c:when test="${recruit.edu eq 7 }">本科</c:when>
								<c:when test="${recruit.edu eq 8 }">本科以上</c:when>
								<c:otherwise>不限</c:otherwise>
							</c:choose>
						</span>
						
						<c:choose>
							<c:when test="${recruit.sex eq 1 }"><i class="fa fa-male"></i><span>男</span></c:when>
							<c:when test="${recruit.sex eq 2 }"><i class="fa fa-female"></i><span>女</span></c:when>
						</c:choose>
						
						<i class="fa fa-calendar"></i>
						<span>
							<c:choose>
								<c:when test="${recruit.workAge eq 0 }">不限</c:when>
								<c:when test="${recruit.workAge eq 1 }">实习</c:when>
								<c:when test="${recruit.workAge eq 2 }">1年以下</c:when>
								<c:when test="${recruit.workAge eq 3 }">1-3年</c:when>
								<c:when test="${recruit.workAge eq 4 }">3-5年</c:when>
								<c:when test="${recruit.workAge eq 5 }">5-10年</c:when>
								<c:when test="${recruit.workAge eq 6 }">10年以上</c:when>
							</c:choose>
						</span>
					</p>
					<c:if test="${!empty recruit.advantage}">
						<p><i class="fa fa-thumbs-up"></i><span>${recruit.advantage}</span></p>
					</c:if>
					<p>
						<i class="fa fa-clock-o"></i><span>${recruit.addDay }&nbsp;${recruit.addTime }&nbsp;职位发布</span>
					</p>
				</div>
			</div>
			<div class="zpdesc">
				<div class="zpitem">
					<span>招聘描述：</span>
				</div>
				<div class="zpdesccontent">
					${recruit.desc }
				</div>
			</div>
			<div class="zpsubmit">
				<i class="fa fa-eye"></i><span>&nbsp;${recruit.scanTime}</span>&nbsp;&nbsp;
				<i class="fa fa-envelope"></i><span>&nbsp;${recruit.deliverTimes}</span>&nbsp;&nbsp;
				<a href="javascript:void(0);" id="submit" class="btn">投递该职位</a>
			</div>
		</div>
		<div class="right">
			<div class="cmpInfo">
				<img alt="公司名称" src="${imgPath }${cmp.head}" width="100" onerror="javascript:this.src='${PATH}/statics/img/nohead.jpg'"/>
				<p><a href="${PATH }/company/toCmpInfo.html?cmpId=${cmp.id}" target="_blank">${cmp.name }<i class="fa fa-legal" style="color: #00838A;"></i></a></p>
				<div class="cmpdesc">
					<p>
						<span class="cmpdesc_tag">企业规模：</span>
						<span>
							<c:choose>
								<c:when test="${cmp.staffNum eq 0}">50人以下</c:when>
								<c:when test="${cmp.staffNum eq 1}">50-200人</c:when>
								<c:when test="${cmp.staffNum eq 2}">200-500人</c:when>
								<c:when test="${cmp.staffNum eq 3}">500-1000人</c:when>
								<c:when test="${cmp.staffNum eq 4}">1000人以上</c:when>
							</c:choose>
						</span>
					</p>
					<p>
						<span class="cmpdesc_tag">发展阶段：</span>
						<span>
							<c:choose>
								<c:when test="${cmp.stage eq 0}">初创型</c:when>
								<c:when test="${cmp.stage eq 1}">成长型</c:when>
								<c:when test="${cmp.stage eq 2}">成熟型</c:when>
								<c:when test="${cmp.stage eq 3}">已上市</c:when>
							</c:choose>
						</span>
					</p>
					<p>
						<span class="cmpdesc_tag">工作地址：</span>
						<span>${cmp.address }</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script src="${PATH}/statics/js/jquery-2.1.3.js"></script>
	<script src="${PATH }/statics/layer/layer.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('#submit').click(function(){
				var recruitId = '${recruit.id }';
				layer.msg('加载中', {icon: 16});
				$.ajax({
	                type: "POST",
	                url: "${PATH}/recruit/deliver.html",
	                data: {'recruitId':recruitId},       
	                dataType: 'json',
	                success: function(result) {
	                	if(result.flag=='success'){
	                		layer.closeAll('loading');
	                    	layer.msg('投递成功', {icon: 6	});
	                	}else{
	                		layer.closeAll('loading');
	                    	layer.msg('投递失败', {icon: 5	});
	                	}
	                },
	                error:function(XMLHttpRequest, textStatus, errorThrown){
	                	layer.msg('投递失败', {icon: 5	});
	                }
	            });
			});
		})
	</script>
	</body>
</html>