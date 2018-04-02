/**
 * Created by jack on 2017/6/15.
 */
define("gardener",['jquery'],function($){
    var gardenerObj={
        listHover:function(){
            $(".gardener--list").hover(function () {
                $(this).addClass("list-boxShadow");
                $(this).children("a").children(".list__desc").stop().fadeIn(200);
            },function () {
                $(this).removeClass("list-boxShadow");
                $(this).children("a").children(".list__desc").stop().fadeOut(200);
            });
        }
};
    return gardenerObj;
});