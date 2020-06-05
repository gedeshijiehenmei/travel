<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/index.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/index.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<!-- <script src="https://unpkg.com/axios/dist/axios.min.js"></script> -->

<title>悦游旅行社官方网站</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div id="index" class="container lunbo">
		<!-- 左导航栏 右侧轮播 -->
		<div class="row no-gutters">
			<!--左导航栏-->
			<div class="col-md-2">
				<div id="cateMenu">
					<ul class="cateList " style="padding-left: 10px;">
						<li class="cateItem">
							<div class="title">
								<a href="#nav-remen-tab">热门推荐</a>
							</div>
							<div class="place ">
								<a href="#" class="hot">北京</a> <a href="#" class="hot">成都</a> <a
									href="#" class="">台湾</a>
							</div>
						</li>
						<li class="cateItem ">
							<div class="title ">
								<a href="#nav-guonei-tab">国内旅游</a>
							</div>
							<div class="place ">
								<a href="#" class="">厦门</a> <a href="#" class="hot">江西</a> <a
									href="#" class="">苏州</a>
							</div>
						</li>
						<li class="cateItem ">
							<div class="title ">
								<a href="#nav-chujingduanxian-tab">出境短线</a>
							</div>
							<div class="place ">
								<a href="#" class="">南亚</a> <a href="#" class="">印度尼西亚</a> <a
									href="#" class="">日本</a>
							</div>
						</li>
						<li class="cateItem ">
							<div class="title ">
								<a href="#chujingchangxian">出境长线</a>
							</div>
							<div class="place ">
								<a href="#" class="">中东非</a> <a href="#" class="hot">欧洲</a><a
									href="#" class="">海岛长线</a>
							</div>
						</li>
						<li class="cateItem ">
							<div class="title ">
								<a href="#">周边</a>
							</div>
							<div class="place ">
								<a href="#" class="">东北周边</a> <a href="#" class="hot">华东周边</a> <a
									href="#" class="">华南周边</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!--轮播-->
			<div id="carouselExampleCaptions" class="carousel carousel-l slide col-md-8 "
				data-ride="carousel">
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
			<div class="col-md-2">
				<div class="border">
					<div class="box">
						<ul>
							<li>
								<canvas id="one" width="60" height="60"></canvas> <span>满意度</span>
							</li>
							<li class="renshu"><p>出行人数1000+</p>
								<p>评论人数500+</p></li>
						</ul>
					</div>
					<div class="box-main">
					<div class="box-main-img"></div>
					
					</div>
				</div>
			</div>
		</div>
		<!-- 左导航栏 右侧轮播 -->


		<!--旅游-->
		<div style="margin-top: 25px;">
			<!--热门旅游-->
			<!--热门旅游导航-->
			<div id="nav-remen-tab" class="row territory no-gutters">
				<div class="col-md-2">
					<div class="territory_text">
						<span id="#">热门推荐 </span>
					</div>
				</div>
				<div id="#" class="col-md-10 territory">
					<div style="float: right; padding-top: 25px; margin-right: 15px;">
						<a href="${APP_PATH }/web/moreXinlu" style="font-size: 13px; text-align: right;">更多热门旅游线路</a>
					</div>
					<!-- 	</div>
				</nav> -->
				</div>
			</div>
			<!--热门旅游导航-->
			<hr color="#f9af46" />
			<!--境内旅游-->
			<div id="#" class="row territory no-gutters">
				<div class="tab-content tab-content-left" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-jx" role="tabpanel"
						aria-labelledby="nav-jx-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot">
							<c:if test="${scenicSpot.type == 1}" >
								<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
									<div class="card_size">
										<div class="card">
											<c:if test="${scenicSpot.photo != null}">
												<img src="/image/${scenicSpot.photo}" class="card-img-top"
													alt="...">
											</c:if>
											<div class="card-body">
												<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
												<span class="card-text-ticket">￥${scenicSpot.ticket }.00</span><span
													class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
											</div>
										</div>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--热门旅游-->

			<!--境内旅游-->
			<!--境内旅游导航-->
			<div id="nav-guonei-tab" class="row territory no-gutters">
				<div class="col-md-2">
					<div class="territory_text">
						<span id="#">国内旅游 </span>
					</div>
				</div>
				<div id="#" class="col-md-10 territory">
					<nav>
						<div class="nav nav-tabs territory_nav" id="nav-tab"
							role="tablist">

							<a class="nav-item nav-link active" id="nav-gjx-tab"
								data-toggle="tab" href="#nav-gjx" role="tab"
								aria-controls="nav-gjx" aria-selected="true">全部</a> <a
								class="nav-item nav-link" id="nav-gz-tab" data-toggle="tab"
								href="#nav-gz" role="tab" aria-controls="nav-gz"
								aria-selected="false">广州</a> <a class="nav-item nav-link"
								id="nav-bj-tab" data-toggle="tab" href="#nav-bj" role="tab"
								aria-controls="nav-bj" aria-selected="false">北京</a> <a
								class="nav-item nav-link " id="nav-yn-tab" data-toggle="tab"
								href="#nav-yn" role="tab" aria-controls="nav-yn"
								aria-selected="false">云南</a> <a class="nav-item nav-link"
								id="nav-gl-tab" data-toggle="tab" href="#nav-gl" role="tab"
								aria-controls="nav-gl" aria-selected="false">桂林</a> <a
								class="nav-item nav-link" id="nav-cx-tab" data-toggle="tab"
								href="#nav-cx" role="tab" aria-controls="nav-cx"
								aria-selected="false">重庆</a>

							<div style="padding-left: 80px; padding-top: 8px;">
								<a href="${APP_PATH }/web/moreXinlu" style="font-size: 13px; text-align: right;">更多国内旅游线路</a>
							</div>
						</div>
					</nav>
				</div>
			</div>
			<!--境内旅游导航-->
			<hr color="#f9af46" />
			<!--境内旅游-->
			<div id="#" class="row territory no-gutters">
				<div class="tab-content tab-content-left" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-gjx" role="tabpanel"
						aria-labelledby="nav-gjx-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 2}">
								<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
									<div class="card_size">
										<div class="card">
											<c:if test="${scenicSpot.photo != null}">
												<img src="/image/${scenicSpot.photo}" class="card-img-top"
													alt="...">
											</c:if>
											<div class="card-body">
												<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
												<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
													class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
											</div>
										</div>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</div>
					<div class="tab-pane fade" id="nav-gz" role="tabpanel"
						aria-labelledby="nav-gz-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 2}">
								<c:if test='${scenicSpot.city =="广州"}'>
									<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
										<div id="#" class="card_size">
											<div class="card">
												<c:if test="${scenicSpot.photo != null}">
													<img src="/image/${scenicSpot.photo}" class="card-img-top"
														alt="...">
												</c:if>
												<div class="card-body">
													<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
													<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
														class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
												</div>
											</div>
										</div>
									</a>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
					<div class="tab-pane fade" id="nav-bj" role="tabpanel"
						aria-labelledby="nav-bj-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 2}">
								<c:if test='${scenicSpot.city =="北京"}'>
									<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
										<div id="#" class="card_size">
											<div class="card">
												<c:if test="${scenicSpot.photo != null}">
													<img src="/image/${scenicSpot.photo}" class="card-img-top"
														alt="...">
												</c:if>
												<div class="card-body">
													<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
													<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
														class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
												</div>
											</div>
										</div>
									</a>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
					<div class="tab-pane fade" id="nav-yn" role="tabpanel"
						aria-labelledby="nav-yn-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 2}">
								<c:if test='${scenicSpot.city =="云南"}'>
									<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
										<div id="#" class="card_size">
											<div class="card">
												<c:if test="${scenicSpot.photo != null}">
													<img src="/image/${scenicSpot.photo}" class="card-img-top"
														alt="...">
												</c:if>
												<div class="card-body">
													<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
													<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
														class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
												</div>
											</div>
										</div>
									</a>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
					<div class="tab-pane fade" id="nav-gl" role="tabpanel"
						aria-labelledby="nav-gl-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 2}">
								<c:if test='${scenicSpot.city =="桂林"}'>
									<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
										<div id="#" class="card_size">
											<div class="card">
												<c:if test="${scenicSpot.photo != null}">
													<img src="/image/${scenicSpot.photo}" class="card-img-top"
														alt="...">
												</c:if>
												<div class="card-body">
													<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
													<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
														class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
												</div>
											</div>
										</div>
									</a>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--境内旅游-->

			<!--出境短线旅游-->
			<!--出境短线旅游导航-->
			<div id="#nav-chujingduanxian-tab" class="row territory no-gutters">
				<div class="col-md-2">
					<div class="territory_text">
						<span id="#">出境短线 </span>
					</div>
				</div>
				<div id="#" class="col-md-10 territory">
					<nav>
						<div class="nav nav-tabs territory_nav" id="nav-tab"
							role="tablist">

							<a class="nav-item nav-link active" id="nav-cjx-tab"
								data-toggle="tab" href="#nav-cjx" role="tab"
								aria-controls="nav-cjx" aria-selected="true">全部</a> <a
								class="nav-item nav-link" id="nav-nanya-tab" data-toggle="tab"
								href="#nav-nanya" role="tab" aria-controls="nav-nanya"
								aria-selected="false">南亚</a> <a class="nav-item nav-link"
								id="nav-ydnxy-tab" data-toggle="tab" href="#nav-ydnxy"
								role="tab" aria-controls="nav-ydnxy" aria-selected="false">印度尼西亚</a>
							<a class="nav-item nav-link " id="nav-riben-tab"
								data-toggle="tab" href="#nav-riben" role="tab"
								aria-controls="nav-riben" aria-selected="false">日本</a> <a
								class="nav-item nav-link" id="nav-gl-tab" data-toggle="tab"
								href="#nav-gl" role="tab" aria-controls="nav-gl"
								aria-selected="false">泰国</a>
							<div style="padding-left: 100px; padding-top: 8px;">
								<a href="${APP_PATH }/web/moreXinlu" style="font-size: 13px; text-align: right;">更多出境短线旅游线路</a>
							</div>
						</div>
					</nav>
				</div>
			</div>
			<hr color="#f9af46" />
			<!--出境短线旅游-->
			<div id="#" class="row territory no-gutters">
				<div class="tab-content tab-content-left" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-cjx" role="tabpanel"
						aria-labelledby="nav-cjx-tab">
						<!--......  -->
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 3}">
								<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
									<div class="card_size">
										<div class="card">
											<c:if test="${scenicSpot.photo != null}">
												<img src="/image/${scenicSpot.photo}" class="card-img-top"
													alt="...">
											</c:if>
											<div class="card-body">
												<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
												<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
													class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
											</div>
										</div>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</div>
					<div class="tab-pane fade" id="nav-nanya" role="tabpanel"
						aria-labelledby="nav-nanya-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 3}">
								<c:if test='${scenicSpot.city =="南亚"}'>
									<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
										<div id="#" class="card_size">
											<div class="card">
												<c:if test="${scenicSpot.photo != null}">
													<img src="/image/${scenicSpot.photo}" class="card-img-top"
														alt="...">
												</c:if>
												<div class="card-body">
													<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
													<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
														class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
												</div>
											</div>
										</div>
									</a>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
					<div class="tab-pane fade" id="nav-ydnxy" role="tabpanel"
						aria-labelledby="nav-ydnxy-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 3}">
								<c:if test='${scenicSpot.city =="印度尼西亚"}'>
									<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
										<div id="#" class="card_size">
											<div class="card">
												<c:if test="${scenicSpot.photo != null}">
													<img src="/image/${scenicSpot.photo}" class="card-img-top"
														alt="...">
												</c:if>
												<div class="card-body">
													<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
													<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
														class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
												</div>
											</div>
										</div>
									</a>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
					<div class="tab-pane fade" id="nav-riben" role="tabpanel"
						aria-labelledby="nav-riben-tab">
						<c:forEach items="${scenicSpotInfo1}" var="scenicSpot"  >
							<c:if test="${scenicSpot.type == 3}">
								<c:if test='${scenicSpot.city =="日本"}'>
									<a href="${APP_PATH}/web/detail?id=${scenicSpot.id}">
										<div id="#" class="card_size">
											<div class="card">
												<c:if test="${scenicSpot.photo != null}">
													<img src="/image/${scenicSpot.photo}" class="card-img-top"
														alt="...">
												</c:if>
												<div class="card-body">
													<p class="card-text">${scenicSpot.name.substring(0,25)  }...</p>
													<span class="card-text-ticket">￥${scenicSpot.ticket }</span><span
														class="card-text-qi">起</span><span class="card-text-text">广州出发</span>
												</div>
											</div>
										</div>
									</a>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--出境短线旅游-->

		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>

</html>