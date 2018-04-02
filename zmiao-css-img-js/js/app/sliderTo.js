/**
 * Created by jack on 2017/6/9.
 */
define(['slider'],function () {
   var sliderRun= function () {
       $('#slider').nivoSlider();
       /*初始化小图标居中*/
       var len=$("#slider").children("a").size();
       $(".nivo-controlNav").css({
           width:len*22,
           "margin-left":(-len*22/2)
       })
    };
    return sliderRun;
});