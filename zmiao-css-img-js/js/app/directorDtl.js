/*
 * 
 * 壮苗系统 - 导师详情
 * 
 * * * */

require.config({
	baseUrl : webroot + "/file/zmiao/js/lib",
	paths: {
		"jquery": "jquery-1.8.2",
		 "base": "../app/base"
	}
});

require(["jquery","base"] , function($,base){
	$(function(){
		base.nav(2);
	    base.sidebar();
	    base.loginUrl();
		starPlan();//点亮星星
		timeFormu();//辅导时间格式-年-月-日
		commnetFormu();//评论时间格式-年-月-日
		commentFace();//评论表情字段
		$(".focus_gz").bind("click" , function(){//关注-取消关注
			var ishasFocus = $(".focus_gz").hasClass("focusMinus");
			if(ishasFocus){
				focusMinus();//取消关注
			}else{
				focusPlus();//+关注
			}
		});
		$("#load_more_btn").bind("click" , function(){
			loadMoreCom(this);
		});
	})
	
});

function starPlan(){
	var starNumArr_len = starNumArr.length;
	var starNumObj = $(".helpItem .startComment");
	for(var m = 0; m < starNumArr_len; m++){
		for(var n = 0; n < starNumArr[m]; n++){
			var starPercent = (starNumArr[m] - n)/1*100;
			var starData = ".service" + m +" "+ ".star" + n;
			if(starPercent > 100){
				starNumObj.find(starData).css({
					width : '100%'
				});
			}else{
				starNumObj.find(starData).css({
					width : starPercent +'%'
				});
			};
		};
	};
};

function timeFormu(){//时间字段
	var itemStartArr_len = itemStartArr.length;
	var itemStartObj = $(".helpItem .itemIn");
	for(var i = 0; i < itemStartArr_len; i++){
		var helpTime = ".helpTime" + i;
		itemStartObj.find(helpTime).html(itemStartArr[i].substring(0,10));
	};
};

function commnetFormu(){//评论时间字段
	var commenTArr_len = commenTArr.length;
	var commenTObj = $(".comment .commentor");
	for(var i = 0;i < commenTArr_len; i++){
		var commenT = ".commenT" + i;
		commenTObj.find(commenT).html(commenTArr[i].substring(0,10));
	};
};

function commentFace(){//评论表情字段
	var faceArr_len = faceArr.length;
	var commenTObj = $(".comment .commentor");
	for(var i = 0;i < faceArr_len; i++){
		var face_discuss = ".face_discuss" + i;
		commenTObj.find(face_discuss).html(changeFaceObj(faceArr[i]));
	};
};

function focusPlus(){//加关注
	$.ajax({
	    type: "POST", //用POST方式传输 
	    dataType: "json", //数据格式:JSON 
	    url: 'PtlZm!focusUser.action', //目标地址 
	    data: {
	    	"nosession": true,
	    	"userId": userId,
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
    			window.location.href = webroot + '/PtlZm!zmLogin.action?backUrl=PtlZm!investDetail.action?userId='+userId;
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
    			window.location.href = webroot + '/PtlZm!zmLogin.action?backUrl=PtlZm!investDetail.action?userId='+userId;;
    		}else{
    			alert(msg.desc);
    		}
        }
	});
}

//遮罩出现
var alertTimer = null;
function loadingMore(){
	$(".loadingPic").show();
	$(".common_mask").show();
	alertTimer = setTimeout(function(){
		$(".loadingPic").hide();
		$(".common_mask").hide();
	} , 300);
}

var commentCurrentPage = 1;
function loadMoreCom(obj , pageNo){//查看更多评论
	//如果pageNo == 1 表示重置评论列表
	var totalNo = $("#load_more_btn").attr("page-num");
	if( pageNo == undefined ) pageNo = parseInt($(obj).attr("page-num"));
	if( parseInt(totalNo/5) < commentCurrentPage){
		$("#load_more_btn").html("没有更多数据咯~");
		return;
	}
	commentCurrentPage++;
	//加载更多ajax
	$.ajax({
		type: "POST",//用POST方式传输
		dataType: "json",//数据格式:JSON
		url: 'PtlZm!forumAjax.action',//目标地址
		data: {
			"nosession": true,
			"pageInfo.pageSize": 5,
			"pageInfo.currentPage": commentCurrentPage,
			"userId": userId
		},//nosession 未登录ajax 请求有效
		error: function (XMLHttpRequest, textStatus, errorThrown) {
			$.alert(errorThrown);
		},
		success: function (msg){
			console.log(msg);
			var msgData = msg.forumList;
			var pageSum = msg.total/5;
			if(msg.result == 'success'){
				var html = "";
				$(obj).attr("page-num" , msg.total);
				$.each(msgData , function(k , v){
					html+='<li class="clearfix">'
						+'<img src="'+ webroot +'/'+ v.userLogo +'" class="fl" />'
						+'<div class="commentor fr">'
							+'<h4>'+ v.userName +'</h4>'
							+'<span>'+ new Date(v.reqTime.time).Format("yyyy-MM-dd") +'</span>'
							+'<p>'+ changeFaceObj(v.reqcontent) +'</p>'
						+'</div>'
					+'</li>';
				});
				$("#comment_wrap").append(html);
				loadingMore();
			}else{
				$("#load_more_btn").html("没有更多数据咯~");
				commentCurrentPage--;
			}
		}
	});
}

//对Date的扩展，将 Date 转化为指定格式的String   
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.Format = function(fmt)   
{ //author: meizz   
var o = {   
"M+" : this.getMonth()+1,                 //月份   
"d+" : this.getDate(),                    //日   
"h+" : this.getHours(),                   //小时   
"m+" : this.getMinutes(),                 //分   
"s+" : this.getSeconds(),                 //秒   
"q+" : Math.floor((this.getMonth()+3)/3), //季度   
"S"  : this.getMilliseconds()             //毫秒   
};   
if(/(y+)/.test(fmt))   
fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
for(var k in o)   
if(new RegExp("("+ k +")").test(fmt))   
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
return fmt;   
}

//表情转义函数
function changeFaceObj(str){
	reg = new RegExp('\\[:emoji_(.+?)\\:]',"g");
	str = str.replace(reg,"<img data-key='$1' class='face_ico' src='"+ webroot +"/file/face/emoji/emoji_$1.png'/>");
	return str;
}


























