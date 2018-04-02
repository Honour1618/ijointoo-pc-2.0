/**
 * Created by jack on 2017/6/15.
 * 助创园地模块
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
        'jqPaginator':{
            deps:["jquery"]/*,
            exports:"pagination"*/
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        pagination:"../lib/jquery.pagination",
        jqPaginator:"../lib/jqPaginator",
        base:"base"

    }
});

// 开始使用jQuery 模块
require(["jquery","base","helpGarden","jqPaginator"], function ($,base,helpGarden,jqPaginator) {
	$(function(){
		base.loginUrl();
	    helpGarden.screenFun("#induBox",1);
	    helpGarden.screenFun("#regiBox",1);
	    helpGarden.screenFun("#proBox",1);
	    helpGarden.zdClick(".zd-btn");
	    base.nav(1);
	    base.sidebar();
	    helpGarden.timeSort.fun();
	    //进页面请求第一页数据
	    helpGarden.dataInit();
/*        $.ajax({
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
            		helpGarden.stringPing(data,".product__lists");
            		helpGarden.pageInit({
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
        */
        
/*        
       var eo=$("#page__box").children("a").eq(1).clone(true);
       $("#page__box").prepend(eo);
       $("#page__box").children("a").eq(2).remove();*/
	});

});