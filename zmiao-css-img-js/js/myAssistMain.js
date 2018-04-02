/**
 * Created by jack on 2017/6/15.
 * 我的辅助模块
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
        'odometer':{
        	deps:["jquery"],
        	exports:'odometer'
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        odometer:"../lib/odometer.min",
        base:"base"
    }
});

// 开始使用jQuery 模块
require(["jquery","base","odometer"], function ($,base,odometer) {
$(function(){
    base.nav();
    base.sidebar();
    base.userNav(2);
  /*  base.person(2);*/
    starStyle("#serveiceStar",starOne);
    starStyle("#jobStar",starTwo);
    starStyle("#massStar",starThree);


    
    tatalAmt=parseInt(tatalAmt);
    var momeyTotal;
    if(tatalAmt>0){
    	momeyTotal=tatalAmt/10000;
    	$("#tatalAmt").text(momeyTotal.toFixed(4));
    }else if(tatalAmt==0 || tatalAmt=='' || tatalAmt==undefined){
    	$("#tatalAmt").text("0.0000");
    }
    
    //数字滚动效果

    if(eles.length>0){
        for(var i=0;i<eles.length;i++){
        	var od= new odometer({
			    el:document.querySelector(eles[i]),
				format: '(dd)',
			  });
        	if(times[i]<10 && times[i]>0){
        		console.log(1);
        		od.update("0"+times[i]);
        	 var valueEle='';
	    	valueEle+="<span class=' valueele'>0</span";
	    	$(eles[i]).children(".odometer-inside").prepend(valueEle);
        }else if(times[i] == 0){
        	console.log(2);
          	 od.update(times[i]);
       	 var valueEle2='';
	    	valueEle2+="<span class=' valueele'>0</span><span class=' valueele'>0</span";
	    	$(eles[i]).children(".odometer-inside").prepend(valueEle2);
        }else if(times[i]>=10){
        	od.update(times[i]);
        }
        }
    }
    

    
    $(".more1").on("click",function () {
        var ele=$(this);
        if(ele.hasClass("active")){
            ele.removeClass("active").text("更多竞标项目");
            $(".pros ").css("height","140px");

        }else{
            ele.addClass("active").text("收起竞标项目");
            $(".pros ").css("height","auto");
            $.ajax({
                type : "post", //使用post方法访问后台
                dataType : "json",
                url : webroot+"/PtlZm!tfBidAjaxAll.action",
                data :{
            		"nosession" : true,
                },
                success : function(data) {
                	if(data.result=="0"){
                		$(".pros").empty("");
                		var ele="";
               		for(var i=0;i<data.lists.length;i++){
                      		ele+='<div class="pro__list">';
                      		ele+='<a href="'+webroot+'/PtlZm!prjDetail.action?prePrjCode='+data.lists[i].prePrjCode+'" target="_blank">';
                      		ele+='<div class="pro--logo"><img src="'+webroot+data.lists[i].prjLogoStr+'" alt="" ></div>';
                      		ele+='<div class="pro--text">';
                      		ele+='<div class="pro--name">'+data.lists[i].prjName+'</div>';
                      		ele+='<div class="pro--desc"><span>'+data.lists[i].bidAmtStr+'</span>元</div>';
                      		var binSts=data.lists[i].bidSts;
                      		if(binSts==1){
                          		ele+='<div class="pro--label">竞标中</div>';
                      		}else if(binSts==2){
                      			ele+='<div class="pro--label">竞标成功</div>';
                      		}else if(binSts ==3){
                      			ele+='<div class="pro--label">竞标失败</div>';
                      		}

                      		ele+='</div>';
                      		ele+='</a>';
                      		ele+='</div>';

                		}	
                		$(".pros").append(ele);
                	}
                },
                error:function (e) {
                	console.log(e);
                }
            });
        }
    });
    
    $(".more2").on("click",function () {
        var ele=$(this);
        if(ele.hasClass("active")){
            ele.removeClass("active").text("更多历史辅导");
            $(".assistds ").css("height","220px");
        }else{
            ele.addClass("active").text("收起历史辅导");
            $(".assistds ").css("height","auto");
            $.ajax({
                type : "post", //使用post方法访问后台
                dataType : "json",
                url : webroot+"/PtlZm!hisPrjAjax.action",
                data :{
            		"nosession" : true,
                },
                success : function(data) {
                	console.log(data);	
                	if(data.result=="0"){
                		console.log(data);
                		$(".assistds").empty("");
                		var ele="";
                		for(var i=0;i<data.lists.length;i++){
                			ele+='<div class="list">';
                			ele+='<a href="'+webroot+'/PtlZm!taskDetails.action?ppCode='+data.lists[i].prePrjCode+'" target="_blank">';
                			ele+='<div class="list--top">';
                			ele+='<div class="list-pro-logo">';
                			ele+='<img src="'+webroot+data.lists[i].prjLogoStr+'"/>';	
                			ele+='</div>';
                			ele+='<div class="list-pro-desc">';
                			ele+='<div class="pro-name">'+data.lists[i].prjName+'</div>';
                         			var payableAmt=data.lists[i].payableAmt;
                         			payableAmt=parseInt(payableAmt);
                			ele+='<div class="pro-person">发起人：'+data.lists[i].relUserName+'<span id="payableAmt'+i+'">'+payableAmt+'<span>元</span></span></div>';
                              		var wantime=data.lists[i].prjEndTime;
                              		wantime=wantime.substring(0,10);
                			ele+='<div class="pro-time" >完成时间：<span id="wanchen'+i+'">'+wantime+'</span></div>';

                			ele+='</div>';
                			ele+='</div>';
                			ele+='<div class="list--bottom">';
                			ele+='<div class="evaluate">创业者评价</div>';
                			ele+='<p>'+data.lists[i].commentDesc+'</p>';
                			ele+='</div>';
                			ele+='</a>';
                			ele+='</div>';

                		}	
                		$(".assistds").append(ele);
                	}
                },
                error:function (e) {
                	console.log(e);
                }
            });
        }
    });
	
    $("#reBtn").on("click",function () {
        var ele=$(this);
        ele.attr("disabled",true);
        var a=new LayerInit("成功提交");
        a.layer("a",".successLayer");
      var g=setTimeout(function () {
          ele.attr("disabled",false);
      },3000);
    });
});

//星星style
function starStyle(className,num){
	//serveiceStar  jobStar  massStar
	var m=parseInt(num); //得到整数;
	var u=parseFloat(num).toFixed(2);//得到小数
	var p=parseInt((u-m)*100);  //取小数 *100 得到星星的宽度 百分比
		$(className).children("span").each(function(i){
			var iele=$(this).children("i");
			if(i<m){
				iele.css("width","100%");
			}else if(i==m){
				iele.css("width",p+"%");
			}
		});
}



});