<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div id="collectionList">
	<div class="detail_sub_title">
		<i></i>我的收藏
	</div>
	<div>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">#</th>
									<th scope="col">照片</th>
									<th scope="col">产品信息</th>
									<th scope="col">价钱</th>
									<th scope="col">操作</th>
								</tr>
							</thead>
							<tbody class="tbody-light">
							<tr v-if="listCollection==''||listCollection==null">
							<td colspan="5">没有发现您的收藏
							</td>
							</tr>
								<tr v-for="(collection,index) in listCollection" :key="index" v-else>
									<td>{{collection.id}}</td>
									<td><div class=""><img alt="#" :src='"/image/"+collection.photo' class="collection_img"></div></td>
									<td>{{collection.name.slice(0,30)}}...</td>
									<td class="collection_td"><div class="collection_ticket"><span>￥</span><span class="collection_ticket_text">{{collection.ticket}}</span><span>起</span></div></td>
									<td><div class="title_4"><a  :href='"${APP_PATH}/web/detail?id="+collection.id' class="order-btn">预定</a><p class="del-btn" v-on:click="delBtn(collection.id)">删除</p></div></td>
								</tr>
								
							</tbody>
						</table>


					</div>

</div>

<script type="text/javascript">
	//获取session
	var userid = "${userInfo.id}";
	var vm = new Vue({
		el : '#collectionList',
		data : function() {
			return {
				listCollection:[],
			}

		},
		mounted:function() {
		this.collectionList();
		},
		methods : {
			collectionList:function(){
				var that=this;
				axios({
					  method:"POST",
					  url:"${APP_PATH}/web/collectionList?id="+userid,
					  data:{
						  userid:userid,
						  
					  }
	              }).then(function (response) {
	             
	              	if(response.data.code==100){
	              		that.listCollection=response.data.extend.collectionList[0].scenicSpotInfo;
	              	}else{
	              		alert(response.data.message)
	              	}
	              }).catch(function (error) {
	              	console.log(error)
	              })
				},
				  delBtn:function(scenicSpotid){
					  var that=this;
						  axios({
							  method:"POST",
							  url:"${APP_PATH}/web/delCcollection?scenicSpotid="+scenicSpotid,
							 }).then((res)=>{
								 new TipBox({type:'success',str:'删除成功',setTime:1500,hasBtn:false});
							 that.collectionList();
							 }).catch(function (error) {
							  alert("删除失败")
							  alert(error)
						    console.log(error);
						  });
						  
					  
					  
				  }
		

		}
	});
</script>