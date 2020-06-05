<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<div id="persionEdit">
	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				<a class="btn btn-link" data-toggle="collapse"
					data-target="#collapseOne" aria-expanded="true"
					aria-controls="collapseOne">基本信息</a> <a
					class="btn btn-link collapsed" data-toggle="collapse"
					data-target="#collapseTwo" aria-expanded="false"
					aria-controls="collapseTwo"> 团队信息</a>
			</div>

			<div id="collapseOne" class="collapse show"
				aria-labelledby="headingOne" data-parent="#accordionExample">
				<div class="card-body">
					<div class="card-table">
							<form method="POST" enctype="multipart/form-data">
						<table class="table table-borderless">
							<tr class="head-img" >
							<td>
							<img :src='"/image/"+userInfo.photo' class="imgheader"/>
							<img src="" class="img" style="display: none;" />
									<p class="divfile">
									<input type="file" name="photo" id="photo" ref="file" class="file imgInput">
									</p>
									<div class="xgtx" v-on:click="changePhoto">
									修改头像
									</div>
									</td> 
							</tr>
							<tr class="personal-info">
								<td class="title-name"><span style="color: red">*&nbsp;</span>昵&nbsp;&nbsp;称：
								</td>
								<td class="title-val">{{userName}}</td>
							</tr>
							<tr class="personal-info">
								<td class="title-name"><span style="color: red">*&nbsp;</span>姓&nbsp;&nbsp;名：
								</td>
								<td class="title-val"><input type="text"
									class="old-real-name" v-model="name"></td>
									<td class="warning nameWarning"></td>
							</tr>
							<tr class="personal-info">
								<td class="title-name"><span style="color: red">*&nbsp;</span>电&nbsp;&nbsp;话：
								</td>
								<td class="title-val"><input type="text"
									class="old-real-name" v-model="phone"></td>
									<td class="warning phoneWarning"></td>
							</tr>
							<tr class="personal-info">
								<td class="title-name">性&nbsp;&nbsp;别：
								</td>
								<td class="input-val"><input type="radio" name="gender"
									checked value="M" v-model="gender"> 男
									&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender"
									value="F" v-model="gender"> 女</td>
							</tr>
							<tr class="personal-info">
								<td class="title-name">生&nbsp;&nbsp;日：
								</td>
								<td class="title-val"><input type="text"
									class="old-real-name" v-model="birthday"></td>
							</tr>
							<tr class="personal-info">
								<td class="title-name">邮&nbsp;&nbsp;箱：
								</td>
								<td class="title-val"><input type="text"
									class="old-real-name" v-model="mailbox"></td>
									<td class="warning mailboxWarning"></td>
							</tr>
							<tr class="personal-info">
								<td class="title-name">地&nbsp;&nbsp;址：
								</td>
								<td class="title-val"><input type="text"
									class="old-real-name" v-model="address"></td>
							</tr>
							<tr>
								<td colspan="2" class="J_button">
									<div class="J_edit" v-on:click="persionEditBtn">修改</div>
									<div class="J_cancel">取消</div>
								</td>
							</tr>

						</table>

</form>

					</div>


				</div>
			</div>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionExample">
				<div class="card-body">团队信息</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//获取session
	var id = "${userInfo.id}";
	  userName = "${userInfo.userName}";
	
	var vm = new Vue({
		el : '#persionEdit',
		data : function() {
			return {
			id : id,
			userName :userName,
			name : '',
			gender : '',
			birthday :'',
			photo : '',
			phone :'',
			mailbox :'',
			address :'', 
			userInfo:''
			}

		},
		mounted : function() {
			this.persionInfoList();
		},
		methods : {
			persionInfoList:function(){
				axios({
					  method:"POST",
					  url:"${APP_PATH}/web/persionUserInfoList?id="+id,
							data:{
								id:id
							}
					 }).then((res)=>{
						 if(res.data.code=100){
					  this.userInfo=res.data.extend.persionUserInfoList[0];
					  console.log(this.userInfo);
					   userName = this.userInfo.userName;
						this.name = this.userInfo.name;
						this.gender = this.userInfo.gender;
						this.birthday= this.userInfo.birthday;
						this.photo = this.userInfo.photo;
						this.phone = this.userInfo.phone;
						this.mailbox = this.userInfo.mailbox;
						this.address = this.userInfo.address; 
						 }
					 }).catch(function (error) {
					  alert("查询失败")
				    console.log(error);
				  });
				
			},
			
			persionEditBtn:function(){
				 $(".warning").html("");
				if(!this.name){
					$(".nameWarning").css("color", "red").html("*昵称不能为空！");
					
				}
				if (!this.phone) {
			           $(".phoneWarning").css("color", "red").html("*手机号不能为空！");
			       } else {
			           $(".phoneWarning").css("color", "red").html(isPoneAvailable(this.phone));
			       }
				if(isEmailAvailable(this.mailbox)=='false'){
					$(".mailboxWarning").css("color", "red").html("邮箱格式错误，请重新输入！");
					
				}
				 var waringBox = $(".warning").length;
		            var waringText,i,flagBoole;
		            flagBoole = "true";
		            for (i = 0; i < waringBox; i++) {
		                waringText = $(".warning").eq(i).html();
		                if (waringText !== "") {
		                    flagBoole = "false";
		                    break;
		                }
		            }
		            if (flagBoole == "true") {
				 axios({
					  method:"POST",
					  url:"${APP_PATH}/web/updateUserInfo?id="+id,
					  data:{
						  id:id,
							userName : userName,
							name : this.name,
							gender : this.gender,
							birthday : this.birthday,
							phone : this.phone,
							mailbox :this.mailbox,
							address : this.address,
					  }	  
					 }).then((res)=>{
						 console.log(res.data);
						 if(res.data.code=100){
							 new TipBox({type:'success',str:'修改成功',setTime:1500,hasBtn:false});
					  this.persionInfoList();
						 }else{
							conssole.log(res) 
						 }
					 }).catch(function (error) {
					  alert("修改失败")
				    console.log(error);
				  });
		            }
				
			},
		
		changePhoto:function(){
			var formData = new FormData();
			 formData.append('photo', document.getElementById('photo').files[0]);
			 console.log(document.getElementById('photo').files[0])
			$.ajax({
				url : "${APP_PATH}/web/changePhoto?id="+id.toString(),
				type : 'POST',
				cache : false,
				data : formData,
				processData : false,
				contentType : false,
				success : function(result) {
					 new TipBox({type:'success',str:'修改成功',setTime:1500,hasBtn:false});
					  this.persionInfoList();
				}
			});
		
		}
		}
	});
	//手机正则
	function isPoneAvailable(str) {
	    var myreg = /^1\d{10}$/;
	    if (!myreg.test(str)) {
	        return "手机号格式错误！";
	    } else {
	        return "";
	    }
	}
	//邮箱正则
	function isEmailAvailable(str) {
	    var myreg = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	    if (!myreg.test(str)) {
	        return 'false';
	    } else {
	        return "";
	    }
	}</script>

<script type="text/javascript">
$(".imgInput").change(function(){
    $(".img").attr("src",URL.createObjectURL($(this)[0].files[0]));
    	$(".imgheader").css({"display":"none"});
        $(".img").css({"display":"block"});
    
});
</script>
