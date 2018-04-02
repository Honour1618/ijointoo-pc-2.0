/*
 * 
 * 壮苗系统 - 登录页js
 * 
 * * * */

require.config({
	baseUrl : webroot +"/file/zmiao/js/lib",
	paths: {
		"jquery": "jquery-1.8.2"
	}
});

require(["jquery"] , function($){
	$(".check_img").on("click" , function() {//图片验证码
		$("#image1").attr("src" , webroot + '/genVerifyCode.do?dt='+ Math.random());
	});
	
	if(loginFlag == "v_code"){
		showCodeLogin();//验证码登录
	}else if(loginFlag == "password"){
		showPwdLogin();//密码登录
	};
	
	var windowW = $(window).width();
	if (windowW <= 1366 ){//小屏电脑适配
		$(".content_wrap").css({"min-width":"1366px","padding-bottom":"188px"});
		$(".leftPic").css({"width":"300px"});
		$(".regBox").css({"margin-right":"196px"});
	};
	
	checkInput();//执行信息验证
});

function checkInput(){//注册信息验证
	
	$("#userMobile").on("blur" , function(){//手机号验证
		var userMobile = $("#userMobile").val();
		if(userMobile == null || userMobile.length == 0 ) {
			$("#userMobileTip").addClass("tip_show").html("请输入手机号");
			return false;
		}else if(!isMobile(userMobile)){
			$("#userMobileTip").addClass("tip_show").html("手机号输入有误");
			return false;
		};
	});
	
	$("#userNum").on("blur" , function(){//手机号验证yzm
		var userNum = $("#userNum").val();
		if(userNum == null || userNum.length == 0 ) {
			$("#userNumTip").addClass("tip_show").html("请输入手机号");
			return false;
		}else if(!isMobile(userNum)){
			$("#userNumTip").addClass("tip_show").html("手机号输入有误");
			return false;
		};
	});
	
	$("#userpass").on("blur" , function(){//密码
		var userpass = $("#userpass").val();
		if(userpass == null || userpass.length == 0 ) {
			$("#userpassTip").addClass("tip_show").html("请输入密码");
			return false;
		};
	});
	
	$("#randCode").on("blur" , function(){//验证码验证
		var randCode = $("#randCode").val();
		if(randCode == null || randCode.length == 0 ) {
			$("#randCodeTip").addClass("tip_show").html("请输入验证码");
			return false;
		}else if(randCode.length < 4 || !isNumber(randCode)){
			$("#randCodeTip").addClass("tip_show").html("验证码输入有误");
			return false;
		};
	});
	
	$("#vCode").on("blur" , function(){//短信验证码验证
		var vCode = $("#vCode").val();
		if(vCode == null || vCode.length == 0 ) {
			$("#vCodeTip").addClass("tip_show").html("请输入短信验证码");
			return false;
		}else if(vCode.length < 4 || !isNumber(vCode)){
			$("#vCodeTip").addClass("tip_show").html("短信验证码输入有误");
			return false;
		};
	});
	
	$(".tr_input input").bind("keydown" , function(){//输入体验优化
		var $self = $(this);
		var idName = $self.attr("id");
		$("#"+ idName +"Tip").removeClass("tip_show");
	});
};

//验证码BOX登录
function showCodeLogin(){
	$(".code_box").show();
	$(".pwd_box").hide();
	var canContinue = true ;
	if(err_msg != '') {//后台验证码错误信息提示
		$("#vCodeTip").html(err_msg).addClass("tip_show");
		err_msg = '';
		canContinue = false;
		$(".tr_input input").bind("keydown" , function(){
			$("#vCodeTip").removeClass("tip_show");
			canContinue = true;
		});
	}else{
		$("#vcodeTip").html("请输入短信验证码");
	};
}
//密码BOX登录
function showPwdLogin(){
	$(".pwd_box").show();
	$(".code_box").hide();
	var canContinue = true ;
	if(err_msg != '') {//后台密码错误信息提示
		$("#userpassTip").html(err_msg).addClass("tip_show");
		err_msg = '';
		canContinue = false;
		$(".tr_input input").bind("keydown" , function(){
			$("#userpassTip").removeClass("tip_show");
			canContinue = true;
		});
	}else{
		$("#userpassTip").html("密码输入有误");
	};
}

function mmLogin() {//密码登录
	var canContinue = true;
	$("#pwdForm").submit(function(e){
		var userMobile = $("#userMobile").val();
		if(userMobile == null || userMobile.length == 0 ) {
			$("#userMobileTip").addClass("tip_show").html("请输入手机号");
			return false;
		}else if(!isMobile(userMobile)){
			$("#userMobileTip").addClass("tip_show").html("手机号输入有误");
			return false;
		};
		var userpass = $("#userpass").val();
		if(userpass == null || userpass.length == 0 ) {
			$("#userpassTip").addClass("tip_show").html("请输入密码");
			return false;
		};
		return canContinue ;
	});
};

function codeLogin() {//验证码登录
	var canContinue = true;
	$("#codeForm").submit(function(e){
		var userNum = $("#userNum").val();
		if(userNum == null || userNum.length == 0 ) {
			$("#userNumTip").addClass("tip_show").html("请输入手机号");
			return false;
		}else if(!isMobile(userNum)){
			$("#userNumTip").addClass("tip_show").html("手机号输入有误");
			return false;
		};
		var randCode = $("#randCode").val();
		if(randCode == null || randCode.length == 0 ) {
			$("#randCodeTip").addClass("tip_show").html("请输入验证码");
			return false;
		}else if(randCode.length < 4 || !isNumber(randCode)){
			$("#randCodeTip").addClass("tip_show").html("验证码输入有误");
			return false;
		};
		var vCode = $("#vCode").val();
		if(vCode == null || vCode.length == 0 ) {
			$("#vCodeTip").addClass("tip_show").html("请输入短信验证码");
			return false;
		}else if(vCode.length < 4 || !isNumber(vCode)){
			$("#vCodeTip").addClass("tip_show").html("短信验证码输入有误");
			return false;
		};
		
		return canContinue;
	});
};

var InterValObj; //timer变量，控制时间
var count = 90; //间隔函数，1秒执行
var curCount;//当前剩余秒数
curCount = count;
function sendMessage() {
	var userMobile = $("#userNum").val();
	if(userMobile == null || userMobile.length == 0 ) {
		$("#userMobileTip").addClass("tip_show").html("请输入手机号");
		return false;
	}else if(!isMobile(userMobile)){
		$("#userMobileTip").addClass("tip_show").html("手机号输入有误");
		return false;
	};
	var randCode = $("#randCode").val();
	if(randCode == null || randCode.length == 0 ) {
		$("#randCodeTip").addClass("tip_show").html("请输入验证码");
		return false;
	}else if(randCode.length < 4 || !isNumber(randCode)){
		$("#randCodeTip").addClass("tip_show").html("验证码输入有误");
		return false;
	};

	//向后台发送处理数据
	$.ajax({
			type: "POST", //用POST方式传输
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
					$("#randCodeTip").addClass("tip_show").html(msg.desc);
					return ;
				}else if(msg.result == 4){
					$("#randCodeTip").addClass("tip_show").html(msg.desc);
					window.clearInterval(InterValObj);//停止计时器
					$("#btnSendCode").html("稍候重试");
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










