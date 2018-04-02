
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<title>壮苗文化-我的项目</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/myItem.css">
</head>
<body>
	<div class="body_color">
		<div class="inner clearfix">
			<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
			<div class="fr content">
	    		<c:if test="${not empty prj.tfSts}">
		    		<div class="item_wrap">
			    		<div class="item_content">
			    			<div class="item_top clearfix">
			    				<img src="${ctx }${prj.prjLogoStr }" class="item_logo fl" />
			    				<h2 class="fl">
			    					<c:if test="${prj.flowSts == 00 || prj.flowSts == 11 || prj.flowSts == 13 }">
			    						<i>${prj.prjName }</i><br/>
			    					</c:if>
			    					<c:if test="${prj.flowSts != 00 && prj.flowSts != 11 && prj.flowSts != 13 }">
			    						<a href="${ctx }/PtlZm!prjDetail.action?prePrjCode=${prj.prePrjCode }">${prj.prjName }</a><br/>
			    					</c:if>
			    					<p>发起时间：<span class="time_chars"></span></p>
			    				</h2>
			    				<img src="${ctx }/file/zmiao/images/person/prostatic_0${prj.tfSts}.png" class="item_statu" />
			    				<c:if test="${prj.flowSts != 00 && prj.flowSts != 11 && prj.flowSts != 13 }">
			    					<div class="item_qrcode fr">
				    					<p class="mrN6">扫描二维码<br/>分享你的项目</p>
				    					<div id="qrcode" class="qrcode"></div>
	    								<img id="qrcodeImg" />
				    				</div>
			    				</c:if>
			    			</div>
			    			<ul class="item_btm clearfix">
			    				<li class="fl"><strong>${prj.realAmt }元</strong><br/>获得资助</li>
			    				<li class="fl"><strong>${prj.tfPercent }%</strong><br/>资助完成比例</li>
			    				<li class="fl"><strong>${prj.bidNum }人</strong><br/>竞标人数</li>
			    				<li class="fl">
			    					<a href="<c:if test="${not empty prj.bidUid }"> ${ctx }/PtlZm!investDetail.action?userId=${prj.bidUid }</c:if><c:if test="${empty prj.bidUid }">#</c:if> " >
				    					<c:if test="${not empty prj.bidUserName }">
				    						<strong>${prj.bidUserName }</strong><br/>辅导导师
			    						</c:if>
			    						<c:if test="${empty prj.bidUserName }">
				    						<strong>——</strong><br/>辅导导师
			    						</c:if>
			    					</a>
			    				</li>
			    				<li class="fl svcPercent"><strong></strong><br/>辅导进度</li>
			    			</ul>
			    			<c:if test="${prj.tfSts == 1 || prj.tfSts == 2}">
				    			<c:if test="${prj.flowSts == 12}">
				    				<div class="btn_start">
				    					<a href="${ctx }/PtlZm!perfectInfo.action?prjBean.prePrjCode=${prj.prePrjCode }">信息完善</a>
				    					<span class="start_first" data-pcd="${prj.prePrjCode }">发起任务</span>
				    				</div>
				    			</c:if>
				    			<c:if test="${prj.flowSts != 12}">
				    				<div class="btn"><a href="${ctx }/PtlZm!perfectInfo.action?prjBean.prePrjCode=${prj.prePrjCode }">信息完善</a></div>
				    			</c:if>
			    			</c:if>
			    		</div>
		    		</div>
		    		<c:if test="${prjSize > 1 }">
			    		<div class="more_item">
			    			<button>展示更多历史项目</button>
			    		</div>
		    		</c:if>
		    		<c:if test="${prj.tfSts != 1 && prj.tfSts != 2 }">
		    			<div class="startNewPrj">
			    			<a href="${ctx }/PtlZm!zmTest.action" target="_blank">发起新项目</a>
		    			</div>
		    		</c:if>
	    		</c:if>
	    		<c:if test="${empty prj.tfSts}">
	    			<div class="nonePrj">
		    			<p>发起壮苗，能让你的项目短时间内得到提升，更有壮苗平台优质服务为你保驾护航</p>
		    			<a href="${ctx }/PtlZm!zmTest.action" target="_blank">发起壮苗</a>
	    			</div>
	    		</c:if>
	    	</div>
		</div>
	</div>
	<div class="mission_pop"></div>
	<div class="mission_mask"></div>
	
    <%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
	<!-- 个性化脚本引用 -->
	<script>
		var webroot = "${ctx}";
		var crtTime = "${prj.crtTime }";
		var tfSts = "${prj.tfSts}";
		var svcPercent = "${prj.svcPercent }";
		var flowSts = "${prj.flowSts}";
		var rcUrl = "${prj.voteQrCode}";
	</script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/myItem"></script>
</body>
</html>