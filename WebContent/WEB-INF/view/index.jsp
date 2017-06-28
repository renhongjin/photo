<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css" />
<link href="${PATH }/statics/css/index.css" rel="stylesheet" type="text/css" />
<link href="${PATH }/statics/css/slideBox.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<body>
		<c:set var="headMenu" value="index" scope="request"/>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="content">
			<div class="zwmenu">
				<ul>
					<li class="sy">
						<a href="#">摄影</a>
						<div id="sy">
							<ul class="zwlist">
								<li><a href="javascript:void(0);">摄影总监/主管</a></li>
								<li><a href="javascript:void(0);">摄影师</a></li>
								<li><a href="javascript:void(0);">摄影助理</a></li>
								<li><a href="javascript:void(0);">写真摄影师</a></li>
							</ul>
						</div>
						<div class="hideline"></div>
					</li>
					<li class="sm">
						<a href="#">数码/彩扩类</a>
						<div id="sm">
							<ul class="zwlist">
								<li><a href="javascript:void(0);">数码总监/主管</a></li>
								<li><a href="javascript:void(0);">数码师</a></li>
								<li><a href="javascript:void(0);">调色师</a></li>
								<li><a href="javascript:void(0);">传统美工师</a></li>
								<li><a href="javascript:void(0);">冲印彩扩</a></li>
								<li><a href="javascript:void(0);">MV拍摄</a></li>
								<li><a href="javascript:void(0);">动态影像编辑</a></li>
							</ul>
						</div>
						<div class="hideline"></div>
					</li>
					<li class="hz">
						<a href="#">化妆</a>
						<div id="hz">
							<ul class="zwlist">
								<li><a href="javascript:void(0);">化妆总监/主管</a></li>
								<li><a href="javascript:void(0);">化妆师</a></li>
								<li><a href="javascript:void(0);">化妆助理</a></li>
								<li><a href="javascript:void(0);">礼服师</a></li>
								<li><a href="javascript:void(0);">写真化妆师</a></li>
							</ul>
						</div>
						<div class="hideline"></div>
					</li>
					<li class="ms">
						<a href="#">门市/管理/策划</a>
						<div id="ms">
							<ul class="zwlist">
								<li><a href="javascript:void(0);">总经理</a></li>
								<li><a href="javascript:void(0);">门市</a></li>
								<li><a href="javascript:void(0);">门市经理	</a></li>
								<li><a href="javascript:void(0);">店长</a></li>
								<li><a href="javascript:void(0);">秀场策划</a></li>
								<li><a href="javascript:void(0);">培训讲师</a></li>
								<li><a href="javascript:void(0);">网络营销</a></li>
								<li><a href="javascript:void(0);">门市顾问</a></li>
								<li><a href="javascript:void(0);">网络客服</a></li>
								<li><a href="javascript:void(0);">网络推广</a></li>
								<li><a href="javascript:void(0);">网络策划</a></li>
								<li><a href="javascript:void(0);">选片师</a></li>
								<li><a href="javascript:void(0);">财务/收银</a></li>
							</ul>
						</div>
						<div class="hideline"></div>
					</li>
					<li class="et">
						<a href="#">儿童</a>
						<div id="et">
							<ul class="zwlist">
								<li><a href="javascript:void(0);">儿童门市/管理/策划</a></li>
								<li><a href="javascript:void(0);">儿童摄影师</a></li>
								<li><a href="javascript:void(0);">儿童化妆师</a></li>
								<li><a href="javascript:void(0);">儿童引导师</a></li>
								<li><a href="javascript:void(0);">儿童数码/美工</a></li>
							</ul>
						</div>
						<div class="hideline"></div>
					</li>
					<li class="hq">
						<a href="#">婚庆</a>
						<div id="hq">
							<ul class="zwlist">
								<li><a href="javascript:void(0);">婚庆策划</a></li>
								<li><a href="javascript:void(0);">婚庆主持</a></li>
								<li><a href="javascript:void(0);">婚礼摄像师</a></li>
								<li><a href="javascript:void(0);">摄像助理</a></li>
								<li><a href="javascript:void(0);">花艺师</a></li>
							</ul>
						</div>
						<div class="hideline"></div>
					</li>
				</ul>
			</div>
			<div class="main">
				<div class="search_box">
					<form action="${PATH }/jobSearch.html" method="get" id="searchFrom">
						<select name="provinceId" id="province_select" onchange="getcity(this.value)">
							<option value="-1">选择省份</option>
							<c:forEach var="provinces" items="${provinces }">
								<option value="${provinces.id }">${provinces.name }</option>	
							</c:forEach>
						</select>
						<input type="hidden" name="provinceName" id="provinceName"/>
						<input type="hidden" name="cityName" id="cityName"/>
						<select name="cityId" id="cityName_select">
							<option value="-1">选择城市</option>
						</select>
						<input type="text" placeholder="请输入职位名称" name="jobName" />
						<input type="button" value="搜索" id="submitSearch"/>
					</form>
				</div>
				<div id="slide" class="slideBox">
				  <ul class="items">
				    <li><a href="#" title="视界婚纱摄影"><img src="${PATH }/statics/img/1.jpg"></a></li>
				    <li><a href="#" title="罗门婚纱摄影"><img src="${PATH }/statics/img/2.jpg"></a></li>
				    <li><a href="#" title="古摄影"><img src="${PATH }/statics/img/3.jpg"></a></li>
				    <li><a href="#" title="迷摄影"><img src="${PATH }/statics/img/4.jpg"></a></li>
				    <li><a href="#" title="金夫人婚纱摄影"><img src="${PATH }/statics/img/5.jpg"></a></li>
				  </ul>
				</div>
				<div class="job_items">
					<div class="job_head">
						<div class="job_head_item">
							<a href="#" class="head_active">最新职位</a>
							<!-- <a href="#">最新职位</a> -->
						</div>
					</div>
					<div class="j_items">
						<ul class="j_items">
							<c:forEach items="${rcs }"  var="rc">
								<li>
									<div class="j_item">
										<div class="item_left">
											<div>
												<a href="${PATH }/recruit/toRecruitPage.html?recruitId=${rc.recruit.id }" target="_blank" class="job_name">${rc.recruit.jobName }&nbsp;&nbsp;[${rc.cmp.cityName }]</a>
												<span class="job_time">${rc.recruit.addDay }</span>
											</div>
											<div>
												<span class="job_money">
													<c:choose>
														<c:when test="${rc.recruit.salary eq 0 }">面议</c:when>
														<c:when test="${rc.recruit.salary eq 1 }">1000以下</c:when>
														<c:when test="${rc.recruit.salary eq 2 }">1000-2000</c:when>
														<c:when test="${rc.recruit.salary eq 3 }">2000-3000</c:when>
														<c:when test="${rc.recruit.salary eq 4 }">3000-4000</c:when>
														<c:when test="${rc.recruit.salary eq 5 }">4000-5000</c:when>
														<c:when test="${rc.recruit.salary eq 6 }">5000-6000</c:when>
														<c:when test="${rc.recruit.salary eq 7 }">6000-7000</c:when>
														<c:when test="${rc.recruit.salary eq 8 }">7000-8000</c:when>
														<c:when test="${rc.recruit.salary eq 9 }">8000-9000</c:when>
														<c:when test="${rc.recruit.salary eq 10 }">9000-10000</c:when>
														<c:when test="${rc.recruit.salary eq 11 }">10000以上</c:when>
													</c:choose>                           
												</span>
												<span class="job_need">
													<c:choose>
														<c:when test="${rc.recruit.workAge eq 0 }">不限</c:when>
														<c:when test="${rc.recruit.workAge eq 1 }">实习</c:when>
														<c:when test="${rc.recruit.workAge eq 2 }">1年以上</c:when>
														<c:when test="${rc.recruit.workAge eq 3 }">1-3年</c:when>
														<c:when test="${rc.recruit.workAge eq 4 }">3-5年</c:when>
														<c:when test="${rc.recruit.workAge eq 5 }">5-10年</c:when>
														<c:when test="${rc.recruit.workAge eq 6 }">10年以上</c:when>
													</c:choose>
												</span>
											</div>
											<div class="job_bottom">
												<span class="job_desc">${rc.recruit.advantage }</span>
											</div>
										</div>
										<div class="item_right">
											<div>
												<a href="${PATH }/company/toCmpInfo.html?cmpId=${rc.cmp.id}" class="cmp_name">${rc.cmp.name }</a>
											</div>
											<div>
												<span class="cmp_desc">
													<c:choose>
														<c:when test="${rc.cmp.stage eq 0}">初创型</c:when>
														<c:when test="${rc.cmp.stage eq 1}">成长型</c:when>
														<c:when test="${rc.cmp.stage eq 2}">成熟型</c:when>
														<c:when test="${rc.cmp.stage eq 3}">已上市</c:when>
													</c:choose>
												
												</span>
											</div>
											<!-- <div class="job_bottom">
												<span class="cmp_tag">包住</span>
												<span class="cmp_tag">报销车费</span>
											</div> -->
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="job_more">
						<a href="#" class="btn">查看更多职位</a>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${PATH }/statics/js/jquery-2.1.3.js" ></script>
		<script type="text/javascript" src="${PATH }/statics/js/jquery.slideBox.min.js" ></script>
		<script>
			$(function(){
				//职位分类
				$('.zwmenu>ul>li').hover(function(){
					var classText = $(this).attr("class");
					$("#"+classText).show();
					$(this).addClass('zwselect');
				},function(){
					$(this).removeClass('zwselect');
					var classText = $(this).attr("class");
					$("#"+classText).hide();
				});
				//轮播
				$('#slide').slideBox({
					direction : 'left',//left,top#方向
					duration : 1.5,//滚动持续时间，单位：秒
					easing : 'swing',//swing,linear//滚动特效
					delay : 7,//滚动延迟时间，单位：秒
					hideClickBar : false,//不自动隐藏点选按键
					startIndex : 1//初始焦点顺序
				});
				$('.zwmenu a').click(function(){
					var jobname =$(this).text(); 
					window.open("${PATH}/jobSearch.html?jobName="+jobname);
				})
				
				//提交搜索表单
				$("#submitSearch").click(function(){
					submitForm();
				})
			});
			function submitForm(){
				//1、获取省份名称
				var provinceName = $("#province_select").find("option:selected").text();
				var cityName = $("#cityName_select").find("option:selected").text();
				console.log(provinceName+" : "+cityName);
				if($("#province_select").val() != -1){
					$("#provinceName").val(provinceName);
				}
				if($("#cityName_select").val() != -1){
					$("#cityName").val(cityName);
				}
				//2、获取选中的城市名称
				$("#searchFrom").submit();
			}
			function getcity(proviceId){
				$.ajax({
	                type: "POST",
	                url: "${PATH}/company/city.html",
	                data: {'proviceId':proviceId},       
	                dataType: 'json',
	                success: function(result) {
	                	var html = '<option value="-1">请选择城市</option>';
	                	for(var i=0;i<result.length;i++){
	                		var p = result[i];
	                		var id = p.id;
	                		var name = p.cityName;
	                		var option = '<option value="'+id+'">'+name+'</option>'
	                		html = html +option;
	                	}
	                	$("#cityName_select").html(html);
	                	<%-- var cityName = '${me.cityName}';
	                	if(cityName != null){
		        			$("#cityName>option:contains('"+cityName+"')").attr("selected",true);
	                	} --%>
	                }
	            });
			}
		</script>
	</body>
</body>
</html>