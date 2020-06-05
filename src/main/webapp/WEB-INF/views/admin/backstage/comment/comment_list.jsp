<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<script type="text/javascript" src="${basePath}/static/ttms/product/comment_list.js"></script>
<script type="text/javascript" src="${basePath}/static/ttms/common/page.js"></script>

 <!-- 表单 -->
	<div class="container">
	   <!-- 页面导航 -->
	   <div class="page-header">
			<div class="page-title" style="padding-bottom: 5px">
				<ol class="breadcrumb">
				  <li class="active">评论信息管理</li>
				</ol>
			</div>
			<div class="page-stats"></div>
		</div>
		<form method="post" id="queryFormId">
		    <!-- 查询表单 -->
			<div class="row page-search">
			 <div class="col-md-12">
				<ul class="list-unstyled list-inline">
					<li><input type="text" id="searchNameId" class="form-control"placeholder="景点名称"></li>
					<!--  <li><select id="searchValidId" class="form-control">
							<option value="">选择状态</option>
							<option value="2">未出行</option>
							<option value="4">已完成</option>
					</select></li> -->
					<li class='O1'><button type="button" class="btn btn-primary btn-search" >查询</button></li>
					<!-- <li class='O2'><button type="button" class="btn btn-primary btn-add">添加</button></li> -->
				<!-- 	<li class='O3'><button type="button" class="btn btn-primary btn-invalid">禁用</button></li>
					<li class='O4'><button type="button" class="btn btn-primary btn-valid">启用</button></li> -->
				</ul>
			  </div>
			</div>
			<!-- 列表显示内容 -->
			<div class="row col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
						<th>评论编号</th>
						   <th>用户编号</th>
						   <th>订单编号</th>
							<th>景点名称</th>
							<th>评分</th>
							<th>评价</th>
							<th>评论时间</th>
							<%-- <c:if test="${userInfo.role == 1}"> --%>
							<th>操作</th>
					<%-- 		</c:if> --%>
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