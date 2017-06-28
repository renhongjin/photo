<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<div class="cmpmenu">
	<ul id="accordion" class="accordion">
		<li ${first_menu eq 'info' ? 'class="open"':'' }>
			<div class="link">企业信息<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu" ${first_menu eq 'info'?'style="display: block;"':'' }>
				<li ${second_menu eq 'info' ? 'class="cmpmenu_actve"':'' }><a href="${PATH }/workbench.html">基本信息</a></li>
				<li ${second_menu eq 'photo' ? 'class="cmpmenu_actve"':'' }><a href="${PATH }/company/imageList.html">企业相册</a></li>
				<li ${second_menu eq 'changePsd' ? 'class="cmpmenu_actve"':'' }><a href="${PATH }/company/tochangePsd.html">修改密码</a></li>
			</ul>
		</li>
		<li ${first_menu eq 'manager' ? 'class="open"':'' }>
			<div class="link">招聘管理<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu" ${first_menu eq 'manager'?'style="display: block;"':'' }>
				<li ${second_menu eq 'publish'?'class="cmpmenu_actve"':'' }><a href="${PATH }/recruit/topublish.html">发布招聘</a></li>
				<li ${second_menu eq 'top'?'class="cmpmenu_actve"':'' }><a href="${PATH }/recruit/toTop.html">管理招聘</a></li>
				<li ${second_menu eq 'deliverList'?'class="cmpmenu_actve"':'' }><a href="${PATH }/recruit/getdeliverList.html">求职申请</a></li>
				<!-- 
				<li><a href="#">人才收藏(10)</a></li>
				<li><a href="#">每日置顶</a></li> 
				-->
			</ul>
		</li>
		<li ${first_menu eq 'vip' ? 'class="open"':'' }>
			<div class="link">会员功能<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu" ${first_menu eq 'vip'?'style="display: block;"':'' }>
				<!-- <li><a href="#">人才联系方式</a></li> -->
				<li><a href="#">浏览过的简历</a></li>
				<li><a href="#">收藏的简历</a></li>
				<!-- <li><a href="#">会员资费</a></li> -->
			</ul>
		</li>
	</ul>
</div>