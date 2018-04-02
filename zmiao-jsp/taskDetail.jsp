
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<title>壮苗文化-我的辅导-任务详情</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/myTask.css">
<script>
	function timeSplit(time,idName){
		var n=time.substring(0,19);
		document.getElementById(idName).innerText=n;
	}
</script>
</head>
<body>
	 <div class="content">
        <div class="inner clearfix">
        	<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
        	<div class="fr">
        		 <div class="tab__window">
				<!--我的任务-->
                    <div class="tab__list active mytask">
                        <h3>我的任务</h3>
                        <dl class="task__top">
                            <dt>项目名称：<span><a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${prjinfo.prePrjCode}">${prjinfo.prjName}</a></span></dt>
                            <dd>辅导佣金：<span>${rspbidinfo.bidAmt}元</span></dd>
                            <dd>剩余时间：<span id="timeDown"></span></dd>
                            <dd>结束时间：<span id="timeEnd"><%-- ${rspbidinfo.expRspTime} --%></span></dd>
                            <script>
                            var t="${rspbidinfo.expRspTime}";
                            timeSplit(t,"timeEnd");
                            </script>
                            <dd class="fdjd">辅导进度：<span>${rspbidinfo.svcPercent}%（应获取佣金<c:if test="${not empty rspbidinfo.payableAmt}">${rspbidinfo.payableAmt}</c:if><c:if test="${empty rspbidinfo.payableAmt}">0</c:if>元）</span>
                            	<div class="qesReletive">
                            		<span class="question" id="qs"></span>
                                	<div class="quesWindow">
                                    	<div class="quesBox">
                                        	<p>应获取佣金仅为当前进度的期望佣金，实际任务佣金会在辅导完成后一次性支付。如有疑问，欢迎垂询壮苗文化客服 400-639-1229</p>
                                        	<span class="closeBtn"></span>
                                    	</div>
                                	</div>
                            	</div>

                            </dd>
                            <dd>辅导次数：<span>${tfBpHisListSize }</span></dd>
                        </dl>
                        <!--辅导记录-->
                        <div class="task__bottom">
                            <h4>辅导记录</h4>
							<c:forEach var="bp" items="${tfBpHisList}" varStatus="i">
								<dl>
                                	<dd class="clearfix logIcon"><span>辅导时间：</span><p id="time${i.index}"><%-- ${bp.crtTime} --%></p></dd>
                                	<dd class="clearfix"><span>修改纪要：</span><p>${bp.submitDesc}</p></dd>
                                	<dd class="clearfix"><span>辅导图片：</span><div class="imgBox"><img src="${ctx}/${bp.rspImgUri}" alt=""></div></dd>
                                	<dd class="clearfix"><span>修改的商业计划书：</span>${bp.bpUrlDown}</dd>
                            	</dl>
                            	<script>
                            		var o="${bp.crtTime}";
                            		timeSplit(o,"time${i.index}");
                            	</script>
							</c:forEach>

                        </div>
                    </div>
                    <!-- 项目状态 1桑未开始   2进行中   3成功  4失败项目 -->
                    <c:if test="${prjinfo.flowSts ==1}"><img src="${ctx}/file/zmiao/images/helpGarden/prostatic_01.png" class="proStatic"/></c:if>
                    <c:if test="${prjinfo.flowSts ==2}"><img src="${ctx}/file/zmiao/images/helpGarden/prostatic_02.png"  class="proStatic"/></c:if>
                    <c:if test="${prjinfo.flowSts ==3}"><img src="${ctx}/file/zmiao/images/helpGarden/prostatic_03.png"  class="proStatic"/></c:if>
                    <c:if test="${prjinfo.flowSts ==4}"><img src="${ctx}/file/zmiao/images/helpGarden/prostatic_03.png"  class="proStatic"/></c:if>
					
					<img src="${ctx}/file/zmiao/images/myTask/fdjg.jpg" class="fdjg"/>
					<!-- 弹窗 -->
					<div class="layer">
					
					</div>
					</div>
                </div>

        		</div>
        	</div>	

    <!--提交成功弹窗-->
    <div class="successLayer">
        <p></p>
    </div>
    <%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
	<!-- 个性化脚本引用 -->
	<script>
		var webroot="${ctx}";
		var times="${rspbidinfo.RTimeByMs}";
		var prostatic="${prjinfo.flowSts}";
	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/myTaskMain"></script>
</body>
</html>