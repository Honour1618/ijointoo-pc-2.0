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
        'jc':{
        	deps:['jquery']
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        jc:"../lib/jquery.cookie",
        base:"base",
        test:"test"
    }
});

// 开始使用jQuery 模块
require(["jquery","base","test",'jc'], function ($,base,test) {

/*    base.person(3 , 1);*/
    $(function(){
        base.nav(4);
        base.sidebar();
        base.userNav(3,1);
    	//保存
        $("#saveBtn").on("click",function(){
        	if(!formyz()){
            	return false;
        	}else{
        		return true;
        	}

        });

        //焦点事件后清除提示信息
        $(".form__input").focus(function(){
        	$(this).siblings(".promptMessage").removeClass("show");
        });
        
        /*验证码*/
        $("#yzmBtn").on("click",function () {
        	 var randCode = $("#imgNum").val();
        	 if(randCode ==""){
        		 $("#imgNum").siblings('.promptMessage').addClass("show");
        		 return false;
        	 }
            var e=$(this);
                /*按钮在未禁用的状态下 进行ajax请求 然后禁用按钮 启用计时器*/

                $.ajax({
                    type: "post", //使用post方法访问后台 
                    dataType: "json",
                    url:webroot+'/PtlVCode!applyWithImg.action', //目标地址
                    data: { "nosession": true, "tel": phone ,"randCode":randCode},//nosession 未登录ajax 请求有效
                     success: function (data) {
                    	 if (data.result == 0) {//发送成功
                             var d=new LayerInit(phone);
                             countDown("60","#yzmBtn");
                             d.layer("b",".successLayer");
                             console.log("发送成功");
                    	 }else{
                    		 alert(data.desc);
                    	 }
    				}
    			});
                return false;
        });
        //图形码切换
        $("#checkImg").on("click",function(){
        	changeImagelabel();
        });
    });

    

	function changeImagelabel() {
		document.getElementById("image1").src = webroot+'/genVerifyCode.do?dt='+ Math.random();
	}

    var LayerInit=function(string){
        this.a="你的实名认证信息已经 <span>"+string+"</span>，我们会及时审核";
        this.b="短信验证码将发送到号码为 <span>"+string+"</span> 的手机上，请注意查收";
    };
    LayerInit.prototype={
        constructor: LayerInit,
        layer:function (type,className) {
            var e=$(className);
            /*a认证成功  ,b 短信验证码放成功*/
                switch (type){
                    case "a":
                        e.show().children("p").empty("").append(this.a);
                        break;
                    case "b":
                        e.show().children("p").empty("").append(this.b);
                        break;
                }
                var d=setTimeout(function () {
                    e.hide();
                },3000);

        }
    };
    
    
    /*计时器*/
    var setTime;
    function countDown(num,className) {
        var e=$(className);
        var t=parseInt(num);
            //禁用按钮
        e.attr("disabled",true);
        e.text("发送成功 "+t+" s");
            setTime=setInterval(function () {
                if (t==0){
                    clearInterval(setTime);
                    e.text("获取验证码").attr("disabled",false);
                    return;
                }
                t--;
                if(t>=0){
                	 e.text("发送成功 "+t+" s");
                }         
            },1000);
    }
    
    
    //表单验证
    function formyz(){
    	var pwd=$("#pwd"),
    		newPwd=$("#newPwd"),
    		imgNum=$("#imgNum"),
    		yzNum=$("#yzNum"),
    		pwdV=pwd.val(),
    		newPwdV=newPwd.val(),
    		imgNumV=imgNum.val(),
    		yzNumV=yzNum.val();

    	//新密码
    	if(pwdV.length<6){
    		pwd.siblings(".promptMessage").addClass("show");
    		return false;
    	}else if(!test.psd(pwdV)){
    		pwd.siblings(".promptMessage").addClass("show");
    		return false;
    	}else{
    	/*	if(!pwdV.match(/\d{4,}/)){
    			return false;
    		}*/
    	}
    	//重复密码
    	if(newPwdV != pwdV){
    		newPwd.siblings(".promptMessage").addClass("show");
    		return false;
    	}
    	//图形码
    	if(imgNumV =="" || imgNumV.length!=4){
    		imgNum.siblings(".promptMessage").addClass("show");
    		return false;
    	}
    	//验证码
    	if(yzNumV =="" || yzNumV.length !=4){
    		yzNum.siblings(".promptMessage").addClass("show");
    		return false;
    	}
    	
    	return true;
    }
});