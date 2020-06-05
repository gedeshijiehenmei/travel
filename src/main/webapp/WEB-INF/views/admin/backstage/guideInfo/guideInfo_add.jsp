<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<script src="${basePath}/static/js/backstage.js"></script>

<!-- 表单 -->
<div class="container">
	<!-- 页面导航 -->
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<ol class="breadcrumb">
				<li class="active">添加新的导游</li>
			</ol>
		</div>
		<div class="page-stats"></div>
	</div>
	<form class="form-horizontal" id="addFormId" method="POST"
		enctype="multipart/form-data">
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">头像：</label>
			<div class="col-sm-4 head-img">
				<img src='' class="imgheader" />
				 <img src="" class="img"
					style="display: none;" />
				<p class="divfile">
					<input type="file" name="photo" id="photo" ref="file"
						class="file imgInput ">
				</p>
			</div>
		</div>
		<div class="form-group">
			<label for="nameId" class="col-sm-2 control-label">昵称：</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control2 required" name="userName"
					id="userNameId" data-index="0">
					<div class="input-tip"><div class="img-chaho"></div><div class="point-text">请正确输入昵称</div></div>
			</div>
		</div>
		<div class="col-sm-2"></div><div class="col-sm-10 point">昵称要求为5-16个字符，支持中文、英文、数字、“_”、“-”</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">密码：</label>
			<div class="col-sm-10">
				<input type="password" class="form-control form-control2 required" name="password"
					id="passwordId" data-index="1">
					<div class="input-tip"><div class="img-chaho"></div><div class="point-text">请正确输入密码</div></div>
			</div>
		</div>
		<div class="col-sm-2"></div><div class="col-sm-10 point">密码要求为6-16个字符，支持英文和数字的组合</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">姓名：</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control2 required" name="name"
					id="nameId" data-index="2">
					<div class="input-tip"><div class="img-chaho"></div><div class="point-text">请正确输入您的姓名</div></div>
			</div>
		</div>
		<div class="col-sm-2"></div><div class="col-sm-10 point">姓名要求为2-15位英文或2-7位中文，不能中英混搭</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"> 性别： </label>
			<div class="col-sm-6">
				<label class="radio-inline"><input type="radio"
					name="gender" id="genderId" checked value="M"> 男</label> <label
					class="radio-inline"><input type="radio" name="gender"
					id="genderId" value="F"> 女</label>
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">生日：</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control2 datepicker " name="birthday"
					id="birthdayId"  data-index="3">
				<!-- 	<input type="text" Class="Wdate" id="birthdayId" name="birthday"
					readonly="readonly" onclick="WdatePicker();"> -->
					<div class="input-tip"><div class="img-chaho"></div><div class="point-text">请正确输入日期格式</div></div>
			</div>
		</div>
		<div class="col-sm-2"></div><div class="col-sm-10 point">日期格式：年-月-日</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">电话：</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control2 required" name="phone"
					id="phoneId"  data-index="4">
					<div class="input-tip"><div class="img-chaho"></div><div class="point-text">请正确输入您的电话号码</div></div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"> 状态： </label>
			<div class="col-md-10">
				<label class="radio-inline"><input type="radio" name="state"
					id="stateId" checked value="1"> 启用</label> <label
					class="radio-inline"><input type="radio" name="state"
					value="2" id="stateId"> 禁用</label>
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">邮箱：</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control2 required" name="mailbox"
					id="mailboxId"  data-index="5" >
					<div class="input-tip"><div class="img-chaho"></div><div class="point-text">请正确输入邮箱</div></div>
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">简介：</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control2 required" name="address"
					id="addressId"  data-index="6">
					<div class="input-tip"><div class="img-chaho"></div><div class="point-text">地址不能为空</div></div>
			</div>
		</div>
		<div class="modal-footer modal-footer-add">
			<button type="button" class="btn btn-primary"
				onclick="guide_add_btn()">保&nbsp;&nbsp;存</button>
			<button type="button"  class="btn btn-default">重&nbsp;&nbsp;置</button>
		</div>
	</form>
</div>
<!-- <script type="text/javascript">
	function user_add_btn() {
		var formData = new FormData();
		formData.append('userName', $('#userNameId').val());
		formData.append('password', $('#passwordId').val());
		formData.append('name', $('#nameId').val());
		formData.append('gender', $('#genderId').val());
		formData.append('birthday', $('#birthdayId').val());
		formData.append('phone', $('#phoneId').val());
		formData.append('state', $('#stateId').val());
		formData.append('role', 2);
		formData.append('mailbox', $('#mailboxId').val());
		formData.append('address', $('#addressId').val());
		formData.append('photo', document.getElementById('photo').files[0]);
		alert(document.getElementById('photo').files[0])
		$.ajax({
			url : "${basePath}/doSaveUserInfo",
			type : 'POST',
			cache : false,
			data : formData,
			processData : false,
			contentType : false,
			success : function(result) {
				alert("添加成功");
				window.location.href = "${basePath}/guideInfo_add";
			}
		});
	}
</script> -->
