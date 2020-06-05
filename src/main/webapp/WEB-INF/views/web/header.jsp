<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet" href="${APP_PATH}/static/css/header.css" />
<script src="${APP_PATH}/static/js/index.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/animation/mdialog.css">
	<script type="text/javascript" src="${APP_PATH}/static/animation/zepto.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/animation/mdialog.js"></script>
<!--第一条导航栏-->
<div class="header1 " id="header1">
<div class="main_body">
	<ul class="nav  bg-light">
		<li class="nav-item " style="padding-left:50px; margin-right: 800px;"><a
			class="nav-link" href="#">悦游</a></li>
		<li class="nav-item" v-if="userName==''"><a class="nav-link"
			href="${APP_PATH}/system/login">登录</a></li>
		<li class="nav-item" v-if="userName==''"><a class="nav-link"
			href="${APP_PATH}/system/register">注册</a></li>
		<li class="nav-item" v-else>
			<div class="dropdown">
				<button class="dropbtn">您好， {{userName}}</button>
				<div class="dropdown-content">
					<a href="#" v-on:click="person">个人中心</a> 
					<a href="${APP_PATH}/backStage/index" v-if="role==1||role==2">后台管理</a>
					<a href="${APP_PATH}/system/login_out">退出</a>
				</div>
			</div>
		</li>

		<li class="nav-item"><a class="nav-link" href="#"
			v-on:click="person">我的订单</a></li>
		<li class="nav-item"><a class="nav-link" href="#">网站地图</a></li>
	</ul>
	</div>
</div>
<div></div>
<!--第二条导航栏-->
<div class="header2 main_body">
	<nav class="navbar navbar-light">
		<a class="navbar-brand navbar-brand-text"></a>
		 <div id="headerSearch">
                <div class="searchType j_search_type">
                    <span>旅游</span>
                    <div class="searchTypeBar">
                            <div data-type="14957033340015086">旅游</div>
                            <div data-type="14957033410015252">新闻</div>
                            <div data-type="14957033690017148">游记</div>
                             <div data-type="14957033390012639">酒店</div>
                             <div data-type="14957033450016344">导游</div>
                    </div>
                </div>

			<div class="inputWrap">
				<input class="searchInput j_searchInput" type="text"
					placeholder="搜索国家、城市" autocomplete="off">
			</div>
			<div class="searchButton j_searchButton">搜索</div>
		</div>
		<div id="headerPromo">
			<div class="serviceTel" style="">
				<div class="label">客户服务热线：</div>
				<div class="value">
					<em class="tel">15102054856</em>
				</div>
			</div>
		</div>
	</nav>
</div>
<!--第三条导航栏-->
<div class="header3 ">
<div class="main_body" >
	<ul class="nav" style=" color: white; padding-left: 20px;">
	<!-- 	<li class="nav-item" style="margin-right: 25px;"><a
			class="nav-link" href="#" style="color: white;">旅游导航</a></li> -->
		<li class="nav-item" style="margin-right: 30px; margin-left: 15px;"><a
			class="nav-link" href="${APP_PATH}/web/index" style="color: white;">首页</a></li>
		<li class="nav-item" style="margin-right: 30px;"><a
			class="nav-link" href="${APP_PATH}/web/moreXinlu" style="color: white;">旅游线路</a></li>
		<li class="nav-item" style="margin-right: 30px;"><a
			class="nav-link" href="${APP_PATH}/web/news" style="color: white;">旅游新闻</a></li>
		<li class="nav-item" style="margin-right: 30px;"><a
			class="nav-link" href="${APP_PATH}/web/travels" style="color: white;">旅游游记</a></li>
			<li class="nav-item" style="margin-right: 30px;"><a
			class="nav-link" href="${APP_PATH}/web/others2" style="color: white;">宾馆酒店</a></li>
			<li class="nav-item" style="margin-right: 30px;"><a
			class="nav-link" href="${APP_PATH}/web/guide" style="color: white;">导游</a></li> 
			<li class="nav-item" style="margin-right: 30px;"><a
			class="nav-link"  href="${APP_PATH}/web/others2" style="color: white;">定制游</a></li>
		<li class="nav-item"><a class="nav-link"  href="${APP_PATH}/web/others2"
			style="color: white;">目的地</a></li>
			<li class="nav-item" style="margin-right: 30px;"><a
			class="nav-link" href="#" style="color: white;">我要咨询</a></li>
	</ul>
	</div>
</div>
<script type="text/javascript">
		//获取session
		var userName = "${userInfo.userName}";
		var role = "${userInfo.role}";
		
		var vm = new Vue({
			el:'#header1',
			data : {
				userName:userName,
				role:role
			},
			methods : {
				person : function() {
					//验证用户是否登录
					if(this.userName==null||this.userName==''){
						alert("请前往登录界面，进行登录")
						window.location.href = "${APP_PATH}/system/login";					
					}
					else{
						window.location.href = "${APP_PATH}/web/person";	
					}
				},
			}
		});
		</script>
		
		
		<script>
		

		</script>