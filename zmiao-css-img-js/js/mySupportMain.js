/**
 * Created by jack on 2017/6/15.
 * 我的资助模块
 */
// 简单的配置
require.config({
    // RequireJS 通过一个相对的路径 baseUrl来加载所有代码。baseUrl通常被设置成data-main属性指定脚本的同级目录。
    baseUrl: webroot+"/file/zmiao/js/app",
    // 告诉RequireJS在任何模块之前，都先载入这个模块
    map: {
        '*': {'css': 'css'}
    },
    shim:{
        'jquery':{
            exports:'jquery'
        },
        'jc':{
        	deps:['jquery']
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        exif:"../lib/exif",
        jquery:"../lib/jquery-1.8.2",
        jc:"../lib/jquery.cookie",
        base:"base"
    }
});

// 开始使用jQuery 模块
require(["jquery","base","exif",'jc'], function ($,base) {
	$(function(){
		base.nav();
		base.sidebar();
    	base.userNav(0);
	});
   /* base.person(0);*/


    
    $(".more__btn").on("click",function () {
        var ele=$(this);
        if(ele.hasClass("active")){
            ele.removeClass("active").text("更多资助项目");
            $(".pros ").css("height","240px");
        }else{
            ele.addClass("active").text("收起资助项目");
            $(".pros ").css("height","auto");
            $.ajax({
                type : "post", //使用post方法访问后台
                dataType : "json",
                url : webroot+"/PtlZm!suptListAjax.action",
                data :{
            		"nosession" : true,
                },
                success : function(data) {
                	if(data.result=="0"){
                		console.log(data);
                		$(".pros ").empty("");
                		var ele="";
                		for(var i=0;i<data.lists.length;i++){
                    		ele+='<div class="pro__list" data-id="'+data.lists[i].ppCode+'">';
                    		ele+='<a href="'+webroot+'/PtlZm!prjDetail.action?prePrjCode='+data.lists[i].ppCode+'" target="_blank">';
                    		ele+='<div class="pro--logo"><img src="'+webroot+data.lists[i].prjLogo+'" /></div>';
                    		ele+='<div class="pro--name">'+data.lists[i].prjName+'</div>';
                    		ele+='<div class="pro--desc">'+data.lists[i].prjUserName+'</div>';
                    		ele+='<div class="pro--label"><span><font style="font-weight:bold">'+data.lists[i].suptAmt+'</font>元</span></div>';
                    		ele+='</div>';
                		}	
                		$(".pros ").append(ele);
                	}
                },
                error:function (e) {
                	console.log(e);
                }
            });
        }
    });
 
});