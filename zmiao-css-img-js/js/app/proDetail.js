/**
 * Created by jack on 2017/6/15.
 */
define("proDetail",['jquery','base'],function($,base){
    var proDetailObj={
    	//tab切换
        tabClick:function () {
            $(".tab__title").children("div").on('click',function (e) {
            	e = e||window.event || event; 
            	if ( e.stopPropagation ){
            	e.stopPropagation(); 
            	}else{ 
            	window.event.cancelBubble = true; 
            	}
                var i=$(this).index();
                $(this).addClass("active").siblings("div").removeClass("active");
                $(".tab__lists").children(".list").eq(i).addClass("active").siblings(".list").removeClass("active");
                var i=$(this).index();
                switch(i){
                case 0:
                	break;
                case 1:
                	$(".zcz__lists").empty("");
                	proDetailObj.helpObj.page=1;
                	$("#zzMore").text("加载更多");
                	proDetailObj.helpObj.helpInit(cfno);
                	break;
                case 2:
                	$(".talk__lists").empty("");
                	proDetailObj.talkObj.page=1;
                	$("#morePl").text("加载更多");
                	proDetailObj.talkObj.talkInit(prePrjCode);
                	break;
                }

            });
        },
        //评论
        talkObj:{
        	page:1,
        	//监听字数
        	txtNum:function(eleBox,inputName,num){
        		$(eleBox).on('input propertychange',inputName,function() {
                    var len=$(this).val().length;
                	var str=$(this).val();
                   	var s=$(this).next(".txt__num").children("span");
                    if(len<=num){
                        s.text(num-len);	
                    }else{
                    	$(this).val(str.substring(0, num));
                    	 s.text(0);
                        return;
                    }
                    $(this).focus();
        		});

                
        	},
        	//评论提交
        	talkClick:function(prePrjCode){
        		$("#talkBtn").on("click",function(e){
                	e = e|| window.event || event; 
                	if ( e.stopPropagation ){
                	e.stopPropagation(); 
                	}else{ 
                	window.event.cancelBubble = true; 
                	}
	                	var content=$(this).parent(".btn__group").prev("div").children(".talk__text").val();
	                	if(content.length>3){
		                    $.ajax({
		                        type : "post", //使用post方法访问后台
		                        dataType : "json",
		                        url : webroot+"/PtlZm!commentOrReplayAjax.action",
		                        data :{
		                    		"nosession" : true,
		                    		"prePrjCode":prePrjCode,
		                    		"content":content,
		                    		"backUrl":"/PtlZm!prjDetail.action?prePrjCode="+prePrjCode
		                        },
		                        success : function(data) {
		                        	if(data.result=="0"){
		                        		proDetailObj.talkObj.talkPostPing(".talk__lists",data);
		                        		$(".talk__text").val("");
		                        		$(".txt__num").children("span").text("256");
		                        		var talkCount=parseInt($("#talkCount").text());
		                        		$("#talkCount").text(++talkCount+"条");
		                        	}
		                        	if(data.result=="1"){
		                        		if(data.msg=="1"){
		                        			//未登录
		                        			base.loginlayer.openlayer("登录后才能评论哦！");
		                        		}else if(data.msg == "2"){
		                        			//已回复
		                        			alert("重复发送，请稍候再试！");
		                        		}
		                        	}
		                        },
		                        error:function () {

		                        }
		                    });
	                	}else{
	                		alert("最少输入4个字符");
	                	}

        		});
        	},
            //回复悬停
            talkListHover:function () {
            	$(".talk__lists").on("mouseover",".talk__list",function(){
            		$(this).find(".btn__reply").stop().show();
            	});
            	$(".talk__lists").on("mouseout",".talk__list",function(){
            		$(this).find(".btn__reply").stop().hide();
            	});
            	$(".talk__lists").on("click",".btn-cancel",function(e){
                	e = e|| window.event || event; 
                	if ( e.stopPropagation ){
                	e.stopPropagation(); 
                	}else{ 
                	window.event.cancelBubble = true; 
                	}
            		$(this).parent(".btn__group").parent(".talk__list__reply").hide();
            		$(this).parent(".btn__group").prev(".reply__text").children(".reply__text__input").val("");
            		$(this).parent(".btn__group").prev(".reply__text").children(".txt__num").children("span").text("256");
            	});
            },
            //回复
            replyClick:function () {
                $(".talk__lists").on("click",".btn__reply",function (e) {
                	e = e|| window.event || event; 
                	if ( e.stopPropagation ){
                	e.stopPropagation(); 
                	}else{ 
                	window.event.cancelBubble = true; 
                	}
                    $(this).parent(".talk__list__name").siblings(".talk__list__reply").toggle(0,function(){
                    	$(".talk__lists").off("click",".btn-relayGo");
                    });
                    $(".talk__lists").on("click",".btn-relayGo",function(e){
                    	e =  e||window.event || event; 
                    	if ( e.stopPropagation ){
                    	e.stopPropagation(); 
                    	}else{ 
                    	window.event.cancelBubble = true; 
                    	}
                    	var successEle=$(this).parent(".btn__group").parent(".talk__list__reply");
                    	var txtNumEle=$(this).parent(".btn__group").prev(".reply__text").children(".txt__num").children("span");
                    	var content=$(this).parent(".btn__group").prev(".reply__text").children(".reply__text__input");
                        var curNo=$(this).attr("data-curno");
                        var eleBox=$(this).parent(".btn__group").parent(".talk__list__reply").prev(".talk__list__desc").children(".other__lists");
                        if(content.val().length>3){
                            $.ajax({
                                type : "post", //使用post方法访问后台
                                dataType : "json",
                                url : webroot+"/PtlZm!commentOrReplayAjax.action",
                                data :{
                            		"nosession" : true,
                            		"prePrjCode":prePrjCode,
                            		"content":content.val(),
                            		"curNo":curNo,
                            		"backUrl":"/PtlZm!prjDetail.action?prePrjCode="+prePrjCode
                                },
                                success : function(data) {
                                	if(data.result=="0"){
                                		var ele="";
                                            ele+= '<div class="o__list clearfix" data-id="'+data.entity.curNo+'">';
                                            ele+= '<div class="other__left"><img src="'+webroot+"/"+data.entity.userLogo+'"/></div>';
                                            ele+= '<div class="other__right">';
                                            ele+= '<div class="other__name">'+data.entity.userMaskName+'</div>';
                                            ele+= '<div class="other__time">'+data.entity.reqTimeStrWeb+'</div>';
                                            var newStr=proDetailObj.transferString(proDetailObj.changeFaceObj(data.entity.reqcontent));
                                            ele+= '<div class="other__desc">'+newStr+'</div>';
                                            ele+= '</div>';
                                            ele+= '</div>';
                                            eleBox.append(ele);
                                            content.val("");
                                            txtNumEle.text("256");
                                            successEle.hide();
                                	}
                                	if(data.result=="1"){
                                		if(data.msg=="1"){
                                			//未登录
                                			base.loginlayer.openlayer("登陆后才能评论哦！");
                                		}else if(data.msg == "2"){
                                			//已回复
                                			alert(data.desc);
                                		}
                                	}
                                },
                                error:function () {}
                            });
                        }else{
                        	alert("最少输入4个字符");
                        }
                    });
                });
            },
            //加载更多
            talkMore:function(prePrjCode){
            	$("#morePl").on("click",function(e){
            		e= e||event||window.event;
            		if ( e.stopPropagation ){
            			e.stopPropagation(); 
            			}else{ 
            			window.event.cancelBubble = true; 
            			};
            		proDetailObj.talkObj.page++;
            		proDetailObj.talkObj.talkInit(prePrjCode); 
            	});
            },
            //评论初始化
            talkInit:function (prePrjCode){
                $.ajax({
                    type : "post", //使用post方法访问后台
                    dataType : "json",
                    //url : webroot+"/PtlCommon!queryForumAjax.action",
                    url : webroot+"/PtlZm!queryForumAjax.action",
                    data : {
                        "nosession" : true,
                        "prePrjCode":prePrjCode,
                        "pageNo":proDetailObj.talkObj.page
                    },
                    success : function(data) {
                        if(data.result=="0"){
                        	if(data.lists.length>0){
                                proDetailObj.talkObj.talkListPing(data,".talk__lists");
                                $("#talkCount").text(data.total+"条");
                        	}else{
                        		$("#talkCount").text(data.total+"条");
                        		$("#morePl").text("没有更多评论了");
                        		
                        	}
                        }
                    },
                    error:function () {

                    }
                });
            },
            //评论提交

            //评论列表字符串拼接
            talkListPing:function (data,className) {
                var ele="";
                for(var i=0;i<data.lists.length;i++){
                    ele+='<div class="talk__list clearfix" data-id="'+data.lists[i].curNo+'">';
                    ele+='<div class="talk__list__left"><div class="talk__list_icon"><img src="'+webroot+"/"+data.lists[i].userLogo+'"/></div></div>';
                    ele+='<div class="talk__list__right">';
                    ele+='<div class="talk__list__name"><span>'+data.lists[i].userName+'</span><button class="btn btn__reply fr">回复</button></div>';
                    ele+='<div class="talk__list__time">'+data.lists[i].reqTimeStrWeb+'</div>';              
                    ele+= '<div class="talk__list__desc">';
                    var newStr=proDetailObj.transferString(proDetailObj.changeFaceObj(data.lists[i].reqcontent));
                    ele+= '<p class="desc__text">'+newStr+'</p>';
                    /*二级回复*/
                    ele+= '<div class="other__lists" >';
                    if(data.lists[i].subs.length>0){
                    	for(var j=0;j<data.lists[i].subs.length;j++){
                            ele+= '<div class="o__list clearfix" data-id="'+data.lists[i].subs[j].curNo+'">';
                            ele+= '<div class="other__left"><img src="'+webroot+"/"+data.lists[i].subs[j].userLogo+'"/></div>';
                            ele+= '<div class="other__right">';
                            ele+= '<div class="other__name">'+data.lists[i].subs[j].userMaskName+'</div>';
                            ele+= '<div class="other__time">'+data.lists[i].subs[j].reqTimeStrWeb+'</div>';
                            ele+= '<div class="other__desc">'+proDetailObj.changeFaceObj(data.lists[i].subs[j].reqcontent)+'</div>';
                            ele+= '</div>';
                            ele+= '</div>';
                    	};
                    } 
                    /*二级回复结束*/
                    ele+= '</div>';
                    ele+= '</div>';
                    ele+='<div class="talk__list__reply clearfix">';
                    ele+='<div class="reply__icon"><img src="'+webroot+"/"+userLogo+'"/></div>';
                    ele+='<div class="reply__text">';
                    ele+='<textarea name=""   cols="30" rows="10" class="reply__text__input" placeholder="'+'回复：@'+data.lists[i].userName+'"></textarea>';
                    ele+='<div class="txt__num">还能输入<span>256</span>个字</div>';
                    if(login==""){
                        ele+='<div class="relay__text_loginBg"><a href="'+webroot+'/PtlZm!zmLogin.action?backUrl=PtlZm!prjDetail.action?prePrjCode='+prePrjCode+'">请先登录</a></div>';
                    }
                    ele+='</div>';
                    if(login!=""){
                        ele+='<div class="btn__group"><button class="btn btn-cancel">取消</button><button class="btn btn-talk btn-relayGo" data-curNo="'+data.lists[i].curNo+'">评论</button></div>';
                    }
                    ele+=' </div>';
                    ele+='</div>';
                    ele+='</div>';
                }
                $(className).append(ele);
            /*    $("#morePl").off("click");*/
            },
            //评论提交后字符串拼接
            talkPostPing:function(className,data){
                var ele="";
                ele+='<div class="talk__list clearfix" data-id="'+data.entity.curNo+'">';
                ele+='<div class="talk__list__left"><div class="talk__list_icon"><img src="'+webroot+"/"+data.entity.userLogo+'" /></div></div>';
                ele+='<div class="talk__list__right">';
                var a=data.entity.userName;
                var b=a.substring(0,1);
                for(var n=0;n<(a.length-1);n++){
                	b+="*";
                }
                ele+='<div class="talk__list__name"><span>'+b+'</span><button class="btn btn__reply fr">回复</button></div>';
                ele+='<div class="talk__list__time">'+data.entity.reqTimeStrWeb+'</div>';              
                ele+= '<div class="talk__list__desc">';
                var newStr=proDetailObj.transferString(proDetailObj.changeFaceObj(data.entity.reqcontent));
                ele+= '<p class="desc__text">'+newStr+'</p>';
                /*二级回复*/
                ele+= '<div class="other__lists" >';
                ele+= '</div>';
                /*二级回复结束*/
                ele+= '</div>';
                ele+='<div class="talk__list__reply clearfix">';
                ele+='<div class="reply__icon"><img src="'+webroot+"/"+userLogo+'"></div>';
                ele+='<div class="reply__text">';
                ele+='<textarea name=""  cols="30" rows="10" class="reply__text__input" placeholder="'+'回复：@'+data.entity.userName+'"></textarea>';
                ele+='<div class="txt__num">还能输入<span>256</span>个字</div>';
                if(login==""){
                    ele+='<div class="relay__text_loginBg"><a href="'+webroot+'/PtlZm!zmLogin.action?backUrl=PtlZm!prjDetail.action?prePrjCode='+prePrjCode+'">请先登录</a></div>';
                }
                ele+='</div>';
                if(login!=""){
                    ele+='<div class="btn__group"><button class="btn btn-cancel">取消</button><button class="btn btn-talk btn-relayGo" data-curNo="'+data.entity.curNo+'">评论</button></div>';
                }
                ele+=' </div>';
                ele+='</div>';
                ele+='</div>';
                $(className).prepend(ele);
            },
            //回复提交后禁用按钮，15秒后开启
            disabledBtn:function(className){
            	$(className).attr("disabled","disabled");
            	var timeGo=setTimeout(function(){
            		$(className).removeAttr("disabled");  
            	},15000);
            }
        },
        //助创明细
        helpObj:{
        	//助创加载更多页码
            page:1,
            //加载更多
            helpClick:function(cfno){
            	$("#zzMore").on("click",function(e){
            		e= e||event||window.event;
            		if ( e.stopPropagation ){
            			e.stopPropagation(); 
            			}else{ 
            			window.event.cancelBubble = true; 
            			};
            		proDetailObj.helpObj.page++;
            		proDetailObj.helpObj.helpInit(cfno);
            	});
            },
            //ajax
            helpInit:function (cfno) {
                //PtlTf!choudtlsAjax.action?cfno=
            	if(chouInfo==""){
            		$("#zzCount").text("0条");
            	}else{
                    $.ajax({
                        type : "post", 
                        dataType : "json",
                        url : webroot+"/PtlTf!choudtlsAjax.action",
                        data : {
                            "nosession" : true,
                            "cfno":cfno,
                            "pageInfo.pageSize":12,
                            "pageInfo.currentPage":proDetailObj.helpObj.page
                        },
                        success : function(data) {
                            if(data.result=="0"){
                            	if(data.lists.length>0){
                                    proDetailObj.helpObj.helpPing(data,".zcz__lists");
                                    $("#zzCount").text(data.pageInfo.total+"条");
                            	}else{
                            		$("#zzCount").text(data.pageInfo.total+"条");
                            		$("#zzMore").text("没有更多记录了");
                            	}
                            }
                        },
                        error:function () {

                        }
                    });
            	}

            },
            //助创字符串拼接
            helpPing:function(data,className){
                var ele="";
                for(var a=0;a<data.lists.length;a++){
                    ele+='<div class="z__list clearfix">';
                    ele+='<div class="z__list__left">'+'<img src="'+webroot+'/'+data.lists[a].userLogo+'"/>'+'</div>';
                    ele+='<div class="z__list__right">';
                    ele+='<div class="zc--title">'+data.lists[a].maskUserName+'</div>';
                    ele+='<div class="zc--desc">'+data.lists[a].payTime+"&nbsp;&nbsp;&nbsp;&nbsp;支持了"+data.lists[a].suptAmt+"元"+'</div>';
                    ele+='</div>';
                    ele+='</div>';
                }
                $(className).append(ele);
/*                $("#zzMore").off("click");*/
            }
        },
        //赞
        zanObj:{
            zanClick:function(prePrjCode,login,isLike){
           		if(isLike=="false"){
            			$("#nz").show().css("opacity","1");
            		//点了赞
            		}else if(isLike=="true"){
            			$("#z").show().css("opacity","1");
            		}
                	$("#zanBtn").on("click",function(e){
                		e= e||event||window.event;
                		if ( e.stopPropagation ){
                			e.stopPropagation(); 
                			}else{ 
                			window.event.cancelBubble = true; 
                		};
                			if($("#nz").css("display")=="block"){
                				var ele=$(this).children("#nz");
                				var zanType=1;
                				proDetailObj.zanObj.zanAjax(prePrjCode,zanType,ele);
                			}else{
                				alert("已经点过赞");
                			}
                	});
            },
            zanAjax:function(prePrjCode,goodType,ele){
                $.ajax({
                    type : "post", //使用post方法访问后台
                    dataType : "json",
                    url : webroot+"/PtlZm!giveGood.action",
                    data : {
                        "nosession" : true,
                        "prePrjCode":prePrjCode,
                        "goodType":goodType,
                        "backUrl":"/PtlZm!prjDetail.action?prePrjCode="+prePrjCode
                    },
                    success : function(data) {
                        if(data.result=="0"){
                            ele.siblings("img").addClass("active");
                            ele.stop().animate({
                    			top:"-50px",
                    			left:"30px",
                    			opacity:"0"
                    		},500,function(){
                    			var  ele2=$("#zanCount");
                    			var num=ele2.text();
                    			ele2.text(++num);
                    			ele.css({"left":"2px","top":"2px","display":"none"}).removeClass("active");
                    		});
                        }
                        if(data.result="1"){
                        	if( data.msg=='1'){
                        		//未登录
                            	base.layer("登录后才能点赞哦！",".login__layer");
                        	}else if(data.msg=="2"){
                        		//已点赞
                        		alert("已经点过赞");
                        	}
                        }
                        if(data.result =="2"){
                        	alert("未知错误");
                        }
                        
                    },
                    error:function () {

                    }
                });
            }
        },
        //进度条
        proScroll:function(money,mb){
        	if(mb>0){
            	var speeding=0;
            	var a=money/mb;
            	console.log("a:"+a);
            	var w=$(".scroll_run").width();
            	console.log("宽度:"+w);
            	var n=w*a;
            	console.log("n:"+n);
            	if(n<100){
            		speeding=400;
            	}else if(n>=100 && n<200){
            		speeding=800;
            	}else if(n>=200 && n<=w){
            		speeding=1200;
            	}else{
            		n=w;
            		speeding=1200;
            	}
            	$("#scroll__bar").stop().animate({
            		"width":n
            	},speeding);
        	}else{
            	$("#scroll__bar").stop().animate({
            		"width":"0px"
            	},0);
        	}

        },
        //生成二维码
       toUtf8: function(str) {
            var out, i, len, c;   
            out = "";   
            len = str.length;   
            for(i = 0; i < len; i++) {   
                c = str.charCodeAt(i);   
                if ((c >= 0x0001) && (c <= 0x007F)) {   
                    out += str.charAt(i);   
                } else if (c > 0x07FF) {   
                    out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));   
                    out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));   
                    out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
                } else {   
                    out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));   
                    out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
                }   
            }   
            return out;   
        },

        //从canvas中提取base64
        convertCanvasToBase64: function (canvas) {
            //新Image对象，可以理解为DOM

            // canvas.toDataURL 返回的是一串Base64编码的URL，当然,浏览器自己肯定支持
            // 指定格式PNG
            var base64 = canvas.toDataURL("image/png");
            return base64;
        },

        finalData: function(urlStr){
        	
        	$('#qrcode').qrcode(proDetailObj.toUtf8(urlStr));
        	$('#qrcode canvas').width('70px');
        	//获取网页中的canvas对象
            var mycanvas1=document.getElementsByTagName('canvas')[0];

            //将转换后的img标签插入到html中
            var img = proDetailObj.convertCanvasToBase64(mycanvas1);
            
          //  $('#qrcode').append(img);//imgDiv表示你要插入的容器id
        	
        	var data=[img,webroot+"/file/zmiao/images/codeLogo.png"],base64=[];
        	var Mycanvas=document.createElement("canvas"),
                ct=Mycanvas.getContext("2d"),  
                len=data.length;  
                Mycanvas.width=270;  
                Mycanvas.height=270;  
                ct.rect(0,0,Mycanvas.width,Mycanvas.height);      
                ct.fillStyle='#fff';  
                ct.fill();  
                function draw(n){  
                    if(n<len){  
                        var img=new Image;  
                        img.crossOrigin = 'Anonymous'; //解决跨域  
                        img.src=data[n];  
                        console.log(data[n]);  
                        img.onload=function(){  
                            ct.drawImage(this,0,0,270,270);  
                            draw(n+1);  
                        }  
                    }else{  
                        base64.push(Mycanvas.toDataURL("image/png"));  
                        document.getElementById("qrcodeImg").innerHTML='<img src="'+base64[0]+'">';  
                    }  
                }  
                draw(0) ;
                
        },
        //项目发起日期计算
        dayFun:function(){
        	//支持所有浏览器时间戳转换
        	var arr = proStart.split(/[- : \/]/),
        	oldTime = new Date(arr[0], arr[1]-1, arr[2], arr[3], arr[4], arr[5]);

    	    var oldTimes=oldTime.getTime();
    	    var newTime=new Date();
    	    var newTimes=newTime.getTime();
    	    var chaTime=parseInt(newTimes)-parseInt(oldTimes);
    	    var dayCha= chaTime/1000/60/60/24;
    	    var days=parseInt(dayCha);
    	    var dayForm=proStart.substring(0,10);
    	    var a=dayForm.split("-");
    	    $("#dayNum").text(days);
    	    $("#dayForm").text(a[0]+"年"+a[1]+"月"+a[2]+"日");
        },
      //表情转义函数
        changeFaceObj:function(str){
        	reg = new RegExp('\\[:emoji_(.+?)\\:]',"g");
        	str = str.replace(reg,"<img data-key='$1' class='face_ico' src='"+ webroot +"/file/face/emoji/emoji_$1.png'/>");
        	return str;
        },
      //替换所有的回车换行    
        transferString:function(content){
            var string = content;    
            try{    
                string=string.replace(/\r\n/g,"<br>");
                string=string.replace(/\n/g,"<br>");    
            }catch(e) {    
                alert(e.message);    
            }    
            return string;    
        }
};
    return proDetailObj;
});