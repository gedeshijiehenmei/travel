<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0" />  
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
<link media="all" rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/bootstrap/css/star-rating.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/header.css" />
<link rel="stylesheet" href="${APP_PATH}/static/css/personalCenter.css" />
<link rel="stylesheet"
	href="${APP_PATH}/static/css/luyou/dindanList.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/star-rating.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/person.js" type="text/javascript"></script>
<!-- 配置文件 -->
    <script type="text/javascript" src="${APP_PATH}/static/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${APP_PATH}/static/ueditor/ueditor.all.js"></script>
<title>个人中心</title>
</head>
<body>
	<%@include file="../header.jsp"%>

	<div class="main_body" id="person">
		<div class="left-sidebar">
			<div id="left-side-nav">
				<ul id="first-nav">
					<li id="order"><span>我的订单</span> <span
						class="nav-arrow arrow-down"></span>
						<ul>
							<li><a target="" href="#" id="dindanList">旅游订单</a></li>
							<li><a target="" href="#" onclick="others()">旅游券订单</a></li>
						</ul></li>
					<li id="cash"><span>我的资产</span> <span
						class="nav-arrow arrow-down"></span>
						<ul>
							<li><a target="" href="#" onclick="others()">优惠券</a></li>
						</ul></li>
					<li id="usercenter"><span>个人中心</span> <span
						class="nav-arrow arrow-down"></span>
						<ul>
							<li><a target="" href="#" id="personalInfo">个人资料</a></li>
							<li><a target="" href="#" id="changePassword">密码设置</a></li>
						</ul></li>
					<li id="message"><span>常用信息</span> <span
						class="nav-arrow arrow-down"></span>
						<ul>
							<li><a target="" href="#" id="changePassword">游客信息</a></li>
							<li><a target="" href="#" onclick="others()">常用配送地址</a></li>
							<li><a target="" href="#" onclick="others()">常用发票信息</a></li>
						</ul></li>
					<li id="tools"><span>常用工具</span> <span
						class="nav-arrow arrow-down"></span>
						<ul>
							<li><a target="" href="#" id="collection">我的收藏</a></li>
							<li><a target="" href="#" id="comments">我的点评</a></li>
						</ul></li>
					<li id="shequ"><a target=""	href="#" onclick="others()">社区互动</a></li>
					<li id="club"><a target="" href="#" onclick="others()">会员俱乐部</a></li>
				</ul>
			</div>
		</div>
		<div class="mainDiv">
			<%@include file="./luyou/dindanList.jsp"%>
		</div>
	</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>