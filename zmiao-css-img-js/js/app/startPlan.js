/*
 * 
 * 壮苗系统 - 发起壮苗计划
 * 
 * * * */

require.config({
	baseUrl : webroot + "/file/zmiao/js/lib",
	paths: {
		"jquery": "jquery-1.8.2"
	}
});

require(["jquery"] , function($){
	$(function(){
		//back top btn
		$("html , body").stop().animate({"scrollTop":"0"} , 500);
		
	})
});

