/**
 * Created by jack on 2017/6/15.
 * 助创园地模块
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
        "jquery.qrcode":{
    		deps:["jquery"]
    	}
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        odometer:"../lib/odometer.min",
        base:"base",
        "jquery.qrcode": "../lib/jquery.qrcode.min",
        proDetail:"proDetail"

    }
});

// 开始使用jQuery 模块
require(["jquery","base","proDetail","jquery.qrcode"], function ($,base,pro,qrcode) {
	$(function(){
	    base.nav(1);
	    base.sidebar();
	    base.loginUrl();
	    pro.proScroll(money,mb);
	    pro.tabClick();
	    pro.talkObj.talkListHover();
	    pro.talkObj.replyClick();
	    pro.talkObj.talkInit(prePrjCode);
	    pro.talkObj.talkMore(prePrjCode);
	    pro.talkObj.talkClick(prePrjCode);
	    pro.zanObj.zanClick(prePrjCode,login,isLike);
	    pro.talkObj.txtNum(".talk__lists",".reply__text__input",256);
	    pro.talkObj.txtNum(".talk__ele",".talk__text",256);
	    pro.helpObj.helpInit(cfno);
	    pro.helpObj.helpClick(cfno);
	    pro.dayFun();
	    pro.finalData(rcUrl);//生成二维码
	    $("#talkqx").on("click",function(){
	    	var eleBox=$(this).parent(".btn__group").prev(".talk__ele");
	    	eleBox.children(".talk__text").val("");
	    	eleBox.children(".txt__num").children("span").text("256");
	    });
	    
	});
	/*var canvas = $('#qrcode').qrcode({width: 70,height: 70,text: rcUrl});
	var image = convertCanvasToImage($("#qrcode canvas").get(0));
	$("#qrcodeImg").attr("src",image.src);
	
	function convertCanvasToImage(canvas) {//生成图片
	    var image = new Image();  
	    image.src = canvas.toDataURL("image/png");  
	    return image;  
	};*/
	
});

