<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>悦游旅行社注册页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" />
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
 <script type="text/javascript" src="${APP_PATH}/static/js/register.js"></script> 
<link rel="stylesheet" href="${APP_PATH}/static/css/login.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/register.css">

</head>
<body>
	<div class="navWrap">
		<div class="typePage">
			<a href="${APP_PATH}/web/index" class="index">悦游旅行社</a> <a href="${APP_PATH}/web/index" class="indexLink">首页</a>
		</div>
	</div>
	<!-- main container -->
<!--内容开始-->
<div class="registerWrap">
    <div class="typePage">
        <div class="registerMain">
            <p class="title1">欢迎注册账号</p>
            <!--用户注册部分-->
            <form id="formpersonal" method="post" role="form" >
                <div class="infoEnter">
                    <div class="validation-summary-errors" data-valmsg-summary="true">
                         <ul>
                            <li id="web_login_error_msg_title"></li>
                        </ul> 
                    </div>
                    <!--登录信息收集-->
                    <div class="enterInfo_box Info_box">

                        <!--姓名-->
                        <div class="nameBox inputBox">
                            <input type="text" id="userName" name="userName" class="input" value="" placeholder="昵称">
                            <div class="warning nameWarning"></div>
                        </div>
                        <div class="inputBox">
                            <input type="text" id="name" name="name" class="input" placeholder="真实姓名">
                            <div class="warning companyWarning"></div>
                        </div>
                        <!--手机号码-->
                        <div class="inputBox">
                            <input type="text" id="phone" name="phone" class="input" value="" placeholder="手机号">
                            <div class="warning phoneWarning"></div>
                        </div>
                        <!--密码-->
                        <div class="inputBox">
                            <input type="password" id="password" name="password" class="input" placeholder="密码" autocomplete="off">
                            <span class="passwordTips" style="display:none;">*请设置不少于6位的密码</span>
                            <div class="passwordTips2 passwordTips2_password" style="display:none;">*请设置不少于6位的密码</div>
                            <div class="warning passwordWarning"></div>
                        </div>
                        <!--确认密码-->
                        <div class="inputBox">
                            <input type="password" id="ConfirmPassword" name="ConfirmPassword" class="input" placeholder="确认密码" autocomplete="off">
                            <span class="passwordTips" style="display:none;">*重复输入密码</span>
                            <div class="passwordTips2 passwordTips2_confirmPassword" style="display:none;">*重复输入密码</div>
                            <div class="warning confirmPasswordWarning"></div>
                        </div>
                        <input type="submit" value="注册" id="btn-save" class="btnRegister">
                        <p style="width:100%;line-height:2em;color:#fff;font-size:14px;padding:20px 10px 0 10px;">* 昵称将作为登录账号，请您务必记住您所注册的昵称跟密码,注册后昵称将无法修改</p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="web/footer.jsp"%>
</body>
</html>