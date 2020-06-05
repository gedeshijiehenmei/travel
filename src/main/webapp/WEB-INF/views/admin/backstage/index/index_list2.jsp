<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!-- 后台首页-->
<link rel="stylesheet" href="${basePath }/static/index/css/base.css">
    <link rel="stylesheet" href="${basePath }/static/index/css/index.css">
    <%-- <link rel="stylesheet" href="${basePath }/static/index/css/second.css"> --%>
    <link rel="shortcut icon" href="${basePath }/static/index/img/index/logo_cloud.ico"/>
    <link rel="stylesheet" href="${basePath }/static/index/css/layui-v2.2.5/layui/css/layui.css">
    <script src="${basePath }/static/index/js/flexible.js"></script>
    <script src="${basePath}/static/js/backstage.js"></script>
    <div class="card_box">
        <!--1-->
        <div class="card_item fl">
            <div class="row_1">
                <div class="arrow_up"></div><span>+12</span>
            </div>
            <div class="row_2">注册用户总数</div>
            <div class="row_3" id="userTotal">2,283,381</div>
        </div>
        <!--2-->
        <div class="card_item fl">
            <div class="row_1">
                <div class="arrow_up"></div><span>+1</span>
            </div>
            <div class="row_2">订单数</div>
            <div class="row_3" id="dindanTotal">50,678,789</div>
        </div>
        <!--3-->
        <div class="card_item fl">
            <div class="row_1">
                <div class="arrow_up"></div><span>+10</span>
            </div>
            <div class="row_2">出行人数</div>
            <div class="row_3" id="tripTotal">9,224</div>
        </div>
        <!--4-->
        <div class="card_item fl">
            <div class="row_1">
                <div class="arrow_up"></div><span>+8</span>
            </div>
            <div class="row_2">总收入(￥)</div>
            <div class="row_3" id="turnoverTotal">52,726</div>
        </div>
        <!--5-->
        <div class="card_item fl">
            <div class="row_1">
                <div class="arrow_up"></div><span>+15</span>
            </div>
            <div class="row_2">每月应收账款(￥)</div>
            <div class="row_3">51,472</div>
        </div>
    </div>
        <!--第一块图标-->
      <div class="row_warp_box_1">
            <div class="row_1 clear">
                <div class="fl left_box">
                    <div id="charts_1" class="w_100 h_100"></div>
                </div>
                <div class="fr right_box">
                    <div id="charts_2" class="w_100 h_100"></div>
                </div>
            </div>
        </div> 
    <script src="${basePath }/static/index/js/echarts/echarts1.js"></script>
    <script src="${basePath }/static/index/css/layui-v2.2.5/layui/layui.all.js"></script>
    <script src="${basePath }/static/index/js/index.js"></script>
