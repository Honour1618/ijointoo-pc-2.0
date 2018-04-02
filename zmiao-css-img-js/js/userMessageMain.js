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
        'uploadify':{
        	deps:['jquery'],
        	exports:"uploadify"
        },
        'jcrop':{
        	deps:['jquery'],
        	exports:"jcrop"
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        base:"base",
        uploadify:"../lib/uploadify/jquery.uploadify.min",
        jcrop:"../lib/jquery.Jcrop.min",
        exif:"../lib/exif",
        test:"test"
    }
});

// 开始使用jQuery 模块
require(["jquery","base","test","exif","uploadify","jcrop"], function ($,base,test,exif,uploadify,jcrop) {
	   var jcropApi;
		var boundx,boundy,xsize,ysize;
		var estatic=1;
	
    //单选按钮初始化
    function checkBtn(className) {
        $(className).each(function () {
            if($(this).children("input").prop("checked")=="checked" || $(this).children("input").prop("checked")==true){
                $(this).addClass("checked");
            }else{
                $(this).removeClass("checked");
            }
        });
        $(className).children("input").change(function() {
            var r=$(this);
            if(r.prop("checked")=="checked" || r.prop("checked")==true){
                r.parent(className).addClass("checked").siblings(className).removeClass("checked");
            }
        });
    }

	//监听字数
	function txtNum(eleBox,inputName,num){
		var l=$(inputName).val().length;
		$(inputName).next(".txt__num").children("span").text(l);
		$(eleBox).on('input propertychange',inputName,function() {
            var len=$(this).val().length;
        	var str=$(this).val();
           	var s=$(this).next(".txt__num").children("span");
            if(len<=num){
                s.text(len);	
            }else{
            	$(this).val(str.substring(0, num));
            	 s.text(0);
                return;
            }
            $(this).focus();
		});  
	}
    
    /* 选择多选项 */
    function checkSub(className,num){
        $(className).on("click","span",function(){
            var n=$(className).children(".active").size();
            if(n=="" || n== undefined || n==0){
                n=0;
            }
            if(!$(this).hasClass("active")){
                if(n<num){
                    $(this).addClass("active").parent(".checkArr").siblings(".promptMessage").removeClass("show");
                    n++;
                }else{
                	//超过四个弹窗
                	promptLayer(".promptWindow",2000,"最多选4项");
                }
            }else{
                $(this).removeClass("active");
                n--;
            }
        });
    };
    var timeObjDown="";
    function promptLayer(className,t,sayText){
    	if(timeObjDown!=""){
        		return;
    	}
        	$(className).fadeIn().children("p").text(sayText);
        	timeObjDown=setTimeout(function(){
        		$(className).fadeOut();
        		timeObjDown="";
        	},t);
    	}

    
	$(function(){
		document.getElementById('formGroup1').reset();
		document.getElementById('formGroup2').reset();
		imgCancel();
	    checkBtn(".radioBtn");
	    base.nav();
	    base.sidebar();
	    base.userNav(3,0);
	    txtNum(".list__desc","#desc",50);
	   /* base.person(3 , 0);*/
	    //提取错误信息
	    if(err){
	    	$("#littleName").siblings(".promptMessage").addClass("show").text("昵称重复");
	    }

	    $(".user__logo2").on("click",function(){
	    	$("#imgUpWindow").show();
	    	if(estatic==2 || estatic==3){
		    	$("#uploadifyPreview").hide();
		    	$(".imgcheckMask").show();
	    	}else if(estatic ==1){
	    		$(".imgcheckMask").show();
	    		
	    	}else if(estatic ==4){
	    		$(".imgcheckMask").hide();
	    	}

	    });
	    var upLoadObj={};
	    var jcropApi={};
	    $(".btn-success").on("click",function(event){
	    	$("#imgUpWindow").hide();
	    	upLoadObj.api.destroy();
	    	estatic=4;
	    	return true;
	    });
	  
	    $(".imgClose").on("click",function(){
        	estatic=2;
	    	$("#imgUpWindow").hide();
	    	$(".imgcheckMask").hide();
	    	jcropApi.destroy();
	    	imgCancel();
	    	return false;
	    });
	    $(".btn-cancel").on("click",function(){
        	estatic=3;
	    	$("#imgUpWindow").hide();
	    	$(".imgcheckMask").hide();
	    	jcropApi.destroy();
	    	imgCancel();
	    	return false;
	    });
	    

	    //图片上传
		 xsize = $(".checkImgBox").width(),
		 ysize = $(".checkImgBox").height();
  
		$("#imgupBtn").uploadify({
			'swf'			 :webroot+'/web/js/uploadify/uploadify.swf',//后台处理的请求  
			'uploader'		 :webroot+'/upload.do',
			'multi'			 : false,
			'fileObjName'    : 'upload',  
	        'fileTypeExts'	 : '*.gif; *.jpg; *.png',
	        'fileTypeDesc'	 : '请选择图片文件',
			'cancelImg'		 : 'cancel.png',
			'queueID'		 : 'imgUpObj',
			'buttonImage'	 : webroot+'/web/js/uploadify/upload.png',
			'auto'			 : true,
			'width'			 : 200,
			'height'		 : 34,
			'onUploadSuccess': function(file, data, response) {
		          if(response){
		        	/*  var result = eval('(' + data + ')');*/
		        	  var o=JSON.stringify(data);
		        	    var arr=o.split("\\");
		        	    var result=arr.join("/");
		        	    result=JSON.parse(result);
		        	    alert(result.path);
		        	  $("#tempLogo").val(result.path);
			          $("#uploadifyPreview").attr("src",webroot+"/"+result.path);
			          $("#jcropPreview").attr("src",webroot+"/"+result.path);
			          $("#imgupBtn").uploadify("disable",true);
			          $('#uploadifyPreview').Jcrop({
			        	    shade:true,
			        	    boxWidth:350,
			  				boxHeight:350,
			  				bgColor:"#000000",
			  				bgOpacity:"0.8",
			  				minSize:[130,130],
			  				allowSelect:false,
			        	    dragEdges:true,
			        	    setSelect : ["0","0","130","130"],
			        	    onChange: updatePreview,
			        	    onSelect: updatePreview,
			        	    maxSize:200,
			        	    aspectRatio: 1
		        	  },function(){
			        	    var bounds = this.getBounds();
			        	    boundx = bounds[0];
			        	    boundy = bounds[1];
			        	    jcropApi = this;
			        	    upLoadObj.api=this


		        	  });
		          }	
	       },
		 'onFallback' : function() {
			 var ele='您还没有安装flash播放器,<a class="downLoad" href="//www.adobe.com/go/getflash" target="_blank">请点击这里</a>';
				 $(".checkImgBox").append(ele);
			 
	        }
		});
		
		//关闭或者取消后清除隐藏域数据
		function imgCancel(){
			$("#x").val("");
			$("#y").val("");
			$("#w").val("");
			$("#h").val("");
			$("#uploadifyPreview").prop("src","");
		}
		//简单的事件处理程序，响应自onChange,onSelect事件，按照上面的Jcrop调用
		function updatePreview(obj){
        	$("#uploadifyPreview").css({
        		"width":"",
        		"height":"",
        		"display":"none"
        	});
			$(".imgcheckMask").hide();
			$("#x").val(parseInt(obj.x));
			$("#y").val(parseInt(obj.y));
			$("#w").val(parseInt(obj.w));
			$("#h").val(parseInt(obj.h));
			if (parseInt(obj.w) > 0) {
		      var rx = xsize / obj.w;
		      var ry = ysize / obj.h;
		      $("#jcropPreview").css({
		        width: Math.round(rx * boundx) + 'px',
		        height: Math.round(ry * boundy) + 'px',
		        marginLeft: '-' + Math.round(rx * obj.x) + 'px',
		        marginTop: '-' + Math.round(ry * obj.y) + 'px'
		      });
			}
		}
		
		
		
		
		
	    
		//提交
        $("#saveBtn").on("click",function(){
        	console.dir(test);
        	//获取表单数据
        	var data=$("#formGroup").serialize();
        	console.log(data);
        	if(!formyz()){
        		return false;
        	}else{
        		return true;
        	}
        });
        //多选
        checkSub(".checkArr",4);
		//关注领域初始化选中状态
		var d=a.split(",");
		$(".checkArr").children("span").each(function(){
			var did=$(this).attr("data-id");
			for(var i=0;i<d.length;i++){
				if(did== d[i]){
					$(this).addClass("active");
				}
			}
		});
		//焦点事件清空提示
		$(".form__input").focus(function(){
			$(this).siblings(".promptMessage").removeClass("show");
		});
	});
	
	//表单验证
	function formyz(){
		var name=$("#name"),
			littleName=$("#littleName"),
			man=$("#man"),
			women=$("#women"),
			email=$("#email"),
			area=$("#area"),
			checkObj=$(".checkArr"),
			desc=$("#desc");

		
		//姓名
		if(name.val() == "" || name.val().length < 2){
			name.siblings(".promptMessage").addClass("show");
			return false;
		}
		//昵称
		if(littleName.val() == "" || littleName.val().length < 2){
			littleName.siblings(".promptMessage").addClass("show").text("请正确填写昵称");
			return false;
		}
		//性别

		if(man.prop("checked") != true && women.prop("checked") != true){
			alert("最少勾选一个性别");
			return false;
		}
		//会员邮箱

		if(test.isEmail(email.val()) == false){
			email.siblings(".promptMessage").addClass("show");
			return false;
		}
		//所在区域

		if($('#area option:selected').attr("data-value") == undefined){
			console.log("不能为空");	
			area.siblings(".promptMessage").addClass("show");
			return false;
		}else{
			area.siblings(".promptMessage").removeClass("show");
		}

		
    	//获取关注领域数据
    	var arr=[];
    	var arrStr="";
    	$(".checkArr").children(".active").each(function(){    		
    			var r=$(this).attr("data-id");
    			arr.push(r);
    	});
    	arrStr=arr.join(",");
    	if($(".checkArr").children(".active").size()==0){
    		$(".checkArr").siblings(".promptMessage ").addClass("show");
    		return false;
    	}else{
    		$("#gz").val(arrStr);
    	}
    	

    	return true;
	}
});