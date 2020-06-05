<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!-- 后台首页-->
<link rel="stylesheet" href="${basePath}/static/assets/css/ready.css">
<script src="${basePath}/static/js/backstage.js"></script>
<div class="content">
	<div class="container-fluid">
		<h4 class="page-title">${userInfo.userName}${userInfo.gender==M?'先生':'女士'} 欢迎您使用旅游信息管理系统！</h4>
		<div class="row">
			<div class="col-md-3">
				<div class="card card-stats card-warning">
					<div class="card-body ">
						<div class="row">
							<div class="col-5">
								<div class="icon-big text-center">
									<i class="la la-users"></i>
								</div>
							</div>
							<div class="col-7 d-flex align-items-center">
								<div class="numbers">
									<p class="card-category">用户数量</p>
									<h4 class="card-title"><span id="userTotal">1000</span>人</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card card-stats card-success">
					<div class="card-body ">
						<div class="row">
							<div class="col-5">
								<div class="icon-big text-center">
									<i class="la la-bar-chart"></i>
								</div>
							</div>
							<div class="col-7 d-flex align-items-center">
								<div class="numbers">
									<p class="card-category">营业额</p>
									<h4 class="card-title"><span>￥</span><span id="turnoverTotal">1345</span>元</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card card-stats card-danger">
					<div class="card-body">
						<div class="row">
							<div class="col-5">
								<div class="icon-big text-center">
									<i class="la la-newspaper-o"></i>
								</div>
							</div>
							<div class="col-7 d-flex align-items-center">
								<div class="numbers">
									<p class="card-category">订单数</p>
									<h4 class="card-title"><span id="dindanTotal">1303</span>单</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card card-stats card-primary">
					<div class="card-body ">
						<div class="row">
							<div class="col-5">
								<div class="icon-big text-center">
									<i class="la la-check-circle"></i>
								</div>
							</div>
							<div class="col-7 d-flex align-items-center">
								<div class="numbers">
									<p class="card-category">出行人数</p>
									<h4 class="card-title"><span id="tripTotal">1303</span>人</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
		</div>
	</div>
</div>
