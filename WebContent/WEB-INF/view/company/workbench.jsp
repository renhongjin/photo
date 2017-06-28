<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>我的工作台</title>
		<link href="${PATH}/statics/css/photo.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH}/statics/css/header.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH}/statics/css/cmpmenu.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH}/statics/css/input.css" rel="stylesheet" type="text/css"/>
		<link href="${PATH}/statics/css/zzsc.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<c:set var="headMenu" value="workbench" scope="request"/>
		<jsp:include page="../head.jsp"></jsp:include>
		<div class="content">
			<c:set var="first_menu" value="info" scope="request"/>
			<c:set var="second_menu" value="info" scope="request"/>
			<jsp:include page="./cmpmenu.jsp"></jsp:include>
			<div class="right">
				<div id="msform">
						<!-- progressbar -->
						<ul id="progressbar">
							<li class="active">企业logo</li>
							<li>联系方式</li>
							<li>公司基本信息</li>
							<li>公司规模</li>
						</ul>
						<!-- fieldsets -->
						<fieldset>
							<h2 class="fs-title">企业logo</h2>
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
							<h2 class="fs-title">联系方式</h2>
							<h3 class="fs-subtitle">第二步</h3>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 联系人</div>
							      <input type="text" class="form-control" id="person" placeholder="联系人" value="${me.person }">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">联系座机</div>
							      <input type="text" class="form-control" id="tel" placeholder="联系座机" value="${me.tel }">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 联系手机</div>
							      <input type="text" class="form-control" id="mobile" placeholder="联系手机" value="${me.mobile }">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 邮箱地址</div>
							      <input type="text" class="form-control" id="email" placeholder="邮箱地址" value="${me.email }">
							    </div>
							</div>
							<input type="button" name="previous" class="previous action-button" value="上一步">	
							<input type="button" name="next" class="next action-button" value="下一步">
						</fieldset>
						<fieldset>
							<h2 class="fs-title">企业基本信息</h2>
							<h3 class="fs-subtitle">第三步</h3>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 企业名称</div>
							      <input type="text" class="form-control" id="name" placeholder="企业名称" value="${me.name }">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 所在省</div>
							      <select class="form-control" id="sheng" onchange="getcity(this.value)">
							      	<option value="-1">请选择</option>
							      </select>	
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 所在市</div>
							      <select class="form-control" id="cityName">
							      	<option value="-1">请选择</option>
							      </select>
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 企业地址</div>
							      <input type="text" class="form-control" id="address" placeholder="联系地址" value="${me.address }">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 企业口号</div>
							      <input type="text" class="form-control" id="slogan" placeholder="企业口号" value="${me.slogan }">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 企业介绍</div>
							      <textarea id="desc" name="content">
									${me.desc }
								  </textarea>
							    </div>
							</div>
							
							<%-- 注释掉企业标签
							<div class="form-group">
							    <div class="tags" style="margin-bottom: 10px;text-align: left;">
							    	<a  href="javascript:void(0);" class="btn btn-success">3D实景影棚</a>
							    	<a  href="#" class="btn btn-success">3D实景影棚</a>
							    	<a  href="#" class="btn btn-success">3D实景影棚</a>
							    	<a  href="#" class="btn btn-success">3D实景影棚</a>
							    </div>
							    <div class="input-group">
							      <input type="text" class="form-control" placeholder="输入企业标签名称">
							      <span class="input-group-btn">
							        <button class="btn btn-default" type="button">贴上标签</button>
							      </span>
							    </div>
							</div> 
							--%>
							<input type="button" name="previous" class="previous action-button" value="上一步">
							<input type="button" name="next" class="next action-button" value="下一步">
						</fieldset>
						<fieldset>
							<h2 class="fs-title">公司规模</h2>
							<h3 class="fs-subtitle">最后一步</h3>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">影棚数量</div>
							      <input type="text" class="form-control" id="studioNum" value="${me.studioNum eq -1 ?'':me.studioNum }" placeholder="影棚数量">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">淡季日拍摄量</div>
							      <input type="text" class="form-control" id="lowNum" value="${me.lowNum eq -1 ?'':me.lowNum}" placeholder="淡季日拍摄量">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">旺季日拍摄量</div>
							      <input type="text" class="form-control" id="busyNum" value="${me.busyNum eq -1 ?'':me.busyNum }" placeholder="旺季日拍摄量">
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">营业面积</div>
							      <select class="form-control" id="area">
							      	  <option value="-1" ${me.area==-1?'selected':'' }>请选择</option>
									  <option value="0" ${me.area==0?'selected':'' }>200平米下</option>
									  <option value="1" ${me.area==1?'selected':'' }>200-400平米</option>
									  <option value="2" ${me.area==2?'selected':'' }>400-800平米</option>
									  <option value="3" ${me.area==3?'selected':'' }>800以上</option>
									</select>
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">员工人数</div>
							      <select class="form-control" id="staffNum">
							      	  <option value="-1" ${me.staffNum==-1?'selected':'' }>请选择</option>
									  <option value="0" ${me.staffNum==0?'selected':'' }>50人以下</option>
									  <option value="1" ${me.staffNum==1?'selected':'' }>50-200人</option>
									  <option value="2" ${me.staffNum==2?'selected':'' }>200-500人</option>
									  <option value="3" ${me.staffNum==3?'selected':'' }>500-1000人</option>
									  <option value="4" ${me.staffNum==4?'selected':'' }>1000人以上</option>
									</select>
							    </div>
							</div>
							<div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon">* 发展阶段</div>
							      <select class="form-control" id="stage">
							      	  <option value="-1" ${me.stage==-1?'selected':'' }>请选择</option>
									  <option value="0" ${me.stage==0?'selected':'' }>初创型</option>
									  <option value="1" ${me.stage==1?'selected':'' }>成长型</option>
									  <option value="2" ${me.stage==2?'selected':'' }>成熟型</option>
									  <option value="3" ${me.stage==3?'selected':'' }>已上市</option>
									</select>
							    </div>
							</div>
							<input type="button" name="previous" class="previous action-button" value="上一步">
							<input type="button" name="submit" class="submit action-button" value="提交信息" onclick="submitCmpInfo();">
						</fieldset>
					</div>
			</div>
		</div>
		<script src="${PATH}/statics/js/jquery-2.1.3.js"></script>
		<script src="${PATH}/statics/js/kindeditor.js" type="text/javascript"></script>
		<script src="${PATH}/statics/js/zh_CN.js" type="text/javascript" charset="utf-8"></script>
		<script src="${PATH}/statics/js/jquery.easing.min.js" type="text/javascript"></script>
		<script src="${PATH}/statics/js/zzsc.js" type="text/javascript"></script>
		<script type="text/javascript" src="${PATH }/statics/layer/layer.js"></script>
		<script type="text/javascript" src="${PATH }/statics/js/cmpmenu.js"></script>
		<script>
		var editor;
		$(function() {
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					minWidth:'440px',
					minHeight:'100px',
					width : '440px',
					height:'150px',
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [
						'fontname', 'fontsize', '|',  'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'image','link']
				});
			});
			getAllProvice();
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
		
		function getAllProvice(){
			var pro = '${me.sheng}';
			$.ajax({
                type: "POST",
                url: "${PATH}/company/provice.html",
                dataType: 'json',
                success: function(result) {
                	var html = '';
                	var sel ='selected';
                	for(var i=0;i<result.length;i++){
                		var p = result[i];
                		var id = p.id;
                		var name = p.name;
                		var option ;
                		if(pro == name){
                			option = '<option value="'+id+'" selected>'+name+'</option>';
                			getcity(id);
                		}else{
                			option = '<option value="'+id+'">'+name+'</option>';
                		}
                		html = html +option;
                	}
                	$("#sheng").append(html);
                }
            });
		}
		function getcity(proviceId){
			console.log("change");
			$.ajax({
                type: "POST",
                url: "${PATH}/company/city.html",
                data: {'proviceId':proviceId},       
                dataType: 'json',
                success: function(result) {
                	var html = '<option value="-1">请选择</option>';
                	for(var i=0;i<result.length;i++){
                		var p = result[i];
                		var id = p.id;
                		var name = p.cityName;
                		var option = '<option value="'+id+'">'+name+'</option>'
                		html = html +option;
                	}
                	$("#cityName").html(html);
                	var cityName = '${me.cityName}';
                	if(cityName != null){
	        			$("#cityName>option:contains('"+cityName+"')").attr("selected",true);
                	}
                }
            });
		}
		function submitCmpInfo(){
			var person = $.trim($('#person').val());
			var tel = $.trim($('#tel').val());
			var mobile = $.trim($('#mobile').val());
			var email = $.trim($('#email').val());
			var name = $.trim($('#name').val());
			var sheng = $.trim($('#sheng').val());
			var cityName = $.trim($('#cityName').val());
			var address = $.trim($('#address').val());
			var studioNum = $.trim($('#studioNum').val());
			var lowNum = $.trim($('#lowNum').val());
			var busyNum = $.trim($('#busyNum').val());
			var area = $.trim($('#area').val());
			var staffNum = $.trim($('#staffNum').val());
			var stage = $.trim($('#stage').val());
			var slogan = $.trim($('#slogan').val());
			var id = '${me.id}';
			if(person.length==0){
				tipsInfo('企业联系人必填');
				return false;
			}
			if(tel.length!=0){
				var telReg =/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
				if(!telReg.test(tel)) { 
					tipsInfo('座机号码格式错误');
				    return false; 
				}
			}
			var telreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
			if(!telreg.test(mobile)) { 
				tipsInfo('联系手机格式错误');
			    return false; 
			}
			var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if(!emailReg.test(email)){
				tipsInfo('邮箱格式错误');
			    return false; 
			}
			if(name.length == 0){
				tipsInfo('公司名称未填');
				return false;
			}
			if(sheng=="-1" || cityName=="-1"){
				tipsInfo('公司的省份城市未选择');
				return false;
			}
			if(address.length==0){
				tipsInfo('公司地址未填写');
				return false;
			}
			if(slogan.length>50){
				tipsInfo('企业口号不能超过50个字哟！');
				return false;
			}
			var desc = editor.html();
			if(editor.text().length < 100){
				tipsInfo('企业介绍内容要大于100字');
				return false;
			}
			if(stage == "-1"){
				tipsInfo('企业发展阶段未选择');
				return false;
			}
			sheng = $("#sheng").find("option:selected").text();
			cityName = $("#cityName").find("option:selected").text();
			var index = layer.msg('加载中', {icon: 16});
			$.ajax({
                type: "POST",
                url: "${PATH}/company/add.html",
                data: {'person':person,'tel':tel,'mobile':mobile,'email':email,
                	'name':name,'sheng':sheng,'cityName':cityName,'address':address,'slogan':slogan,
                	'desc':desc,'studioNum':studioNum,'lowNum':lowNum,
                	'busyNum':busyNum,'area':area,'staffNum':staffNum,'stage':stage,'id':id},       
                dataType: 'json',
                success: function(result) {
                	layer.close(index);
                	layer.msg('操作成功', {icon: 1});
                },
                error:function(error){
                	console.log(error);
                }
            });
		}
		function tipsInfo(message){
			layer.msg(message,function(){});
		}
		</script>
	</body>
</html>
