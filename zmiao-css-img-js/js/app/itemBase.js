/*
 * 个人中心 ~ 我的项目 ~ 基础信息
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
	//base.person(1);//个人中心侧边导航
	if(prjLogoStr != ''){
		$(".upload img").css({"visibility":"hidden"});
	};
	
	choiceInit(compRngList,"#industry",industry);//所属行业初始化
	choiceInit(provinces,"#address",address);//所属区域初始化
	choiceInit(finStageList,"#stage",stage);//所属阶段初始化
    
    // 上传logo预览
	document.getElementById("itemLogo").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#item_logo_show") , $("#item_logo_data"));
        };
        $(".alt_pic").css({"display":"block"});
    });
	// 替换logo预览
	document.getElementById("itemLogo2").addEventListener('change', function(e){
        var files = this.files;
        if(files.length){
            checkFile(this.files , $("#item_logo_show") , $("#item_logo_data"));
        }
    });
	
	//点击提交项目信息
	$("#btnLogin").bind("click" , function(e){
		if($("#compName").val() == ""){//企业名称
			$("#compName").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			return;
		}else{
			$("#compName").css({"border":"none"});
		}
		
		/*if($("#rscDesc").val() == ""){//寻求资源
			$("#rscDesc").focus().css({"outline-color":"#f74a3d","border":"1px solid #f74a3d"});
			$("#compName").css({"border":"none"});
			return;
		}else{
			$("#compName,#rscDesc").css({"border":"none"});
		}*/
		
		var a=document.getElementById("address");
	    var b=a.options[a.selectedIndex].value;
	    $("#compRangStr").val(b);
	    
		//提交
		var formMain = document.getElementById("ajaxForm");
		formMain.submit();
		
	});
	
});

