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
<link rel="stylesheet" href="${APP_PATH}/static/css/news.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<title>旅游新闻</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="tbody" id="news">
		<div class="main-wrapper">
			<div class="main_body news-body">
				<div class="headline">
					<h1>
						<a href="${APP_PATH }/web/newsListId?id=1">{{title}} </a>
					</h1>

				</div>

				<div class="news-box">
					<div class="news-left">
						<div class="news-left-img">
								<a href="${APP_PATH }/web/newsListId?id=1"><img alt="" :src='"/image/"+photo'></a>
						</div>
					</div>
					<div class="news-right">
						<div class="news-head-2">
							<h2>要闻聚焦</h2>
							<a>更多</a>
						</div>
						<div class="news-head-3" v-for="(news,index) in listNews" :key="index"  v-if="index>=1">
						<ul>
							<li><a :href='"${APP_PATH}/web/newsListId?id="+news.id'>{{news.title.slice(0,20)}}...</a></li>
						</ul>
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
		el : '#news',
		data : function() {
			return {
				listNews:[],
				id:0,
				title:'',
				photo:''
			}

		},
		mounted:function() {
		this.newsList();
		},
		methods : {
			newsList:function(){
				var that=this;
				axios({
					  method:"POST",
					  url:"${APP_PATH}/web/newsList",
	              }).then(function (response) {
	              	if(response.data.code==100){
	              		that.title=response.data.extend.news[0].title;
	              		that.photo=response.data.extend.news[0].photo;
	              		that.listNews=response.data.extend.news;
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