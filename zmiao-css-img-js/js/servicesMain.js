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
        'swiper':{
            deps:["jquery"],
            exports:'swiper'
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        swiper:"../lib/swiper.min",
        base:"base"
    }
});

// 开始使用jQuery 模块
require(["jquery","base","swiper"], function ($,base,s) {
    $(function(){
	    base.loginUrl();
        base.nav(3);
        base.sidebar();
        autoRun("#angelToday");
        $(".plan__btn").bind("click" , function(){//发起壮苗项目
        	window.open( webroot + "/PtlZm!zmTest.action");
        })
        $(".ds__btn").bind("click" , function(){
        	window.location.href = webroot + "/PtlZm!investorList.action";
        })
    });
    /*tab切换*/
   $(".tab__box").children(".tab").hover(function(){
    	console.log("悬停了");
    	$(this).children(".tab__text").addClass("hoverStyle");
    	$(this).children(".tab__icon").addClass("hoverStyle");
    },function(){
    	$(this).children(".tab__text").removeClass("hoverStyle");
    	$(this).children(".tab__icon").removeClass("hoverStyle");
    });
    $(".tab__box").children(".tab").on("click",function (e) {
        e=e||event||window.event;
        if(e.stopPropagation ){
            e.stopPropagation();
        }else{
            window.event.cancelBubble=true;
        }
        var i=$(this).index();
        $(this).children(".tab__icon").addClass("active").parent(".tab").siblings(".tab").children(".tab__icon").removeClass("active");
        $(this).children(".tab__text").addClass("active").parent(".tab").siblings(".tab").children(".tab__text").removeClass("active")
        $(".tabs").children(".tab__list").eq(i).siblings(".tab__list").fadeOut(100);
        $(".tabs").children(".tab__list").eq(i).delay(100).fadeIn(100);
    });
    /*学生说*/
    $(".students").children(".student").on("mouseover",function (e) {
        e=e||event||window.event;
        if(e.stopPropagation ){
            e.stopPropagation();
        }else{
            window.event.cancelBubble=true;
        }
        $(this).css({
            "opacity":"1"
        }).siblings(".student").css({
            "opacity":"0.4"
        });
        var i=$(this).index();
        switch (i){
            case 0:
                $(".jd__box").children(".active").stop().animate({
                    "left":"0px"
                },100);
                break;
            case 1:
                $(".jd__box").children(".active").stop().animate({
                    "left":"204px"
                },100);
                break;
            case 2:
                $(".jd__box").children(".active").stop().animate({
                    "left":"408px"
                },100);
                break;
            case 3:
                $(".jd__box").children(".active").stop().animate({
                    "left":"612px"
                },100);
                break;
        }
        $(".tab_student_say").children(".say_list").eq(i).addClass("active").siblings(".say_list").removeClass("active")
    });
    /*轮播图*/
    function autoRun(className) {
        var mySwiper = new Swiper (className, {
            effect : 'slide',
            slide: {
                slideShadows : true,
                limitRotation : true
            },
            prevButton:'.swiper-button-prev',
            nextButton:'.swiper-button-next',
            loop: true,
            autoplay: 3000,//可选选项，自动滑动
            autoplayDisableOnInteraction : false,
            onTouchMove: function(swiper){
                //你的事件
              
            },
            observer:true,//修改swiper自己或子元素时，自动初始化swiper
            observeParents:true//修改swiper的父元素时，自动初始化swiper

        });
    }

 
});