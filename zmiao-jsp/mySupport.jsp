
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<title>壮苗文化-我的资助</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/mySupport.css">
</head>
<body>
	 <div class="content">
        <div class="inner clearfix">
        	<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
        	<div class="fr">
        		 <div class="tab__window">
        		 <!--我的资助-->
                    <div class="tab__list active">
                        <div class="support__count clearfix">
                            <div class="fl count__num">
                                <div class="clearfix">
                                    <div class="fl count--title">累计资金</div>
                                    <div class="fl count--num"><font style="font-weight:bold;font-size:26px;margin-right:10px;"><c:if test="${not empty suptAmtSum}">${suptAmtSum}</c:if><c:if test="${empty suptAmtSum}">0</c:if></font>元</div>
                                </div>
                                <div class="clearfix">
                                    <div class="fl count--title">资助项目</div>
                                    <div class="fl count--num"><font style="font-weight:bold;font-size:26px;margin-right:10px;"><c:if test="${not empty suptPrjSum}">${suptPrjSum}</c:if><c:if test="${empty suptPrjSum}">0</c:if></font>个</div>
                                </div>
                            </div>
                            <div class="fr count__banner"><img src="${ctx }/file/zmiao/images/myAssist/supportBanner.png" alt="小苗"></div>
                        </div>
                        <!--更多资助项目-->
                        <div class="support__pros ">
                        	<c:if test="${not empty suptList}">
                 				<div class="pros clearfix">
                            		<c:forEach var="list" items="${suptList}" varStatus="i">
                            			<div class="pro__list" data-id="${list.prePrjCode}">
                            				<a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${list.prePrjCode}" target="_blank">
                                    			<div class="pro--logo"><img src="${ctx}${list.prjLogo}" alt=""></div>
                                    			<div class="pro--name">${list.prjName}</div>
                                    			<div class="pro--desc">${list.prjUserName}</div>
                                    			<div class="pro--label"><span><font style="font-weight:bold">${list.suptAmt}</font>元</span></div>
                                    		</a>
                                		</div>
                            		</c:forEach>
                            	</div>       	
                        	</c:if>
                        	<c:if test="${not empty suptList}">
                            	<!--更多资助项目-->
                            	<div class="morePro__box">
                                	<a href="###" class="more__btn">更多资助项目</a>
                            	</div>
                        	</c:if>
							<c:if test="${empty suptList}">
								<div class="emptyData">
									<p>你还没有资助过壮苗哦，和我一起帮助小苗一起成长吧</p>
									<a  href="${ctx}/PtlZm!prjList.action" >查看壮苗项目</a>
								</div>	
							</c:if>

                        </div>
                        <!--累计-->
                        <div class="all__total clearfix">
                            <div class="money__count">
                                <div class="count__num"><font style="font-size:30px;font-weight:bold;margin-right:10px;"><c:if test="${not empty rtnAmtSum}">${rtnAmtSum}</c:if><c:if test="${empty rtnAmtSum}">0</c:if></font>元</div>
                                <div class="count__title">已累计回馈</div>
                            </div>
                            <div class="pro__count">
                                <div class="count__num"><font style="font-size:30px;font-weight:bold;margin-right:10px;"><c:if test="${not empty rtnPrjSum}">${rtnPrjSum}</c:if><c:if test="${empty rtnPrjSum}">0</c:if></font>个</div>
                                <div class="count__title">回馈项目</div>
                            </div>
                            <div class="success__count">
                                <div class="count__num"><font style="font-size:30px;font-weight:bold;margin-right:10px;"><c:if test="${not empty benefit}">${benefit}</c:if><c:if test="${empty benefit}">0</c:if></font>元</div>
                                <div class="count__title">成功获益</div>
                            </div>
                        </div>
                    </div>
        		</div>
        	</div>	

        </div>
     </div>

    <%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
	<!-- 个性化脚本引用 -->
	<script>
		var webroot="${ctx}";
		var count="${pageInfo.total}";
		var d="${suptList}";

	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/mySupportMain"></script>
</body>
</html>