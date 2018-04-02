/**
 * Created by jack on 2017/6/15.
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
        }
    },
    // 第三方脚本模块的别名,jquery比libs/jquery-1.11.1.min.js简洁明了；
    paths: {
        jquery:"../lib/jquery-1.8.2",
        base:"base",
        gardener:"gardener"
    }
});

// 开始使用jQuery 模块
require(["jquery","base","gardener"], function ($,base,gardener) {
    base.nav(2);
    base.sidebar();
    base.loginUrl();
    gardener.listHover();

    //你的代码
    //这里直接可以使用jquery的方法，比如：$( "#result" ).html( "Hello World!" );
});