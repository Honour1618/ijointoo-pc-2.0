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
        exif:"../lib/exif",
        base:"base",
        test:"test"
    }
});

// 开始使用jQuery 模块
require(["jquery","base","exif","test",'jc'], function ($,base,e,test) {
	$(function(){
	    base.nav();
	    base.sidebar();
	    base.userNav(3,2);
	    /*base.person(3 , 2);*/

	    //检验图片提交
	    function checkFile(files , showObj , dataObj , nowSize){
	        if( showObj != undefined ){
	            showObj.html("").show();
	        }
	        if (files.length != 0) {
	            //获取文件并用FileReader进行读取
	            var html = '';
	            var orientation = 0;
	            EXIF.getData(files[0],function(){
	                orientation=EXIF.getTag(this,'Orientation');
	            });
	            var reader = new FileReader();
	            if(!/image\/\w+/.test(files[0].type)){
	                showObj.html("请确保文件为图像类型");
	                return false;
	            }
	            reader.onload = function(e) {
	                getImgData(this.result,orientation,function(data){
	                    //这里可以使用校正后的图片data了
	                    if( dataObj != undefined ){
	                        dataObj.val(data);
	                    }
	                    html = '<img src="'+data+'" />';
	                    if( showObj != undefined ){
	                        showObj.html(html);
	                        $("#user_avatar_show").siblings(".promptMessage").removeClass("show");
	                    }
	                } , nowSize);
	            };
	            reader.readAsDataURL(files[0]);
	        }
	    }
	    //图片压缩
	    function getImgData(dataURL,dir,callback , nowSize){
	        img = new Image(),
	            degree=0;
	        img.onload = function() {
	            var degree=0,drawWidth,drawHeight,width,height;
	            drawWidth=this.naturalWidth;
	            drawHeight=this.naturalHeight;
	            //以下改变一下图片大小
	            var maxSide = Math.max(drawWidth, drawHeight);
	            if (maxSide > nowSize) {
	                var minSide = Math.min(drawWidth, drawHeight);
	                minSide = minSide / maxSide * nowSize;
	                maxSide = nowSize;
	                if (drawWidth > drawHeight) {
	                    drawWidth = maxSide;
	                    drawHeight = minSide;
	                } else {
	                    drawWidth = maxSide;
	                    drawHeight = maxSide*maxSide/minSide;
	                }
	            }
	            var canvas=document.createElement('canvas');
	            canvas.width=width=drawWidth;
	            canvas.height=height=drawHeight;
	            var context=canvas.getContext('2d');

	            //判断图片方向，重置canvas大小，确定旋转角度
	            switch(dir){
	                case 3:
	                    degree=180;
	                    drawWidth=-width;
	                    drawHeight=-height;
	                    break;
	                case 6:
	                    canvas.width=height;
	                    canvas.height=width;
	                    degree=90;
	                    drawWidth=width;
	                    drawHeight=-height;
	                    break;
	                case 8:
	                    canvas.width=height;
	                    canvas.height=width;
	                    degree=270;
	                    drawWidth=-width;
	                    drawHeight=height;
	                    break;
	            }
	            //使用canvas旋转校正
	            context.fillStyle = "#fff";
	            context.fillRect(0, 0, canvas.width, canvas.height);
	            context.rotate(degree*Math.PI/180);
	            context.drawImage(this,0,0,drawWidth,drawHeight);
	            //返回校正图片
	            callback(canvas.toDataURL("image/jpeg",1));

	        };
	        img.src = dataURL;
	    }

	    
	    //上传头像预览
	    $(document.getElementById("imgUp")).on('change', function(e){
	        
	        var files = this.files;
	        if(files.length){
	            checkFile(this.files , $("#user_avatar_show") , $("#user_avatar_data") , "360");
	        }
	    });
	    
	    //弹窗调用

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

	    $("#reBtn").on("click",function (){
	    	if(!formyz()){
	    		return false;
	    	}else{

		        var a=new LayerInit("成功提交");
		        a.layer("a",".successLayer");
		        return true;
	    	}

	    });
	    
	    $("#rerzBtn").on("click",function(){
	    	$(".perfect").removeClass("hidden");
	    	$(".subEnd ").removeClass("display").addClass("hidden");
	    });
	    
	    $(".form__input").focus(function(){
	    	$(this).siblings(".promptMessage").removeClass("show");
	    });
	    
	    
	    //表单验证
	    function formyz(){
	    	var name=$("#name"),
	    		peopleNum=$("#peopleNum"),
	    		home=$("#home"),
	    		pos=$("#pos"),
	    		imgData=$('#user_avatar_data');
	    	//姓名
	    	if(name.val().length<2){
	    		name.siblings(".promptMessage").addClass("show");
	    		return false;
	    	}
	    	//证件号码
	    	if(!test.isCardId(peopleNum.val())){
	    		peopleNum.siblings(".promptMessage").addClass("show");
	    		return false;
	    	}
	    	//图片

	    	if($("#user_avatar_show").children("img").prop("src") == undefined || $("#user_avatar_show").children("img").prop("src") == ""){
	    		$("#user_avatar_show").siblings(".promptMessage").addClass("show");
	    		return false;
	    	}
	    	return true;
	    }

	})




});