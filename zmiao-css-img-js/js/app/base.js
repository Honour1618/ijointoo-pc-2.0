/**
 * Created by jack on 2017/6/7.
 */

//define() 参数1：模块名称     参数2：依赖模块     参数3：回调函数
define("base",['jquery'], function($){
    var baseObj={
        //导航
        nav:function (activeNum) {
            //初始化默认页面  active  当前页面  0 1 2 3 4/首页  助创园地    园丁之家    关于壮苗    爱就投     传入当前页面下标
            $(".nav__box").children("li").eq(activeNum).addClass("nav__active");
        },
        //个人中心侧边导航
        person:function (personNum,settingNum) {
        	//个人中心 
        	$(".person_nav").children("li").eq(personNum).find("a").addClass("selected");
        	if(personNum == 3) {
        		$(".person_second").children("a").eq(settingNum).addClass("active").siblings("active");
        		$(".person_second").toggle();
    			$(".personSet").addClass("personSetUp");
        	}
        },
        //返回顶部
        sidebar:function(){
        	var eleBox=$("#backTop");
          //初始化返回顶部样式
            eleBox.css({
                display:"block"
            });
            $(window).on("scroll",function(){
            	var h=$(window).height();
            	var j=$(document).scrollTop();
            	if(j>h){
            		$("#backTop").children(".back__btn").slideDown("fast") ;
            	}else{
            		$("#backTop").children(".back__btn").slideUp("fast") ;
            	}
            });
            
            //返回顶部点击
            $("#backTop").children(".back__btn").on("click",function(){
                console.log("返回顶部");
                $("html,body").stop().animate({
                    scrollTop:0
                },"fast");
            });
            $("#backTop").children("div").hover(function(e){
            	$(this).children(".btn__desc").stop().animate({
            		"right":"68px"
            	},300);
            },function(e){
            	var i=$(this).index();
            	console.log(i);
            	$(this).children(".btn__desc").stop().animate({
            		"right":"-200px",
            	},300);
            });

            //二维码
        },
        layer:function(sayText,className,time){
        	var openlayer=function(){
            	$(className).show().children(".lay__title").text(sayText);
            	if(time!=""&&time!=undefined){
            		if(delayGo){
            			clearTimeout(delayGo);
            		}
            		var delayGo=setTimeout(function(){
                		$(className).hide();
            		},time);
            	}
        		//点击空白区域关闭弹窗
        		$(document).mouseup(function(e){
      			  var _con = $(className);   // 设置目标区域
      			  if(!_con.is(e.target) && _con.has(e.target).length === 0){ 
      				closelayer();
      			  }
      			});
            }();
        	var closelayer=function(){
            	$(className).hide();
            };
            //监听滚动事件关闭窗口
            var scrollTo=function(){
            	  $(window).on("scroll",function(event){
            		  if($(className).css("display")=="block"){
            			  closelayer();
            		  }
            	    });
            }();
        },
        //登录按钮初始化url,从当前页面登录完成后返回到当前页
        loginUrl:function(){
        	//PtlZm!investDetail.action?userId=17L000011962
        	var a=webroot+"/";
        	var p=window.location.pathname;
        	var s=window.location.search;
        	var b=p+s;
        	var newUrl=b.substring(a.length);
        	var u=webroot+"/PtlZm!zmLogin.action?backUrl="+newUrl;
        	$(".loginBtn").attr("href",u);
        	$(".login__layer").children("a").attr("href",u);
        },
        userCenter:function(){
        	$(".user__center").on("click",function(e){
        		e=e||event||window.events;
        		if(e.stopPropagation){
        			e.stopPropagation();
        		}else{
        			window.event.cancelBubble = true; 
        		}
        		baseObj.layer("个人中心还未开放，请耐心等待哦",".prompt__layer",3000);

        		});
        },
        //个人中心二级菜单
        userNav:function(i,itwo){
        	$(".person_nav").children("li").eq(i).children("a").addClass("selected");
    		//初始化样式
    		var activeEle=$(".person_nav").children("li").eq(3).children("a");
    		if(activeEle.hasClass("selected")){
    			activeEle.addClass("personSetUp");
    		}else{
    			activeEle.addClass("personSet1");
    		}
        	if(arguments[1]!=undefined){
        		$(".person_second").children("a").eq(itwo).addClass("active");
        		
        	}
/*        	$(".person_nav").children("li").on("click",function(){
        		var i=$(this).index();
    			var ele=$(this).next(".person_second");
        		if(i==3){
        			if($(this).children("a").hasClass("selected")){
            			if(ele.css("height")=="137px"){
            				ele.stop().animate({
            					height:"0"
            				},200);
            				$(this).children("a").removeClass("personSetUp").addClass("personSet");
            			}else{
            				ele.stop().animate({
            					height:"137px"
            				},200);
            				$(this).children("a").addClass("personSetUp").removeClass("personSet");
            			}
        			}else{
            			if(ele.css("height")=="137px"){
            				ele.stop().animate({
            					height:"0"
            				},200);
            				$(this).children("a").removeClass("personSetUp1").addClass("personSet1");
            			}else{
            				ele.stop().animate({
            					height:"137px"
            				},200);
            				$(this).children("a").addClass("personSetUp1").removeClass("personSet1");
            			}
        			}

        		}else{
        			$(".person_nav").children("li").eq(3).children("a").addClass("personUp")
        			
        		}

        	});*/
        }
    };
    return baseObj;
});