var reg = [
		/^[\u4E00-\u9FA5A-Za-z0-9_-]{5,16}$/,
		/^[a-z0-9A-Z]{6,18}$/,
		/^[\u4e00-\u9fa5]{2,7}|[A-Za-z]{2,15}$/,
		/^\d{4}-(0?[1-9]|1[0-2])-((0?[1-9])|((1|2)[0-9])|30|31)$/,
		/^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/,
		/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/, /\S/ ];
//添加用户的
function user_add_btn() {
	var formData = new FormData();
	formData.append('userName', $('#userNameId').val());
	formData.append('password', $('#passwordId').val());
	formData.append('name', $('#nameId').val());
	formData.append('gender', $('#genderId').val());
	 formData.append('birthday', $('#birthdayId').val()); 
	formData.append('phone', $('#phoneId').val());
	formData.append('state', $('#stateId').val());
	formData.append('role', 3);
	formData.append('mailbox', $('#mailboxId').val());
	formData.append('address', $('#addressId').val());
	 formData.append('photo', document.getElementById('photo').files[0]);
	$.ajax({
		url : "doSaveUserInfo",
		type : 'POST',
		cache : false,
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert("添加成功");
		/* 	window.location.href = "${basePath}/userInfo_add"; */
		}
	});
}

//添加导游的信息
function guide_add_btn() {
	 $(".input-tip").each(function(){
	        if($(this).css("display")=="none"){
	            //隐藏的
	        	
	        }else{
	            //显示的
	        }
	    });
	
	var formData = new FormData();
	formData.append('userName', $('#userNameId').val());
	formData.append('password', $('#passwordId').val());
	formData.append('name', $('#nameId').val());
	formData.append('gender', $('#genderId').val());
	formData.append('birthday', $('#birthdayId').val());
	formData.append('phone', $('#phoneId').val());
	formData.append('state', $('#stateId').val());
	formData.append('role', 2);
	formData.append('mailbox', $('#mailboxId').val());
	formData.append('address', $('#addressId').val());
	formData.append('photo', document.getElementById('photo').files[0]);
	$.ajax({
		url : "doSaveUserInfo",
		type : 'POST',
		cache : false,
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert("添加成功");
/*			window.location.href = "${basePath}/guideInfo_add";
*/		}
	});
}
$(document).ready(function() {
	// 对添加信息进行验证
	$(":text,:password").blur(function() {
		var value = $(this).val();
		var index = $(this).attr("data-index");
		var regTest = reg[index];
		if (regTest.test(value)) {
			$(this).next(".input-tip").css("display", "none");
		} else {
			$(this).next(".input-tip").css("display", "block");
			$(":text").focus(function() {
				$(this).next(".input-tip").css("display", "none");
			});
		}
	});
	
	// 预览图片
	$(".imgInput").change(function() {
		$(".img").attr("src", URL.createObjectURL($(this)[0].files[0]));
		$(".imgheader").css({
			"display" : "none"
		});
		$(".img").css({
			"display" : "block"
		});
	});
	
	

});
$(function() {
	userTotal();
	turnoverTotal();
	dindanTotal();
});

//总用户数
function userTotal() {
	$.ajax({
		url : "userTotal",
		type : "post",
		success : function(result) {
			var userTotal=100;
			 userTotal=result.extend.count;
			document.getElementById("userTotal").innerHTML=userTotal;
		}

	});
	
}

//总营业额/出行人数
function turnoverTotal() {
	$.ajax({
		url : "turnoverTotal",
		type : "post",
		success : function(result) {
			var total=result.extend.total;
			var totals=0;
			var t=0;
			var n=0;
			var numbers=0;
			for(var i=0;i<=total.length-1;i++){
				 t=parseInt(total[i].total);
				 n=parseInt(total[i].number);
				 numbers+=n;
				totals+=t;
			}
			//总营业额
			document.getElementById("turnoverTotal").innerHTML=totals;
			//出行人数
			document.getElementById("tripTotal").innerHTML=numbers;
		}
	});
}
//订单数量
function dindanTotal() {
	$.ajax({
		url : "dindanTotal",
		type : "post",
		success : function(result) {
			var dindanTotal=100;
			 dindanTotal=result.extend.count;
			document.getElementById("dindanTotal").innerHTML=dindanTotal;
		}
	});
	
}
//修改密码
function change_password(){
	var that=this;
	var oldPassword=$('#oldPassword').val();
	var newPassword=$('#newPassword').val();
	var passwordagain=$('#passwordagain').val();
	 //清空提示信息
    $(".warning").html("");
   if (!oldPassword) {
	   $(".oldPassword").show();
       $(".oldPassword").html("*原密码不能为空！");
    }
    if (!newPassword) {
        $(".passwordWarning").show();
        $(".passwordWarning").html("*密码不能为空！");
        if (!passwordagain) {
            $(".confirmPasswordWarning").show();
            $(".confirmPasswordWarning").html("*确认密码不能为空！");
        }
    } else if(newPassword.length < 6) {
        $(".passwordWarning").show();
        $(".passwordWarning").html("*密码不能少于6位！");
    } else if (ispPassWord(newPassword)=="false") {
        var sas = ispPassWord(newPassword);
        $(".passwordWarning").show();
        $(".passwordWarning").html("*密码必须是数字和字母的组合！");
    }else if (newPassword !== passwordagain) {
        $(".confirmPasswordWarning").show();
        $(".confirmPasswordWarning").html("*两次输入的密码不一致！");
    }
    //遍历错误提示信息
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
            $("#btn-save").val("正在提交，请稍后...");
            $("#btn-save").attr("disabled", "disabled");
            $.post("change_password?id="+that.userid, $("#addFormId").serialize(), function (data) {
                if (data.code == 200) {
                	 $(".oldPassword").show();
                     $(".oldPassword").html(data.message);
                    if (data.code != null) {
                        window.setTimeout((function () {
                           /* window.location.href = "index";*/
                        }), 2000);
                    }
                    $("#btn-save").val("修改");
                    $("#btn-save").removeAttr("disabled");

                } else {
                    $("#web_login_error_msg_title").css("color", "#ffff00").html("修改成功，正在跳转到登录页面...");
                    window.setTimeout((function () {
                        window.location.href = "/travel/system/login";
                    }), 2000);

                }
                return false;
            });
            return false;

        } else {
            
            return false;
        }
	
}

//用户名
function isuserName(){
	
	var userName=/^[\u4E00-\u9FA5A-Za-z0-9_-]{5,16}$/;
	 if (!userName.test(str)) {
	        return "邮箱格式错误，请重新输入！";
	    } else {
	        return "";
	    }
}

//密码格式正则，字母和数字组合
function ispPassWord(str) {
    var pw = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,100}$/;
    if (!pw.test(str)) {
        return "false";
    } else {
        return "true";
    }
}
