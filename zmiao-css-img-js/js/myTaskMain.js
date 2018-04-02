/**
 * Created by jack on 2017/6/15.
 * 任务详情模块
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
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        base:"base"
    }
});

// 开始使用jQuery 模块
require(["jquery","base"], function ($,base) {
    var timeObj;
    $(function(){
        base.nav();
        base.sidebar();
        base.userNav(2);
        timeDown("#timeDown",times);
        
        //辅导交稿弹窗
        var timeFlag,timeDownObj;
        $(".fdjg").on("click",function(){
        	if(!timeFlag){
            	timeFlag=true;
            	$(".layer").fadeIn(500).text("功能尚未开放，壮苗工程师正在添砖加瓦，请耐心等待或在客户端完成操作");
            	timeDownObj=setTimeout(function(){
            		$(".layer").fadeOut(500);
            		timeFlag=false;
            	},3000);
        	}else{
        		return;
        	}

        });
        $(".more__btn").on("click",function () {
            var ele=$(this);
            if(ele.hasClass("active")){
                ele.removeClass("active");
                $(".pros ").css("height","140px");
            }else{
                ele.addClass("active");
                $(".pros ").css("height","auto");
            }
        });

        $("#qs").on("click",function(){
           $(".quesWindow").show();

        });
        $(".closeBtn").on("click",function(){
            $(".quesWindow").hide();
        });
        
    });
    //倒计时 classname t为时间差毫秒数
    function timeDown(className,t){
    	var shijiancha=t;
    	!function reTime(){
    		if(shijiancha>0){
    			timeObj=setInterval(function(){
    				shijiancha=shijiancha-1000;
    				var days    = shijiancha / 1000 / 60 / 60 / 24;
    				var daysRound   = Math.floor(days);
    				var hours    = shijiancha/ 1000 / 60 / 60 - (24 * daysRound);
    				var hoursRound   = Math.floor(hours);
    				var minutes   = shijiancha / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound);
    				var minutesRound  = Math.floor(minutes);
    				var seconds   = shijiancha/ 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound);
    				var secondRound=Math.floor(seconds);
    				$(className).text(daysRound+"天"+hoursRound+"小时"+minutesRound+"分钟"+secondRound+"秒");
    			},1000);
    		}else{
    			clearInterval(timeObj);
    			$(className).text("0天");
    		}
    	}();
    }
});