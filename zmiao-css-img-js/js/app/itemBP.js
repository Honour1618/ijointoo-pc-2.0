/*
 * 个人中心  ~ 我的项目 ~ 上传BP
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
	$(function(){
		
		base.sidebar();
		base.userNav(1);
	    //base.person(1);//个人中心侧边导航
		
		var bbt = $("#plantBook").val();
		if(bbt != "" || rspBussPPT != ""){
			$(".preImageContent").show();
		};
		
		//点击提交项目信息
		$("#btnLogin").bind("click" , function(e){
			
			var plantBook = $("#plantBook").val();
			if(plantBook == "" && rspBussPPT == ""){//商业计划书
				$("#plantBook").focus().css("outline-color","#f74a3d");
				return;
			}
			
			base.layer("您已成功提交项目信息，我们会在三个工作日内审核，请耐心等待。",".prompt__layer",3000);
			var alertTimer = null;
			clearTimeout(alertTimer);
			alertTimer = setTimeout(function(){
				//提交
				var formMain = document.getElementById("ajaxForm");
				formMain.submit();
				
			} , 3000);
			
			
		});
		$("#plantBook").change(function(){
			var fileA = $(this).val();
			$(".abLoad").html(fileA);
			$("#plantBook,.upload").css({"display":"none"});
			$(".alt_pic").css({"display":"block"});
		});
		$("#plantBook2").change(function(){
			var fileA = $(this).val();
			$(".abLoad").html(fileA);
		});
	})
	
});
