<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link href="${PATH }/statics/css/font-awesome.min.css" rel="stylesheet"/>
<style>
	/**用户登录情况*/
	.user_flag{
		width: 80px;
	}
	.user_menu{
		background-color: #000000;
		width: 80px;
		display: none;
	}
	.user_menu li{
		line-height: 23px;
		text-align: left;
		float: none;
	}
	.user_menu li a{
		margin-left: 10px;
	}
	.user_menu li:hover{
		background-color: #4C4B4B;
	}
</style>
<div class="topbar">
	<ul class="left">
		<li><a href="${PATH }/index.html">摄影人才网</a></li>
	</ul>
	<ul class="right">
		<c:choose>
			<c:when test="${me eq null }">
				<li><a href="${PATH }/tologin.html">登录</a></li>
				<li><span>&nbsp;|&nbsp;</span></li>
				<li><a href="${PATH }/toregister.html">注册</a></li>
			</c:when>
			<c:otherwise>
				<li class="user_flag">
					<a href="#" >${me.name }&nbsp;&nbsp;<i class="fa fa-chevron-up"></i></a>
					<ul class="user_menu">
						<c:choose>
							<c:when test="${userType eq 'personal' }">
								<li><a href="${PATH }/resume/tomyworkbench.html">我的简历</a></li>
								<li><a href="${PATH }/personal/deliverStatus.html">投递箱</a></li>
								<li><a href="${PATH }/logout.html">退出</a></li>
							</c:when>
							<c:when test="${userType eq 'cmp' }">
								<li><a href="${PATH }/company/toCmpInfo.html?cmpId=${me.id}" target="_blank">公司主页</a></li>
								<li><a href="${PATH }/recruit/getdeliverList.html">投递箱</a></li>
								<li><a href="${PATH }/logout.html">退出</a></li>
							</c:when>
						</c:choose>
						
					</ul>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<div class="menubar">
	<ul>
		<li ${headMenu eq 'index'?'class="active"':''  }><a href="${PATH }/index.html">首页</a></li>
		<li ${headMenu eq 'cmp'?'class="active"':''  }><a href="${PATH }/company/listCmps.html">影楼婚庆</a></li>
		<!-- <li><a href="#">培训学校</a></li> -->
		<c:if test="${userType eq 'cmp' }">
			<!-- <li><a href="#">经营联盟</a></li> -->
			<li ${headMenu eq 'workbench'?'class="active"':''  }><a href="${PATH }/workbench.html">工作台</a></li>
		</c:if>
		<c:if test="${userType eq 'personal' }">
			<!-- <li><a href="#">经营联盟</a></li> -->
			<li ${headMenu eq 'userworkbench'?'class="active"':''  }><a href="${PATH }/resume/tomyworkbench.html">我的工作台</a></li>
		</c:if>
	</ul>
</div>
<script type="text/javascript" src="${PATH }/statics/js/jquery-2.1.3.js" ></script>
<script>
	$(function(){
		//登录用户的移入移出效果
		$('.user_flag').mouseover(function(){//移入
		  $(this).find('i').removeClass('fa fa-chevron-up')
		  $(this).find('i').addClass('fa fa-chevron-down');
		  $('.user_menu').show();
		});
		$(".user_flag").mouseleave(function(){//移出
		  $(this).find('i').removeClass('fa fa-chevron-down')
		  $(this).find('i').addClass('fa fa-chevron-up');
		  $('.user_menu').hide();
		});
	});
</script>