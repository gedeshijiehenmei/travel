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
<title>游记</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div id="travels">
		<!-- 轮播 -->
		<div class="bd-example">
			<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${APP_PATH }/static/image/1.jpg" class="d-block w-100"
							alt="...">
						<div class="carousel-caption d-none d-md-block">
							<!-- <h5>First slide label</h5>
							<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p> -->
						</div>
					</div>
					<div class="carousel-item">
						<img src="${APP_PATH }/static/image/2.jpg" class="d-block w-100"
							alt="...">
						<div class="carousel-caption d-none d-md-block">
							<!-- <h5>Second slide label</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> -->
						</div>
					</div>
					<div class="carousel-item">
						<img src="${APP_PATH }/static/image/3.jpg" class="d-block w-100"
							alt="...">
						<div class="carousel-caption d-none d-md-block">
							<!-- <h5>Third slide label</h5>
							<p>Praesent commodo cursus magna, vel scelerisque nisl
								consectetur.</p> -->
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!-- 轮播 -->
		<div id="travels">
			<div class="indexMain clearfix">
				<div class="leftMain">
					<div class="leftYoujiBox">
						<div class="youjiNavBox clearfix">
							<ul class="yjNavList clearfix" id="myTab" role="tablist">
								<li class="nav-item"><a class="active" id="home-tab"
									data-toggle="tab" href="#home" role="tab" aria-controls="home"
									aria-selected="true">推荐精品</a></li>
								<li class="nav-item"><a id="profile-tab" data-toggle="tab"
									href="#profile" role="tab" aria-controls="profile"
									aria-selected="false">热门游记</a></li>
								<li class="nav-item"><a id="contact-tab" data-toggle="tab"
									href="#contact" role="tab" aria-controls="contact"
									aria-selected="false">最新发布</a></li>
							</ul>
							<div class="rightYjBtn clearfix">
								<a class="myYjBtn" href="#" @click="mytravels(this.id)">我的游记</a> <a class="whiteYjBtn"
									href="#" @click="travelsAdd">写游记</a>
							</div>
						</div>
						<div class="youjiList">
							<div id="yjDomBox">
								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade show active" id="home"
										role="tabpanel" aria-labelledby="home-tab">
										<div class="product_list">
											<div class="product_normal" id="product_normal">
												<div class="product j_item"
													v-for="(travels,index) in listTravels" :key="index">
													<div class="base">
														<div class="image">
															<a :href='"${APP_PATH}/web/travelsDetails?id="+travels.id'> <img class="lazy_img j_lazyImg"
																:src='"/image/"+travels.cover' style="display: inline;">
															</a>
														</div>
														<div class="detail">
															<div class="left">
																<div class="top">
																	<div class="title">
																		<a :href='"${APP_PATH}/web/travelsDetails?id="+travels.id'>{{travels.title}}</a>
																	</div>
																	
																	<div class="tags"> <a :href='"${APP_PATH}/web/travelsDetails?id="+travels.id'><span>{{travels.introduction.slice(0,120)}}...</span></a></div>
																
																</div>
																
																<div class="bottom"
																	v-for="(user,index) in travels.userInfo" :key="index">
																	<div class="origin">
																		<div class="origin-left">
																			<img class="header-photo" :src='"/image/"+user.photo'>
																			<span class="header-text">{{user.userName}}</span>
																			<span class="header-text">{{travels.creationtime}}</span>
																		</div>
																		</div>
																	</div>
																	<div class="dianzan" v-on:click="dianzanClick">
																			<span class="dianzan-number">{{travels.fabulous}}</span>
																				<span class="ding" v-if="dianzan"></span>
																				<span class="ding-hover" v-else></span>
																			</div>
																</div>
															</div>
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab"></div>
								<div class="tab-pane fade" id="contact" role="tabpanel"
									aria-labelledby="contact-tab"></div>
							</div>

						</div>
						<div id="yjListPage"></div>
					</div>
				</div>
			</div>
			<div class="rightMain"></div>
		</div>
		<%@include file="../footer.jsp"%>
</body>
<script type="text/javascript">
var id = "${userInfo.id}";
	var vm = new Vue({
		el : '#travels',
		data : function() {
			return {
				listTravels:[],
				dianzan:true,
				id:id
			}

		},
		mounted:function() {
		this.travelsList();
		
		},
		methods : {
			travelsList:function(){
				var that=this;
				axios({
					  method:"POST",
					  url:"${APP_PATH}/web/travelsList",
					  data:{
						  userid:this.userid
					  }
					  
	              }).then(function (response) {
	              	if(response.data.code==100){
	              		that.listTravels=response.data.extend.travels;
	              		console.log(that.listTravels)
	              	}else{
	              		alert(response.data.message)
	              	}
	              }).catch(function (error) {
	              	alert(error)
	              })
				},
				travelsAdd:function(){
					if(id==''||id==null){
						alert("请前往登录界面，进行登录")
						window.location.href = "${APP_PATH}/system/login";	
					}else{
						window.location.href = "${APP_PATH}/web/travelsAdd";	
					}					
					
				},
				dianzanClick:function(){
					this.dianzan=!this.dianzan
				},
				mytravels:function(id){
					this.userid=id;
					this.travelsList();
				}
		}
	});
</script>
</html>