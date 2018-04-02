/**
 * Created by jack on 2017/6/7.
 * 首页模块
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
        "slider" : {
        	//依赖模块
            deps:["jquery"],
            exports:'slider'
        },
        "swiper":{
        	deps:["jquery"],
        	exports:'swiper'
        },
        'odometer':{
        	deps:["jquery"],
        	exports:'odometer'
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        slider:"../lib/jquery.nivo.slider",
        odometer:"../lib/odometer.min",
        base:"base",
        index:"index",
        swiper:"../lib/swiper.min"
    }
});

// 开始使用jQuery 模块
require(["jquery","base","slider","index","swiper","odometer"], function ($,base,s,index,swiper,odometer) {
		$(function(){
	        index.tab.tabClick();
	        base.nav(0);
	        base.sidebar();
	        index.sliderRun();
	        index.newSwiper("#proList");
	        index.newSwiper("#proListImg");
	        index.newSwiper("#angelToday");
	        index.newSwiper("#angelLike");
	        index.angel("#angelLeft");
	        index.angel("#teacherLeft");
	        index.scrrollRun();
	        $(".img__mask").on("mouseover",function(){
	        	$(this).stop().animate({
	        		"opacity":"1"
	        	},400);
	        });
	        $(".img__mask").on("mouseout",function(){
	        	$(this).stop().animate({
	        		"opacity":"0"
	        	},400);
	        });
		});

    //你的代码
    //这里直接可以使用jquery的方法，比如：$( "#result" ).html( "Hello World!" );
});