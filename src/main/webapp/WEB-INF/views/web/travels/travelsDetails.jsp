<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="${APP_PATH}/static/css/travels.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<title>游记</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<c:if test="${RESULT == 'SUCCESS' }">
		<div id="travels_details">
				<div class="travels_details-img travels-details-box">
					<img alt="" src="/image/${travels.cover}">
				</div>
				<div class="view_title travels-details-box">
				<c:forEach items="${travels.userInfo}" var="userInfo">
				<div class="view_info">
				<div class="vi_con">
				<h1 class="headtext lh80" style="white-space: nowrap; overflow-wrap: normal;">${travels.title}</h1>
				</div>
				</div>
					<div class="person">
					<a class="per_pic" ><img alt="" src="/image/${userInfo.photo}" ></a>
					<a class="per_name"><span>${userInfo.userName}</span><span style="color: #acacac; font-size: 14px;"><fmt:formatDate value="${travels.creationtime}" pattern="yyyy-MM-dd"/></span></a>
					</div>
					</c:forEach>
				</div>
			<div>
			<div class="container">
				<div class="row">
					<div class="vc_article">
					${travels.text}
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
		</div>
	</c:if>
	
</body>

</html>