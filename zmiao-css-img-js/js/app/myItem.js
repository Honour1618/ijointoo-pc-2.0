/**
 * 个人中心 ~ 我的项目
 * 
 */
// 简单的配置
require.config({
	baseUrl : webroot + "/file/zmiao/js/lib",
	shim:{
        'jquery':{
            exports:'jquery'
        },
        "jquery.qrcode":{
    		deps:["jquery"]
    	}
    },
	paths: {
		"jquery": "jquery-1.8.2",
		"jquery.qrcode": "jquery.qrcode.min",
		 "base": "../app/base"
	}
});

// 开始使用jQuery 模块
require(["jquery","base","jquery.qrcode"], function ($,base,qrcode) {
    base.sidebar();
    base.userNav(1);
    if(svcPercent == 0.0) {
    	svcPercent = 0;
    	$(".svcPercent strong").html("0%");
    }else if(svcPercent == 100.0){
    	svcPercent = 100;
    	$(".svcPercent strong").html("100%");
    }else{
    	$(".svcPercent strong").html(svcPercent+"%");
    };
    //base.person(1);//个人中心侧边导航
    
    if(flowSts != 00 && flowSts != 11 && flowSts != 13 ){
    	var canvas = $('#qrcode').qrcode({width: 90,height: 90,text: rcUrl});
    	var image = convertCanvasToImage($("#qrcode canvas").get(0));
    	$("#qrcodeImg").attr("src",image.src);
    };
    
    //页面初始化 ~ 发起时间
    var changeTime = crtTime.substr(0,10);
    $(".time_chars").html(changeTime);
    
    $(".start_first").on("click" , function(){
    	var cthis = $(this).attr("data-pcd");
    	$.ajax({
            type : "post", //使用post方法访问后台
            dataType : "json",
            url : webroot+"/PtlZm!taskQryAjax.action",
            data :{
        		"nosession" : true,
        		"ppCode" : cthis
            },
            success : function(data) {
            	console.log(data);
            	if(data.result=="0"){
            		$(".mission_pop").empty("");
            		var ele="";
            		for(var i=0;i<data.lists.length;i++){
            			ele+='<img src="'+webroot+'/file/zmiao/images/person/close_icon.png" class="close_icon" onclick="closePop();" />';
            			ele+='<div class="mission_require">';
	            			ele+='<h2>任务需求：</h2>';
	            			ele+='<ul class="require_Amt">';
		            			ele+='<li onclick="requireClick(this);" data-num="'+data.lists[i].priceNo+'">导师辅导：<span>'+data.lists[i].amt+'</span>元</li>';
	            			ele+='</ul>';
	            			ele+='<i class="color_sign"></i>';
	            			ele+='<p>'+data.lists[i].textDesc+'</p>';
            			ele+='</div>';
            			ele+='<div class="mission_return">';
	            			ele+='<h2>助创回报：</h2>';
	            			ele+='<ul class="return_Amt">';
		            			ele+='<li onclick="returnClick(this);" data-num="200">200%</li>';
		            			ele+='<li onclick="returnClick(this);" data-num="300">300%</li>';
		            			ele+='<li onclick="returnClick(this);" data-num="500">500%</li>';
	            			ele+='</ul>';
	            			ele+='<i class="color_sign"></i>';
	            			ele+='<p>创业的路上，不是简单的风光，一路的歌唱；多少个无眠的夜晚，北斗与我孤独地分享星光；感谢亲爱的你，给予我的支持。我承诺：你将获得本项目最近一次融资时的优先认购权，以及融资成功后10个工作日内<strong class="togChange">200%</strong>的现金回报。</p>';
            			ele+='</div>';
            			ele+='<div class="comfirm_btn">';
	            			ele+='<button class="confirm_start" data-pd="'+cthis+'" onclick="comfirmStart(this);">确认发起</button><br/>';
	            			ele+='<a class="restart" href="'+webroot+'/htmlview/appDoc/agreement/entrepriseHelp.html" target="_blank">发起即同意<strong>《创业辅导助创协议》</strong></a>';
            			ele+='</div>';
            		}
            		$(".mission_pop").append(ele).show();
            		$(".mission_mask").show();
                	$(".require_Amt li").eq(0).addClass("active");
                	$(".return_Amt li").eq(0).addClass("active");
            	}else{
            		alert(data.desc);
            	}
            },
            error:function (data) {
            	alert(data.desc);
            }
        });
    });
    
    $(".more_item button").on("click",function () {
        var ele=$(this);
        if(ele.hasClass("active")){
            ele.removeClass("active").text("展示更多历史项目");
            if(tfSts == 1 || tfSts == 2){
            	 $(".item_wrap").css({"height":"388px","overflow":"hidden"});
            }else{
            	 $(".item_wrap").css({"height":"320px","overflow":"hidden"});
            }
        }else{
            ele.addClass("active").text("收起更多历史项目");
            $(".item_wrap").css("height","auto");
            $.ajax({
                type : "post", //使用post方法访问后台
                dataType : "json",
                url : webroot+"/PtlZm!prjAllAjax.action",
                data :{
            		"nosession" : true,
                },
                success : function(data) {
                	console.log(data);
                	if(data.result=="0"){
                		$(".item_wrap").empty("");
                		var ele="";
                		for(var i=0;i<data.lists.length;i++){
                    		ele+='<div class="item_content">';
                    			ele+='<div class="item_top clearfix">';
                    				ele+='<img src="'+webroot+''+data.lists[i].prjLogo+'" class="item_logo fl" />';
            	    				ele+='<h2>';
            	    				if(data.lists[i].flowSts == 00 || data.lists[i].flowSts == 11 || data.lists[i].flowSts == 13){
            	    					ele+='<i>'+data.lists[i].prjName+'</i><br/>';
            	    				}else{
            	    					ele+='<a href="'+webroot+'/PtlZm!prjDetail.action?prePrjCode='+data.lists[i].ppCode+'">'+data.lists[i].prjName+'</a><br/>';
            	    				}
            	    					ele+='<p>发起时间：'+data.lists[i].crtTime.substr(0,10)+'</p>';
            	    				ele+='</h2>';
            	    				ele+='<img src="'+webroot+'/file/zmiao/images/person/prostatic_0'+data.lists[i].tfSts+'.png" class="item_statu" />';
            	    				if(data.lists[i].flowSts != 00 && data.lists[i].flowSts != 11 && data.lists[i].flowSts != 13){
            	    					ele+='<div class="item_qrcode fr">';
	            	    					ele+='<p>扫描二维码<br/>分享你的项目</p>';
	            	    					ele+='<div id="qrcode'+data.lists[i].ppCode+'" class="qrcode"></div>';
	            	    					ele+='<img id="qrcodeImg'+data.lists[i].ppCode+'" />';
	            	    				ele+='</div>';
            	    				}
        	    				ele+='</div>';
	    	    				ele+='<ul class="item_btm clearfix">';
	        	    				ele+='<li class="fl"><strong>'+data.lists[i].realAmt +'元</strong><br/>获得资助</li>';
	        	    				ele+='<li class="fl"><strong>'+data.lists[i].tfPercent+'%</strong><br/>资助完成比例</li>';
	        	    				ele+='<li class="fl"><strong>'+data.lists[i].bidNum+'人</strong><br/>竞标人数</li>';
	        	    				ele+='<li class="fl">';
	        	    					if(data.lists[i].bidUid == null){
	        	    						ele+='<a href="#">';
	        	    					}else{
	        	    						ele+='<a href="'+webroot+'/PtlZm!investDetail.action?userId='+data.lists[i].bidUid+'">';
	        	    					}
	        	    						if(data.lists[i].bidUserName != null){
	        	    							ele+='<strong>'+data.lists[i].bidUserName+'</strong><br/>辅导导师';
	        	    						}else{
	        	    							ele+='<strong>——</strong><br/>辅导导师';
	        	    						}
	        	    					ele+='</a>';
	        	    				ele+='</li>';
	        	    				ele+='<li class="fl"><strong>'+data.lists[i].svcPercent+'%</strong><br/>辅导进度</li>';
	        	    			ele+='</ul>';
	        	    			if(data.lists[i].tfSts == 1 || data.lists[i].tfSts == 2){
		        	    			if(data.lists[i].flowSts == 12) {
		        	    				ele+='<div class="btn_start">';
		        	    					ele+='<a href="'+webroot+'/PtlZm!perfectInfo.action?prjBean.prePrjCode='+data.lists[i].ppCode+'">信息完善</a>';
		        	    					ele+='<span class="start_first" data-pcd="'+data.lists[i].ppCode+'">发起任务</span>';
		        	    				ele+='</div>';
		        	    			}else{
		        	    				ele+='<div class="btn">';
		        	    					ele+='<a href="'+webroot+'/PtlZm!perfectInfo.action?prjBean.prePrjCode='+data.lists[i].ppCode+'">信息完善</a>';
		        	    				ele+='</div>';
		        	    			}
	        	    			}
                    		ele+='</div>';
                		}
                		$(".item_wrap").append(ele);
                		for(var i=0;i<data.lists.length;i++){
                			if(data.lists[i].flowSts != 00 && data.lists[i].flowSts != 11 && data.lists[i].flowSts != 13){
		                		var codeNum = data.lists[i].ppCode;
		            			var qrcodeNum = "#qrcode" + codeNum;
		            			var qrcodeCvsNum = qrcodeNum + " canvas";
		            			var rcUrlNum = data.lists[i].voteQrCode;
		            			var qrcodeImgNum = "#qrcodeImg" + codeNum;
		            			
		            			var canvas = $(qrcodeNum).qrcode({width: 90,height: 90,text: rcUrlNum});
		            			var image = convertCanvasToImage($(qrcodeCvsNum).get(0));
		            			$(qrcodeImgNum).attr("src",image.src);
                			};
                		};
                	}
                },
                error:function (e) {
                	console.log(e);
                }
            });
        }
    });
});

function closePop(){//关闭弹窗
	$(".mission_pop,.mission_mask").hide();
}

function convertCanvasToImage(canvas) {//生成图片
    var image = new Image();  
    image.src = canvas.toDataURL("image/png");  
    return image;  
};

function requireClick(t){//任务需求金额
	$(t).addClass("active").siblings("li").removeClass("active");
};

function returnClick(t){//助创回报金额
	$(t).addClass("active").siblings("li").removeClass("active");
	var togVlu = $(t).html();
	$(".togChange").html(togVlu);
};

function comfirmStart(t){//确认发起
	var cthis = $(t).attr("data-pd");
	var priceNo = $(".require_Amt").find(".active").attr("data-num");
	if(priceNo == undefined){
		var priceNo = $(".require_Amt li").eq(0).addClass("active");
	};
	var rtn = $(".return_Amt").find(".active").attr("data-num");
	if(rtn == undefined){
		alert("请选择助创回报率");
		return false;
	};
	$.ajax({
        type : "post", //使用post方法访问后台
        dataType : "json",
        url : webroot+"/PtlZm!LaunchTaskAjax.action",
        data :{
    		"nosession" : true,
    		"ppCode" : cthis,
    		"priceNo" : priceNo,
    		"rtn" : rtn
        },
        success : function(data) {
        	console.log(data);
        	if(data.result=="0"){
        		$(".mission_pop,.mission_mask").hide();
        		window.location.reload();
        	}else{
        		alert(data.desc);
        		$(".mission_pop,.mission_mask").hide()
        	};
        },
        error:function (e) {
        	console.log(e);
        }
    });
}





















