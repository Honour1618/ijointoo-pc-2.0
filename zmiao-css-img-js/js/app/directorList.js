/**
 * 壮苗系统 - 导师列表
 */
define("directorList",['jquery',"jqPaginator"],function($,pageGo){
    var directorListObj = {
    	//页面加载完毕初始化页面数据
    	dataInit:function(){
            $.ajax({
                type : "post", //使用post方法访问后台
                dataType : "json",
                url : webroot+"/PtlZm!investorListAjax.action",
                data : {
                    "nosession" : true,
                    "pageInfo.currentPage":1,
                    "pageInfo.pageSize":10
                },
                success : function(data) {
                	if(data.result=="success"){
                		//字符串拼接
                		directorList.stringPing(data,".product__lists");
                		directorList.pageInit2({
                			 pageBox:"#page__box",
                             tableId:".product__lists",
                             url:webroot+"/PtlZm!investorListAjax.action",
                             data:data,
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
    	},
        /*条件筛选样式*/
        screenFun: function (className) {  //参数：委托元素的class名
            $(className).on('click', "li", function (e) {
                e.stopPropagation();
                var allEle=$(className).children("li").eq(0);
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
                    //判断全部是否选中
                	if($(this).hasClass("active")){
                    	$(this).removeClass("active");
                    	allEle.addClass("active").siblings("li").removeClass("active");
                    }else{
                    	$(this).addClass("active").siblings("li").removeClass("active");
                    }
                }
               //ajax请求
                var ind=$("#indBox").children(".active").attr("data-val");
                var rank=$("#rankBox").children(".active").attr("data-val");
                $.ajax({
                    type : "post", //使用post方法访问后台
                    dataType : "json",
                    url : webroot+"/PtlZm!investorListAjax.action",
                    data : {
                        "nosession" : true,
                        "investMemInfo.userRang":ind,
                        "sort":rank
                    },
                    success : function(data) {
                    	if(data.result=="success"){
                    		console.log(data);
                    		//字符串拼接
                    		directorListObj.stringPing(data,".product__lists");
                    		directorListObj.pageInit({
                    			 pageBox:"#page__box",
                                 tableId:".product__lists",
                                 url:webroot + "/PtlZm!investorListAjax.action",
                                 data:data,
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
        
        //分页初始化
        pageInit:function (obj){
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
            var ind=$("#indBox").children(".active").attr("data-val");
            var rank=$("#rankBox").children(".active").attr("data-val");
            //请求填充数据
            $.jqPaginator(obj.pageBox, {
                //总页数
            	totalPages: pageCount(),
                visiblePages: 6,
    	        currentPage: 1,
    	        first: '<li class="prev"><a href="javascript:;"></a></li>',
    	        prev: '<li class="prev"><a href="javascript:;"></a></li>',
    	        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
    	        next: '<li class="next"><a href="javascript:;"></a></li>',
    	        last: '<li class="next"><a href="javascript:;"></a></li>',
    	        onPageChange: function(num , type){
                    $.ajax({
                        type : "post", //使用post方法访问后台
                        dataType : "json",
                        url : obj.url,
                        data : {
                            "nosession" : true,
                            "pageInfo.currentPage":num,
                            "pageInfo.pageSize":10,
                            "investMemInfo.userRang":ind,
                            "sort":rank
                        },
                        success : function(data) {
                        	if(data.result == "success"){
                        		$(obj.tableId).empty("");
                        		//字符串拼接
                            	directorListObj.stringPing(data,obj.tableId);
                        	}
                        },
                        error:function (e) {
                        	console.log(e);
                        }
                    });
                }
            });
        },
        pageInit2:function(obj){
        	var pagelists=obj.data.resultMap.pageInfo.total;
        	var s="共 "+"<span>"+pagelists+"</span>"+"条";
        	$("#pageTotal").html(s);
            //根据ajax数据，计算分页的页数
            var pageCount=function (){
                var dataLen=obj.data.resultMap.pageInfo.total;
                var pageSum=Math.ceil(dataLen/obj.pageTotal);
                console.log("pageSum:"+pageSum);
                return pageSum;
            };
            $(obj.pageBox).empty("");
            var ind=$("#indBox").children(".active").attr("data-val");
            var rank=$("#rankBox").children(".active").attr("data-val");
    	    $.jqPaginator(obj.pageBox, {
    	    	totalPages: pageCount(),
    	        visiblePages:6,
    	        currentPage: "",
    	        first:'<li class="prev"><a href="javascript:;"></a></li>',
    	        prev: '<li class="prev"><a href="javascript:;"></a></li>',
    	        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
    	        next: '<li class="next"><a href="javascript:;"></a></li>',
    	        last:'<li class="next"><a href="javascript:;"></a></li>',
    	        onPageChange: function (num, type) {
                    $.ajax({
                        type : "post", //使用post方法访问后台
                        dataType : "json",
                        url : obj.url,
                        data : {
                            "nosession" : true,
                            "pageInfo.currentPage":num,
                            "pageInfo.pageSize":10,
                            "investMemInfo.userRang":ind,
                            "sort":rank
                        },
                        success : function(data) {
                        	if(data.result == "success"){
                            	console.log("请求成功");
                        		//字符串拼接
                            	directorListObj.stringPing(data,obj.tableId);
                        	}
                        },
                        error:function (e) {
                        	console.log(e);
                        }
                    });
    	        }
    	    });
        },
        //字符串拼接
        stringPing:function(data,className){
        	console.log(data);
            var eles="";
            for(var i=0;i<data.resultMap.investorList.length;i++){
                eles+='<li>';
                	eles+='<a class="jumpDirector clearfix" href="'+ webroot +'/PtlZm!investDetail.action?userId='+ data.resultMap.investorList[i].userId +'" target="view_window">';
	                	eles+='<div class="directorLogo fl">';
	                		eles+='<img src="'+ webroot +'/'+ data.resultMap.investorList[i].userLogo +'" alt="" />';
	            		eles+='</div>';
	                	eles+='<div class="directorGain fr">';
	                		eles+='<p>好评率：<strong>'+parseInt(data.resultMap.investorList[i].posPercent)+'%</strong></p>';
	                		eles+='<p>辅导项目：<strong>'+data.resultMap.investorList[i].succNum+'个</strong></p>';
	                	eles+='</div>';
	                	eles+='<div class="infoDetail">';
	                		eles+='<h3>'+data.resultMap.investorList[i].userName;
		                		var prostatic=data.resultMap.investorList[i].recommLevel;
		                        if(prostatic==1){
		                        	eles+='<img src="'+webroot+'/file/zmiao/images/directorList/level_01.png"/>';
		                        }else if(prostatic == 2){
		                        	eles+='<img src="'+webroot+'/file/zmiao/images/directorList/level_02.png"/>';
		                        }else if(prostatic == 3){
		                        	eles+='<img src="'+webroot+'/file/zmiao/images/directorList/level_03.png"/>';
		                        }else if(prostatic == 4){
		                        	eles+='<img src="'+webroot+'/file/zmiao/images/directorList/level_04.png"/>';
		                        }else if(prostatic == 5){
		                        	eles+='<img src="'+webroot+'/file/zmiao/images/directorList/level_05.png"/>';
		                        }
	                		eles+='</h3>';
	                		if(data.resultMap.investorList[i].compName != '' && data.resultMap.investorList[i].position != ''){
	                			eles+='<span>'+ data.resultMap.investorList[i].compName +' | '+data.resultMap.investorList[i].position+'</span>';
	                		}else{
	                			eles+='<span>'+ data.resultMap.investorList[i].compName + data.resultMap.investorList[i].position+'</span>';
	                		}
	                		eles+='<p>'+data.resultMap.investorList[i].userDesc+'</p>';
	                	eles+='</div>';
                	eles+='</a>';
                eles+='</li>';
            };
            $(className).empty("").append(eles);
            console.log("拼接完成");
        }
    };
    return directorListObj;
});
