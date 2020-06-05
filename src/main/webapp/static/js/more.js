$(document).ready(function(){
	$('.filters').on('click','.onloading',function(){
        $(this).parent().children().removeClass("on");
        $(this).addClass("on")
    });
	
});
