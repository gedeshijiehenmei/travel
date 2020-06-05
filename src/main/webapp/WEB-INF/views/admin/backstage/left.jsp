<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
      <li class="treeview">
          <a href="#" id="load-index-id">
            <i class="glyphicon glyphicon-home"></i> <span>首页</span>
          </a>
        </li>
        	<c:if test="${userInfo.role == 1}">
        <li class="treeview">
          <a href="#">
            <i class="glyphicon glyphicon-camera"></i> <span>景点管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a id="load-scenicSpot-id"><i class="fa fa-circle-o"></i>景点管理</a></li>
            <li><a id="load-scenicSpot-add-id"><i class="fa fa-circle-o"></i>景点添加</a></li>
          </ul>
        </li>
        </c:if>
        <c:if test="${userInfo.role == 1}">
         <li class="treeview">
          <a href="#">
            <i class="glyphicon glyphicon-user"></i> <span>用户管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a id="load-userInfo-id"><i class="fa fa-circle-o"></i>管理用户</a></li>
            <li><a id="load-userInfo2-id"><i class="fa fa-circle-o"></i>添加用户</a></li>
          </ul>
        </li>
        </c:if>
        <c:if test="${userInfo.role == 1}">
         <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>导游管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a id="load-guideInfo-id"><i class="fa fa-circle-o"></i>管理导游</a></li>
            <li><a id="load-guideInfo-add-id"><i class="fa fa-circle-o"></i>添加导游</a></li>
          </ul>
        </li>
        </c:if>
        <li class="treeview">
          <a href="#">
            <i class="glyphicon glyphicon-list-alt"></i> <span>订单管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a id="#" target="_blank" href="${basePath}/web/moreXinlu"><i class="fa fa-circle-o"></i>添加订单</a></li>
            <li><a id="load-dindan-id"><i class="fa fa-circle-o"></i>订单管理</a></li>
           <!--  <li><a id="load-type-id"><i class="fa fa-circle-o"></i>产品分类</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>产品管理</a></li>
            <li><a id="load-attachment-id"><i class="fa fa-circle-o"></i>附件管理</a></li> -->
          </ul>
        </li>
         	<c:if test="${userInfo.role == 1}">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>社区管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" id="load-travels-id"><i class="fa fa-circle-o"></i>游记管理</a></li>
            <li><a id="load-comment-id"><i class="fa fa-circle-o"></i>评论管理</a></li>
             <li><a id="load-news-id"><i class="fa fa-circle-o"></i>新闻管理</a></li>
              <li><a id="load-news-add-id"><i class="fa fa-circle-o"></i>发表新闻</a></li>
             <!-- <li><a id="load-role-id"><i class="fa fa-circle-o"></i>问答管理</a></li> -->
          </ul>
        </li>
        </c:if>
         <!-- <li class="treeview">
          <a href="#">
            <i class="fa fa-database"></i>
            <span>数据统计</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" id="load-user-data-id"><i class="fa fa-circle-o"></i>用户数据</a></li>
            <li><a id="load-comment-id"><i class="fa fa-circle-o"></i>评价数据</a></li>
             <li><a id="load-news-id"><i class="fa fa-circle-o"></i>订单数据</a></li>
              <li><a id="load-news-add-id"><i class="fa fa-circle-o"></i>类型数据</a></li>
          </ul>
        </li> -->
         <li class="treeview">
          <a href="#">
            <i class="fa fa-gears"></i>
            <span>系统管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" id="load-change-password-id"><i class="fa fa-circle-o"></i>修改密码</a></li>
         <li><a href="#" id="load-personal-info-id"><i class="fa fa-circle-o"></i>修改信息</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
<script type="text/javascript">

//后台首页
$('#load-index-id').click(function(){
	var url="index_list";
	$(".content").load(url);
})
//管理用户信息
$('#load-userInfo-id').click(function(){
	var url="userInfo_list";
	$(".content").load(url);
})
//添加用户信息
$('#load-userInfo2-id').click(function(){
	var url="userInfo_add";
	$(".content").load(url);
})
//景点管理
$('#load-scenicSpot-id').click(function(){
	var url="scenicSpot_list";
	$(".content").load(url);
})
//景点添加
$('#load-scenicSpot-add-id').click(function(){
	var url="scenicSpot_add";
	$(".content").load(url);
})
//订单管理
$('#load-dindan-id').click(function(){
	var url="dindan_list";
	$(".content").load(url);
})

//评论管理
$('#load-comment-id').click(function(){
	var url="comment_list";
	$(".content").load(url);
})

//显示导游信息
$('#load-guideInfo-id').click(function(){
	var url="guideInfo_list";
	$(".content").load(url);
})
//显示导游添加信息
$('#load-guideInfo-add-id').click(function(){
	var url="guideInfo_add";
	$(".content").load(url);
})
//显示游记信息
$('#load-travels-id').click(function(){
	var url="travelsInfo_list";
	$(".content").load(url);
})
//显示新闻信息
$('#load-news-id').click(function(){
	var url="newsInfo_list";
	$(".content").load(url);
})
//发表新闻信息
$('#load-news-add-id').click(function(){
	var url="newsInfo_add";
	$(".content").load(url);
})
//修改密码
$('#load-change-password-id').click(function(){
	var url="change_password";
	$(".content").load(url);
})
//用户数据统计
$('#load-user-data-id').click(function(){
	var url="user_data";
	$(".content").load(url);
})
//用户数据统计
$('#load-personal-info-id').click(function(){
	var url="personal_info";
	$(".content").load(url);
})
</script>