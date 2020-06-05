 $(function () {
		function drawCircle(_options){
	    var options = _options || {}; // 获取或定义options对象;
	    options.angle = options.angle || 1; // 定义默认角度1为360度(角度范围 0-1);
	    options.color = options.color || '#fff'; // 定义默认颜色（包括字体和边框颜色）;
	    options.lineWidth = options.lineWidth || 10; // 定义默认圆描边的宽度;
	    options.lineCap = options.lineCap || 'square'; // 定义描边的样式，默认为直角边，round 为圆角
	    options.bgLine = options.bgLine || '#ccc';

	    var oBoxOne = document.getElementById(options.id);
	    var sCenter = oBoxOne.width / 2; // 获取canvas元素的中心点;
	    var ctx = oBoxOne.getContext('2d');
	    var nBegin = Math.PI / 2; // 定义起始角度;
	    var nEnd = Math.PI * 2; // 定义结束角度;

	    // grd定义为描边渐变样式
	    var grd = ctx.createLinearGradient(0, 0, oBoxOne.width, 0);
	    grd.addColorStop(0, '#49b1f5'); // 开始颜色
	    grd.addColorStop(0.5, '#10af7e'); // 50%时的颜色
	    grd.addColorStop(1, 'red'); // 结束时的颜色

	    ctx.textAlign = 'center'; // 定义字体居中;
	    ctx.font = 'normal normal bold 20px Arial'; // 定义字体加粗大小字体样式;
	    ctx.fillStyle = options.color == 'grd' ? grd : options.color; // 判断文字填充样式为颜色，还是渐变色;
	    ctx.fillText((options.angle * 100) + '%', sCenter, sCenter); // 设置填充文字;

	    // ctx.strokeStyle = grd; // 设置描边样式为渐变色;
	    // ctx.strokeText((options.angle * 100) + '%', sCenter, sCenter); // 设置描边文字(即镂空文字);

	    ctx.lineCap = options.lineCap; // 设置描边的样式
	    ctx.strokeStyle = options.color == 'grd' ? grd : options.color; // 设置颜色
	    ctx.lineWidth = options.lineWidth; // 设置宽度

	    ctx.beginPath(); // 设置起始路径，这段绘制360度背景;
	    ctx.strokeStyle = options.bgLine; // 设置背景颜色
	    ctx.arc(sCenter, sCenter, (sCenter - options.lineWidth), -nBegin, nEnd, false);
	    ctx.stroke();

	    var imd = ctx.getImageData(0, 0, 240, 240);
	    function draw(current) { // 该函数实现角度绘制;
	        ctx.putImageData(imd, 0, 0);
	        ctx.beginPath();
	        ctx.strokeStyle = options.color == 'grd' ? grd : options.color;
	        ctx.arc(sCenter, sCenter, (sCenter - options.lineWidth), -nBegin, (nEnd * current) - nBegin, false);
	        ctx.stroke();
	    }

	    var t = 0;
	    var timer = null;
	    function loadCanvas(angle) { // 该函数循环绘制指定角度，实现加载动画;
	        timer = setInterval(function(){
	            if (t > angle) {
	                draw(options.angle);
	                clearInterval(timer);
	            }else{
	                draw(t);
	                t += 0.01;
	            }
	        }, 20);
	    }
	    loadCanvas(options.angle); // 载入百度比角度  0-1 范围;
	    timer = null;
	}
		
		// 示例一
	drawCircle({
	    id: 'one', // dom元素
	    color: '#ff5905', // 颜色
	    bgLine: '#e4e4e4', // 背景颜色
	    angle: 0.98, // 所占比例
	    lineWidth: 2, // 宽度(像素)
	    lineCap: 'round' // 描边的样式
	    	
	});
	 
	 
    });
 var j_searchButton = function () {
     var _type = $('.searchTypeBar > div').eq(0).attr('data-type'), _name = window.location.pathname;
     var _list = [
         { type: '14957033340015086', en: 'moreXinlu', name: '线路' },
         { type: '14957033410015252', en: 'news', name: '新闻' },
         { type: '14957033690017148', en: 'travels', name: '游记' },
         { type: '14957033390012639', en: 'jiudian', name: '酒店' },
         { type: '14957033450016344', en: 'daoyou', name: '导游' }
     ];
     for (var i = 0; i < _list.length; i++) {
         var a = _list[i];
         if (_name.indexOf(a.en) > -1) {
             _type = a.type;
             $('.j_search_type > span').text(a.name);
             break;
         }
     }

     $('.j_search_type').hover(function () {
         $(this).addClass('active')
     }, function () {
         $(this).removeClass('active')
     });
     $('.j_search_type .searchTypeBar > div').click(function () {
         _type = $(this).attr('data-type');
         $('.j_search_type > span').text($(this).text());
         $('.j_search_type').removeClass('active')
     });
     $('.j_searchInput').bind('keypress', function (event) {
         if (event.keyCode == "13") {
             $(".j_searchButton").click();
         }
     });
     $(".j_searchButton").on("click", function () {
         var key = $(".j_searchInput").val(), mold = 'moreXinlu';
         for (var i = 0; i < _list.length; i++) {
             var a = _list[i];
             if (_type == a.type) {
                 mold = a.en;
                 break;
             }
         }
         window.location.href = '../travel/'+mold+'' 
     })
 }
 $(function () {
     j_searchButton();
 })
 var j_hasSub = function () {
     $(".j_hasSub").mouseover(function () {
         $(this).addClass("showSub");
         $("#subNavBg").addClass("show");
         setleft($(this));
     }).mouseout(function () {
         $(this).removeClass("showSub");
         $("#subNavBg").removeClass("show");
     });
 }
 function setleft(a) {
     var b = a.find(".j_sub"),
         c = "sub-posed";
     var j = $("#mainNavList");
     var k = j.width();
     if (!b.data(c)) {
         var d = {},
             e = b.width(),
             f = (2 * (a.offset().left - j.offset().left) + a.width() - e) / 2;
         d = f < 0 ? {
             left: 0
         } : f + e > k ? {
             right: 0
         } : {
             left: f
         }, b.data(c, 1).css(d)
     }
 }

