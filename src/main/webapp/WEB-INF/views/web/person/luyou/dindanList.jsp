<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div id="dindan">
	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				<a class="btn btn-link" data-toggle="collapse"
					data-target="#collapseOne" aria-expanded="true"
					aria-controls="collapseOne">全部订单</a> <a
					class="btn btn-link collapsed" data-toggle="collapse"
					data-target="#collapseTwo" aria-expanded="false"
					aria-controls="collapseTwo"> 待付款</a> <a
					class="btn btn-link collapsed" data-toggle="collapse"
					data-target="#collapseThree" aria-expanded="false"
					aria-controls="collapseThree"> 待出行</a> <a
					class="btn btn-link collapsed" data-toggle="collapse"
					data-target="#collapseFour" aria-expanded="false"
					aria-controls="collapseFour"> 待点评</a>
			</div>
			<div id="collapseOne" class="collapse show"
				aria-labelledby="headingOne" data-parent="#accordionExample">
				<div class="card-body">
					<!-- 全部订单 -->
					<div>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">产品信息</th>
									<th scope="col">数量</th>
									<th scope="col">订单金额</th>
									<th scope="col">状态</th>
									<th scope="col">操作</th>
								</tr>
							</thead>
							<tbody class="tbody-light" v-for="(dindan,index) in dindanList"
								:key="index">
								<tr v-if="dindanList==''||dindanList==null">
									<td colspan="5">没有发现订单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										旅行，就是离开熟悉的地方，然后不一样的归来</td>
								</tr>
								<tr v-else>
									<td>{{dindan.name.slice(0,15)}}...</td>
									<td>{{dindan.number}}人</td>
									<td>{{dindan.total}}元</td>
									<td v-if="dindan.state==1">待付款</td>
									<td v-if="dindan.state==5">待处理</td>
									<td v-if="dindan.state==2">待出行</td>
									<td v-if="dindan.state==3">待评论</td>
									<td v-if="dindan.state==4">已完成</td>
									<td rowspan="2" style="border-left: 1px solid #ccc;"><a
										href="#" class="see-btn" @click="orderListId(dindan.id)">查看订单</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="#" class="del-dindan-btn" v-on:click="delBtn(dindan.id)">删除订单</a></td>
								</tr>
								<tr>
									<td colspan="4" style="margin: 0px; padding: 5px;"><div
											class="dindan-title">
											<span>订单编号：{{dindan.id}}</span> <span>下单时间：{{dindan.creationTime}}</span><span>出发时间：{{dindan.departureTime}}&nbsp;&nbsp;&nbsp;08:00:00</span><span>出发地点：广东技术师范大学天河学院</span><span v-if="dindan.daoyou!=null">导游：{{dindan.daoyou}}</span>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionExample">
				<div class="card-body">
					<!-- 待付款 -->
					<div>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">产品信息</th>
									<th scope="col">数量</th>
									<th scope="col">订单金额</th>
									<th scope="col">状态</th>
									<th scope="col">操作</th>
								</tr>
							</thead>
							<tbody class="tbody-light" v-for="(dindan,index) in dindanList"
								:key="index"  v-if="dindan.state=='1'">
								<tr>
									<td>{{dindan.name.slice(0,15)}}...</td>
									<td>{{dindan.number}}人</td>
									<td>{{dindan.total}}元</td>
									<td v-if="dindan.state==1">待付款</td>
									<td rowspan="2" style="border-left: 1px solid #ccc;"><a
										href="#" class="see-btn" @click="orderListId(dindan.id)">去付款</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="#" v-on:click="delBtn(dindan.id)" class="del-dindan-btn">删除订单</a></td>
								</tr>
								<tr>
									<td colspan="4" style="margin: 0px; padding: 5px;"><div
											class="dindan-title">
											<span>订单编号：{{dindan.id}}</span> <span>下单时间：{{dindan.creationTime}}</span><span>出发时间：{{dindan.departureTime}}&nbsp;&nbsp;&nbsp;08:00:00</span><span>出发地点：广东技术师范大学天河学院</span>
										</div></td>
								</tr>
							</tbody>
							<%-- <tbody v-else-if="index<1">
								<tr>
									<td colspan="5">没有发现待付款订单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										旅行，就是离开熟悉的地方，然后不一样的归来</td>
								</tr>
							</tbody> --%>
						</table>
					</div>
				</div>
			</div>
			<div id="collapseThree" class="collapse"
				aria-labelledby="headingThree" data-parent="#accordionExample">
				<div class="card-body">
					<!-- 待出行 -->
					<div>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">产品信息</th>
									<th scope="col">数量</th>
									<th scope="col">订单金额</th>
									<th scope="col">状态</th>
									<th scope="col">操作</th>
								</tr>
							</thead>
							<tbody class="tbody-light" v-for="(dindan,index) in dindanList"
								:key="index" v-if="dindan.state=='2'">
								<tr>
									<td>{{dindan.name.slice(0,15)}}...</td>
									<td>{{dindan.number}}人</td>
									<td>{{dindan.total}}元</td>
									<td v-if="dindan.state==2">待出行</td>
									<td rowspan="2" style="border-left: 1px solid #ccc;"><a
										href="#" class="see-btn">查看订单</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="#" v-on:click="delBtn(dindan.id)" class="del-dindan-btn">删除订单</a></td>
								</tr>
								<tr>
									<td colspan="4" style="margin: 0px; padding: 5px;"><div
											class="dindan-title">
											<span>订单编号：{{dindan.id}}</span> <span>下单时间：{{dindan.creationTime}}</span><span>出发时间：{{dindan.departureTime}}&nbsp;&nbsp;&nbsp;08:00:00</span><span>出发地点：广东技术师范大学天河学院</span>
										</div></td>
								</tr>
							</tbody>
							<%-- <tbody v-else-if="index<1">
								<tr>
									<td colspan="5">没有发现订单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										旅行，就是离开熟悉的地方，然后不一样的归来</td>
								</tr>
							</tbody> --%>
						</table>
					</div>
				</div>
			</div>
			<div id="collapseFour" class="collapse" aria-labelledby="headingFour"
				data-parent="#accordionExample">
				<div class="card-body">
					<!-- 待点评 -->
					<div>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">产品信息</th>
									<th scope="col">数量</th>
									<th scope="col">订单金额</th>
									<th scope="col">状态</th>
									<th scope="col">操作</th>
								</tr>
							</thead>
							<tbody class="tbody-light" v-for="(dindan,index) in dindanList"
								:key="index" v-if="dindan.state=='3'">
								<tr>
									<td>{{dindan.name.slice(0,15)}}...</td>
									<td>{{dindan.number}}人</td>
									<td>{{dindan.total}}元</td>
									<td>待评论</td>
									<td rowspan="2" style="border-left: 1px solid #ccc;"><a
										href="#" data-toggle="modal" data-target="#exampleModalCenter"
										@click="modalclick(dindan)" class="see-btn">评论</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="#" v-on:click="delBtn(dindan.id)" class="del-dindan-btn">删除订单</a>
										<!-- 评论Modal --></td>
								</tr>
								<tr>
									<td colspan="4" style="margin: 0px; padding: 5px;"><div
											class="dindan-title">
											<span>订单编号：{{dindan.id}}</span> <span>下单时间：{{dindan.creationTime}}</span><span>出发时间：{{dindan.departureTime}}&nbsp;&nbsp;&nbsp;08:00:00</span><span>出发地点：广东技术师范大学天河学院</span>
										</div></td>
								</tr>
							</tbody>
							<tbody v-else-if="index<1">
								<tr>
									<td colspan="5">没有发现待评论订单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										旅行，就是离开熟悉的地方，然后不一样的归来</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 评论模态框 -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">评论</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-body-tr">
						<span>订单编号：</span>{{dindanid}}<span></span>
					</div>
					<div class="modal-body-tr">
						<span>状态：</span>已出行<span></span>
					</div>
					<div class="modal-body-tr">
						<div style="float: left;">
							<span class="modal-body-tr-text">评分：</span>
						</div>
						<div id="xzw_starSys" style="float: left;">
							<div id="xzw_starBox">
								<ul class="star" id="star">
									<li><a href="javascript:void(0)" title="非常差"
										class="one-star">非常差</a></li>
									<li><a href="javascript:void(0)" title="差"
										class="two-stars">差</a></li>
									<li><a href="javascript:void(0)" title="一般"
										class="three-stars">一般</a></li>
									<li><a href="javascript:void(0)" title="好"
										class="four-stars">好</a></li>
									<li><a href="javascript:void(0)" title="非常好"
										class="five-stars">非常好</a></li>
								</ul>
								<div class="current-rating" id="showb"></div>
							</div>
						</div>
						<div id="fraction" class="description description-text"
							style="float: left;"></div>
					</div>
					<div class="modal-body-tr modal-body-tr-textarea">
						<span>评论：</span>
						<textarea rows="5" cols="30" id="container" name="content"
							v-model="content"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" @click="submission">提交</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 评论模态框 -->
	<!-- 查看订单模态框 -->
	<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
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
					<div>订单编号：{{orderList.id}}</div>
					<div>线路名称：{{orderList.name }}</div>
					<div v-if="orderList.state==1">出行人数：<input type="number"  min="1" step="1" max="50" :value="orderList.number" id="numberId" @focus="xgdindanq" @blur="xgdindan"></div>
					<div v-else>出行人数：{{orderList.number}}人</div>
					<div>总价：<span id="totalId">{{orderList.total}}</span>元</div>
					<div v-if="orderList.state==1">联系人：<input type="text" :value="orderList.contacts" id="contactsId"></div>
					<div v-else>联&nbsp;&nbsp;系&nbsp;&nbsp;人：{{orderList.contacts}}</div>
					<div v-if="orderList.state==1">联系电话：<input type="text" :value="orderList.phone" id="phoneId"></div>
					<div v-else>联系电话：{{orderList.phone}}</div>
					<div>出发城市：广州</div>
					<div>出行时间：{{orderList.departureTime}}&nbsp;&nbsp;&nbsp;08:00:00</div>
					<div>下单时间：{{orderList.creationTime}}</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						@click="modifyPayment(orderList.id)" v-if="orderList.state==1">付款</button>
				</div>
			</div>
		</div>
		<!-- 查看订单模态框 -->
	</div>
	<script type="text/javascript"> 
	//获取session
	var userid = "${userInfo.id}"; 
	var vm = new Vue({
	el : '#dindan',
	data :function() {
	return {
		dindanList:[],
		dindanid:'',
		scenicSpotName:'',
		content:'',
		state:'',
		orderList:'',
		number:1,
		totals:''
	}
		
		
	},
	  mounted :function () {
		  this. listDindan();
		  },
		  methods : {
			  listDindan:function(){
				  axios({
					  method:"POST",
					  url:"${APP_PATH}/web/dindanList?userName="+userName,
					 }).then((res)=>{
						 console.log(res.data);
						 if(res.data.code=100){
					  this.dindanList=res.data.extend.dindanList;
					  console.log( this.dindanList)
						 }
					 }).catch(function (error) {
				    console.log(error);
				  });
			  },
			  
			  //查看详细订单信息
			  orderListId:function(id){
				  axios({
					  method:"POST",
					  url:"${APP_PATH}/web/orderListId?id="+id,
					 }).then((res)=>{
						 this.orderList=res.data.extend.orderListId;
							$('#exampleModalCenter2').modal('show');
						 
					 }).catch(function (error) {
				    console.log(error);
				  });
				  
			  },
			  //付款
			  modifyPayment:function(id){
				  var number=$('#numberId').val();
				  var contacts=$('#contactsId').val();
				  var totals=document.getElementById("totalId").innerHTML
				  var phone=$('#phoneId').val();
				  axios({
					  method:"POST",
					  url:"${APP_PATH}/web/modifyPayment",
					data:{
						id:id,
						state:5,
						number:number,
						total:totals,
						contacts:contacts,
						phone:phone
					}
					 }).then((res)=>{
							$('#exampleModalCenter2').modal('hide');
							 new TipBox({type:'success',str:'付款成功',setTime:1500,hasBtn:false});
							this. listDindan();
						 
					 }).catch(function (error) {
						  alert(error);
					  alert("付款失败");
				    console.log(error);
				  });
			  },
			  xgdindanq:function(){
				  var that=this;
				  var number=$('#numberId').val();
				var totals=document.getElementById("totalId").innerHTML;
				that.total=parseInt(totals)/number;
			  },
			  xgdindan:function(){
				  var that=this;
				  var number=$('#numberId').val();
				  that.totals=parseInt(that.total)*parseInt(number);
				  document.getElementById("totalId").innerHTML=that.totals;
			  },
			  delBtn:function(id){
				  if(confirm("您确定要删除该订单吗？")){
					  axios({
						  method:"POST",
						  url:"${APP_PATH}/web/delDindan?id="+id,
						 }).then((res)=>{
							        new TipBox({type:'success',str:'删除成功',hasBtn:true});
							        this. listDindan();
						 }).catch(function (error) {
							  alert(error);
						  alert("删除失败");
					    console.log(error);
					  });
					  
				  }
				  
			  },
			  modalclick:function(item){
				 this.dindanid = item.id;
				 this.scenicSpotName=item.name;
				 this.state=item.state;
			  },
			  
			  //修改订单状态
			  modifyState:function(){
				  axios({
					  method:"POST",
					  url:"${APP_PATH}/web/modifyState?dindanid"+this.dindanid,
					  data:{
						  dindanid:this.dindanid,
						  state:4					  
					  }
					 }).then((res)=>{
						 console.log(res.data);
						 new TipBox({type:'success',str:'修改成功',setTime:1500,hasBtn:false});
							 window.location.href = "${APP_PATH}/web/person";
						 
					 }).catch(function (error) {
					  alert("出错")
				    console.log(error);
				  });
				  
			  },
			  submission:function(){
				  var fraction=document.getElementById("fraction").innerText;
				  var index = fraction.lastIndexOf(":")
				  fraction =fraction.substring(index+1,fraction.length);
				  axios({
					  method:"POST",
					  url:"${APP_PATH}/web/comment",
					  data:{
						  userid:userid,
						  dindanid:this.dindanid,
						  content:this.content,
						  scenicSpotName:this.scenicSpotName,
						  fraction:fraction,						  
					  }
					 }).then((res)=>{
						 console.log(res.data);
						 new TipBox({type:'success',str:'评论成功',setTime:1500,hasBtn:false});
							 this.modifyState();
							 window.location.href = "${APP_PATH}/web/person";
					 }).catch(function (error) {
					  alert("出错")
				    console.log(error);
				  });
				  
			  }
			  
		  },
		  
		  
});
</script>