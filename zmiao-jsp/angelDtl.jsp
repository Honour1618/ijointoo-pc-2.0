<%@ include file="/WEB-INF/content/zmiao/header.jsp" %>
<title>壮苗文化-园丁之家-天使详情</title>
<link rel="stylesheet" type="text/css" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/pagination.css">
<link rel="stylesheet" type="text/css" href="file/zmiao/css/angelDtl.css">
</head>
<body>
	<div class="briefInfo">
		<%-- <img src="${ctx }/file/zmiao/images/directorDtl/directorInfo.jpg" alt=""> --%>
		<div class="brief">
			<img src="${ctx }/${memberInfo.userLogo }" alt="" class="briefLogo">
			<h3>${memberInfo.userName }</h3>
			<p>${memberInfo.userComp } <c:if test="${not empty memberInfo.userComp && not empty memberInfo.position }">|</c:if> ${memberInfo.position }</p>
			<c:if test="${empty memberInfo.userComp && empty memberInfo.position }">
				<p class="noneLocal">公司未填写 | 职位未填写</p>
			</c:if>
			<c:if test = "${isFocus == 1 }">
				<button class="focus_gz focusPlus"></button>
			</c:if>
			<c:if test ="${isFocus == 0 }">
				<button class="focus_gz focusMinus"></button>
			</c:if>
		</div>
	</div>

	<div class="content inner clearfix">
		<div class="contentL fl">
			<div class="helpItem">
				<h3>资助过的项目</h3>
				<ul>
					<c:forEach var="pro" items="${tfChouList }" varStatus="statu">
						<li>
							<a class="clearfix" href="${ctx }/PtlZm!prjDetail.action?prePrjCode=${pro.prePrjCode}">
								<div class="itemIn fl">
									<h4>${pro.prjName }<span class="helpTime helpTime${statu.index }"><%-- ${pro.crtTime } --%></span></h4>
									<p>${pro.prjDesc }</p>
									<ol class="clearfix">
										<li class="fl">目标：<strong>${pro.targAmtStr }元</strong></li>
										<li class="fl">已筹：<strong>${pro.realAmt }元</strong></li>
										<li class="fl">资助：<strong>${pro.giveNum }人</strong></li>
									</ol>
								</div>
								<div class="startItem fr">
									<img src="${ctx }/${pro.prjUserLogo }" alt="">
									<h5>${pro.prjUserName }<br/><span>（项目发起人）</span></h5>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
				<c:if test="${empty tfChouList }">
					<p class="noneInfo">没有资助过项目</p>
				</c:if>
			</div>
		</div>
		<div class="contentR fr">
			<div class="focus">
				<span><strong>${memberInfo.focusNum }</strong><br/>关注</span>
				<span><strong class="fansNum">${memberInfo.fansNum }</strong><br/>粉丝</span>
			</div>
			<div class="region">
				<ul>
					<li>
						<label for="">所在区域：</label>
						<c:if test="${not empty memberInfo.province }">
							<p>${memberInfo.province }</p>
						</c:if>
						<c:if test="${empty memberInfo.province }">
							<p class="noneBrief">未选择</p>
						</c:if>
					</li>
					<li>
						<label for="">简　　介：</label>
						<c:if test="${not empty memberInfo.userDesc }">
							<p>${memberInfo.userDesc }</p>
						</c:if>
						<c:if test="${empty memberInfo.userDesc }">
							<p class="noneBrief">我要好好想想再介绍自己~</p>
						</c:if>
					</li>
					<li>
						<label for="">关注领域：</label>
						<c:if test="${not empty memberInfo.userRangStr }">
							<p>
								<c:forEach var="rang" items="${memberInfo.userRangStr }" varStatus="statu">
									<i>${rang}</i>
								</c:forEach>
							</p>
						</c:if>
						<c:if test="${empty memberInfo.userRangStr }">
							<p class="noneBrief">未选择</p>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
   	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp" %>
	<script text="text/javascript">
		var webroot = "${ctx}";
		var userId = "${memberInfo.userId }";
		var itemStartArr = [];// 项目发起时间
		<c:forEach var="pro" items="${tfPrjList }" >
			itemStartArr.push("${pro.crtTime }");
		</c:forEach>
	</script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/angelDtl.js"></script>
</body>
</html>