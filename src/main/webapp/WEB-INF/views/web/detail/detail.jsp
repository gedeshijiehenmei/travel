<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0" />  
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>


<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/detail.css" />
<link rel="stylesheet"
	href="${APP_PATH}/static/calendar/skin/WdatePicker.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/detail.js"></script>
<script src="${APP_PATH}/static/calendar/WdatePicker.js"
	type="text/javascript"></script>
<title>详情</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<c:if test="${RESULT == 'SUCCESS' }">
		<div id="content">
			<div id="content_body" class="main_body">
				<div class="contain">
					<div class="crumbs">
						<a href="#"><span>首页</span></a>&gt;<a href="#"><span>{{type2}}</span>
						</a>&gt;<a href="#"><span>${scenicSpotInfo.city}</span></a>
					</div>
					<div class="main_panel clearfix">
						<div class="left">
							<div class="cover">
								<img class="img" src="/image/${scenicSpotInfo.photo }">
							</div>
						</div>
						<div class="right">
							<div class="basic_info">
								<h1 class="main_title">${scenicSpotInfo.name }</h1>
								<div class="priceArea">
									<dl class="rp">
										<dt class="bt">参考价</dt>
										<dd class="mid">
											<span class="general_price"> <span class="cur">￥</span><span
												class="num" id="ticket"> ${scenicSpotInfo.ticket }.00
											</span><span class="unit">起/人</span>
											</span>
										</dd>
									</dl>
								</div>
								<dl class="info_list">
									<dt class="label text_justify">目的地</dt>
									<dd class="value">
										<em> ${scenicSpotInfo.city }</em>
									</dd>
									<dt class="label">预订须知</dt>
									<dd class="value">本网站暂时只支持出发地在广州，暂不能在线支付，下单后会有工作人员联系您</dd>
									<dt class="label">相关服务</dt>
									<dd class="value">本产品由旅游系统提供相关服务</dd>
									<dt class="label">出发时间</dt>
									<dd class="value">
										<input type="type" readonly="readonly"
											onclick="WdatePicker();" Class="Wdate" id="departureTime" />
									</dd>
									<dt class="label">选择人数</dt>
									<dd class="value">
										<div class="quantity">
											<div class="quantity-select">
												<div class="entry value-minus" v-on:click="minus">&nbsp;</div>
												<div class="entry value2">
													<span>{{number}}</span>
												</div>
												<div class="entry value-plus active" v-on:click="plus">&nbsp;</div>
											</div>
										</div>
									</dd>
									<dt class="label total_dt">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计</dt>
									<dd class="value total_dt">
										<span class="cur">￥</span> &nbsp;<span class="total">{{total}}</span>&nbsp;&nbsp;<span>元</span>
									</dd>
								</dl>
								<div class="form_set ljyd">
									<div class=" placeOrder" v-on:click="makeOrder">立即预定</div>
									<div class="collection" v-on:click="collectionClick">
										<div v-if="collection">
											<span class="xinx"></span><span>收藏</span>
										</div>
										<div v-else>
											<span class="xinx2"></span><span>已收藏</span>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
				<!-- 导航  -->
				<div class="detail">
					<div class="detail-tab">
						<ul class="nav detail-tab-box">
							<li class="nav-item nav-item2"><a
								class="nav-link nav-link2 active" href="#nav-jieshao-tab">行程路线</a></li>
							<li class="nav-item nav-item2"><a class="nav-link nav-link2"
								href="#nav-xuizhi-tab">预定须知</a></li>
							<li class="nav-item nav-item2"><a class="nav-link nav-link2"
								href="#nav-dianping-tab">游客点评</a></li>
							<li class="nav-item nav-item2"><a class="nav-link nav-link2"
								href="#nav-xiangguan-tab">相关产品</a></li>
						</ul>
					</div>
					<div class="whole-box content">
						<div id="nav-jieshao-tab" class="section-box-title">
							<div class="prd_group_module">
								<h2 class="title_text">行程路线</h2>
							</div>
						</div>
						<div v-for="day in day" style="margin-top: 50PX;">
							<div class="title-title">
								<h4 style="color: rgb(255,102,0);">
									<span>第{{day}}天：</span> <span
										v-for="(itinerary,index) in lsitItinerary " :key="index"
										v-if="itinerary.days==day" >{{itinerary.title}}&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</h4>
							</div>
							<hr/>
							<div class="detail-box"
								v-for="(itinerary,index) in lsitItinerary" :key="index">
								<div v-if="itinerary.days==day">
									<div class="detail-title" style="color: rgb(255,151,3);">
										<span clas="detail-title-jingdian">景点：</span><span>{{itinerary.title}}</span>
									</div>
									<div class="detail-desc">{{itinerary.introduce}}</div>
									<div class="detail-photo-box">
										<img alt="" :src='"/image/"+itinerary.photo'
											class="detail-photo"> <img alt=""
											:src='"/image/"+itinerary.photo2' class="detail-photo">
									</div>
								</div>
							</div>
						</div>
						<div id="nav-xuizhi-tab" class="section-box-title">
							<div class="prd_group_module">
								<h2 class="title_text">预定须知</h2>
							</div>

						</div>
						<div class="xuizhi">
							<div class="section-box-title-chu">出行须知</div>
							<div class="section-box-xuizhi-box">
								<div class="section-box-xuizhi"
									v-for="(reservation,index) in listReservation" :key="index">
									<div class="section-box-xuizhi-title">
										<strong>{{reservation.xztitle}}：</strong>
									</div>
									<div class="section-box-xuizhi-text">
										{{reservation.xztext}}</div>

								</div>

							</div>
						</div>
						<div id="nav-dianping-tab" class="section-box-title">
							<div class="prd_group_module">
								<h2 class="title_text">游客点评</h2>
							</div>
						</div>
						<!-- 游客点评 -->
						<div class="comment">
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist"
								@click="pillsClick">
								<li class="nav-item"><a class="nav-link active"
									id="pills-whole-tab" data-toggle="pill" href="#pills-whole"
									role="tab" aria-controls="pills-whole" aria-selected="true"
									@click="fractionBtn()">全部</a></li>
								<li class="nav-item"><a class="nav-link"
									id="pills-recommend-tab" data-toggle="pill"
									href="#pills-recommend" role="tab"
									aria-controls="pills-recommend" aria-selected="false"
									@click="fractionBtn('好'||'非常好')">推荐</a></li>
								<li class="nav-item"><a class="nav-link"
									id="pills-commonly-tab" data-toggle="pill"
									href="#pills-commonly" role="tab"
									aria-controls="pills-commonly" aria-selected="false"
									@click="fractionBtn('一般')">一般</a></li>
								<li class="nav-item"><a class="nav-link"
									id="pills-notrecommended-tab" data-toggle="pill"
									href="#pills-notrecommended" role="tab"
									aria-controls="pills-notrecommended" aria-selected="false"
									@click="fractionBtn('差'||'非常差')">不推荐</a></li>
								<li class="nav-item"><a class="nav-link"
									id="pills-figure-tab" data-toggle="pill" href="#pills-figure"
									role="tab" aria-controls="pills-figure" aria-selected="false">有图</a>
								</li>
							</ul>
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-whole"
									role="tabpanel" aria-labelledby="pills-whole-tab"
									id="comment-box">
									<div v-for="(comment,index) in commentList" :key="index"
										v-if="comment.fraction!=''" class="comment-box">
										<div class="user" v-for="(userInfo,index) in comment.userInfo"
											:key="index">
											<img alt="" :src='"/image/"+userInfo.photo' class="user-img"><span
												class="user-userName">{{userInfo.userName}}</span>
										</div>
										<div class="comment-right">
											<div class="comment-card-tags">
												<span class="text-orange">总体评价：{{comment.fraction}}</span> <span>导游服务:
													{{comment.fraction}}</span> <span>行程安排:
													{{comment.fraction}}</span> <span>餐饮住宿:
													{{comment.fraction}}</span> <span>旅行交通:
													{{comment.fraction}}</span>
											</div>
											<div class="comment-text">{{comment.content}}</div>
											<div class="comment-data">{{comment.commentaryTime}}</div>
										</div>

									</div>
									<div class="user" v-else>暂无数据1</div>
								</div>
								<div class="tab-pane fade" id="pills-recommend" role="tabpanel"
									aria-labelledby="pills-recommend-tab">
									<div v-for="(comment,index) in commentList" :key="index"
										v-if="comment.fraction=='非常好'||comment.fraction=='好'">
										<div class="user" v-for="(userInfo,index) in comment.userInfo"
											:key="index">
											<img alt="" :src='"/image/"+userInfo.photo' class="user-img"><span
												class="user-userName">{{userInfo.userName}}</span>
										</div>
										<div class="comment-right">
											<div class="comment-card-tags">
												<span class="text-orange">总体评价：{{comment.fraction}}</span> <span>导游服务:
													{{comment.fraction}}</span> <span>行程安排:
													{{comment.fraction}}</span> <span>餐饮住宿:
													{{comment.fraction}}</span> <span>旅行交通:
													{{comment.fraction}}</span>
											</div>
											<div class="comment-text">{{comment.content}}</div>
											<div class="comment-data">{{comment.commentaryTime}}</div>
										</div>
									</div>
									<div class="user" v-else-if="comment.fraction==''">暂无数据2
									</div>
								</div>
								<div class="tab-pane fade" id="pills-commonly" role="tabpanel"
									aria-labelledby="pills-commonly-tab">
									<div v-for="(comment,index) in commentList" :key="index"
										v-if="comment.fraction=='一般'">
										<div class="user" v-for="(userInfo,index) in comment.userInfo"
											:key="index">
											<img alt="" :src='"/image/"+userInfo.photo' class="user-img"><span
												class="user-userName">{{userInfo.userName}}</span>
										</div>
										<div class="comment-right">
											<div class="comment-card-tags">
												<span class="text-orange">总体评价：{{comment.fraction}}</span> <span>导游服务:
													{{comment.fraction}}</span> <span>行程安排:
													{{comment.fraction}}</span> <span>餐饮住宿:
													{{comment.fraction}}</span> <span>旅行交通:
													{{comment.fraction}}</span>
											</div>
											<div class="comment-text">{{comment.content}}</div>
											<div class="comment-data">{{comment.commentaryTime}}</div>
										</div>
									</div>
									<div class="user" v-else-if="comment.fraction==''">暂无数据3
									</div>
								</div>
								<div class="tab-pane fade" id="pills-notrecommended"
									role="tabpanel" aria-labelledby="pills-notrecommended-tab">
									<div v-for="(comment,index) in commentList" :key="index"
										v-if="comment.fraction=='非常差'||comment.fraction=='差'">
										<div class="user" v-for="(userInfo,index) in comment.userInfo"
											:key="index">
											<img alt="" :src='"/image/"+userInfo.photo' class="user-img"><span
												class="user-userName">{{userInfo.userName}}</span>
										</div>
										<div class="comment-right">
											<div class="comment-card-tags">
												<span class="text-orange">总体评价：{{comment.fraction}}</span> <span>导游服务:
													{{comment.fraction}}</span> <span>行程安排:
													{{comment.fraction}}</span> <span>餐饮住宿:
													{{comment.fraction}}</span> <span>旅行交通:
													{{comment.fraction}}</span>
											</div>
											<div class="comment-text">{{comment.content}}</div>
											<div class="comment-data">{{comment.commentaryTime}}</div>
										</div>
									</div>
									<div class="user" v-else-if="comment.fraction==''">暂无数据4</div>
								</div>
								<div class="tab-pane fade" id="pills-figure" role="tabpanel"
									aria-labelledby="pills-figure-tab">暂无评论</div>
							</div>
							<div class="page-bar" v-if="all>1">
								<ul>
									<li v-if="cur>1"><a v-on:click="cur--,pageClick()">上一页</a></li>
									<li v-if="cur==1"><a class="banclick">上一页</a></li>
									<li v-for="index in indexs"
										v-bind:class="{ 'active': cur == index}"><a
										v-on:click="btnClick(index)">{{ index }}</a></li>
									<li v-if="cur!=all"><a v-on:click="cur++,pageClick()">下一页</a></li>
									<li v-if="cur == all"><a class="banclick">下一页</a></li>
									<li><a>共<i>{{all}}</i>页
									</a></li>
								</ul>
							</div>
						</div>
						<!-- 游客点评 -->

						<!-- 相关产品 -->
						<div id="nav-xiangguan-tab" class="section-box-title">
							<div class="prd_group_module">
								<h2 class="title_text">相关产品</h2>
							</div>
						</div>
						<div class="">
							<%@include file="../../others.jsp"%>
						</div>
						<!-- 相关产品 -->
					</div>
				</div>
			</div>
			<!-- 确认订单模态框 -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">订单详情</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div>线路名称：${scenicSpotInfo.name }</div>
							<div>出行人数：{{number}}人</div>
							<div>总价：{{total}}元<span style="margin-left: 10px;"></span></div>
							<div style="margin-top: 5px;">
								联系人&nbsp;&nbsp;&nbsp;： <input type="text" class="" v-model="contacts">
							</div>
							<div style="margin-top: 5px;">
								联系电话： <input type="text" class="" v-model="phone" >
							</div>
							<div>出发城市：广州</div>
							<div>
								出行时间：<span id="departureTimeList"></span>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary"
								@click="makeOrderadd(1)">先下单</button>
							<button type="button" class="btn btn-primary"
								@click="makeOrderadd(5)">去支付</button>
						</div>
					</div>
				</div>
				<!-- 确认订单模态框 -->
			</div>
		</div>
	</c:if>
	<%@include file="../footer.jsp"%>
</body>
<script>
	var total = '${scenicSpotInfo.ticket }';
	var name='${scenicSpotInfo.name }';
	var scenicSpotid='${scenicSpotInfo.id }';
	var types='${scenicSpotInfo.type }';
	var day=Number('${scenicSpotInfo.day }');
	/* var departureTime=this.departureTime; */
	//获取session
	var userid = "${userInfo.id}";
	var userName = "${userInfo.userName}";
	var phone="${userInfo.phone}";
	var contacts="${userInfo.name}";
	var role="${userInfo.role}";
	var vm = new Vue({
		el : '#content',
		data :function() {
			return {
				number : 1,
				total : total,
				userName:userName,
				phone:phone,
				contacts:contacts,
				name:name,
				type2:'',
				role:role,
				collection:true,
				lsitItinerary:[],
				listReservation:[],
				day:day,
				commentList:[],
					all: 1, //总页数
					cur: 1,//当前页码
					totalPage: 0,//当前条数
					fraction:''
			}

		},
		
		mounted : function() {
			this.checkCollection();
			this.itineraryRoute();
			this.reservationList();
			this.displayComment(1);
			this.typeList();
			/*  this.days(undefined); */
			
		},
		methods : {
			minus : function() {
				if (this.number > 1) {
					this.number -= 1;
				}
				this.total = this.number * total;
			},
			plus : function() {
				this.number += 1;
				this.total = this.number * total;
			},
			makeOrder : function() {
				var departureTime=document.getElementById("departureTime").value; 
				 var e = new Date(departureTime);
				    var n = new Date();//当前时间
				    if (e.valueOf() < n.valueOf()){
				      alert("请选择今天后的时间")
				      
				      return false;
				    }
				document.getElementById("departureTimeList").innerHTML=departureTime;
				if(departureTime==null||departureTime==''){
					alert("出行时间不能为空，请选择出行时间");
				}else{
				//验证用户是否登录
				if(this.userName==null||this.userName==''){
					alert("请前往登录界面，进行登录")
					window.location.href = "${APP_PATH}/system/login";					
				}
				else{
				 /* if(this.role==1){
						this.myFunction();
					}else{ */
						$('#exampleModalCenter').modal('show')
						
						/* this.makeOrderadd(); */
					/* } */
				}
				}
			},
			
			makeOrderadd:function(state){
				
				if(this.phone==''){
					alert("请输入联系电话，联系电话不能为空")
				}else if(this.contacts==''){
					alert("请输入联系人，联系人不能为空")
				}else{
				 axios({
					  method:"POST",
					  url:"${APP_PATH}/web/makeOrder",
					  data:{
						  userName: userName,
							total:this.total.toString(),
							number:this.number.toString(),
							name:name,
							phone:this.phone,
							contacts:this.contacts,
							departureTime:departureTime.realValue,
							state:state,
					  }
					 }).then(function (response) {
						  $('#exampleModalCenter').modal('hide');
						 if(state==1){
							 new TipBox({type:'load',str:"努力下单中..",setTime:1500,callBack:function(){  
						            new TipBox({type:'success',str:'下单成功成功',hasBtn:true}); 
						       	 window.location.href = "${APP_PATH}/web/person";
						        }});  
						 }else{
							 new TipBox({type:'load',str:"努力付款中..",setTime:1500,callBack:function(){  
						            new TipBox({type:'success',str:'付款成功',hasBtn:true}); 
						       	 window.location.href = "${APP_PATH}/web/person";	
							 }});    	 
							 }
				  }).catch(function (error) {
					  alert("下单失败，请重试")
				    console.log(error);
				  });
				}
			},
			
			//收藏和取消收藏
			collectionClick:function(){
				if(this.userName==null||this.userName==''){
					alert("请前往登录界面，进行登录")
					window.location.href = "${APP_PATH}/system/login";					
				}else{
			var that=this;
			if(this.collection==true){
				 axios({
					  method:"POST",
					  url:"${APP_PATH}/web/addCollection",
					  data:{
						  userid:userid,
						  scenicSpotid:scenicSpotid
					  }
					 })
				  .then(function (response) {
					  if(response.data.code==100){
						  new TipBox({type:'success',str:'收藏成功',setTime:1500,hasBtn:false});
						  that.collection=false;
					  }else{
						  new TipBox({type:'error',str:'取消收藏失败',setTime:1500,hasBtn:true});  
						  that.collection=true;
						  
					  }
				  }).catch(function (error) {
					  alert("收藏失败，请联系客服了解具体情况")
					  that.collection=true;
				  });
				
			}else{
				 axios({
					  method:"POST",
					  url:"${APP_PATH}/web/delCollection",
					  data:{
						  userid:userid,
						  scenicSpotid:scenicSpotid
					  }
					 }).then(function (response) {
					  if(response.data.code==100){
						  new TipBox({type:'success',str:'取消收藏成功',setTime:1500,hasBtn:false});
						  that.collection=true;
					  }else{
						  new TipBox({type:'error',str:'取消收藏失败',setTime:1500,hasBtn:true});  
						  that.collection=false;
					  }
				  }).catch(function (error) {
					  alert("取消收藏失败，请联系客服了解具体情况")
				  });
			}
				}
				
			},
			
			//查询该用户是否已经收藏了该景点
			checkCollection:function(){
				var that=this;
				 axios({
					  method:"POST",
					  url:"${APP_PATH}/web/checkCollection",
					  data:{
						  userid:userid,
						  scenicSpotid:scenicSpotid
					  }
					 })
				  .then(function (response) {
					  if(response.data.code==100){
						  that.collection=false;
					  }else{
						  that.collection=true;
					  }
				  }).catch(function (error) {
				  });
				
			},
			//查询行程路线
			itineraryRoute:function(){
				var that=this;
				 axios({
					  method:"POST",
					  url:"${APP_PATH}/web/itineraryList?scenicSpotid="+scenicSpotid,
					  data:{
						  scenicSpotid:scenicSpotid
					  }
					 })
				  .then(function (response) {
					  if(response.data.code==100){
						  
						  that.lsitItinerary=response.data.extend.itineraryRoute;
						  console.log(that.lsitItinerary)
  }else{
						  console.log(response.message)
					  }
				  }).catch(function (error) {
					  alert("系统出现错误，请联系客服了解具体情况")
				  });
			},
//查询产品类型
typeList:function(){
	var that= this;
	axios({
		  method:"POST",
		  url:"${APP_PATH}/web/typeList",
			 data:{
			 type:types
		 }
	 })

	  .then(function (response) {
			  that.type2=response.data.extend.type.type;
			  console.log(that.type2)
	  }).catch(function (error) {
		  alert("系统出现错误，请联系客服了解具体情况")
	  });
	
},

			//预定须知
			reservationList:function(){
				var that=this;
				 axios({
					  method:"POST",
					  url:"${APP_PATH}/web/reservationList",
					 })
				  .then(function (response) {
					  if(response.data.code==100){
						  that.listReservation=response.data.extend.reservation;
						  console.log( that.listReservation)
					  }else{
						  console.log(response.message)
					  }
				  }).catch(function (error) {
					  alert("系统出现错误，请联系客服了解具体情况")
				  });
			},
			//线路景点详情页面的游客点评的查询显示（根据线路名称查）
			displayComment:function(index){
				var that=this;
				 axios({
					  method:"POST",
					  url:"${APP_PATH}/web/commentDisplay?scenicSpotName="+name,
							data:{
								scenicSpotName:name,
								  page:index,
								  fraction:this.fraction
								  
								  }
					  })
				  .then(function (response) {
					  if(response.data.code==100){
						 that.commentList=[]; 
						  for(let i=0;i<response.data.extend.commentList.list.length;i++){
							  that.commentList.push(response.data.extend.commentList.list[i]);
						  } 
						  that.all = response.data.extend.commentList.pages;//总页数
						  that.cur = response.data.extend.commentList.pageNum;
						  that.totalPage = response.data.extend.commentList.total;
				  }else{
						  console.log(response.message)
					  }
				  }).catch(function (error) {
					  alert("评论系统出现错误，请联系客服了解具体情况2");
					  alert(error)
					  
				  });
				
			},//分页
			btnClick: function(data){//页码点击事件
				if(data != this.cur){
				this.cur = data 
				}
				//根据点击页数请求数据
				this.displayComment(this.cur.toString());
			},
			pageClick: function(){
				//根据点击页数请求数据
				this.displayComment(this.cur.toString());
			},
			pillsClick:function(){
				
				this.displayComment(1);
			},
			fractionBtn:function(fraction){
				this.fraction=fraction;
				this.displayComment(1);
			},
			/* myFunction:function() {
				  var person = prompt("请输入出行人的名字：");
				  if (person == null || person == "") {
				   alert("您取消输入"); 
				   
				  } else {
				    userName=person;
				    this.makeOrder();
				  }
				}
			 */
		},
		computed: {
			//分页
			indexs: function(){
			var left = 1;
			var right = this.all;
			var ar = [];
			if(this.all>= 5){
			if(this.cur > 3 && this.cur < this.all-2){
			left = this.cur - 2;
			right = this.cur + 2;
			}else{
			if(this.cur<=3){
			left = 1;
			right = 5;
			}else{
			right = this.all;
			left = this.all -4;
			}
			}
			}
			while (left <= right){
			ar.push(left);
			left ++;
			}
			return ar;
			}
		}
	});
	 $("#success").click(function(){  
	        new TipBox({type:'success',str:'操作成功',hasBtn:true});
	    });  
</script>
</html>