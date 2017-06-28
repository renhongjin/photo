<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<div class="cmpmenu">
	<ul id="accordion" class="accordion">
		<li ${first_menu eq 'personalInfo' ? 'class="open"':'' }>
			<div class="link">我的信息<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu" ${first_menu eq 'personalInfo'?'style="display: block;"':'' }>
				<li ${second_menu eq 'myResume' ? 'class="cmpmenu_actve"':'' }><a href="${PATH }/resume/tomyworkbench.html">我的简历</a></li>
				<li ${second_menu eq 'changePsd' ? 'class="cmpmenu_actve"':'' }><a href="${PATH }/personal/tochangePsd.html">修改密码</a></li>
				<li ${second_menu eq 'myzp' ? 'class="cmpmenu_actve"':'' }><a href="${PATH }/personal/toMyworks.html">我的作品</a></li>
			</ul>
		</li>
		<li>
			<div class="link">投递箱<i class="fa fa-chevron-down"></i></div>
			<ul class="submenu" ${first_menu eq 'resume'?'style="display: block;"':'' }>
				<li ${second_menu eq 'invitation' ? 'class="cmpmenu_actve"':'' }><a href="${PATH }/personal/deliverStatus.html">面试邀请</a></li>
				<li ${second_menu eq 'collect' ? 'class="cmpmenu_actve"':'' }><a href="#">我的收藏</a></li>
			</ul>
		</li>
	</ul>
</div>