/*
 * 
 * 壮苗系统 - 注册页js
 * 
 * * * */

require.config({
	baseUrl : webroot +"/file/zmiao/js/app",
	paths: {
		"jquery": "../lib/jquery-1.8.2"
	}
});

require(["jquery"] , function($){
	$(".check_img").on("click" , function() {//图片验证码
		$("#image1").attr("src" , webroot + '/genVerifyCode.do?dt='+ Math.random());
	})
	checkInput();//执行信息验证
});

function checkInput(){//注册信息验证
	
	$("#userName").on("blur" , function(){//用户名验证
		var userName = $("#userName").val();
		if(userName == null || userName.length == 0 || !isChName(userName)) {
			$("#userNameTip").addClass("tip_show");
			return false;
		}else {
			$("#userNameTip").removeClass("tip_show");
		}
	});
	
	$("#nickName").on("blur" , function(){//昵称验证
		var nickName = $("#nickName").val();
		if(nickName == null || nickName.length == 0 || !isNickName(nickName)) {
			$("#nickNameTip").addClass("tip_show");
			return false;
		}else {
			$("#nickNameTip").removeClass("tip_show");
		}
	});
	
	$("#userMobile").on("blur" , function(){//手机号验证
		var userMobile = $("#userMobile").val();
		if(userMobile == null || userMobile.length == 0 || !isMobile(userMobile)) {
			$("#userMobileTip").addClass("tip_show");
			return false;
		}else {
			$("#userMobileTip").removeClass("tip_show");
		}
	});
	
	$("#randCode").on("blur" , function(){//验证码验证
		var randCode = $("#randCode").val();
		if(randCode == null || randCode.length < 4) {
			$("#randCodeTip").addClass("tip_show");
			return false;
		}else {
			$("#randCodeTip").removeClass("tip_show");
		}
	});

	$("#vcode").on("blur" , function(){//短信验证码验证
		var vCode = $("#vcode").val();
		if(vCode == null || vCode.length < 4) {
			$("#vcodeTip").addClass("tip_show");
			return false;
		}else {
			$("#vcodeTip").removeClass("tip_show");
		}
	});
};

var InterValObj; //timer变量，控制时间
var count = 90; //间隔函数，1秒执行
var curCount;//当前剩余秒数
function sendMessage() {
	curCount = count;
	var userMobile = $("#userMobile").val();
	if(userMobile == null || userMobile.length == 0 || !isMobile(userMobile)) {//手机号
		$("#userMobileTip").addClass("tip_show");
		return false;
	};
	var randCode = $("#randCode").val();
	if(randCode == null || randCode.length < 4) {//验证码
		$("#randCodeTip").addClass("tip_show");
		return false;
	};
	//向后台发送处理数据
	$.ajax({
			type: "post", //用POST方式传输
			dataType: "json", //数据格式:JSON
			url: webroot + '/PtlVCode!applyWithImg.action', //目标地址
			data: { "nosession": true,"tel": userMobile,"randCode":randCode },//nosession 未登录ajax 请求有效
			success: function (msg){
				console.log(msg);
				if(msg.result == 0){
					InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
					//设置button效果，开始计时
					$("#btnSendCode").hide();
					$("#btnSendCodeTime").show().val(curCount + "秒");
				}else if(msg.result == 9){
					window.clearInterval(InterValObj);//停止计时器
					$("#btnSendCode").removeAttr("disabled");//启用按钮
					$("#btnSendCode").html("重新获取");
					code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
					$("#randCodeTip").addClass("tip_show").html(msg.desc);//提示信息
					return ;
				}else if(msg.result == 4){
					$("#randCodeTip").html(msg.desc);//提示信息
					window.clearInterval(InterValObj);//停止计时器
					$("#btnSendCode").addClass("tip_show").html("稍候重试");
					return ;
				}
			}
	});
};

//timer处理函数 
function SetRemainTime() {
	if (curCount == 0) {                
		window.clearInterval(InterValObj);//停止计时器
		$("#btnSendCodeTime").hide();
		$("#btnSendCode").show().val("点击重新获取");
		code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
	}else {
		curCount--;
		$("#btnSendCodeTime").val( curCount + "秒");
	}
};

function registerNew() {//页面提交
	var userName = $("#userName").val();
	if(userName == null || userName.length == 0 || !isChName(userName)) {//用户名
		$("#userNameTip").addClass("tip_show");
		return false;
	};
	var nickName = $("#nickName").val();
	if(nickName == null || nickName.length == 0 || !isChName(nickName)) {//昵称
		$("#nickNameTip").addClass("tip_show");
		return false;
	};
	var userMobile = $("#userMobile").val();
	if(userMobile == null || userMobile.length == 0 || !isMobile(userMobile)) {//手机号
		$("#userMobileTip").addClass("tip_show");
		return false;
	};
	var randCode = $("#randCode").val();
	if(randCode == null || randCode.length < 4) {//验证码
		$("#randCodeTip").addClass("tip_show");
		return false;
	};
	var vCode = $("#vcode").val();
	if(vCode == null || vCode.length < 4) {//短信验证码
		$("#vcodeTip").addClass("tip_show");
		return false;
	};
	$.ajax({
		type: "POST", //用POST方式传输
		dataType: "json", //数据格式:JSON
		url: webroot+'/PtlPortal!registerMember.action', //目标地址
		data: { "nosession": true,"member.userName": userName ,"member.nickName": nickName ,"member.userMobile":userMobile, "randCode":randCode, "validateCode":vcode},//nosession 未登录ajax 请求有效
		success: function (data){
			console.log(data);
			if(data.result=="0"){
				window.location.href =webroot+ '/zhuangmiao';
			}else{
				alert(data.desc);
			}
		}
	});
};












