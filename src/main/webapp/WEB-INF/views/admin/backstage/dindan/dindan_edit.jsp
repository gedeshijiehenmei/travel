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
		<label for="nameId" class="col-sm-2 control-label">用户昵称：</label>
		<div class="col-sm-10">
			<!-- <div name="userName" id="userNameId"></div>  -->
			<input type="text" class="form-control required" name="userName"
				id="userNameId" disabled="disabled"/>
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">景点名称：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="name"
				id="nameId">
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">人数：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="number"
				id="numberId">
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">总价：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="total"
				id="totalId">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label"> 状态： </label>
		<div class="col-md-10">
			<label class="radio-inline"><input type="radio" name="state" checked value="1"> 待付款</label>
			<label class="radio-inline"><input
				type="radio" name="state" value="5">待处理</label>
			<label class="radio-inline"><input
				type="radio" name="state" value="2">待出行</label>
				<label class="radio-inline"><input
				type="radio" name="state" value="3">待评论</label>
				 <label class="radio-inline"><input
				type="radio" name="state" value="4">已完成</label>
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">联系人：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="contacts"
				id="contactsId">
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">联系电话：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control required" name="phone"
				id="phoneId">
		</div>
	</div>
	<div class="form-group">
		<label for="project-code" class="col-sm-2 control-label">出行时间：</label>
		<div class="col-sm-10">
			<input type="text" class="form-control datepicker " name="departureTime"
				id="departureTimeId">
		</div>
	</div>
</form>
<c:url var="url" value="/static/ttms/product/dindan_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>