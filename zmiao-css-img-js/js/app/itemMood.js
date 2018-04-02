/*
 * 个人中心  ~ 我的项目 ~ 创始人简介
 * 
 */

require.config({
	baseUrl : webroot +"/file/zmiao/js/lib",
	paths: {
		"jquery": "jquery-1.8.2",
		"base": "../app/base"
	}
});

require(["jquery","base"] , function($,base){
	base.sidebar();
	base.userNav(1);
	txtNum(".info","#userAvatar",512);
    //base.person(1);//个人中心侧边导航
	
	//点击提交项目信息
	$("#btnLogin").bind("click" , function(e){
		
		if($("#userAvatar").val() == ""){//自我介绍
			$("#userAvatar").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			return;
		}
		
		//提交
		var formMain = document.getElementById("ajaxForm");
		formMain.submit();
		
	});
	
});
