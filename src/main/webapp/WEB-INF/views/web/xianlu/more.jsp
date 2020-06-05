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
	<link rel="stylesheet" href="${APP_PATH}/static/css/more.css" />
<script src="${APP_PATH}/static/jquery/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${APP_PATH}/static/js/vue.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/static/js/axios.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/more.js"></script>
<title>线路列表</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="main_body">
		<div class="product_list">
			<div class="product_normal" id="product_normal">
				<div class="nav-box">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="home-tab"
							data-toggle="tab" href="#home" role="tab" aria-controls="home"
							aria-selected="true">全部</a></li>
						<li class="nav-item"><a class="nav-link" id="profile-tab"
							data-toggle="tab" href="#profile" role="tab"
							aria-controls="profile" aria-selected="false">当地参团</a></li>
						<li class="nav-item"><a class="nav-link" id="contact-tab"
							data-toggle="tab" href="#contact" role="tab"
							aria-controls="contact" aria-selected="false">半参团</a></li>
						<li class="nav-item"><a class="nav-link" id="contact-tab"
							data-toggle="tab" href="#contact" role="tab"
							aria-controls="contact" aria-selected="false">半自助</a></li>
						<li class="nav-item"><a class="nav-link" id="contact-tab"
							data-toggle="tab" href="#contact" role="tab"
							aria-controls="contact" aria-selected="false">常规跟团</a></li>
					</ul>
					<div class="wrap">
						<ul class="filters">
							<li class="filter" style="padding-top: 0px;">
								<div class="label">产品类型</div>
								<div class="keysWrap j_filterKeysWrap">
									<div class="keys j_filterKeys">
										<a href="#" class="onloading all on" @click="types()">不限</a> <a
											href="#" class="onloading " @click="types(1)">热门推荐</a> <a
											href="#" class="onloading " @click="types(2)">国内旅游</a><a
											href="#" class="onloading " @click="types(3)">出境短线</a> <a
											href="#" class="onloading " @click="types(4)">出境长线</a> <a
											href="#" class="onloading " @click="types(5)">周边</a>
									</div>
								</div>
							</li>

							<li class="filter">
								<div class="label">目的地</div>
								<div class="keysWrap j_filterKeysWrap">
									<div class="keys j_filterKeys">
										<a href="#" class="onloading all on" @click="citys()">不限</a> <a
											href="#" data-parent="z0" class="onloading hideparent "
											@click="citys('泰国')">泰国</a> <a href="#" data-parent="z0"
											class="onloading hideparent " @click="citys('日本')">日本</a> <a
											href="#" data-parent="z0" class="onloading hideparent "
											@click="citys('日本')">美国</a> <a href="#" data-parent="z0"
											class="onloading hideparent " @click="citys('新加坡')">新加坡</a> <a
											href="#" data-parent="z0" class="onloading hideparent "
											@click="citys('罗马')">罗马</a> <a href="#" data-parent="z0"
											class="onloading hideparent " @click="citys('日本')">欧洲</a> <a
											href="#" data-parent="z0" class="onloading hideparent "
											@click="citys('俄罗斯')">俄罗斯</a> <a href="#" data-parent="z0"
											class="onloading hideparent " @click="citys('加拿大')">加拿大</a>
									</div>
								</div>
							</li>
							<li class="filter">
								<div class="label">天数</div>
								<div class="keysWrap j_filterKeysWrap">
									<div class="keys j_filterKeys">
										<a href="#" class="onloading all on" @click="days()">不限</a> <a
											href="#" class="onloading" @click="days(1)">1天</a> <a
											href="#" class="onloading " @click="days(2)">2天</a> <a
											href="#" class="onloading " @click="days(3)">3天</a> <a
											href="#" class="onloading " @click="days(4)">4天</a> <a
											href="#" class="onloading " @click="days(5)">5天</a> <a
											href="#" class="onloading " @click="days(6)">6天</a>
									</div>
								</div>
							</li>
						</ul>
					</div>


					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="product j_item"
								v-for="(scenicSpot,index) in scenicSpotInfo" :key="index"
								v-if="scenicSpot!=null||scenicSpot!=''||scenicSpot.day==day||day==undefined||scenicSpot.type==day||type==undefined || scenicSpot.city==day||city==undefined">
								<div class="base">
									<div class="image">
										<a target="_blank" href="#"> <img
											class="lazy_img j_lazyImg" :src='"/image/"+scenicSpot.photo'
											style="display: inline;">
										</a>
										<!-- <div class="tag">{{scenicSpot.type}}</div> -->
									</div>
									<div class="detail">
										<div class="left">
											<div class="top">
												<div class="title">
													<a target="_blank" :href='"${APP_PATH}/web/detail?id="+scenicSpot.id'>{{scenicSpot.name}}</a>
												</div>
												<div class="tags"></div>
											</div>
											<div class="bottom">
												<div class="origin">
													<span>出发地：广州</span><span>行程天数：{{scenicSpot.day}}天</span><span style="margin-right: 10px;">满意度&nbsp;&nbsp;&nbsp;90%</span><span style="margin-right: 10px;">100人购买</span><span>50条评论</span>
												</div>
											</div>
										</div>
										<div class="right">
											<div class="price">
												<span class="unit">￥</span><span class="value">{{scenicSpot.ticket}}</span><span
													class="qi">起</span>
											</div>
											<a target="_blank"
												:href='"${APP_PATH}/web/detail?id="+scenicSpot.id'
												class="btn button button-highlight" style="background: #f86a5c;	color: #fff;" >立即预订</a>
										</div>
									</div>
								</div>
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
							<div class="product j_item" v-if="totalPage==0" style="margin-bottom: 100px;">
								<%@include file="../../others.jsp"%></div>
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel"
							aria-labelledby="profile-tab" style="margin-bottom: 100px;"><%@include file="../../others.jsp"%></div>
						<div class="tab-pane fade" id="contact" role="tabpanel"
							aria-labelledby="contact-tab" style="margin-bottom: 100px;"><%@include file="../../others.jsp"%></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
	<script type="text/javascript"> 
	var vm = new Vue({
	el : '#product_normal',
	data :function() {
		return{
				scenicSpotInfo:[],
				all: 0, //总页数
				cur: 1,//当前页码
				totalPage: 0,//当前条数
				day:'',
				type:'',
				city:'',
			}
		
	},
	 mounted :function () {
		 this.morexianlu(1);
		 this.days(undefined);
		 this.citys(undefined);
		 this.types(undefined);
		  },
		  methods : {
			  morexianlu:function(index){
				  
				  var that=this;
				  axios({
					  method:"POST",
					  url:"${APP_PATH}/web/more",
					  data:{ 
						  page:index,
							  day:this.day,
							  type:this.type,
							  city:this.city
							  },
					 }).then((response)=>{
					 if(response.data.code==100){
						 that.scenicSpotInfo=[]; 
						  for(let i=0;i<response.data.extend.scenicSpotInfo.list.length;i++){
							  that.scenicSpotInfo.push(response.data.extend.scenicSpotInfo.list[i]);
						  } 
						  that.all = response.data.extend.scenicSpotInfo.pages;//总页数
						  that.cur = response.data.extend.scenicSpotInfo.pageNum;
						  that.totalPage = response.data.extend.scenicSpotInfo.total;
				  }else{
						  console.log(response.message);
					  }
				  }).catch(function (error) {
					  alert("系统出现错误，请联系客服了解具体情况");
					  alert(error)
				  });
				  
			  },
			  days:function(day){
				this.day=day;
				 this.morexianlu(1)
			  },
			  
			  types:function(type){
				  this.type=type;
				  this.morexianlu(1);
			  },
			  citys:function(city){
				 this.city=city;
				  this.morexianlu(1);
			  },
			//分页
				btnClick: function(data){//页码点击事件
					if(data != this.cur){
					this.cur = data 
					}
					//根据点击页数请求数据
					this.morexianlu(this.cur.toString());
				},
				pageClick: function(){
					//根据点击页数请求数据
					this.morexianlu(this.cur.toString());
				},
				pillsClick:function(){
					
					this.morexianlu(1);
				}
				
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
			  
</script>
</body>
</html>