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
				<li class="active">添加新的景点</li>
			</ol>
		</div>
		<div class="page-stats"></div>
	</div>
	<form class="form-horizontal" id="addFormId" method="POST">
		<div class="#">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#home"
					aria-controls="home" role="tab" data-toggle="tab">基本信息</a></li>
				<!-- <li role="presentation"><a href="#profile"
					aria-controls="profile" role="tab" data-toggle="tab">图片</a></li> -->
				<li role="presentation"><a href="#messages"
					aria-controls="messages" role="tab" data-toggle="tab">行程路线</a></li>
				<li role="presentation"><a href="#settings"
					aria-controls="settings" role="tab" data-toggle="tab">预定须知</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content" style="margin-top: 50px;">
				<div role="tabpanel" class="tab-pane active" id="home">
				
				<div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">景点封面：</label>
						<div class="col-sm-4">
				<div >
						<img src='' class="imgheader"
							style="width: 150px; height: 150px; margin-right: 10px;" />
							 <img
							src="" class="img"
							style="display: none; height: 150px; width: 150px;" />
						<p style="position: absolute; left: 0px; top: 0px;">
							<input type="file" name="photo" id="photo" ref="file"
								class="file imgInput " style="width: 150px; height: 150px;">
						</p>
						<!-- <div>
							<a>上传图片</a>
						</div> -->
					</div>
					</div>
					</div>
				
					<div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">景点类型：</label>
						<div class="col-sm-4">
							<select id="scenicSpotType" class="form-control"
								name="scenicSpotType">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">景点名称：</label>
						<div class="col-sm-4">
							<input type="text" class="form-control required" name="name"
								id="name">
						</div>
					</div>
					<div class="form-group">
						<label for="project-code" class="col-sm-2 control-label">城市：</label>
						<div class="col-sm-4">
							<input type="text" class="form-control required" name="city"
								id="city">
						</div>
					</div>
					<div class="form-group">
						<label for="project-code" class="col-sm-2 control-label">天数：</label>
						<div class="col-sm-4">
							<select id="day" class="form-control"
								name="day">
								<option value="1">1天</option>
								<option value="2">2天</option>
								<option value="3">3天</option>
								<option value="4">4天</option>
								<option value="5">5天</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="project-code" class="col-sm-2 control-label">价格：</label>
						<div class="col-sm-4">
							<input type="text" class="form-control required"
								name="ticket" id="ticket">
						</div>
					</div>
					<div class="form-group">
						<label for="project-code" class="col-sm-2 control-label">简介：</label>
						<div class="col-sm-4">
							<input type="text" class="form-control required"
								name="introduction" id="introduction">
						</div>
					</div>
					<div class="modal-footer modal-footer-add">
						<button type="button" class="btn btn-default">重&nbsp;&nbsp;置</button>
					<button type="button" class="btn btn-primary"
				onclick="scenic_spot()">保&nbsp;&nbsp;存</button>
					</div>
				</div>
				<!-- <div role="tabpanel" class="tab-pane" id="profile">
					<div style="margin-left: 30px; margin-top: 30px;">
						<img src='' class="imgheader"
							style="width: 300px; height: 300px; margin-right: 10px;" />
							 <img
							src="" class="img"
							style="display: none; height: 300px; width: 300px;" />
						<p style="position: absolute; left: 335px; top: 245px;">
							<input type="file" name="photo" id="photo" ref="file"
								class="file imgInput " style="width: 300px; height: 300px;">
						</p>
						<div>
							<a>上传图片</a>
						</div>
					</div>
					<a href="#home"
					aria-controls="home" role="tab" data-toggle="tab">上一步</a>
					<button type="button" class="btn btn-primary"
				onclick="scenic_spot()">保&nbsp;&nbsp;存</button>
				</div> -->
				<div role="tabpanel" class="tab-pane" id="messages">
					<div>
					<div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">线路编号：</label>
						<div class="col-sm-4">
							<input type="text" class="form-control required" name="scenicSpotid"
								id="scenicSpotid">
						</div>
					</div>
					<div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">天数：</label>
						<div class="col-sm-4">
							<select id="days" class="form-control"
								name="days">
								<option value="1">第1天</option>
								<option value="2">第2天</option>
								<option value="3">第3天</option>
								<option value="4">第4天</option>
								<option value="5">第5天</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">景点名称：</label>
						<div class="col-sm-4">
							<input type="text" class="form-control required" name="title"
								id="title">
						</div>
					</div>
					<div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">景点介绍：</label>
						<div class="col-sm-4">
							<input type="text" class="form-control required" name="introduce"
								id="introduce">
						</div>
					</div>
				 <div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">照片：</label>
						<div class="col-sm-4">
							<input type="file" ref="file"name="photo2"
								id="photo2">
						</div>
					</div>
					<div class="form-group">
						<label for="nameId" class="col-sm-2 control-label">照片2：</label>
						<div class="col-sm-4">
							<input type="file" ref="file" name="photo3"
								id="photo3">
						</div>
					</div>
					<div class="modal-footer modal-footer-add">
			<button type="reset" class="btn btn-default">重&nbsp;&nbsp;置</button>
			<button type="button" class="btn btn-primary"
				onclick="scenic_spot_list()">保&nbsp;&nbsp;存</button>
		</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="settings">
					<script id="container" name="content" type="text/plain"
						style="width: 1000px;">
        这里写你的初始化内容
    </script>

				</div>
			</div>

		</div>
	</form>
</div>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "${basePath}/backStage/scenicSpotType",
			type : 'POST',
			success : function(result) {
				console.log(result);
				var type = result.extend.scenicSpotType;
				console.log(type);
				var scenicSpotType = $("#scenicSpotType");
				for ( var i in type) {
					var option = $("<option value='"+type[i].id+"'></option>");
					/* option.data("id",type[i].id); */
					option.append(type[i].type);
					scenicSpotType.append(option);
				}

			}
		});
	});
//添加基本信息
function find_scenic_spot_name(){
	var  scenicSpotName=$('#name').val();
	$.ajax({
		url : "${basePath}/backStage/findScenicSpotName?scenicSpotName="+scenicSpotName,
		type : 'POST',
		success : function(result) {
			console.log(result)
			var scenicSpotid=result.extend.scenicSpotId.id;
			$("#scenicSpotid").val(scenicSpotid);
			
		}
	});
}

	function scenic_spot() {
		var basicInfo = new FormData();
		basicInfo.append('type', $('#scenicSpotType').val());
		basicInfo.append('name', $('#name').val());
		/* basicInfo.append('introduction', $('#introduction').val()); */
		basicInfo.append('city', $('#city').val());
		basicInfo.append('day', $('#day').val());
		basicInfo.append('ticket', $('#ticket').val());
		basicInfo.append('photo', document.getElementById('photo').files[0]);
		$.ajax({
			url : "${basePath}/backStage/addScenicSpotInfo",
			type : 'POST',
			cache : false,
			data : basicInfo,
			processData : false,
			contentType : false,
			success : function(result) {
				alert("线路基本信息添加成功，请前往添加线路详细信息");
				find_scenic_spot_name();
			}
		});
	}
	
	//添加详细信息
	function scenic_spot_list() {
		var basicInfo = new FormData();
		basicInfo.append('scenicSpotid', $('#scenicSpotid').val());
		basicInfo.append('days', $('#days').val());
		basicInfo.append('title', $('#title').val());
		basicInfo.append('introduce', $('#introduce').val());
		basicInfo.append('photo3', document.getElementById('photo3').files[0]);
		basicInfo.append('photo2', document.getElementById('photo2').files[0]); 
		$.ajax({
			url : "${basePath}/backStage/addScenicSpotInfoDetail",
			type : 'POST',
			cache : false,
			data : basicInfo,
			processData : false,
			contentType : false,
			success : function(result) {
				alert("添加成功");
			}
		});
	}
	/* var ue = UE.getEditor('container'); */
	
	// 预览图片
	$(".imgInput").change(function() {
		$(".img").attr("src", URL.createObjectURL($(this)[0].files[0]));
		$(".imgheader").css({
			"display" : "none"
		});
		$(".img").css({
			"display" : "block"
		});
	});

</script>
<%-- <script src="${basePath}/static/js/backstage.js"></script> --%>