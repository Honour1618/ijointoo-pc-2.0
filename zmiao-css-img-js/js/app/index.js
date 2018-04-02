/**
 * Created by jack on 2017/6/12.
 */
define("index",['jquery','odometer'],function ($,odometer) {

   var indexObj={
       //项目tab
       tab:{
           tabBox:".proTab__box",
           listBox:".proList__box",
           //tab切换
           tabClick:function () {
        	   $(".proList__box").children(".proList").eq(0).addClass("active");
               $(indexObj.tab.tabBox).children("div").on('click',function () {
                   var index=$(this).index();
                   if($(this).hasClass("active")){
                	   return;
                   }else{
                       $(this).addClass("active").siblings("div").removeClass("active");
                	   $(indexObj.tab.listBox).children(".active").delay(500).animate({
                		   "left":"-2000px"
                	   },500,"linear",function(){
                		   $(this).css({
                			   "display":"none",
                			   "left":"2000px"
                		   });
                	   });
                   }
                   switch(index){
                       //壮苗ajax请求
                       case 0:  
                        	   $(indexObj.tab.listBox).children("div").eq(0).show().animate({
                        		   "left":"0px"
                        	   },500,"linear");       
                           break;
                       case 1:
                        	   $(indexObj.tab.listBox).children("div").eq(1).show().animate({
                        		   "left":"0px"
                        	   },500,"linear");
                           break;
                       case 2:
                        	   $(indexObj.tab.listBox).children("div").eq(2).show().animate({
                        		   "left":"0px"
                        	   },500,"linear");
                           break;
                   }
                   
                   $(indexObj.tab.listBox).children(".proList").eq(index).addClass("active").siblings(".proList").removeClass("active");
               });
            }
       },
       //轮播图
       sliderRun:function () {
           $('#slider').nivoSlider({
        	   directionNav:false
           });
           /*初始化小图标居中*/
           var len=$("#slider").children("a").size();
           $(".nivo-controlNav").css({
               width:len*22,
               "margin-left":(-len*22/2)
           });
       },
       //项目列表幻灯片
       newSwiper:function(className){
    	   var mySwiper = new Swiper (className, {
    		    effect : 'flip',
    		    flip: {
    	            slideShadows : true,
    	            limitRotation : true,
    	        },
    		    loop: true,
    		    autoplay: 3000,//可选选项，自动滑动
    		    autoplayDisableOnInteraction : false,
    		    onTouchMove: function(swiper){
    		        //你的事件
    		      },
    		      observer:true,//修改swiper自己或子元素时，自动初始化swiper
    		      observeParents:true//修改swiper的父元素时，自动初始化swiper

    		  });
    	   return mySwiper;
       },
       newSwiper2:function(className){
    	   var mySwiper = new Swiper (className, {
    		    direction: 'vertical',
    		    loop: true,
    		    autoplay: 3000,//可选选项，自动滑动

       });
       },
       //微天使鼠标悬停，图片tansiform效果
       angel:function(className){
    	   $(className).children(".angel_list").hover(function(){
    		   $(this).children(".angel_list__title").show().stop().animate({
    			  "bottom":"0"
    		   },300);
    	   },function(){
    		   $(this).children(".angel_list__title").stop().animate({
    			   "bottom":"-60px"
     		   },300);
    	   });
       },
       scrrollRun:function(){
    	   $(window).on("scroll",function(){
    		  var n=$(window).scrollTop();
    		  if(n>800){
    			  $(".zmPro__left").animate({
    				  "left":"0",
    				  "opacity":"1"
    			  },500);
    			  $(".zmPro__right").animate({
    				  "left":"0",
    				  "opacity":"1"
    			  },500);
    		  }
    		  if(n>1200){
    				//数字倒计时模块
    			  var el = document.querySelector('#proCount');
    			  var ela=document.querySelector('#angelCount');
    			  var eld=document.querySelector('#dsCount');
    			  var ely=document.querySelector('#okCount');
    			  var od = new odometer({
    			    el:el,
  				  	format: '(,ddd)',
    			  });
    			  od.update(pro);
    			  var oda = new odometer({
      			    el:ela,
    				  	format: '(,ddd)',
      			  });
    			  oda.update(angel);
    			  var odd = new odometer({
        			    el:eld,
      				  	format: '(,ddd)',
        			  });
      			  odd.update(ds);
    			  var ody = new odometer({
      			    el:ely,
    				  	format: '(,ddd)',
      			  });
    			  ody.update(prj);
    		  }
    	   });
       }
   } ;
   return indexObj;
});