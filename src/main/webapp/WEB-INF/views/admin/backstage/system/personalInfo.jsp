<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<script type="text/javascript">

	//初始化datepicker对象
	$('.datepicker').datepicker({
		format : 'yyyy-mm-dd',
		autoclose : true
	//选中自动关闭
	})
</script>
<div class="container">
	<!-- 页面导航 -->
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<ol class="breadcrumb">
				<li class="active">修改个人信息</li>
			</ol>
		</div>
		<div class="page-stats"></div>
	</div>
	<form class="form-horizontal" role="form" id="editFormId"
		enctype="multipart/form-data">
		<div class="head-img2">
				<div id="photoId"></div>
				 <img src="" class="img"
					style="display: none; position: absolute; top: 0;" />
				 <p class="divfile2">
					<input type="file" name="photo" id="photo" ref="file"
						class="file file2 imgInput imgInput2">
				</p>
				<div class="xgtx2" onclick="changePhoto()">修改头像</div>
		</div>

		<div class="form-group">
			<label for="nameId" class="col-sm-2 control-label">昵称：</label>
			<div class="col-sm-5">
				<!-- <div name="userName" id="userNameId"></div>  -->
				<input type="text" class="form-control required" name="userName"
					id="userNameId" disabled="disabled" />
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">真实姓名：</label>
			<div class="col-sm-5">
				<input type="text" class="form-control required" name="name"
					id="nameId">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label"> 性别： </label>
			<div class="col-md-10">
				<label class="radio-inline"><input type="radio"
					name="gender" checked value="M"> 男</label> <label
					class="radio-inline"><input type="radio" name="gender"
					value="F"> 女</label>
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">生日：</label>
			<div class="col-sm-5">
				<input type="text" class="form-control datepicker " name="birthday"
					id="birthdayId">
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">电话号码：</label>
			<div class="col-sm-5">
				<input type="text" class="form-control required" name="phone"
					id="phoneId">
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">邮箱：</label>
			<div class="col-sm-5">
				<input type="text" class="form-control required" name="mailbox"
					id="mailboxId">
			</div>
		</div>
		<div class="form-group">
			<label for="project-code" class="col-sm-2 control-label">简介：</label>
			<div class="col-sm-5">
				<input type="text" class="form-control required" name="address"
					id="addressId">
			</div>
		</div>
		<div class="modal-footer modal-footer-add">
			<button type="button" class="btn btn-primary"
				onclick="userInfo_xg_btn()">修&nbsp;&nbsp;改</button>
			<button type="button" onclick="findPersonalInfoId()"
				class="btn btn-default">重&nbsp;&nbsp;置</button>
		</div>
	</form>
</div>
<script>
var id='${userInfo.id}';
$(function() {
	findPersonalInfoId()
	
});
function findPersonalInfoId(){
	$.ajax({
		url : "${basePath}/backStage/findPersonalInfoId?id="+id,
		type : "post",
		success : function(result) {
			var userInfo=result.extend.userInfo;
			$("#userNameId").val(userInfo.userName);
			$("#nameId").val(userInfo.name);
			$("#editFormId input[name='gender']")//radio
			//迭代input标签中name为valid的dom对象
			.each(function(){
				//假如这个对象的值等于userInfo.valid的值
				//则让其选中.
				if($(this).val()==userInfo.gender){
				   //设置radio对象的checked属性为true
				   $(this).prop("checked",true)
				}
			});
			$("#birthdayId").val(userInfo.birthday);
			$("#photoId").html('<img src="/image/'+userInfo.photo+'" id="photoId" name="photo"/>').val(userInfo.photo);
			$("#phoneId").val(userInfo.phone);
			$("#mailboxId").val(userInfo.mailbox);
			$("#addressId").val(userInfo.address);
			
		}

	});
}
function changePhoto(){
	var formData = new FormData();
	 formData.append('photo', document.getElementById('photo').files[0]);
	 console.log(document.getElementById('photo').files[0])
	$.ajax({
		url : "${basePath}/web/changePhoto?id="+id,
		type : 'POST',
		cache : false,
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert("修改成功")
			findPersonalInfoId();
		}
	});

}
function userInfo_xg_btn(){
	$.ajax({
		 url:"${basePath}/backStage/adminUpdateUserInfo?id="+id,
		type : "POST",
		data : $("#editFormId").serialize(),
		success : function(result) {
			if (result.code == 100) {
				alert("修改成功");
				findPersonalInfoId();
			} else {
				alert("修改失败")
				 console.log(result) 

			}

		}

	});
	
}
</script>
<script src="${basePath}/static/js/backstage.js"></script>