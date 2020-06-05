<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	//初始化datepicker对象
	$('.datepicker').datepicker({
		format : 'yyyy-mm-dd',
		autoclose : true
	//选中自动关闭
	})
</script>
<form class="form-horizontal" role="form" id="editFormId" >
	<div class="form-group">
		<label for="nameId" class="col-sm-2 control-label">昵称：</label>
		<div class="col-sm-10">
			<!-- <div name="userName" id="userNameId"></div>  -->
			<input type="text" class="form-control required" name="userName"
				id="userNameId" disabled="disabled"/>
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">密码：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="password"
				id="passwordId">
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">真实姓名：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="name"
				id="nameId">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label"> 性别： </label>
		<div class="col-md-10">
			<label class="radio-inline"><input type="radio" name="gender"
				checked value="M"> 男</label> <label class="radio-inline"><input
				type="radio" name="gender" value="F"> 女</label>
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">生日：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control datepicker " name="birthday"
				id="birthdayId">
		</div>
	</div>
	<%-- <div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">照片：</label>
		<div class="col-sm-10">
			<!-- <input type="image" class="form-control required" name="photo" id="photoId"> -->
			<img alt="" src="/image/${photoId}"  id="photoId" name="photo" style="width: 50px;height:50px;"/>
			<div id="photoId"></div>
		</div>
	</div> --%>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">电话号码：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="phone"
				id="phoneId">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label"> 状态： </label>
		<div class="col-md-10">
			<label class="radio-inline"><input type="radio" name="state"
				checked value="1"> 启用</label> <label class="radio-inline"><input
				type="radio" name="state" value="2"> 禁用</label>
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">邮箱：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="mailbox"
				id="mailboxId">
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">地址：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="address"
				id="addressId">
		</div>
	</div>
</form>
<c:url var="url" value="/static/ttms/product/project_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>