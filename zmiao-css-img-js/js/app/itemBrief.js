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

require(["jquery" , "base"] , function($,base){
	
	base.sidebar();
	base.userNav(1);
	txtNum(".info","#itemDesc",512);
	txtNum(".info","#itemFeature",512);
	txtNum(".info","#itemAdvantage",512);
    //base.person(1);//个人中心侧边导航
	if(featureImgUrl == ""){
		$(".alt_pic").hide();
	}else{
		$(".upload img").css({"visibility":"hidden"});
	}
	
    // 上传logo预览
	document.getElementById("userAvatar").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data"));
        };
        $("#userAvatar").css("display","none");
        $(".alt_pic").css({"display":"block"});
    });
	// 替换logo预览
	document.getElementById("userAvatar2").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data"));
        }
    });
	
	//点击提交项目信息
	$("#btnLogin").bind("click" , function(e){
		
		if($("#itemDesc").val() == ""){//项目介绍
			$("#itemDesc").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			//$("#itemFeature,#itemAdvantage").css({"border":"none"});
			return;
		}else{
			//$("#itemFeature,#itemAdvantage").css({"border":"none"});
			$("#itemDesc").css({"outline-color":"none","border":"1px solid #d3d3d3"});
		}
		
		if($("#itemFeature").val() == ""){//项目特点
			$("#itemFeature").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			//$("#itemDesc,#itemAdvantage").css({"border":"none"});
			return;
		}else{
			//$("#itemDesc,#itemAdvantage").css({"border":"none"});
			$("#itemFeature").css({"outline-color":"none","border":"1px solid #d3d3d3"});
		}
		
		if($("#itemAdvantage").val() == ""){//竞争优势
			$("#itemAdvantage").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			//$("#itemDesc,#itemFeature").css({"border":"none"});
			return;
		}else{
			//$("#itemDesc,#itemFeature").css({"border":"none"});
			$("#itemAdvantage").css({"outline-color":"none","border":"1px solid #d3d3d3"});
		}
		
		//提交
		var formMain = document.getElementById("ajaxForm");
		formMain.submit();
		
	});
	
});
