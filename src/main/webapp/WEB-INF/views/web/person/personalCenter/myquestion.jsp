<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div class="changePassword" id="a">
啊啊啊啊
</div>
<script type="text/javascript">
var id = "${userInfo.id}";

	var vm = new Vue({
		el : '#a',
		data : function() {
			return {
				id:id,
				changePswModel:true,
				oldPassword:'',
				oldPassword_noBlank: '密码不能为空，请输入原密码',
				oldPassword_noBlank_Flag: 'none',
				newPassword: '',
				newPassword_noBlank: '密码不能为空，请重新输入',
				newPassword_noBlank_Flag: 'none',
				newPassword_pattern: '密码由6-20位数字字母组成，请重新输入',
				newPassword_pattern_Flag: 'none',
				passwordagain: '',
				passwordagain_noBlank: '确认密码不能为空，请重新输入',
				passwordagain_noBlank_Flag: 'none',
				passwordagain_equality: '两次输入密码不相等，请重新输入',
				passwordagain_equality_Flag: 'none'

				
			}

		},
		mounted : function() {
		},
		methods : {
			 oldPswValid: function() {
	                if(this.oldPassword != ''){
	                    this.oldPassword_noBlank_Flag = 'none'
	                }else{
	                    this.oldPassword_noBlank_Flag = 'block'
	                }
	            },
	            oldPswValid_focus: function() {
	                this.oldPassword_noBlank_Flag = 'none'
	            },
	            newPswValid: function() {
	            	console.log(this.newPassword+"123")
	                if(this.newPassword != ''){
	                    this.newPassword_noBlank_Flag = 'none';
	                   var pattern = /^[a-zA-Z0-9]{6,20}$/;
	                    if(!pattern.test(this.newPassword)){
	                        this.newPassword_pattern_Flag = 'block';
	                    }else{
	                        this.newPassword_pattern_Flag = 'none';
	                    }
	                }else{
	                    this.newPassword_noBlank_Flag = 'block';
	                }
	            },
	            newPswValid_focus: function() {
	                this.newPassword_noBlank_Flag = 'none';
	                this.newPassword_pattern_Flag = 'none';
	            },
	            againNewPswValid: function() {
	                console.log(this.passwordagain)
	                if(this.passwordagain != ''){
	                    this.passwordagain_noBlank_Flag = 'none';
	                    if(this.passwordagain != this.newPassword){
	                        this.passwordagain_equality_Flag = 'block'
	                    }else{
	                        this.passwordagain_equality_Flag = 'none'
	                    }
	                }else{
	                    this.passwordagain_noBlank_Flag = 'block'
	                }
	            },
	            againNewPswValid_focus: function() {
	                this.passwordagain_noBlank_Flag = 'none';
	                this.passwordagain_equality_Flag = 'none'
	            },
	 
	// 修改密码
	             changePswOk: function () {
	            	 
	            	 if(this.oldPassword==''||this.newPassword==''||this.passwordagain==''){
	            		 this.oldPswValid();
	            		 this.newPswValid();
	            		 this.againNewPswValid()
	            	 }else{
	            		 var self = this;
		                	axios({
		  					  method:"POST",
		  					  url:"${APP_PATH}/web/updateUserPwd?id="+id,
		  					  data:{
		  						  id:self.id,
		                    	oldPassword: self.oldPassword,
		                        newPassword: self.newPassword
		  					  }
		                    }).then(function (response) {
		                    	alert(response.data.code)
		                    	if(response.data.code==100){
		                    		alert("密码修改成功，请重新登录")
		                    		 window.location.href = "${APP_PATH}/system/login_out";	
		                    	}else{
		                    		alert(response.data.message)
		                    	}
		                    }).catch(function (error) {
		                    	alert(error)
		                    })
	            	 }
	               
	            },changePswCancel: function () {
	            	 
	            }
	}			
				
	});
		
</script>