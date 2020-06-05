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
				<li class="active">发表新闻</li>
			</ol>
		</div>
		<div class="page-stats"></div>
	</div>
	<form class="form-horizontal" id="addFormId" method="POST"
		enctype="multipart/form-data">
		<div class="input-group news-group">
			<input type="text" class="form-control news-input" placeholder="作者"
				aria-describedby="basic-addon1" id="author" name="author">
		</div>
		<div class="input-group  news-group ">
			<input type="text" class="form-control" style="width: 600px" placeholder="新闻标题"
				aria-describedby="basic-addon1" id="title" name="title">
		</div>
		<div>
			<script  id="newsText" name="text" type="text/plain"
				style="width: 800px;" > 新闻主要内容
    </script >
		</div>


		<div class="modal-footer modal-footer-add">
			<button type="button" class="btn btn-primary"
				onclick="user_add_btn()">发&nbsp;&nbsp;表</button>
			<button type="button" class="btn btn-default">重&nbsp;&nbsp;置</button>
		</div>
	</form>
</div>

<!-- 配置文件 -->
<script type="text/javascript" src="${basePath}/static/ueditor/ueditor.config.js"></script>
 <!-- 编辑器源码文件 -->
<script type="text/javascript" src="${basePath}/static/ueditor/ueditor.all.js"></script>
<script type="text/javascript">

	var ue = UE.getEditor('newsText');
	
	
	function user_add_btn() {
		var formData = new FormData();
		formData.append('author', $('#author').val());
		formData.append('title', $('#title').val());
		var text=ue.getContent();
		formData.append('text', text);
		$.ajax({
			url : "${basePath}/backStage/doSaveNewsInfo",
			type : 'POST',
			cache : false,
			data : formData,
			processData : false,
			contentType : false,
			success : function(result) {
				alert("添加成功");
			}
		});
	}
</script>
