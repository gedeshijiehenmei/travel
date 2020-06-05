<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/header.css" />
<link rel="stylesheet" href="${APP_PATH}/static/css/news.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<title>旅游新闻</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="" id="news">
			<div class="main_body">
			<div class="position"><p>您的位置：首页&gt;要闻聚焦&gt;</p></div>
			
			<div class="article">
			<div class="nav-t"><h1>${newsInfo.title}</h1></div>
			<div class="article-info">
			<span>时间：<fmt:formatDate value="${newsInfo.creationTime}" pattern="yyyy-MM-dd"/> </span>
			<span>作者：${newsInfo.author}</span>
			</div>
			<div class="content">
			<p>${newsInfo.text}</p>
			<div class="content-img"><img alt="" src="/image/${newsInfo.photo }"></div>
			</div>
			</div>
			</div>
			</div>
			

	<%@include file="../footer.jsp"%>
</body>
</html>