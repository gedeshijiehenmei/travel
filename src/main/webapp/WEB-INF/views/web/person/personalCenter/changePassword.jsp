<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div class="changePassword" id="a">
	<div class="detail_sub_title">
		<i></i>密码设置
	</div>
	<div class="common_div password-event change_password"
		v-model="changePswModel" :closable="false" :mask-closable="false"
		title="修改密码" @on-ok="changePswOk" @on-cancel="changePswCancel">
		<table cellspacing="0" cellpadding="0" border="0" class="form-table">
			<tbody>
				<tr>
					<td width="60" align="right">当前密码：</td>
					<td width="200"><input type="password" class="txt-m txt-grey"
						name="oldPassword" id="oldPassword" tabindex="1"
						placeholder="请输入当前使用密码" v-model="oldPassword" @blur="oldPswValid"
						@focus="oldPswValid_focus" /></td>
					<td><div id="oldpwd-tip" class="input-tip">
							<div class="input-tip-inner "
								:style="{display:oldPassword_noBlank_Flag}">
								<p class="img-chaho"></p>
								<p class="input-tip-inner-text">{{oldPassword_noBlank}}</p>
							</div>
						</div></td>
				</tr>
				<tr>
					<td height="50" align="right">新密码：</td>
					<td height="50"><input placeholder="请输入新密码" type="password"
						class="txt-m" name="newPassword" tabindex="2"
						v-model="newPassword" id="newPassword" maxlength="16"
						@blur="newPswValid" @focus="newPswValid_focus" /></td>
					<td><div id="pwd-tip" class="input-tip">
							<div class="input-tip-inner "
								:style="{display:newPassword_noBlank_Flag}">
								<p class="img-chaho"></p>
								<p class="input-tip-inner-text">{{newPassword_noBlank}}</p>
							</div>
							<div class="input-tip-inner"
								:style="{display:newPassword_pattern_Flag}">
								<p class="img-chaho"></p>
								<p class="input-tip-inner-text">{{newPassword_pattern}}</p>
							</div>
						</div></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">
						<div class="password-state" id="password-state">
							<div class="password-state-inner txt-grey">
								<span>密码由8—16位数字、字母或符号组成，至少含有2种及以上的字符</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">确认密码：</td>
					<td><input type="password" class="txt-m txt-grey"
						id="passwordagain" v-model="passwordagain" name="passwordagain"
						tabindex="3" placeholder="请输入新密码" @blur="againNewPswValid"
						@focus="againNewPswValid_focus" /></td>
					<td><div id="oldpwd-tip" class="input-tip">
							<div class="input-tip-inner "
								:style="{display: passwordagain_noBlank_Flag}">
								<p class="img-chaho"></p>
								<p class="input-tip-inner-text">{{passwordagain_noBlank}}</p>
							</div>
							<div class="input-tip-inner "
								:style="{display:passwordagain_equality_Flag}">
								<p class="img-chaho"></p>
								<p class="input-tip-inner-text">{{passwordagain_equality}}</p>
							</div>
						</div></td>
				</tr>
				<tr>
					<td><input type="button" class="yellow_btn mt10"
						v-on:click="changePswOk" value="确认"  v-bind:disabled="changePsw"  /></td>
				</tr>
			</tbody>
		</table>
	</div>

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
				passwordagain_equality_Flag: 'none',
				changePsw:false

				
			}

		},
		mounted : function() {
		},
		methods : {
			 oldPswValid: function() {
	                if(this.oldPassword != ''){
	                    this.oldPassword_noBlank_Flag = 'none'
	                }else{
	                    this.oldPassword_noBlank_Flag = 'block';
	                    this.changePsw=true;
	                    
	                }
	            },
	            oldPswValid_focus: function() {
	                this.oldPassword_noBlank_Flag = 'none'
	            },
	            newPswValid: function() {
	                if(this.newPassword != ''){
	                    this.newPassword_noBlank_Flag = 'none';
	                   var pattern = /^[a-zA-Z0-9]{6,20}$/;
	                    if(!pattern.test(this.newPassword)){
	                        this.newPassword_pattern_Flag = 'block';
	                        this.changePsw=true;
	                    }else{
	                        this.newPassword_pattern_Flag = 'none';
	                    }
	                }else{
	                    this.newPassword_noBlank_Flag = 'block';
	                    this.changePsw=true;
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
	                        this.passwordagain_equality_Flag = 'block';
	                        	 this.changePsw=true;
	                    }else{
	                        this.passwordagain_equality_Flag = 'none';
	                    }
	                }else{
	                    this.passwordagain_noBlank_Flag = 'block';
	                    this.changePsw=true;
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