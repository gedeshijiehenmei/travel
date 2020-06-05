$().ready(function () {
    //隐藏公共导航
    $("header").hide();
    register();
});
function register() {
    $("#formpersonal").on("submit", function () {
        var userName, name, phone, passwordVal, confirmPasswordVal;
        userName = $("#userName").val();
        name = $("#name").val();
        phone = $("#phone").val();
        passwordVal = $("#password").val();
        confirmPasswordVal = $("#ConfirmPassword").val();
        //清空提示信息
        $(".warning").html("");
       if (!userName) {
           $(".nameWarning").html("*昵称不能为空！");
        }
       if (!name) {
           $(".companyWarning").html("*姓名不能为空！");
        }
       if (!phone) {
           $(".phoneWarning").html("*手机号不能为空！");
       } else {
           $(".phoneWarning").html(isPoneAvailable(phone));
       }
        if (!passwordVal) {
            $(".passwordWarning").show();
            $(".passwordWarning").html("*密码不能为空！");
            $(".passwordTips2_password").hide();
            if (!confirmPasswordVal) {
                $(".confirmPasswordWarning").show();
                $(".confirmPasswordWarning").html("*确认密码不能为空！");
                $(".passwordTips2_confirmPassword").hide();
            }
        } else if(passwordVal.length < 6) {
            $(".passwordWarning").show();
            $(".passwordWarning").html("*密码不能少于6位！");
            $(".passwordTips2_password").hide();
        } else if (ispPassWord(passwordVal)=="false") {
            var sas = ispPassWord(passwordVal);
            $(".passwordWarning").show();
            $(".passwordWarning").html("*密码必须是数字和字母的组合！");
            $(".passwordTips2_password").hide();
        }else if (passwordVal !== confirmPasswordVal) {
            $(".confirmPasswordWarning").show();
            $(".confirmPasswordWarning").html("*两次输入的密码不一致！");
            $(".passwordTips2_confirmPassword").hide();
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
                $.post("save_register", $("#formpersonal").serialize(), function (data) {
                    if (data.code == 200) {
                        $("#web_login_error_msg_title").html(data.message);
                        if (data.code != null) {
                            window.setTimeout((function () {
                                window.location.href = "register";
                            }), 2000);
                        }
                        $("#btn-save").val("注册");
                        $("#btn-save").removeAttr("disabled");

                    } else {
                        $("#web_login_error_msg_title").css("color", "#ffff00").html("注册成功，正在跳转到登录页面...");
                        window.setTimeout((function () {
                            window.location.href = "login";
                        }), 2000);

                    }
                    return false;
                });
                return false;

            } else {
                
                return false;
            }
    });
};

//手机正则
function isPoneAvailable(str) {
    var myreg = /^1\d{10}$/;
    if (!myreg.test(str)) {
        return "手机号格式错误，请重新输入！";
    } else {
        return "";
    }
}
//邮箱正则
function isEmailAvailable(str) {
    var myreg = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    if (!myreg.test(str)) {
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