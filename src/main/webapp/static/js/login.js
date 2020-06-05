$().ready(function () {
    //隐藏公共导航
    $("header").hide();
    $("#defaultForm").on("submit", function () {
        //清空提示信息
        $(".warning").html("");
        var userName, password;
        userName = $("#userName").val();
        password = $("#password").val();
        if (!userName) {
            $(".warninguserName").html("*请输入用户昵称！");
        } /*else {
            $(".warninguserName").html(userName);
        }*/
        if (!password) {
            $(".warningpassword").html("*请输入密码！");
        } 
        //遍历错误提示信息
        var waringBox = $(".warning").length;
        var i, flagBoole, waringText;
        flagBoole = "true";
        var flagSolide = $(".slideWarning").attr("flag");
        
        for (i = 0; i < waringBox; i++) {
            waringText = $(".warning").eq(i).html();
            if (waringText !== "") {
                flagBoole = "false";
                break;
            }
        }
        if (flagBoole == "true") {
            $(".btnLogin").val("正在提交，请稍后...");
            $(".btnLogin").attr("disabled", "disabled");
            $.post("inspect_login", $("#defaultForm").serialize(), function (data) {
/*                data = $.parseJSON(data);*/
                if (data.code== 200) {
                    $("#web_login_error_msg_title").html(data.message);
                    if (data.code != null) {
                        window.setTimeout((function () {
                            window.location.href = "/travel/system/login";
                        }), 2000);
                    }
                    $(".btnLogin").val("登录");
                    $(".btnLogin").removeAttr("disabled");

                } else {
                    $("#web_login_error_msg_title").css("color", "#ffff00").html("登陆成功，正在跳转到系统页面...");
                    window.setTimeout((function () {
                        window.location.href = "/travel/web/index";
                    }), 2000);

                }
                return false;
            });
            return false;
        } else {
            
            return false;
        }
    });

});
