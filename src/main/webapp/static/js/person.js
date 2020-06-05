$(document).ready(
		function() {

			// 进入页面时展开第一个菜单项 -- 待优化，所属项展开，对应item高亮
			// $("#order > ul").slideDown();
			var href = location.href;
			var containdiv = $("#first-nav");
			$("a", containdiv).each(
					function() {
						if (href.indexOf($(this).attr('href')) >= 0) {
							$(this).parents("li").find("ul").slideDown();
							$(this).parents("li").addClass("focus")
									.find("span").removeClass("arrow-down")
									.addClass("arrow-up");
							$(this).addClass("focus");
						}
					});
			// 菜单栏切换
			$(document).on(
					"click",
					"#first-nav > li",
					function() {
						if ($(this).find("ul").length > 0) {
							if (!$(this).hasClass("focus")) {
								$(this).addClass("focus").find("span")
										.addClass("arrow-up");
							} else {
								$(this).removeClass("focus").find("span")
										.removeClass("arrow-up");
							}
							$(this).siblings().removeClass("focus")
									.find("span").removeClass("arrow-up");
							$(this).siblings().find("ul").slideUp("fast");
							$(this).find("ul").slideToggle("fast");
						}
					});

			$('#dindanList').click(function() {
				$.ajax({
					url : "dindan",
					type : "POST",
					traditional : true,
					success : function(data) {
						$(".mainDiv").empty();
						$(".mainDiv").append(data);
					}
				});
			});
			$('#personalInfo').click(function() {
				$.ajax({
					url : "personalInfo",
					type : "POST",
					traditional : true,
					success : function(data) {
						$(".mainDiv").empty();
						$(".mainDiv").append(data);
					}
				});
			});
			$('#changePassword').click(function() {
				$.ajax({
					url : "changePassword",
					type : "POST",
					traditional : true,
					success : function(data) {
						$(".mainDiv").empty();
						$(".mainDiv").append(data);
					}
				});
			});
			$('#collection').click(function() {
				$.ajax({
					url : "collection",
					type : "POST",
					traditional : true,
					success : function(data) {
						$(".mainDiv").empty();
						$(".mainDiv").append(data);
					}
				});
			});
			$('#comments').click(function() {
				$.ajax({
					url : "comments",
					type : "POST",
					traditional : true,
					success : function(data) {
						$(".mainDiv").empty();
						$(".mainDiv").append(data);
					}
				});
			});
			
			$('#myquestion').click(function() {
				$.ajax({
					url : "myquestion",
					type : "POST",
					traditional : true,
					success : function(data) {
						$(".mainDiv").empty();
						$(".mainDiv").append(data);
					}
				});
			});
			
			var stepW = 28;
			var description = new Array("非常差", "差",
					"一般", "好", "非常好");
			var stars = $("#star > li");
			var descriptionTemp;
			$("#showb").css("width", 0);
			stars.each(function(i) {
				$(stars[i]).click(function(e) {
					var n = i + 1;
					$("#showb").css({
						"width" : stepW * n
					});
					descriptionTemp = description[i];
					$(this).find('a').blur();
					return stopDefault(e);
					return descriptionTemp;
				});
			});
			stars.each(function(i) {
				$(stars[i]).hover(function() {
					$(".description").text(description[i]);
				}, function() {
					if (descriptionTemp != null)
						$(".description").text("当前您的评价为:" + descriptionTemp);
					else
						$(".description").text(" ");
				});
			});
			function stopDefault(e) {
				if (e && e.preventDefault)
					e.preventDefault();
				else
					window.event.returnValue = false;
				return false;
			}
			;
		});
function others(){
	$.ajax({
		url : "others",
		type : "POST",
		traditional : true,
		success : function(data) {
			$(".mainDiv").empty();
			$(".mainDiv").append(data);
		}
	});
}