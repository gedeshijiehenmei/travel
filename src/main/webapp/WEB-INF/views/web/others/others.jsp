<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="${APP_PATH}/static/css/detail.css" />
<link rel="stylesheet"
	href="${APP_PATH}/static/calendar/skin/WdatePicker.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/detail.js"></script>
<script src="${APP_PATH}/static/calendar/WdatePicker.js"
	type="text/javascript"></script>
<title>详情</title>
</head>
<body>
	<%@include file="../header.jsp"%>
<div id="others" style="min-height: 300px;">

<div class="others"></div>
<div class="others-text">抱歉，该功能有待开发</div>

</div>
<%@include file="../footer.jsp"%>
</body>
</html>