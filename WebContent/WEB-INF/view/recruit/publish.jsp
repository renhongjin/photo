<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>发布招聘</title>
	<link href="${PATH }/statics/css/photo.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/header.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/cmpmenu.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH }/statics/css/input.css" rel="stylesheet" type="text/css"/>
	<link href="${PATH}/statics/css/zzsc.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		.jobactive{
			background-color: #00838A!important;
			color: white!important;
		}
	</style>
</head>
<body>
	<c:set var="headMenu" value="workbench" scope="request"/>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<c:set var="first_menu" value="manager" scope="request"/>
		<c:set var="second_menu" value="publish" scope="request"/>
		<jsp:include page="../company/cmpmenu.jsp"></jsp:include>
		<div class="right">
			<form id="msform">
				<ul id="progressbar">
					<li class="active">职位福利</li>
					<li>职位要求</li>
					<li>招聘说明</li>
				</ul>
				<!-- fieldsets -->
				<fieldset>
					<h2 class="fs-title">职位福利</h2>
					<h3 class="fs-subtitle">第一步</h3>
					<div class="form-group">
					    <div class="input-group">
					      <div class="input-group-addon">*发布职位</div>
					      <input type="text" class="form-control" id="jobType" placeholder="发布职位">
					      <div class="jobpanle">
					      	<div class="item">
					      		<div class="type"><span>摄影类</span></div>
					      		<div class="jobitem">
					      			<ul>
						      			<li><a href="javascript:void(0);">摄影总监/主管</a></li>
						      			<li><a href="javascript:void(0);">摄影师</a></li>
						      			<li><a href="javascript:void(0);">摄影助理</a></li>
						      			<li><a href="javascript:void(0);">写真摄影师</a></li>
						      		</ul>
					      		</div>
					      		<hr class="split"/>
					      	</div>
					      	<div class="item">
					      		<div class="type"><span>数码/彩扩类</span></div>
					      		<div class="jobitem">
					      			<ul>
						      			<li><a href="javascript:void(0);">数码总监/主管</a></li>
						      			<li><a href="javascript:void(0);">数码师</a></li>
						      			<li><a href="javascript:void(0);">调色师</a></li>
						      			<li><a href="javascript:void(0);">传统美工师</a></li>
						      			<li><a href="javascript:void(0);">冲印彩扩</a></li>
						      			<li><a href="javascript:void(0);">MV拍摄</a></li>
						      			<li><a href="javascript:void(0);">动态影像编辑</a></li>
						      		</ul>
					      		</div>
					      		<hr class="split"/>
					      	</div>
					      	<div class="item">
					      		<div class="type"><span>化妆</span></div>
					      		<div class="jobitem">
					      			<ul>
						      			<li><a href="javascript:void(0);">化妆总监/主管</a></li>
						      			<li><a href="javascript:void(0);">化妆师</a></li>
						      			<li><a href="javascript:void(0);">化妆助理</a></li>
						      			<li><a href="javascript:void(0);">礼服师</a></li>
						      			<li><a href="javascript:void(0);">写真化妆师</a></li>
						      		</ul>
					      		</div>
					      		<hr class="split"/>
					      	</div>
					      	<div class="item">
					      		<div class="type"><span>门市/管理/策划</span></div>
					      		<div class="jobitem">
					      			<ul>
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
					      		<hr class="split"/>
					      	</div>
					      	<div class="item">
					      		<div class="type"><span>儿童</span></div>
					      		<div class="jobitem">
					      			<ul>
						      			<li><a href="javascript:void(0);">儿童门市/管理/策划</a></li>
										<li><a href="javascript:void(0);">儿童摄影师</a></li>
										<li><a href="javascript:void(0);">儿童化妆师</a></li>
										<li><a href="javascript:void(0);">儿童引导师</a></li>
										<li><a href="javascript:void(0);">儿童数码/美工</a></li>
						      		</ul>
					      		</div>
					      		<hr class="split"/>
					      	</div>
					      </div>
					    </div>
					</div>
					<div class="form-group">
					      <div class="input-group">
					      	<div class="input-group-addon">*薪酬待遇</div>
					      	<select class="form-control" id="salary">
						      	<option value="0">面议</option>
						      	<option value="1">1000以下</option>
						      	<option value="2">1000-2000</option>
						      	<option value="3">2000-3000</option>
						      	<option value="4">3000-4000</option>
						      	<option value="5">4000-5000</option>
						      	<option value="6">5000-6000</option>
						      	<option value="7">6000-7000</option>
						      	<option value="8">7000-8000</option>
						      	<option value="9">8000-9000</option>
						      	<option value="10">9000-10000</option>
						      	<option value="11">10000以上</option>
						    </select>
						    <div style="line-height: 30px;">
						    	<input type="checkbox" id="deduct">是否提成	
						    </div>
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">*是否报销路费</div>
					      	<select class="form-control" id="trlFee">
						      	<option value="-1">请选择</option>
						      	<option value="0">面议</option>
						      	<option value="1">报销</option>
						      	<option value="2">不报销</option>
						    </select>
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">*是否提供宿食</div>
					      	<select class="form-control" id="foodRoom">
						      	<option value="0">面议</option>
						      	<option value="1">提供</option>
						      	<option value="2">不提供</option>
						    </select>
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">职位诱惑</div>
					      	<input type="text" class="form-control" id="advantage" placeholder="职位诱惑">
					    </div>
					</div>
					<input type="button" name="next" class="next action-button" value="下一步">
				</fieldset>
				<fieldset>
					<h2 class="fs-title">职位要求</h2>
					<h3 class="fs-subtitle">第二步</h3>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">*教育程度</div>
					      	<select class="form-control" id="education">
						      	<option value="-1">请选择</option>
						      	<option value="0">不限</option>
						      	<option value="1">小学</option>
						      	<option value="2">初中</option>
						      	<option value="3">高中</option>
						      	<option value="4">中专</option>
						      	<option value="5">高专</option>
						      	<option value="6">专科</option>
						      	<option value="7">本科</option>
						      	<option value="8">本科以上</option>
						    </select>
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">*工作时间</div>
					      	<input type="text" class="form-control" id="workTime" placeholder="例：8点到18点">
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">*招聘人数</div>
					      	<input type="text" class="form-control" id="personNum" placeholder="招聘人数">
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">*工作经验</div>
					      	<select class="form-control" id="workage">
						      	<option value="-1">请选择</option>
						      	<option value="0">不限</option>
						      	<option value="1">实习</option>
						      	<option value="2">1年以下</option>
						      	<option value="3">1-3年</option>
						      	<option value="4">3-5年</option>
						      	<option value="5">5-10年</option>
						      	<option value="6">10年以上</option>
						    </select>
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">*性别要求</div>
					      	<select class="form-control" id="sex">
						      	<option value="0">不限</option>
						      	<option value="1">男</option>
						      	<option value="2">女</option>
						    </select>
					    </div>
					</div>
					<div class="form-group">
					    <div class="input-group">
					      	<div class="input-group-addon">*工作方式</div>
					      	<select class="form-control" id="workway">
						      	<option value="-1">请选择</option>
						      	<option value="0">面议</option>
						      	<option value="1">全职</option>
						      	<option value="2">兼职</option>
						      	<option value="3">工时</option>
						    </select>
					    </div>
					</div>
					<input type="button" name="previous" class="previous action-button" value="上一步">
					<input type="button" name="next" class="next action-button" value="下一步">
				</fieldset>
				<fieldset>
					<h2 class="fs-title">招聘说明</h2>
					<h3 class="fs-subtitle">第三步</h3>
					<div class="form-group">
					    <div class="input-group">
					      <div class="input-group-addon">招聘说明</div>
					      <textarea id="desc" name="content"></textarea>
					    </div>
					</div>
					<input type="button" class="previous action-button" value="上一步">
					<input type="button" class="action-button" value="预览" onclick="preview();">
					<input type="button" class="submit action-button" value="发布" onclick="publish();">
				</fieldset>
			</form>
		</div>
	</div>
	<script src="${PATH}/statics/js/jquery-2.1.3.js"></script>
	<script src="${PATH}/statics/js/kindeditor.js" type="text/javascript"></script>
	<script src="${PATH}/statics/js/zh_CN.js" type="text/javascript" charset="utf-8"></script>
	<script src="${PATH }/statics/layer/layer.js" type="text/javascript"></script>
	<script src="${PATH}/statics/js/jquery.easing.min.js" type="text/javascript"></script>
	<script src="${PATH}/statics/js/zzsc.js" type="text/javascript"></script>
	<script src="${PATH }/statics/js/cmpmenu.js" type="text/javascript"></script>
	<script>
		var editor;
		$(function() {
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					minWidth:'440px',
					minHeight:'250px',
					width : '440px',
					height:'250px',
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [
						'fontname', 'fontsize', '|',  'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'link']
				});
			});
			$('#jobType').focus(function(){
				$('.jobpanle').show();
			});
			
			$('.jobitem a').click(function(){
					$('#jobType').val($(this).text());
					$('.jobactive').removeClass('jobactive');
					$(this).addClass('jobactive');
					$('.jobpanle').hide();
			});
		});
		function publish(){
			var jobType = $.trim($('#jobType').val());
			var salary = $.trim($('#salary').val());
			var trlFee = $.trim($('#trlFee').val());
			var foodRoom = $.trim($('#foodRoom').val());
			var education = $.trim($('#education').val());
			var workTime = $.trim($('#workTime').val());
			var personNum = $.trim($('#personNum').val());
			var workage = $.trim($('#workage').val());
			var workway = $.trim($('#workway').val());
			var sex = $.trim($('#sex').val());
			var advantage = $.trim($('#advantage').val());
			var desc = editor.html();
			var raise = 0;//不提成
			if($("#deduct").is(":checked")){
				raise = 1;
			}
			//console.log("jobType:"+jobType+"\nsalary:"+salary+"\ndeduct:"+raise+"\ntrlFee:"+trlFee+"\nfoodRoom:"+foodRoom+"\neducation:"+education+"\nworkTime:"+workTime+"\npersonNum:"+personNum+"\nworkage:"+workage+"\nsex:"+sex+"\ndesc:"+desc);
			if(jobType.length==0){
				tipsInfo('请选择招聘的职位');
				return;
			}
			if(trlFee=='-1'){
				tipsInfo('请选择路费是否报销');
				return;
			}
			if(advantage.length>50){
				tipsInfo('职位诱惑不能大于50字！');
				return;
			}
			if(education=='-1'){
				tipsInfo('请选择教育程度');
				return;
			}
			if(workTime.length==0){
				tipsInfo('请填写工作时间段');
				return;
			}
			var type = /^[0-9]*[1-9][0-9]*$/;
			if(!type.test(personNum)){
				tipsInfo('招聘人数填写整数');
				return;
			}
			if(workage=='-1'){
				tipsInfo('请选择工作经验');
				return;
			}
			if(editor.text().length < 50){
				tipsInfo('企业介绍内容要大于50字');
				return false;
			}
			
			layer.msg('加载中', {icon: 16});
			$.ajax({
                type: "POST",
                url: "${PATH}/recruit/publish.html",
                data: {'jobName':jobType,'salary':salary,'raise':raise,'travelFee':trlFee,'travelFee':trlFee,
                	'foodRoom':foodRoom,'advantage':advantage,'edu':education,'workTime':workTime,'personNum':personNum,'workAge':workage,
                	'sex':sex,'workWay':workway,'desc':desc},       
                dataType: 'json',
                success: function(result) {
                	if(result.flag=='success'){
                		layer.closeAll('loading');
                    	layer.msg('发布成功', {icon: 6	});
                	}else{
                		layer.closeAll('loading');
                    	layer.msg('发布失败', {icon: 5	});
                	}
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){
                	layer.msg('发布失败', {icon: 5	});
                }
            });
		}
		function preview(){
			var jobType = $.trim($('#jobType').val());
			var salary = $.trim($('#salary').val());
			var trlFee = $.trim($('#trlFee').val());
			var foodRoom = $.trim($('#foodRoom').val());
			var education = $.trim($('#education').val());
			var workTime = $.trim($('#workTime').val());
			var personNum = $.trim($('#personNum').val());
			var workage = $.trim($('#workage').val());
			var workway = $.trim($('#workway').val());
			var sex = $.trim($('#sex').val());
			var advantage = $.trim($('#advantage').val());
			var desc = editor.html();
			var raise = 0;//不提成
			if($("#deduct").is(":checked")){
				raise = 1;
			}
			if(jobType.length==0){
				tipsInfo('请选择招聘的职位');
				return;
			}
			if(trlFee=='-1'){
				tipsInfo('请选择路费是否报销');
				return;
			}
			if(advantage.length>50){
				tipsInfo('职位诱惑不能大于50字！');
				return;
			}
			if(education=='-1'){
				tipsInfo('请选择教育程度');
				return;
			}
			if(workTime.length==0){
				tipsInfo('请填写工作时间段');
				return;
			}
			var type = /^[0-9]*[1-9][0-9]*$/;
			if(!type.test(personNum)){
				tipsInfo('招聘人数填写整数');
				return;
			}
			if(workage=='-1'){
				tipsInfo('请选择工作经验');
				return;
			}
			if(editor.text().length < 50){
				tipsInfo('企业介绍内容要大于50字');
				return false;
			}
			$.ajax({
                type: "POST",
                url: "${PATH}/recruit/preview.html",
                data: {'jobName':jobType,'salary':salary,'raise':raise,'travelFee':trlFee,'travelFee':trlFee,
                	'foodRoom':foodRoom,'advantage':advantage,'edu':education,'workTime':workTime,'personNum':personNum,'workAge':workage,
                	'sex':sex,'workWay':workway,'desc':desc},       
                success: function(result) {
                	var height = $(window).height()-30;
                	var width = $(window).width()-30;
                	layer.open({
                		title:['职位预览 ', 'text-align:center;font-size:16px;'],
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
		function tipsInfo(message){
			layer.msg(message,function(){});
		}
		</script>
</body>
</html>