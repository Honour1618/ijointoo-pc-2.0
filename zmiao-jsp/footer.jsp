
   <footer>
        <div class="footer__yuan"><%-- <img src="${ctx}/file/zmiao/images/base/footer__yuan02_01.png" alt="椭圆"> --%></div>
        <div class="inner">

            <div class="footer__link">
                <div class="footer__link__top clearfix">
                    <div class="link--listLeft">
                        <div class="link--title">友情链接</div>
                        <div class="link__box clearfix">
							<c:forEach var="friend" items="${friendLinks }">
								<div><a href="${friend.marketingURL }">${friend.marketingDesc }</a></div>
							</c:forEach>
                        </div>
                    </div>
                    <div class="link--listCenter">
                        <div class="link--title">联系我们</div>
                        <div class="tel__box">
                            <div>客服热线：021-69029851</div>
                            <div>客服邮箱：market@ijointoo.com</div>
                            <div>工作时间：周一至周五 9：00-19：00</div>
                        </div>
                    </div>
                    <div class="link--listRight clearfix">
                        <div></div>
                        <div><img src="${ctx}/file/zmiao/images/base/zm--ewm_07.jpg" alt="二维码"><p>壮苗文化订阅号</p></div>
                    </div>

                </div>
                <div class="footer__link__bottom">Copyright©2014 ijointoo.com︱上海爱就投金融信息服务股份有限公司 All Rights Reserved       沪ICP备14047237号</div>
            </div>
        </div>
    </footer>
<!-- 底部内容展示 ，通用脚本-->

	<script language="javascript">
		//百度统计
		var _hmt = _hmt || [];
		(function() {
		  var hm = document.createElement("script");
		  hm.src = "https://hm.baidu.com/hm.js?14e2a4a6dbddb32c85ffb926601d5fc0";
		  var s = document.getElementsByTagName("script")[0]; 
		  s.parentNode.insertBefore(hm, s);
		})();
	</script>
</body>
</html>






