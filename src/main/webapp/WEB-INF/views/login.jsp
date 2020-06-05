<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>悦游旅行社登录页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" />
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
 <script type="text/javascript" src="${APP_PATH}/static/js/login.js"></script> 
<link rel="stylesheet" href="${APP_PATH}/static/css/login.css">

</head>
<body>
	<div class="navWrap">
		<div class="typePage">
			<a href="${APP_PATH}/web/index" class="index">悦游旅行社</a> <a href="${APP_PATH}/web/index" class="indexLink">首页</a>
		</div>
	</div>
	<!-- main container -->
	<!--内容开始-->
	<div class="loginMain_wrap">
		<div class="typePage">
			<div class="login_box">
				<!--登录title-->
				<div class="titleBox">
					<span class="title titleLogin">登录</span> 
					<a href="${APP_PATH}/system/register" class="title titleRegister">注册</a>
				</div>

				<form id="defaultForm" method="post" role="form"
					action="#">
					<div class="validation-summary-errors" data-valmsg-summary="true">
                    <ul>
                        <li id="web_login_error_msg_title"></li>
                    </ul>
                </div>
					<!--昵称-->
					<div class="inputBox">
						<input type="text" value="" name="userName" id="userName"
							class="input" placeholder="请输入昵称">
						<div class="warning warninguserName"></div>
					</div>
					<!--密码-->
					<div class="inputBox">
						<input type="password" value="" name="password" id="password"
							class="input" placeholder="密码" autocomplete="off">
						<div class="warning warningpassword"></div>
					</div>
					<input type="submit" id="submit" value="登录" class="btnLogin">

				</form>
			</div>
		</div>
	</div>
	<%@include file="web/footer.jsp"%>
</body>
</html>