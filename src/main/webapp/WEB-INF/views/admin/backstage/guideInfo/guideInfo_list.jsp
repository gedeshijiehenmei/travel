<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<script type="text/javascript" src="${basePath}/static/ttms/product/guide_list.js"></script>
<script type="text/javascript" src="${basePath}/static/ttms/common/page.js"></script>
 <!-- 表单 -->
	<div class="container">
	   <!-- 页面导航 -->
	   <div class="page-header">
			<div class="page-title" style="padding-bottom: 5px">
				<ol class="breadcrumb">
				  <li class="active">导游用户信息管理</li>
				</ol>
			</div>
			<div class="page-stats"></div>
		</div>
		<form method="post" id="queryFormId">
		    <!-- 查询表单 -->
			<div class="row page-search">
			 <div class="col-md-12">
				<ul class="list-unstyled list-inline">
					<li><input type="text" id="searchNameId" class="form-control"placeholder="导游昵称"></li>
					<li><select id="searchValidId" class="form-control">
							<option value="">选择状态</option>
							<option value="1">启用</option>
							<option value="2">禁用</option>
					</select></li>
					<li class='O1'><button type="button" class="btn btn-primary btn-search" >查询</button></li>
					<!-- <li class='O2'><button type="button" class="btn btn-primary btn-add">添加</button></li> -->
					<li class='O3'><button type="button" class="btn btn-primary btn-invalid">禁用</button></li>
					<li class='O4'><button type="button" class="btn btn-primary btn-valid">启用</button></li>
				</ul>
			  </div>
			</div>
			<!-- 列表显示内容 -->
			<div class="row col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
						<th><input type="checkbox" name="checkedItem" value="[id]"></th>
						<th>id</th>
						   <th>昵称</th>
							<th>密码</th>
							<th>真实姓名</th>
							<th>性别</th>
							<th>生日</th>
							<th>头像</th>
							<th>电话号码</th>
							<th>邮箱</th>
							<th>状态</th>
							<th>简介</th>
							<th>注册时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- ajax异步获得,并将数据填充到tbody中 -->
					<tbody id="tbodyId">
					</tbody>
				</table>
           <%@include file="../common/page.jsp" %> 
			</div>
		</form>
	</div>  