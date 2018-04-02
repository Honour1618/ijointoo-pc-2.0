/*
 * 
 * 壮苗系统 - 天使详情
 * 
 * * * * */

require.config({
	baseUrl : webroot + "/file/zmiao/js/lib",
	paths: {
		"jquery": "jquery-1.8.2",
		 "base" : "../app/base"
	}
});

require(["jquery","base"] , function($,base){
	$(function(){
		base.nav(2);
		base.sidebar();
		base.loginUrl();
		timeFormu();//时间字段-年-月-日
		$(".focus_gz").bind("click" , function(){//关注-取消关注
			var ishasFocus = $(".focus_gz").hasClass("focusMinus");
			if(ishasFocus){
				focusMinus();//取消关注
			}else{
				focusPlus();//+关注
			}
		});
	})
	
});

function timeFormu(){//时间字段
	var itemStartArr_len = itemStartArr.length;
	var itemStartObj = $(".helpItem .itemIn");
	for(var i = 0; i < itemStartArr_len; i++){
		var helpTime = ".helpTime" + i;
		itemStartObj.find(helpTime).html(itemStartArr[i].substring(0,10));
	};
};

function focusPlus(){//加关注
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlZm!focusUser.action', //目标地址 
	    data: {
	    	"nosession": true,
	    	"userId": userId ,
	    	"fType": 0 
	    },//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
    		if( msg.result == 0 ){
    			$(".focus_gz").addClass("focusMinus");
    			var zaPlus=$(".fansNum").html();
    			zaPlus=parseInt(zaPlus)+1;
    			$(".fansNum").html(zaPlus);
    		}else if( msg.result == 9 ){
    			window.location.href = webroot + '/PtlZm!zmLogin.action?backUrl=PtlZm!angelDetail.action?userId='+userId;
    		}else{
    			alert(msg.desc);
    		}
        }
	});
}

function focusMinus(){//取消关注
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlZm!focusUser.action', //目标地址 
	    data: {
	    	"nosession": true,
	    	"userId": userId,
	    	"fType": 1
	    },//nosession 未登录ajax 请求有效
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	    	alert(errorThrown);
	    },
	    success: function (msg){
	    	console.log(msg);
    		if( msg.result == 0 ){
    			$(".focus_gz").removeClass("focusMinus");
    			var zaPlus=$(".fansNum").html();
    			zaPlus=parseInt(zaPlus)-1;
    			$(".fansNum").html(zaPlus);
    		}else if( msg.result == 9 ){
    			window.location.href = webroot + '/PtlZm!zmLogin.action?backUrl=PtlZm!angelDetail.action?userId='+userId;
    		}else{
    			alert(msg.desc);
    		}
        }
	});
}