<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<link rel="stylesheet" href="file/zmiao/images/index/themes/default/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="file/zmiao/images/index/themes/pascal/pascal.css" type="text/css" media="screen" />
<link rel="stylesheet" href="file/zmiao/images/index/themes/orman/orman.css" type="text/css" media="screen" />
<title>壮苗文化-${prj.prjName }</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/proDetail.css">
</head>
<body>
<%-- 	${ priceTitle }<br><br>
	${chouinfo.cfDesc }<br><br>
	${chouinfo.rightsDesc }<br><br>
	${ chouinfo.rtnMulNum}%<br><br> --%>

    <div class="content">
        <div class="inner clearfix">
            <!--左边-->
            <div class="pro__left">
                <div class="left__banner">
					<img src="${ctx}${intro_img}"/>
                </div>
            </div>
            <!--右边-->
            <div class="pro__right top__right">
                <h2>${prj.prjName }</h2>
                <div class="card__box">
                	<c:forEach var="prjTag" items="${prj.prjTag}">
                		<span>${prjTag}</span>
                	</c:forEach>
                </div>
                <!--动态加载条-->
                <div class="scroll_run"><div id="scroll__bar"></div></div>
                <!--项目统计-->
                <div class="pro__count clearfix">
                    <div class="count__list">
                        <div class="count--num" id="countjd">
							<c:if test="${not empty chouInfo}"><fmt:formatNumber type="number" value="${prj.realAmt*100/prj.targAmt}" pattern="0.00" maxFractionDigits="2"/>%</c:if>
							<c:if test="${empty chouInfo}">0%</c:if>
						</div>
                        <div class="count--title">项目进度</div>
                    </div>
                    <div class="count__list">
                        <div class="count--num">${prj.targAmt}元</div>
                        <div class="count--title">筹资目标</div>
                    </div>
                    <div class="count__list">
                        <div class="count--num">${prj.realAmt}元</div>
                        <div class="count--title">打赏金额</div>
                    </div>
                    <div class="count__list">
                        <div class="count--num">		
  						<c:choose>
							<c:when test="${flowSts=='bid'}">
								${prj.bidNum}人
							</c:when>
							<c:otherwise>
								${prj.giveNum}人
							</c:otherwise>
						</c:choose>
						</div>
                        <div class="count--title">
                        	<c:choose>
								<c:when test="${flowSts=='bid'}">
									竞标人数
								</c:when>
								<c:otherwise>
									资助人数
								</c:otherwise>
							</c:choose>
                        </div>
                    </div>

                </div>
                <!--项目发起日期-->
                <div class="pro__date">
                    此项目于<span id="dayForm"></span>发起，截止今日已有<span id="dayNum"></span>天
                </div>
                <!--点赞-->
                <div class="clearfix">
                    <div class="pro_liking fl">
                		<span class="zan__box" id="zanBtn">
                			<img src="${ctx}/file/zmiao/images/proDetail/zanup.png" alt="赞过"   post-type="0" id="z"> 
							<img src="${ctx}/file/zmiao/images/proDetail/zandown.png" alt="未赞"  post-type="1" id="nz">
							<span>点赞</span>
                		</span>
                		(<span id="zanCount">${prj.goodNum}</span>)
                	</div>
                	<div class="fl pro__static">
                		 <c:if test="${prj.flowStsStr }"></c:if> 
                		<!-- 成功 -->
                		<c:if test="${prj.flowSts ==3}"><img src="${ctx }/file/zmiao/images/helpGarden/prostatic_03.png"/></c:if>
                		<!-- 进行中 -->
                		<c:if test="${prj.flowSts ==2}"><img src="${ctx }/file/zmiao/images/helpGarden/prostatic_02.png"/> </c:if>
                		<!-- 失败项目 -->
                		<c:if test="${prj.flowSts ==4}"><img src="${ctx }/file/zmiao/images/helpGarden/prostatic_04.png"/> </c:if>
                		<!-- 尚未开始 -->
                		<c:if test="${prj.flowSts ==1}"><img src="${ctx }/file/zmiao/images/helpGarden/prostatic_01.png"/> </c:if> 
                		
                	</div>	
                </div>	

            </div>
        </div>
        <div class="tab__box">
            <div class="inner clearfix">
                <div class="tab__title">
                    <div class="active">壮苗故事</div><div>TA的支持者</div><div>TA的评论</div>
                </div>
            </div>
        </div>
        <!--tab切换栏-->
        <div class="inner clearfix">
            <!--左边-->
            <div class="pro__left">
                <div class="tab__lists">
                    <!--壮苗故事-->
                    <div class="list active">
                        <!--创始人介绍-->
                        	 <c:forEach var="feature" items="${featureList }" varStatus="itr">
		                        <div class="list__people">
	                         		<c:if test="${not empty feature.featureDesc || not empty feature.featureImgUrl}">
	                         		<!-- 创始人简介 -->
		                        	<c:if test="${feature.featureCode == 01}">
		                        		 <div class="list--title people-title"></div>
                            		    <p>${feature.featureDesc }</p>
                            			<%-- <div class="list__img"><c:if test="${not empty feature.featureImgUrl}"></c:if><img src='${ctx}${feature.featureImgUrl}'/></div> --%>
		                        	</c:if>
		                        <!-- 创业初衷 -->
		                        	<c:if test="${feature.featureCode == 02}">
		                        		 <div class="list--title desc-title"></div>
                            		    <p>${feature.featureDesc }</p>
                            			<div class="list__img"><c:if test="${not empty feature.featureImgUrl}"><img src='${ctx}${feature.featureImgUrl}'/></c:if></div>
		                        	</c:if>
		                        <!-- 团队风采 -->
		                        	<c:if test="${feature.featureCode == 03}">
		                        		<div class="list--title sunny-title"></div>
                            		    <p>${feature.featureDesc }</p>
                            			<div class="list__img"><c:if test="${not empty feature.featureImgUrl}"><img src='${ctx}${feature.featureImgUrl}'/></c:if></div>
		                        	</c:if>
								<!-- 项目介绍 -->
									<c:if test="${feature.featureCode == 04}">
		                        		 <div class="list--title target-title"></div>
                            		    <p>${feature.featureDesc }</p>
                            			<div class="list__img"><c:if test="${not empty feature.featureImgUrl}"><img src='${ctx}${feature.featureImgUrl}'/></c:if></div>
		                        	</c:if>
		                        <!-- 对标的企业以及特点 -->
									<c:if test="${feature.featureCode == 05}">
		                        		 <div class="list--title repay-title"></div>
                            		    <p>${feature.featureDesc }</p>
                            			<div class="list__img"><c:if test="${not empty feature.featureImgUrl}"><img src='${ctx}${feature.featureImgUrl}'/></c:if></div>
		                        	</c:if>
		                        <!-- 竞争优势 -->
									<c:if test="${feature.featureCode == 06}">
		                        		 <div class="list--title style-title"></div>
                            		    <p>${feature.featureDesc }</p>
                            			<div class="list__img"><c:if test="${not empty feature.featureImgUrl}"><img src='${ctx}${feature.featureImgUrl}'/></c:if></div>
		                        	</c:if>
	                         		</c:if> 
                        		</div>	
							</c:forEach>
                    </div>
                    <!--TA的支持者-->
                    <div class="list">
                        <div class="zcz__box">共<font size="-1" color="#fb664a" id="zzCount"></font>资助记录</div>
                        <div class="zcz__lists clearfix"></div>
                        <button class="btn more-zz" id="zzMore">加载更多</button>
                    </div>
                    <!--TA的评论-->
                    <div class="list">
                        <div class="zcz__box">共<font size="-1" color="#fb664a" id="talkCount"></font>评论</div>
                        <div class="say__box clearfix">
                            <div class="say__icon"><img src="<c:if test='${not empty session_member.userLogo}'>${ctx }/${session_member.userLogo }</c:if> <c:if test='${empty session_member.userLogo}'>${ctx }/images/gardenerHome/default.jpg</c:if>"/></div>
                            <div class="say__text">
                                <div class="talk__ele">
                                    <textarea name="" id="" cols="30" rows="10" class="talk__text " placeholder="写下你的评论"></textarea>
                                    <div class="txt__num">还能输入<span>256</span>个字</div>
                                    <c:if test="${empty login}"><div class="talk__text_loginBg"><a href="${ctx}/PtlZm!zmLogin.action?backUrl=PtlZm!prjDetail.action?prePrjCode=${prj.prePrjCode}">请先登录</a></div></c:if>
                                </div>
                                <c:if test="${not empty login}">
                                	<div class="btn__group"><button class="btn btn-cancel" id="talkqx">取消</button><button class="btn btn-talk" id="talkBtn">评论</button></div>
                                </c:if>
                            </div>
                        </div>
                        <div class="talk__lists"></div>
                        <!-- 加载更多 -->
                        <button class="pl__btn" id="morePl">加载更多</button>	
                    </div>
                </div>
            </div>
            <!--右边-->
            <div class="pro__right bottom__right">
                <!--支持他-->
                <div class="zc_box">
                    <div class="zc__top clearfix">
                        <div class="zc__top_left">
                            <div>扫描右侧二维码</div>
                            <div>“支持TA”</div>
                        </div>
                        <div class="zc__top_right">
                        	<img src="${ctx}/file/zmiao/images/proDetail/zc__shou.png" alt="">
                        	<div id="qrcode" class="qrcode"></div>
							<!-- <img id="qrcodeImg zcewm" /> -->
							<div id="qrcodeImg" class="qrcode"></div>
                        	<%-- <img src="${ctx}/file/zmiao/images/proDetail/zcewm_03.png" id="zcewm" alt="二维码"> --%>
                        </div>
                    </div>
                    <p class="zc__bottom">
                    ${chouInfo.rightsDesc}
                   <%--  ${chouinfo.rightsDesc } --%>
        <%--      助创者在本项目最近一次融资时将获得助创金额<font color="fb664a" size="-1">100倍</font>的优先认购权（八折），以及融资成功后十个工作日内<font color="fb664a" size="-1">${ chouinfo.rtnMulNum}%</font>的现金回报  --%>
                    </p>
                </div>
                <!--壮苗服务-->
                <div class="zm__service">
                    <div class="service__banner"><img src="${ctx}/file/zmiao/images/proDetail/service_banner.png" alt="壮苗服务"></div>
                    <div class="service__box">
                    	<c:if test="${not empty dsInfo}">
                    		<div class="teacher__box clearfix">
                            	<div class="teacher_icon fl"><img src="${ctx}/${dsInfo.userLogo}"/></div>
                            	<div class="teacher__desc fl">辅导导师：<span>${dsInfo.userName}</span></div>
                        	</div>
                    	</c:if>
                        <div class="service__lists">
                           <dl>
                                <dt>${priceTitle}</dt>
                                <dd>${priceDesc}</dd>
                           </dl>
                           ${chouinfo.cfDesc }
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
		var info="${prjList }";
		var prePrjCode="${prj.prePrjCode}";
		var cfno="${chouInfo.cfno}";
		var flowstsStr ="${prj.flowStsStr}";
		var mb="${prj.targAmt}";
		var money="${prj.realAmt}";
		var login="${login}";
		var isLike="${isLike}";
		var userLogo="${session_member.userLogo }";
		var proStart="${prj.crtTime}";  /*项目发起日期 */
		var staticName="${flowSts}";
		var chouInfo="${chouInfo.prePrjCode}";
		var rcUrl = "${prj.voteQrCode}";
	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/proDetailMain"></script>
</body>
</html>