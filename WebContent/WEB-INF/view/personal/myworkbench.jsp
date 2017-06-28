<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的工作台</title>
	<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/cmpmenu.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/input.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/zzsc.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<style>
		select{
			width: 170px!important;
		}
		input{
			width: 144px!important;
		}
		label{
			width: 65px;
		}
		.row{
			margin-bottom: 10px;
		}
	</style>
</head>
<body>
		<c:set var="headMenu" value="userworkbench" scope="request"/>
		<jsp:include page="../head.jsp"></jsp:include>
		<div class="content">
			<c:set var="first_menu" value="personalInfo" scope="request"/>
			<c:set var="second_menu" value="myResume" scope="request"/>
			<jsp:include page="./personalMenu.jsp"></jsp:include>
			<div class="right">
				<div id="msform" class="form-inline">
						<!-- progressbar -->
						<ul id="progressbar">
							<li class="active">个人照片</li>
							<li>基本信息</li>
							<li>期望</li>
							<li>经历</li>
						</ul>
						<!-- fieldsets -->
						<fieldset>
							<h2 class="fs-title">个人照片</h2>
							<h3 class="fs-subtitle">第一步</h3>
							<div class="row">
								<img id="headImg" onerror="javascript:this.src='${PATH}/statics/img/nohead.jpg'" alt="头像" height="125px" width="115px" src="${imgPath}${me.head }">
								<div>
									<form id="submit_form" method="post" action="${PATH}/common/uploadHeadImg.html" target="exec_target" enctype="multipart/form-data">
									     <input type="file" name="upload_file" id="upload_file">        <!-- 添加上传文件 -->
									</form>
						 			<iframe id="exec_target" name="exec_target" style="display: none;"></iframe>
								</div>
							</div>
							<input type="button" name="next" class="next action-button" value="下一步">
						</fieldset>
						<fieldset>
							<h2 class="fs-title">基本信息</h2>
							<h3 class="fs-subtitle">第二步</h3>
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">姓名:</label>
								    <input type="text" class="form-control" id="name" value="${resume.name}" placeholder="姓名">
								    <input type="hidden" id="id" value="${resume.id }">
								</div>
								<div class="form-group">
								    <label for="exampleInputName2">性别:</label>
								    <select class="form-control" id="sex">
								      	<option value="0">请选择</option>
								      	<option value="1" ${resume.sex==1?'selected':'' }>男</option>
								      	<option value="2" ${resume.sex==2?'selected':'' }>女</option>
								    </select>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">手机:</label>
								    <input type="text" class="form-control" id="phone" value="${resume.phone}" placeholder="手机号码">
								</div>
								<div class="form-group">
								    <label for="exampleInputName2">邮箱地址:</label>
								    <input type="text" class="form-control" id="email" value="${resume.email}" placeholder="邮箱地址">
								</div>
							</div>
							
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">出生日期:</label>
								    <input type="text" class="form-control" id="birthday" value="${resume.birthday}" placeholder="yyyy-mm-dd">
								</div>
								<div class="form-group">
								    <label for="exampleInputName2">婚姻状况:</label>
								    <select class="form-control" id="marriage">
								      	<option value="0">请选择</option>
								      	<option value="1" ${resume.marriage==1?'selected':'' }>已婚</option>
								      	<option value="2" ${resume.marriage==2?'selected':'' }>未婚</option>
								      	<option value="3" ${resume.marriage==3?'selected':'' }>其他</option>
								    </select>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">身高(cm):</label>
								    <input type="text" class="form-control" id="height" value="${resume.height}" placeholder="身高(cm)">
								</div>
								<div class="form-group">
								    <label for="exampleInputName2">学历:</label>
								    <select class="form-control" id="degree">
								      	<option value="0">请选择</option>
								      	<option value="1" ${resume.degree==1?'selected':'' }>小学</option>
								      	<option value="2" ${resume.degree==2?'selected':'' }>初中</option>
								      	<option value="3" ${resume.degree==3?'selected':'' }>高中</option>
								      	<option value="4" ${resume.degree==4?'selected':'' }>中专</option>
								      	<option value="5" ${resume.degree==5?'selected':'' }>高专</option>
								      	<option value="6" ${resume.degree==6?'selected':'' }>专科</option>
								      	<option value="7" ${resume.degree==7?'selected':'' }>本科</option>
								      	<option value="8" ${resume.degree==8?'selected':'' }>本科以上</option>
								    </select>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">现居住地:</label>
								    <input type="text" class="form-control" id="city" value="${resume.city}" placeholder="现居住地">
								</div>
								<div class="form-group">
								    <label for="exampleInputName2">籍贯:</label>
								    <input type="text" class="form-control" id="origin" value="${resume.origin}" placeholder="籍贯">
								</div>
							</div>
							<input type="button" name="previous" class="previous action-button" value="上一步">
							<input type="button" name="next" class="next action-button" value="下一步">
						</fieldset>
						<fieldset>
							<h2 class="fs-title">期望</h2>
							<h3 class="fs-subtitle">第三步</h3>
							
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">期望职位:</label>
								    <input type="text" class="form-control" id="idealJob" value="${resume.idealJob}" placeholder="期望职位">
								</div>
								<div class="form-group">
								    <label for="exampleInputName2">工作经验:</label>
								    <select class="form-control" id="workYear">
								      	<option value="0">请选择</option>
								      	<option value="1" ${resume.workYear==1?'selected':'' }>实习期</option>
								      	<option value="2" ${resume.workYear==2?'selected':'' }>1年以下</option>
								      	<option value="3" ${resume.workYear==3?'selected':'' }>1-3年</option>
								      	<option value="4" ${resume.workYear==4?'selected':'' }>3-5年</option>
								      	<option value="5" ${resume.workYear==5?'selected':'' }>5-10年</option>
								      	<option value="6" ${resume.workYear==6?'selected':'' }>10年以上</option>
								    </select>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">期望待遇:</label>
								    <input type="text" class="form-control" id="idealMoney" value="${resume.idealMoney}" placeholder="期望待遇">
								</div>
								<div class="form-group">
								    <label for="exampleInputName2">工作方式:</label>
								    <select class="form-control" id="workWay">
								      	<option value="0">请选择</option>
								      	<option value="1" ${resume.workWay==1?'selected':'' }>工时</option>
								      	<option value="2" ${resume.workWay==2?'selected':'' }>兼职</option>
								      	<option value="3" ${resume.workWay==3?'selected':'' }>全职</option>
								    </select>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">报销路费:</label>
								    <select class="form-control" id="freeTravel">
								      	<option value="0">请选择</option>
								      	<option value="1" ${resume.freeTravel==1?'selected':'' }>面议</option>
								      	<option value="2" ${resume.freeTravel==2?'selected':'' }>报销</option>
								      	<option value="3" ${resume.freeTravel==3?'selected':'' }>不报销</option>
								    </select>
								</div>
								<div class="form-group">
								    <label for="exampleInputName2">提供吃住:</label>
								    <select class="form-control" id="proPlace">
								      	<option value="0" >请选择</option>
								      	<option value="1" ${resume.proPlace==1?'selected':'' }>面议</option>
								      	<option value="2" ${resume.proPlace==2?'selected':'' }>提供</option>
								      	<option value="3" ${resume.proPlace==3?'selected':'' }>不提供</option>
								    </select>
								</div>
							</div>
							
							<input type="button" name="previous" class="previous action-button" value="上一步">
							<input type="button" name="next" class="next action-button" value="下一步">
						</fieldset>
						<fieldset>
							<h2 class="fs-title">经历</h2>
							<h3 class="fs-subtitle">最后一步</h3>
							<div class="row">
								<div class="form-group">
								    <label for="exampleInputName2">个人简介:</label>
								    <textarea id="workExp" name="content">
										${resume.workExp}
								  	</textarea>
								</div>
							</div>
							<input type="button" class="action-button" value="预览" onclick="previewResume();">
							<input type="button" name="previous" class="previous action-button" value="上一步">
							<input type="button" class="submit action-button" value="提交信息" onclick="saveResume();">
						</fieldset>
					</div>
			</div>
		</div>
		<script src="${PATH }/statics/js/jquery-2.1.3.js"></script>
		<script src="${PATH }/statics/js/kindeditor.js" type="text/javascript"></script>
		<script src="${PATH }/statics/js/zh_CN.js" type="text/javascript" charset="utf-8"></script>
		<script src="${PATH }/statics/js/jquery.easing.min.js" type="text/javascript"></script>
		<script src="${PATH }/statics/js/zzsc.js" type="text/javascript"></script>
		<script type="text/javascript" src="${PATH }/statics/layer/layer.js"></script>
		<script src="${PATH }/statics/js/cmpmenu.js" type="text/javascript"></script>
		<script>
		var editor;
		$(function() {
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					minWidth:'500px',
					minHeight:'200px',
					width : '500px',
					height:'200px',
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [
						 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist']
				});
			});
			
			initUpload();
		});
		
		/**初始化文件上传**/
		function initUpload(){
			//选择文件成功则提交表单
			   $("#upload_file").change(function(){
			       if($("#upload_file").val() != '') 
			    	   $("#submit_form").submit();
			   });
			   //iframe加载响应，初始页面时也有一次，此时data为null。
			   $("#exec_target").load(function(){
			       var data = $(window.frames['exec_target'].document.body).html();
			       data = JSON.parse(data);
			       console.log(data);
			       $("#headImg").attr("src",'${imgPath}'+data);
			   });
		}
		/**保存简历**/
		function saveResume(){
			var id = $.trim($('#id').val());
			var name = $.trim($('#name').val());
			var sex = $.trim($('#sex').val());
			var phone = $.trim($('#phone').val());
			var email = $.trim($('#email').val());
			var birthday = $.trim($('#birthday').val());
			var marriage = $.trim($('#marriage').val());
			var height = $.trim($('#height').val());
			var degree = $.trim($('#degree').val());
			var city = $.trim($('#city').val());
			var origin = $.trim($('#origin').val());
			var idealJob = $('#idealJob').val();
			var workYear = $.trim($('#workYear').val());
			var idealMoney = $.trim($('#idealMoney').val());
			var workWay = $.trim($('#workWay').val());
			var freeTravel = $.trim($('#freeTravel').val());
			var proPlace = $.trim($('#proPlace').val());
			var workExp = editor.html();
			/* console.debug(
					"name       "+name        +"\n"+
					"sex        "+sex         +"\n"+
					"phone      "+phone       +"\n"+
					"email      "+email       +"\n"+
					"birthday   "+birthday    +"\n"+
					"marriage    "+marriage     +"\n"+
					"height     "+height      +"\n"+
					"degree     "+degree      +"\n"+
					"city    "+city     +"\n"+
					"origin     "+origin      +"\n"+
					"idealJob   "+idealJob    +"\n"+
					"workYear"+workYear +"\n"+
					"idealMoney "+idealMoney  +"\n"+
					"workWay    "+workWay     +"\n"+
					"freeTravel "+freeTravel  +"\n"+
					"proPlace"+proPlace    ); */
			layer.msg('加载中', {icon: 16});
			$.ajax({
                type: "POST",
                url: "${PATH}/resume/add.html",
                data: {
                	'id':id,
                	'name':name,
                	'sex':sex,
                	'phone':phone,
                	'email':email,
                	'birthday':birthday,
                	'marriage':marriage,
                	'height':height,
                	'degree':degree,
                	'city':city,
                	'origin':origin,
                	'idealJob':idealJob,
                	'workYear':workYear,
                	'idealMoney':idealMoney,
                	'workWay':workWay,
                	'freeTravel':freeTravel,
                	'proPlace':proPlace,
                	'workExp':workExp
                	},       
                dataType: 'json',
                success: function(result) {
                	if(result.flag=='success'){
                		if(id==null){
	                		$("#id").val(result.id);
                		}
                		layer.closeAll('loading');
                    	layer.msg('简历添加成功', {icon: 6	});
                	}else{
                		layer.closeAll('loading');
                    	layer.msg('简历添加失败', {icon: 5	});
                	}
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){
                	layer.msg('简历添加失败', {icon: 5	});
                }
            });
		}
		/**提示信息**/
		function tipsInfo(message){
			layer.msg(message,function(){});
		}
		function previewResume(){
			var id = $.trim($('#id').val());
			var name = $.trim($('#name').val());
			var sex = $.trim($('#sex').val());
			var phone = $.trim($('#phone').val());
			var email = $.trim($('#email').val());
			var birthday = $.trim($('#birthday').val());
			var marriage = $.trim($('#marriage').val());
			var height = $.trim($('#height').val());
			var degree = $.trim($('#degree').val());
			var city = $.trim($('#city').val());
			var origin = $.trim($('#origin').val());
			var idealJob = $('#idealJob').val();
			var workYear = $.trim($('#workYear').val());
			var idealMoney = $.trim($('#idealMoney').val());
			var workWay = $.trim($('#workWay').val());
			var freeTravel = $.trim($('#freeTravel').val());
			var proPlace = $.trim($('#proPlace').val());
			var workExp = editor.html();
			$.ajax({
                type: "POST",
                url: "${PATH}/resume/preview.html",
                data: {
                	'id':id,
                	'name':name,
                	'sex':sex,
                	'phone':phone,
                	'email':email,
                	'birthday':birthday,
                	'marriage':marriage,
                	'height':height,
                	'degree':degree,
                	'city':city,
                	'origin':origin,
                	'idealJob':idealJob,
                	'workYear':workYear,
                	'idealMoney':idealMoney,
                	'workWay':workWay,
                	'freeTravel':freeTravel,
                	'proPlace':proPlace,
                	'workExp':workExp
                	},     
                success: function(result) {
                	var height = $(window).height()-30;
                	var width = $(window).width()-30;
                	layer.open({
                		title:['简历预览 ', 'text-align:center;font-size:16px;'],
                		move: false,
                        type: 1,
                        area: [width+'px', height+'px'],
                        shadeClose: true, //点击遮罩关闭
                        content: result
                    });
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){
                	console.log(textStatus);
                	console.log(errorThrown);
                	layer.msg('预览失败', {icon: 5	});
                }
            });
		}
		</script>
	</body>
</html>