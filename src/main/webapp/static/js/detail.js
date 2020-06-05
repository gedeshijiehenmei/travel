$(document).ready(
		function() {
			// 获取导航栏到屏幕顶部的距离
			var oTop = $(".detail-tab").offset().top;
			//获取导航栏的高度，此高度用于保证内容的平滑过渡
			var martop = $('.detail-tab').outerHeight();

			var sTop = 0;
			// 监听页面的滚动
			$(window).scroll(function () {
			    // 获取页面向上滚动的距离
			    sTop = $(this).scrollTop();
			    // 当导航栏到达屏幕顶端
			    if (sTop >= oTop) {
			        // 修改导航栏position属性，使之固定在屏幕顶端
			        $(".detail-tab").css({ "position": "fixed", "top": "0" });
			        // 修改内容的margin-top值，保证平滑过渡
			        $(".content").css({ "margin-top": martop });
			        $(".section-box-title").css({ "padding-top": "45px" });
			    } else {
			        // 当导航栏脱离屏幕顶端时，回复原来的属性
			        $(".detail-tab").css({ "position": "static" });
			        $(".content").css({ "margin-top": "0" });
			        $(".section-box-title").css({ "padding-top": "5px" });
			    }
			});

			
			
		});
