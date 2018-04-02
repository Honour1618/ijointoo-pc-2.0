/**
 * Created by jack on 2017/6/15.
 */
define("helpGarden",['jquery'],function($){
    var helpGardenObj={
    	//页面加载完毕初始化页面数据
    	dataInit:function(){		
           $.ajax({
                type : "post", //使用post方法访问后台
                dataType : "json",
                url : webroot+"/PtlZm!prjListAjax.action",
                data : {
                    "nosession" : true,
                    "pageInfo.currentPage":1,
                    "pageInfo.pageSize":10
                },
                success : function(data) {
                	if(data.result=="success"){
                		//字符串拼接
                		helpGardenObj.stringPing(data,".product__lists");
                		helpGardenObj.pageInit({
                			data:data,
                			url:webroot+"/PtlZm!prjListAjax.action",
                			pageBox:"#page__box",
                			tableId:".product__lists",
                			pageTotal:10
                		});

                	}else{
                	}
                },
                error:function (e) {
                	console.log(e); 
                }
            }); 
    	},
        /*条件筛选样式*/
        screenFun: function (className) {  //参数：委托元素的class名
            $(className).on('click', ".screen--list", function (e) {
            	e = e||window.event || event; 
            	if ( e.stopPropagation ){
            	e.stopPropagation(); 
            	}else{ 
            	window.event.cancelBubble = true; 
            	}
            	console.log("click");
                var allEle=$(className).children(".screen--list").eq(0);
                //如果是点击全部
                    if($(this).index()=="0"){
                        //判断是否选中
                        if($(this).hasClass("active")){
                            //如果选中不操作
                            return;
                        }else{
                            //如果未选中则选中
                            $(this).addClass("active").siblings(".active").removeClass("active");
                        }
                    }else{
                        //如果点击的是其他
                    		if($(this).hasClass("active")){
                    			$(this).removeClass("active");
                    			allEle.addClass("active").siblings(".screen--list").removeClass("active");
                    		}else{
                    			$(this).addClass("active").siblings(".screen--list").removeClass("active");
                    		}
                    }
                   //ajax请求
                    var indu=$("#induBox").children(".active").attr("data-val");
                    var pro=$("#proBox").children(".active").attr("data-val");
                    var regi=$("#regiBox").children(".active").attr("data-val");
                    $.ajax({
                        type : "post", //使用post方法访问后台
                        dataType : "json",
                        url : webroot+"/PtlZm!prjListAjax.action",
                        data : {
                            "nosession" : true,
                            "prjBean.address":regi,
                            "prjBean.industry":indu,
                            "customStatus":pro
                        },
                        success : function(data) {
                        	console.log("请求");
                        	if(data.result=="success"){
                        		//字符串拼接
                        		helpGardenObj.stringPing(data,".product__lists");
                        		helpGardenObj.pageInit({
                        			data:data,
                        			url:webroot+"/PtlZm!prjListAjax.action",
                        			pageBox:"#page__box",
                        			tableId:".product__lists",
                        			pageTotal:10
                        			
                        		});
                        	}else{
                        		console.log("请求出错");
                        	}
                        },
                        error:function (e) {
                        	console.log(e);
                        }
                    });     
          });
        },
        //区域折叠
        zdClick:function(className){
        	$(className).on("click",function(e){
            	e = e|| window.event || event; 
            	if ( e.stopPropagation ){
            	e.stopPropagation(); 
            	}else{ 
            	window.event.cancelBubble = true; 
            	}
      		var ele=$(this).siblings("#regiBox");
      		var eleHeight=ele.css("height");
      		console.log(eleHeight);
        	if(eleHeight=="42px"){
        		$(this).addClass("zd-btn2");
        		ele.stop().animate({"height":"110px"},200);
        	}else{
        		$(this).removeClass("zd-btn2");
        		ele.stop().animate({"height":"42px"},200);
        	}
        	});
        },
        //排序
        timeSort:{
        	fun:function(){
            	$("#sort__btn").on("click",function(){
                    var indu=$("#induBox").children(".active").attr("data-val");
                    var pro=$("#proBox").children(".active").attr("data-val");
                    var regi=$("#regiBox").children(".active").attr("data-val");
            		if($(this).children(".sort--sty").attr("data-type")==1){
            			$(this).children(".sort--sty").addClass("sort--sty2").attr("data-type",0);
            			helpGardenObj.timeSort.sortAjax(0,indu,pro,regi);
            		}else{
            			$(this).children(".sort--sty").removeClass("sort--sty2").attr("data-type",1);
            			helpGardenObj.timeSort.sortAjax(1,indu,pro,regi);
            		}
            	});
        	},
        	sortAjax:function(sortType,indu,pro,regi){
                $.ajax({
                    type : "post", //使用post方法访问后台
                    dataType : "json",
                    url : webroot+"/PtlZm!prjListAjax.action",
                    data : {
                        "nosession" : true,
                        "sort":sortType,
                        "prjBean.address":regi,
                        "prjBean.industry":indu,
                        "customStatus":pro
                    },
                    success : function(data) {
                    	if(data.result == "success"){
                        	console.log(data);
                    		//字符串拼接
                    		helpGardenObj.stringPing(data,".product__lists");
                    	}
                    },
                    error:function (e) {
                    	console.log(e);
                    }
                });
        	}
        },
        //字符串拼接
        stringPing:function(data,className){
        	var imgs=[];
        	imgs[0]=webroot+'/file/zmiao/images/helpGarden/prostatic_03.png';
        	imgs[1]=webroot+'/file/zmiao/images/helpGarden/prostatic_06.png';
        	imgs[2]=webroot+'/file/zmiao/images/helpGarden/prostatic_08.png';
        	imgs[3]=webroot+'/file/zmiao/images/helpGarden/prostatic_10.png';
            var eles="";
            for(var i=0;i<data.resultMap.prjList.length;i++){
                eles+='<div class="list">';
                eles+='<a href="'+webroot+"/PtlZm!prjDetail.action?prePrjCode="+data.resultMap.prjList[i].prePrjCode+'" target="_blank">';
                eles+='<div class="list__desc clearfix">';
                eles+='<div class="desc--left"><img src="'+webroot+data.resultMap.prjList[i].prjLogoStr+'" alt="logo"></div>';
                eles+='<div class="desc--right">';
                eles+='<div class="desc--name">'+data.resultMap.prjList[i].prjName+'</div>';
                var descTrim=data.resultMap.prjList[i].prjTag;
                eles+='<div class="desc--desc">'+descTrim+'</div>';
                eles+='</div>';
                eles+='</div>';
                eles+='<div class="list__industry">'+data.resultMap.prjList[i].industryStr+'</div>';
                eles+='<div class="list__term">'+data.resultMap.prjList[i].address+'</div>';
                var prostatic=data.resultMap.prjList[i].flowstsChange;
                if(prostatic==1){
                	eles+='<div class="list__static"><img src="'+webroot+'/file/zmiao/images/helpGarden/prostatic_01.png"/></div>';
                }else if(prostatic==2){
                	eles+='<div class="list__static"><img src="'+webroot+'/file/zmiao/images/helpGarden/prostatic_02.png"/></div>';
                }else if(prostatic==3){
                	eles+='<div class="list__static"><img src="'+webroot+'/file/zmiao/images/helpGarden/prostatic_03.png"/></div>';
                }else if(prostatic==4){
                	eles+='<div class="list__static"><img src="'+webroot+'/file/zmiao/images/helpGarden/prostatic_04.png"/></div>';
                }
                eles+='</a>';
                eles+='</div>';
            }
            $(className).empty("").append(eles);
        },
        pageInit:function(obj){
        	/*
        	 * {
        	 * data:data,
        	 * url:url,
        	 * pageBox:pageBox,
        	 * tableId:tableId
        	 * pageTotal:pageTotal
        	 * }
        	 * */
        	var pagelists=obj.data.resultMap.pageInfo.total;
        	var s="共 "+"<span>"+pagelists+"</span>"+"条";
        	$("#pageTotal").html(s);
            //根据ajax数据，计算分页的页数
            var pageCount=function (){
                var dataLen=obj.data.resultMap.pageInfo.total;
                var pageSum=Math.ceil(dataLen/obj.pageTotal);
                return pageSum;
            };
            $(obj.pageBox).empty("");
    	    $.jqPaginator(obj.pageBox, {
    	    	totalPages:pageCount(),
    	        visiblePages:6,
    	        currentPage: 1,
    	        first:'<li class="prev"><a href="javascript:;"></a></li>',
    	        prev: '<li class="prev"><a href="javascript:;"></a></li>',
    	        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
    	        next: '<li class="next"><a href="javascript:;"></a></li>',
    	        last:'<li class="next"><a href="javascript:;"></a></li>',
    	        onPageChange: function (num, type) {
                    var indu=$("#induBox").children(".active").attr("data-val");
                    var pro=$("#proBox").children(".active").attr("data-val");
                    var regi=$("#regiBox").children(".active").attr("data-val");
                    var sortType=$("#sort__btn").children(".sort--sty").attr("data-type");
                    $.ajax({
                        type : "post", //使用post方法访问后台
                        dataType : "json",
                        url : obj.url,
                        data : {
                            "nosession" : true,
                            "pageInfo.currentPage":num,
                            "pageInfo.pageSize":10,
                            "prjBean.address":regi,
                            "prjBean.industry":indu,
                            "customStatus":pro,
                            "sort":sortType
                        },
                        success : function(data) {
                        	if(data.result == "success"){
                            	console.log("请求成功");
                        		//字符串拼接
                        		helpGardenObj.stringPing(data,obj.tableId);
                        	}
                        },
                        error:function (e) {
                        	console.log(e);
                        }
                    });
    	        }
    	    });
        }
        };
    return helpGardenObj;
});
