<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="0">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>悦游旅行社后台管理系统</title>

<link rel="stylesheet" href="${basePath}/static/bootstrap/css/bootstrap.min3.3.5.css" />
<link rel="stylesheet" href="${basePath}/static/bootstrap/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" href="${basePath}/static/bootstrap/css/bootstrap-table.min.css">
<link rel="stylesheet" href="${basePath}/static/bootstrap/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/static/dist/css/ionicons.min.css">
<link rel="stylesheet" href="${basePath}/static/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="${basePath}/static/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="${basePath}/static/bootstrap/plugins/ztree/css/metroStyle/metroStyle.css">
<link rel="stylesheet" href="${basePath}/static/bootstrap/plugins/treegrid/jquery.treegrid.css">
<link rel="stylesheet" href="${basePath}/static/calendar/skin/WdatePicker.css">
<link rel="stylesheet" href="${basePath}/static/css/admin/backstage.css">

<script src="${basePath}/static/jquery/jquery-3.4.1.min.js"></script>
<script src="${basePath}/static/js/popper.min.js"></script>
<script src="${basePath}/static/jquery/jquery-ui.min.js"></script>
<script src="${basePath}/static/jquery/jquery.validate.min.js"></script>
<script src="${basePath}/static/jquery/jquery.form.js"></script>
<script src="${basePath}/static/bootstrap/js/bootstrap.min3.3.4.js"></script>
<script src="${basePath}/static/bootstrap/js/bootstrap-datepicker.min.js"></script>
<script src="${basePath}/static/bootstrap/js/bootstrap-table.min.js"></script>
<script src="${basePath}/static/bootstrap/plugins/layer/layer.js"></script>
<script src="${basePath}/static/bootstrap/plugins/treegrid/jquery.treegrid.min.js"></script>
<script src="${basePath}/static/bootstrap/plugins/treegrid/jquery.treegrid.bootstrap3.js"></script>
<script src="${basePath}/static/bootstrap/plugins/treegrid/jquery.treegrid.extension.js"></script>
<script src="${basePath}/static/bootstrap/plugins/treegrid/tree.table.js"></script>
<script src="${basePath}/static/bootstrap/plugins/ztree/jquery.ztree.all.min.js"></script>
<script src="${basePath}/static/calendar/WdatePicker.js"></script>

<!-- 配置文件 -->
<script type="text/javascript" src="${basePath}/static/ueditor/ueditor.config.js"></script>
 <!-- 编辑器源码文件 -->
<script type="text/javascript" src="${basePath}/static/ueditor/ueditor.all.js"></script>

<!-- AdminLTE App -->
<script src="${basePath}/static/dist/js/app.min.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <%@include file="header.jsp" %>
  <%@include file="left.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- <section class="content-header">
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>当前位置</a></li>
        <li class="active">首页</li>
      </ol>
    </section> -->

    <!-- Main content -->
    <section class="content">
  <%@include file="index/index_list.jsp" %>  
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@include file="footer.jsp" %>
  <div class="control-sidebar-bg"></div>
</div>

 <!-- Modal(模态框) -->
 <div class="modal fade" id="modal-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <!-- 此位置放置具体页面的位置 -->
      <div class="modal-body"></div>
      <div class="modal-footer">
      <button type="button" class="btn btn-primary ok">保&nbsp;&nbsp;存</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关&nbsp;&nbsp;闭</button>
      </div>
    </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- modal -->
</body>
</html>





