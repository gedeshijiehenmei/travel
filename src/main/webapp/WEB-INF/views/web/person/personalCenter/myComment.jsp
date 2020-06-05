<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div id="myListComment">
	<div class="detail_sub_title">
		<i></i>我的点评
	</div>
	<div>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">名称</th>
									<th scope="col">评分</th>
									<th scope="col">评论</th>
									<th scope="col">评论时间</th>
									<th scope="col">操作</th>
								</tr>
							</thead>
							<tbody class="tbody-light">
							<tr  v-if="myListComment==''||myListComment==null">
							<td colspan="5">您还没有评论
							</td>
							</tr>
								<tr v-for="(myComment,index) in myListComment" :key="index" v-else>
									<td>{{myComment.scenicSpotName.slice(0,30)}}</td>
									<td>{{myComment.fraction}}</td>
									<td>{{myComment.content.slice(0,30)}}...</td>
									<td>{{myComment.commentaryTime}}</td>
									<td><p class="del-myListComment-btn" v-on:click="delmyCommentBtn(myComment.pid)">删除评论</p></td>
								</tr>
								
							</tbody>
						</table>
						<!--分页-->
							<div class="fenye"><div class="page-bar" v-if="all>1">
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
							</div></div>
					</div>

</div>


<script type="text/javascript">
	//获取session
	var userid = "${userInfo.id}";
	var vm = new Vue({
		el : '#myListComment',
		data : function() {
			return {
				myListComment:[],
				all: 10, //总页数
				cur: 1,//当前页码
				totalPage: 0,//当前条数
			}

		},
	 	mounted:function() {
		this.myComment(1);
		}, 
		methods : {
			myComment:function(index){
				var that=this;
				axios({
					  method:"POST",
					  url:"${APP_PATH}/web/myCommentList?userid="+userid,
					  data:{
						  userid:userid,
						  page: index,
						  
					  }
	              }).then(function (response) {
	             
	              	if(response.data.code==100){
	              		 that.myListComment=[]; 
						  for(let i=0;i<response.data.extend.myCommentList.list.length;i++){
							  that.myListComment.push(response.data.extend.myCommentList.list[i]);
						  } 
						  that.all = response.data.extend.myCommentList.pages;//总页数
						  that.cur = response.data.extend.myCommentList.pageNum;
						  that.totalPage = response.data.extend.myCommentList.total;
	              	}else{
	              		alert(response.data.message);
	              	}
	              }).catch(function (error) {
	              	alert(error);
	              })
				},
				delmyCommentBtn:function(pid){
					  var that=this;
						  axios({
							  method:"POST",
							  url:"${APP_PATH}/web/delMyComment?pid="+pid,
							 }).then((res)=>{
								 new TipBox({type:'success',str:'删除成功',setTime:1500,hasBtn:false});
							 that.myComment(1);
							 }).catch(function (error) {
							  alert("删除失败")
							  alert(error)
						    console.log(error);
						  });
						  
					  
					  
				  },
		
				//分页
					btnClick: function(data){//页码点击事件
						if(data != this.cur){
						this.cur = data 
						}
						//根据点击页数请求数据
						this.myComment(this.cur.toString());
					},
					pageClick: function(){
						//根据点击页数请求数据
						this.myComment(this.cur.toString());
					},
					pillsClick:function(){
						
						this.myComment(1);
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