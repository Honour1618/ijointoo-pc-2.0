/*
 * 
 * 壮苗系统 - 关于壮苗
 * 
 * * * */

require.config({
	baseUrl : webroot + "/file/zmiao/js/lib",
	paths: {
		"jquery": "jquery-1.8.2",
		 "base": "../app/base"
	}
});

require(["jquery","base"] , function($,base){
	$(function(){
		base.nav(4);
	    base.sidebar();
	    base.loginUrl();

	})
});

