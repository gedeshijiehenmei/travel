<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>

<!-- 表单 -->
<div class="container">
	<!-- 页面导航 -->
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<ol class="breadcrumb">
				<li class="active">修改密码</li>
			</ol>
		</div>
		<div class="page-stats"></div>
	</div>
	<form class="form-horizontal" id="addFormId" method="POST"
		enctype="multipart/form-data">
		<div class="form-group">
			<label for="nameId" class="col-sm-2 control-label">原密码：</label>
			<div class="col-sm-10">
				<input type="password" class="form-control form-control2 required" name="oldPassword"
					id="oldPassword" data-index="0">
					<div class="warning input-tip oldPassword"><div class="img-chaho"></div>
					<div class="point-text">请正确输入原密码</div></div>
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">新密码：</label>
			<div class="col-sm-10">
				<input type="password" class="form-control form-control2 required" name="newPassword"
					id="newPassword" data-index="1">
					<div class="warning input-tip passwordWarning"><div class="img-chaho"></div><div class="point-text">请正确输入新密码</div></div>
			</div>
		</div>
		<div class="col-sm-2"></div><div class="col-sm-10 point">密码要求为6-16个字符，支持英文和数字的组合</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">确认密码：</label>
			<div class="col-sm-10">
				<input type="password" class="form-control form-control2 required" name="passwordagain"
					id="passwordagain" data-index="2">
					<div class="warning input-tip confirmPasswordWarning"></div>
			</div>
		</div>
		<div class="modal-footer modal-footer-add">
			<input type="button" class="btn btn-primary"
				onclick="change_password()" id="btn-save" value="修改">
			<button type="button"  class="btn btn-default">重&nbsp;&nbsp;置</button>
		</div>
	</form>
</div>
<script type="text/javascript">
var userid = "${userInfo.id}";
</script>
<script src="${basePath}/static/js/backstage.js"></script>