<%@ include file="/WEB-INF/content/zmiao/header.jsp" %>
<title>壮苗文化-园丁之家-导师详情</title>
<link rel="stylesheet" type="text/css" href="file/zmiao/css/base.css">
<link rel="stylesheet" type="text/css" href="file/zmiao/css/directorDtl.css">
</head>
<body>
	<div class="briefInfo">
		<%-- <img src="${ctx }/file/zmiao/images/directorDtl/directorInfo.jpg" alt=""> --%>
		<div class="brief">
			<img src="${ctx }/${investMemInfo.userLogo }" alt="" class="briefLogo">
			<h3><strong>${investMemInfo.userName }</strong><img src="${ctx }/file/zmiao/images/directorDtl/level_0${investMemInfo.recommLevel }.png" alt="" class="briefLevel"></h3>
			<p>${investMemInfo.compName } <c:if test="${not empty investMemInfo.compName && not empty investMemInfo.position }">|</c:if> ${investMemInfo.position }</p>
			<c:if test="${empty investMemInfo.compName && empty investMemInfo.position }">
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
			<div class="backCase">
				<h3>过往案例</h3>
				<ul>
					<c:forEach var="memFeature" items="${memFeatures}">
						<li class="clearfix">
							<img class="fl" src="${ctx}/${memFeature.featureImgUrl }" />
							<div class="caseInfo">
								<h4>${memFeature.featureTitle }</h4>
								<p>${memFeature.featureDesc }</p>
							</div>
						</li>
					</c:forEach>
				</ul>
				<c:if test="${empty memFeatures}">
					<p class="noneInfo">未填写过往案例</p>
				</c:if>
			</div>
			<div class="helpItem">
				<h3>辅导过的项目</h3>
				<ul>
					<c:forEach var="rspBid" items="${rspBids }" varStatus="statu">
						<li>
							<a class="clearfix" href="${ctx }/PtlZm!prjDetail.action?prePrjCode=${rspBid.prePrjCode }">
								<div class="itemIn fl">
									<h4>${rspBid.prjName }<span class="helpTime helpTime${statu.index }"><%-- ${rspBid.CTime } --%></span></h4>
									<p>${rspBid.prjDesc }</p>
									<ol>
										<li>
											<div class="startComment">
												<span class="fl">服务评论<%-- ${rspBid.avgNum } --%></span>
												<div class="service service${statu.index }">
													<p>
														<span><i class="star0"></i></span>
														<span><i class="star1"></i></span>
														<span><i class="star2"></i></span>
														<span><i class="star3"></i></span>
														<span><i class="star4"></i></span>
													</p>
													<p>${rspBid.commentDesc }</p>
												</div>
											</div>
										</li>
									</ol>
								</div>
								<div class="startItem fr">
									<img src="${ctx}/${rspBid.relUserLogo}" onerror="javascript:this.src='data/common/default.jpg';" alt="">
									<h5>${rspBid.relUserName }<br/><span>（项目发起人）</span></h5>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
				<c:if test="${empty rspBids }">
					<p class="noneInfo">没有辅导过项目</p>
				</c:if>
			</div>
			<div class="comment">
				<h3>评论</h3>
				<ul id="comment_wrap">
					<c:forEach var="discuss" items="${forumList }" varStatus="status">
						<li class="clearfix">
							<img src="${ctx }/${discuss.userLogo }" onerror="javascript:this.src='data/common/default.jpg';" alt="" class="fl">
							<div class="commentor fr">
								<h4>${discuss.userName }</h4>
								<span class="commenT${status.index }"></span>
								<p class="face_discuss${status.index }"><%-- ${discuss.reqcontent } --%></p>
							</div>
						</li>
					</c:forEach>
				</ul>
				<c:if test="${not empty forumList }">
					<button id="load_more_btn" page-num="${pageInfo.total}">查看更多评论</button>
				</c:if>
				<c:if test="${empty forumList }">
					<p class="noneInfo">没有评论</p>
				</c:if>
			</div>
		</div>
		<div class="contentR fr">
			<div class="focus">
				<span><strong>${investMemInfo.focusNum }</strong><br/>关注</span>
				<span><strong class="fansNum">${investMemInfo.fansNum }</strong><br/>粉丝</span>
			</div>
			<div class="region">
				<ul>
					<li>
						<label for="">所在区域：</label>
						<c:if test="${not empty investMemInfo.areaRang }">
							<p>${investMemInfo.areaRang }</p>
						</c:if>
						<c:if test="${empty investMemInfo.areaRang }">
							<p class="noneBrief">未选择</p>
						</c:if>
					</li>
					<li>
						<label for="">简　　介：</label>
						<c:if test="${not empty investMemInfo.userDesc }">
							<p>${investMemInfo.userDesc }</p>
						</c:if>
						<c:if test="${empty investMemInfo.userDesc }">
							<p class="noneBrief">我要好好想想再介绍自己~</p>
						</c:if>
					</li>
					<li>
						<label for="">关注领域：</label>
						<c:if test="${investMemInfo.userRangStr != 'null' }">
							<p>
								<c:forEach var="rang" items="${investMemInfo.userRangStr }" varStatus="statu">
									<i>${rang}</i>
								</c:forEach>
							</p>
						</c:if>
						<c:if test="${investMemInfo.userRangStr == 'null' }">
							<p class="noneBrief">未选择</p>
						</c:if>
					</li>
					<li>
						<label for="">投资阶段：</label>
						<c:if test="${not empty investMemInfo.invstStagesStr }">
							<p>
								<c:forEach var="stage" items="${investMemInfo.invstStagesStr }" varStatus="statu">
									<i>${stage}</i>
								</c:forEach>
							</p>
						</c:if>
						<c:if test="${empty investMemInfo.invstStagesStr }">
							<p class="noneBrief">未选择</p>
						</c:if>
					</li>
					<li>
						<label for="">投资理念：</label>
						<c:if test="${not empty investMemInfo.investIdea }">
							<p>${investMemInfo.investIdea }</p>
						</c:if>
						<c:if test="${empty investMemInfo.investIdea }">
							<p class="noneBrief">未填写</p>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
   	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp" %>
	<script>
		var webroot = "${ctx}";
		var commentTotal = "${pageInfo.total}";
		var userId = "${investMemInfo.userId }";
		var starNumArr = [];//评论等级
		var itemStartArr = [];// 项目服务时间
		var commenTArr = [];// 评论时间
		var faceArr = [];//表情转义
		<c:forEach var="rspBid" items="${rspBids }">
			starNumArr.push("${rspBid.avgNum }");
		</c:forEach>
		<c:forEach var="rspBid" items="${rspBids }" varStatus="statu">
			itemStartArr.push("${rspBid.CTime }");
		</c:forEach>
		<c:forEach var="discuss" items="${forumList }" varStatus="status">
			commenTArr.push("${discuss.reqTime }");
			faceArr.push("${discuss.reqcontent }")
		</c:forEach>
			console.log(faceArr);
	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/directorDtl.js"></script>
</body>
</html>