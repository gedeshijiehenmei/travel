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
<title>导游</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div id="guide">
	
	<div class="container">
	<div class="row">
	<div v-for="(guide,index) in guides" :key="index" style="margin-top:20px; margin-right: 10px;margin-bottom: 5px;">
	<div class="card" style="width: 13rem;">
  <img :src='"/image/"+guide.photo' class="card-img-top" alt="..." style="width: 206px;height: 210px;">
  <div class="card-body" style="height: 178px;">
    <h5 class="card-title">{{guide.name}}</h5>
    <p class="card-text">{{guide.address}}</p>
    <a href="#" class="btn btn-primary">详细信息</a>
  </div>
</div>
</div>
	</div>
	</div>
		</div>
		<%@include file="../footer.jsp"%>
</body>
<script type="text/javascript">
	var vm = new Vue({
		el : '#guide',
		data : function() {
			return {
				guides:''
			}

		},
		mounted:function() {
		this.guidesList();
		
		},
		methods : {
			guidesList:function(){
				var that=this;
				axios({
					  method:"POST",
					  url:"${APP_PATH}/web/guideList",
					  data:{
						  role:2
					  }
					  
	              }).then(function (response) {
	              	if(response.data.code==100){
	              		that.guides=response.data.extend.guides;
	              	}else{
	              		alert(response.data.message)
	              	}
	              }).catch(function (error) {
	              	alert(error)
	              })
				},
		}
	});
</script>
</html>