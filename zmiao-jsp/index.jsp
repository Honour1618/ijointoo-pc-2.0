
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<link rel="stylesheet" href="file/zmiao/images/index/themes/default/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="file/zmiao/images/index/themes/pascal/pascal.css" type="text/css" media="screen" />
<link rel="stylesheet" href="file/zmiao/images/index/themes/orman/orman.css" type="text/css" media="screen" />
<link rel="stylesheet" href="file/zmiao/css/odometer-theme-default.css">
<title>壮苗文化</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">

<link rel="stylesheet" href="file/zmiao/css/index.css">
<link rel="stylesheet" href="file/zmiao/css/nivo-slider.css">
<link rel="stylesheet" href="file/zmiao/css/style.css">
<link rel="stylesheet" href="file/zmiao/css/swiper.min.css">


</head>
<body>
	<!--轮播图-->
	<div class="banner">
		<div id="wrapper">
			<div class="slider-wrapper theme-default">
				<div id="slider" class="nivoSlider">
					<c:forEach var="banner" items="${banners}" >
						<a href="${banner.marketingURL}"><img src="${ctx}${banner.marketingURI}" alt="" title="" /></a>
					</c:forEach>
				</div>
			</div>
			<div class="footer-banner" style="width: 728px; margin: 0 auto"></div>
		</div>
	</div>
	<div class="content">
		<div class="content__jihui">

		</div>
		<!--项目列表-->
		<div class="project__box inner">
			<!--项目分类-->
			<div class="proList__box">
			<!-- 壮苗项目 -->
				<div class="proList clearfix">
					<div class="proList--left fl">
						<div class="proLeft--title"><span>为您推荐</span><a href="${ctx}/PtlZm!prjList.action">更多</a></div>
						<div class="proList__box__l clearfix">
							<c:forEach var="tPrj" items="${suitablePrjs}" varStatus="itr">
								<c:if test="${itr.index%2==0 }">
									<div class="proList__row__box">
									<div>
										<a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${tPrj.prjCode}" target="_blank">
											<div class="list-title">${tPrj.prjName }</div>
											<p>${tPrj.prjDesc }</p>
										</a>
									</div>
									<div><a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${tPrj.prjCode}" target="_blank"><img src='${ctx}${tPrj.introImg }'/></a></div>
									</div>
								</c:if>
								<c:if test="${itr.index%2>0 }">
									<div class="proList__row__box">
										<div><a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${tPrj.prjCode}" target="_blank"><img src="${ctx}${tPrj.introImg }"/></a></div>
										<div>
											<a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${tPrj.prjCode}" target="_blank">
											<div class="list-title">${tPrj.prjName }</div>
											<p>${tPrj.prjDesc }</p>
											</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="proList--right fl">
						<div class="proRight--title">最新入驻</div>
						<div class="proList__box__r clearfix">
								<div >
									<div class="swiper-container" id="proListImg">
  										<div class="swiper-wrapper">
    										<c:forEach var="tPrj" items="${tdyPrjs }">
    											<a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${tPrj.prjCode}" target="_blank" class="swiper-slide">
    												<img src="${ctx}${tPrj.introImg }"/>
    												<div class="list-title">${tPrj.prjName }</div>
													<p>
														<c:if test="${empty tPrj.prjDesc }">-</c:if>
														<c:if test="${not empty tPrj.prjDesc }">${tPrj.prjDesc}</c:if>
													</p>
    											</a>
											</c:forEach>
  										</div>
									</div>
								</div>
								<%-- <div>
									<div class="swiper-container" id="proList">
    									<div class="swiper-wrapper">
        									<c:forEach var="tPrj" items="${tdyPrjs }">
												<div class="swiper-slide">
													<a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${tPrj.prjCode}" target="_blank">
													<div class="list-title">${tPrj.prjName }</div>
													<p><c:if test="${empty tPrj.prjDesc }">-</c:if><c:if test="${not empty tPrj.prjDesc }">${tPrj.prjDesc}</c:if></p>
													</a>
												</div>
											</c:forEach>
    									</div>
									</div>
								</div> --%>
						</div>
					</div>
				</div>
				<!-- 微天使 -->
				<div class="proList clearfix">
					<div class="proList--left fl">
						<div class="proLeft--title"><span>为您推荐</span><a href="${ctx}/PtlZm!gardenerHome.action">更多</a></div>
						<div class="proList__box__l clearfix" id="angelLeft">
							<c:forEach var="member" items="${suitableWts }">
								<div class="angel_list clearfix" >
									<a href="${ctx}/PtlZm!angelDetail.action?userId=${member.userId}" target="_blank">
									<div class="list__left"><img src="${ctx}/${member.userLogo }"/></div>
									<div class="list__right">
										<div class="angel_list__title">${member.userName }</div>
										<div class="angel_list__desc"><c:if test="${empty member.investIdea}">-</c:if><c:if test="${not empty member.investIdea}">${member.investIdea}</c:if></div>	
									</div>	
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="proList--right fl">
						<div class="proRight--title">最新入驻</div>
						<div class="proList__box__r clearfix">
							<div class="swiper-container" id="angelToday">
  								<div class="swiper-wrapper">
 									<c:forEach var="member" items="${tdyWts }">
										<div class="swiper-slide" >
											<a href="${ctx}/PtlZm!angelDetail.action?userId=${member.userId}" target="_blank">
											<div class="angel_list clearfix">
												<div class="list__icon"><img src="${ctx}/${member.userLogo }"/></div>	
												<div class="angel_list__title">${member.userName }</div>
												<div class="angel_list__desc"><c:if test="${empty member.investIdea}">-</c:if><c:if test="${not empty member.investIdea}">${member.investIdea}</c:if></div>	
											</div>
											</a>
										</div>
									</c:forEach> 
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- 导师 -->
				<div class="proList clearfix">
					<div class="proList--left fl">
						<div class="proLeft--title"><span>为您推荐</span><a href="${ctx}/PtlZm!investorList.action">更多</a></div>
						<div class="proList__box__l clearfix" id="teacherLeft">
							<c:forEach var="invMem" items="${suitableDs }">
								<div class="angel_list" >
								<a href="${ctx}/PtlZm!investDetail.action?userId=${invMem.userId}" target="_blank">
									<div class="list__left"><img src="${ctx}/${invMem.userLogo }"/></div>
									<div class="list__right">
										<div class="angel_list__title">${invMem.userName }</div>
										<div class="angel_list__desc"><c:if test="${empty invMem.investIdea}">-</c:if><c:if test="${not empty invMem.investIdea}">${invMem.investIdea}</c:if></div>	
									</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="proList--right fl">
						<div class="proRight--title">最新入驻</div>
						<div class="proList__box__r clearfix">
							<div>
								<div class="swiper-container" id="angelLike">
  								<div class="swiper-wrapper">
									<c:forEach var="invMem" items="${tdyDs }">
										<div class="swiper-slide" >
											<div class="angel_list clearfix">
											<a href="${ctx}/PtlZm!investDetail.action?userId=${invMem.userId}" >
												<div class="list__icon"><img src="${ctx}/${invMem.userLogo }"/></div>	
												<div class="angel_list__title">${invMem.userName }</div>
												<div class="angel_list__desc"><c:if test="${empty invMem.investIdea}">-</c:if><c:if test="${not empty invMem.investIdea}">${ invMem.investIdea}</c:if></div>	
												</a>
											</div>
										</div>
									</c:forEach>
								</div>
								</div>
	
							</div>

						</div>
					</div>
				</div>
			</div>

			<!--项目切换-->
			<div class="proTab__box">
				<div class="pro--tab active">壮苗项目</div>
				<div class="pro--tab">微天使</div>
				<div class="pro--tab">导师</div>
			</div>
		</div>
		<!--发起壮苗-->
		<div class="zm__box">
			<div class="zm__top"></div>
			<div class="zm__middle">
				<div class="inner">
					<div class="zmPro__box clearfix">
						<div class="zmPro__left zm__cd">
							<img src="${ctx}/file/zmiao/images/index/prozm.png" class="proImgHover" alt="壮苗项目">
							<a class="img__mask" href="${ctx}/PtlZm!prjList.action"><span>去看项目</span></a>
						</div>
						<div class="zmPro__right" >
							<h3>壮苗项目</h3>
							<p>
								点滴雨露，汇成甘泉浇灌壮苗项目，<br>创业圆梦需要你的力量
							</p>
							<p>
								Oasis potted of the meeting of drizzle, achieving dreams need<br>
								efforts of you.
							</p>
						</div>
					</div>
					<div class="zmFq__box clearfix">
						<div class="zmPro__left">
							<h3>发起壮苗</h3>
							<p>
								集合智慧和资源，让你的项目快快长大，<br>你的创业之路不再孤单
							</p>
							<p>
								Gather intelligences and resources, growing your project taller<br>
								and quicker, your entrepreneurship road no longer alone.
							</p>
						</div>
						<div class="zmPro__right zm__cd">
							<img src="${ctx}/file/zmiao/images/index/fazm.png" class="proImgHover" alt="发起项目">
							<a class="img__mask" href="${ctx}/PtlZm!zmTest.action"><span>发起项目</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="zm__bottom"></div>
		</div>
		<!--数据统计-->
		<div class="data__box">
			<div class="inner clearfix">
				<div class="data__List">
					<div class="data--count odometer" id="proCount">0</div>
					<div class="data--tittle">创业项目</div>
				</div>
				<div class="data__List">
					<div class="data--count odometer"  id="angelCount">0</div>
					<div class="data--tittle" >壮苗微天使</div>
				</div>
				<div class="data__List">
					<div class="data--count odometer"  id="dsCount">0</div>
					<div class="data--tittle">导师园丁</div>
				</div>
				<div class="data__List">
					<div class="data--count odometer"  id="okCount">0</div>
					<div class="data--tittle">成功项目</div>
				</div>
			</div>
		</div>
		<!--合作伙伴-->
		<div class="service__box inner ">
			<h3>合作伙伴</h3>
			<div class="service__lists clearfix">
				<c:forEach var="partner" items="${partners }">
					<div>
						<a href="${partner.marketingURL }"><img src="${partner.marketingURI }" alt="${partner.marketingDesc }"></a>	
					</div>	
				</c:forEach>
			</div>

		</div>
	</div>
		<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
	<!-- 个性化脚本引用 -->
	<script>
		var webroot="${ctx}";
		var pro="${dataCount.prj_total }";
		var angel="${dataCount.wts_total }";
		var ds="${dataCount.ds_total }";
		var prj="${dataCount.prj_suc_total }";

	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/indexMain"></script>
</body>
</html>