<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH }/statics/css/page.css" rel="stylesheet" type="text/css"/>
		<style>
			/**搜索框**/
			.content .left{
				width: 744px;
			}
			.search_box input[type='text']{
				height: 40px;
				border: 2px solid #00838A;
				width: 600px;
				padding-left: 10px;
			}
			.search_box input[type='button']{
				height: 44px;
				background-color: #00838A;
				color: white;
				width: 130px;
				margin-left: -4px;
				border: 0;
				font-weight: 700;
				cursor: pointer;
			}
			.condition{
				margin-top: 20px;
				background-color: #FAFAFA;
				border: 1px solid #00838A;
				padding: 10px;
				margin-bottom: 10px;
			}
			.condition li{
				text-align: left;
				line-height: 30px;
			}
			.condition li span{
				font-weight: 600;
			}
			.condition li a:hover{
				background-color: #00838A;
				color: white;
			}
			.condition li a{
				padding-bottom: 3px;
				padding-top: 3px;
				padding-left: 6px;
				padding-right: 6px;
				cursor: pointer;
			}
			.select{
				background-color: #00838A;
				color: white;
			}
			/**职位列表*/
			.j_item{
				display: inline-flex;
				text-align: left;
				border-bottom: 1px dashed #00838A;
				font-size:16px;
			}
			.item_left,.item_right{
				width: 390px;
				padding-top: 10px;
				padding-left: 10px;
			}
			.item_left>div,.item_right>div{
				line-height: 30px;
			}
			.job_name,.cmp_name{
				color: #00838A;
			}
			.j_item{width: 744px;}
			.job_time{
				color: #979C9D;
				margin-left: 30px;
			}
			.job_money{
				color: red;
			}
			.job_need{
				margin-left: 30px;
			}
			.job_bottom{
				background-color: #FAFAFA;
				margin-left: -10px;
				padding-left: 10px;
			}
			.job_time,.job_need,.job_desc,.cmp_tag{font-size: 14px;}
			.cmp_tag{border: 1px solid #979C9D;padding: 2px;}
		</style>
	</head>
	<body>
		<c:set var="headMenu" value="userworkbench" scope="request"/>
		<jsp:include page="../head.jsp"></jsp:include>
		<div class="content">
			<div class="left">
				<div class="search_box">
					<form action="${PATH}/jobSearch.html" method="post" id="searchForm">
						<input type="text" placeholder="请输入职位名称" name="jobName" value="${jobName }"/>
						<input type="hidden" name="workYear" id="workYear"/>
						<input type="hidden" name="degree" id="degree"/>
						<input type="hidden" name="workType" id="workType"/>
						<input type="hidden" name="provinceId" id="provinceId"/>
						<input type="hidden" name="provinceName" id="provinceName"/>
						<input type="hidden" name="cityId" id="cityId"/>
						<input type="hidden" name="currentPage" id="currentPage"/>
						<input type="hidden" name="cityName" id="cityName"/>
						<input type="button" value="搜索" onclick="search();"/>
					</form>
				</div>
				<div class="condition">
					<ul>
						<li>
							<span>工作地点:</span>
							<select id="province_select" onchange="getcity(this.value)">
								<option value="-1">选择省份</option>
								<c:forEach var="provinces" items="${provinces }">
									<option value="${provinces.id }" ${provinceId==provinces.id?'selected':'' }>${provinces.name }</option>	
								</c:forEach>
							</select>
							<select id="cityName_select" onchange="changeCity();">
								<option value="-1">选择城市</option>
								<c:forEach var="city" items="${citys}">
									<option value="${city.id }" ${cityId==city.id?'selected':'' }>${city.cityName }</option>	
								</c:forEach>
							</select>
						</li>
						<li id="workYear_li">
							<span>工作经验:</span>
							<a ${workYear==0 or workYear==null?'class="select"':'' } id="workYear_0">不限</a>
							<a ${workYear==1?'class="select"':'' } id="workYear_1">实习</a>
							<a ${workYear==2?'class="select"':'' } id="workYear_2">1年以下</a>
							<a ${workYear==3?'class="select"':'' } id="workYear_3">1-3年</a>
							<a ${workYear==4?'class="select"':'' } id="workYear_4">3-5年</a>
							<a ${workYear==5?'class="select"':'' } id="workYear_5">5-10年</a>
							<a ${workYear==6?'class="select"':'' } id="workYear_6">10年以上</a>
						</li>
						<li id="degree_li">
							<span>学历要求:</span>
							<a ${degree==0 or degree==null?'class="select"':'' } id="degree_0">不限</a>
							<a ${degree==1?'class="select"':'' } id="degree_1">小学</a>
							<a ${degree==2?'class="select"':'' } id="degree_2">初中</a>
							<a ${degree==3?'class="select"':'' } id="degree_3">高中</a>
							<a ${degree==4?'class="select"':'' } id="degree_4">中专</a>
							<a ${degree==5?'class="select"':'' } id="degree_5">高专</a>
							<a ${degree==6?'class="select"':'' } id="degree_6">专科</a>
							<a ${degree==7?'class="select"':'' } id="degree_7">本科</a>
							<a ${degree==8?'class="select"':'' } id="degree_8">本科以上</a>
						</li>
						<li id="workType_li">
							<span>工作性质:</span>
							<a ${workType==0 or workType==null?'class="select"':'' } id="workType_0">不限</a>
							<a ${workType==1?'class="select"':'' } id="workType_1">全职</a>
							<a ${workType==2?'class="select"':'' } id="workType_2">兼职</a>
							<a ${workType==3?'class="select"':'' } id="workType_3">工时</a>
						</li>
					</ul>
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
											<a href="#" class="cmp_name">${rc.cmp.name }</a>
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
				<div class="page">
				    <nav>
				      <ul class="pagination">
				      	<c:choose>
				      		<c:when test="${page.start == 1}">
					      		<li class="disabled"><a href="javascript:void(0);" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				      		</c:when>
				      		<c:otherwise>
				      			<li><a href="javascript:void(0);" onclick="page('${page.start - 1}');" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				      		</c:otherwise>
				      	</c:choose>
				      	
				      	<c:forEach begin="${page.start }" end="${page.end }" var="index">
				      		<li class="${page.currentPage == index ?'active':''}"><a href="javascript:void(0);" onclick="page('${index }');">${index }</a></li>
				      	</c:forEach>
				      	<c:choose>
				      		<c:when test="${page.end == page.totalPage}">
					      		<li class="disabled"><a href="javascript:void(0);" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				      		</c:when>
				      		<c:otherwise>
				      			<li><a href="javascript:void(0);" onclick="page('${page.end + 1}');" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				      		</c:otherwise>
				      	</c:choose>
				     </ul>
			   		</nav>
			   </div>
			</div>
		</div>
		<script type="text/javascript" src="${PATH }/statics/js/jquery-2.1.3.js" ></script>
		<script>
			$(function(){
				$('.condition a').click(function(){
					var parent = $(this).parent("li");
					$(parent).children('.select').removeClass('select');
					$(this).addClass("select");
					//调用收索
					search();
				});
			});
			function changeCity(){
				search();
			}
			
			function page(currentPage){
				$("#currentPage").val(currentPage);
				search();
			}
			function search(){
				//设置收索参数值
				$(".select").each(function(idnex){
					var attr = $(this).attr("id").split("_");
					var value = attr[1];
					var flag = attr[0];
					switch(flag){
						case "workYear":
							$("#workYear").val(value);
							break;
						case "degree":
							$("#degree").val(value);
							break;
						case "workType":
							$("#workType").val(value);
							break;
					}
					var cityId = $("#cityName_select").val(); 
					var provinceId = $("#province_select").val();
					if("-1" != cityId){
						var cityName = $("#cityName_select").find("option:selected").text();
						$("#cityName").val(cityName);
						$("#cityId").val(cityId);
					}
					if("-1" != provinceId){
						var provinceName = $("#province_select").find("option:selected").text();
						$("#provinceName").val(provinceName);
						$("#provinceId").val(provinceId);
					}
					
				})
				$("#searchForm").submit();
			}
			function getcity(proviceId){
				console.log(proviceId);
				$.ajax({
	                type: "POST",
	                url: "${PATH}/company/city.html",
	                data: {'proviceId':proviceId},       
	                dataType: 'json',
	                success: function(result) {
	                	console.log(result);
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
</html>
