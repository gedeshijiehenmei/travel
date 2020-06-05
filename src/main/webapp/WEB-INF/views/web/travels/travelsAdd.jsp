<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/header.css" />
<link rel="stylesheet" href="${APP_PATH}/static/css/travels.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<!-- 配置文件 -->
<script type="text/javascript"
	src="${APP_PATH}/static/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"
	src="${APP_PATH}/static/ueditor/ueditor.all.js"></script>

<title>游记</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div id="travels_add" class="travels-box">
		<div class="container">
		<form action="#" method="POST" enctype="multipart/form-data"  >
			<div class="travels-img ">
				<img src="" class="img" style="display: none;" />
				<p class="divfile">
					<input type="file" name="cover" id="cover" ref="file"
						class="file imgInput ">
				</p>
			</div>
			<div class="row">
				<div class="input-group input-group-width">
					<input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default"
						placeholder="请在这里填写游记标题" name="title" id="title">
				</div>
				<div class="input-group input-group-width">
					<textarea class="form-control" aria-label="With textarea"
						placeholder="请在这里填写游记简介" name="introduction"
					 id="introduction"></textarea>
				</div>

				<div class="input-group-width">
					<textarea id="travelsText" name="text" type="text/plain"
						style="width: 800px;" >  请在这里填写游记主要内容
    </textarea>

				</div>

			</div>
			<div class="fabiao">
				<div class="fabiao_btn ">
					<button type="button" class="btn btn-primary" v-on:click="addTravels">发表游记</button>
				</div>
			</div>
			</form>
			</div>
		</div>
	<%@include file="../footer.jsp"%>
</body>
<script type="text/javascript">

var userid = "${userInfo.id}";
	var vm = new Vue({
		el : '#travels_add',
		data : function() {
			return {
				title:'',
				introduction:'',
				text:'',
				cover:''
			}

		},
		mounted:function() {
		},
		methods : {
			addTravels:function(){
				
				var formData = new FormData();
				 formData.append('cover', document.getElementById('cover').files[0]);
					formData.append('title', $('#title').val());
					formData.append('introduction', $('#introduction').val());
					formData.append('userid', userid);
					var text=ue.getContent();
					formData.append('text', text);
				   console.log(document.getElementById('cover').files[0])
				 $.ajax({
					  url:"${APP_PATH}/web/travels_add",
					 type : 'POST',
						cache : false,
						data : formData,
						processData : false,
						contentType : false,
						success : function(result) {
							alert("发表成功");
						}
				 });
				},
				dianzanClick:function(){
					this.dianzan=!this.dianzan
				}
		}
	});
	
	var ue = UE.getEditor('travelsText');
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

</html>