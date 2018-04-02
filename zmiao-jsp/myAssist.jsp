
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<title>壮苗文化-我的辅导</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/myAssist.css">
<link rel="stylesheet" href="file/zmiao/css/odometer-theme-default.css">
<script src="file/zmiao/js/lib/jquery-1.8.2.js"></script>

<script>
var eles=[];
var times=[];
//时间截取
function timeSub(className,fatime){
    $(className).each(function(){
    	var e=$(this);
    	var nNum=fatime.substring(0,10);
    	e.text(nNum);
    });
};
//倒计时
function timeDown(t){
    var time=parseInt(t);
    if(time>0){
        var dayCha= time/1000/60/60/24;
        var days=parseInt(dayCha);
        return days;
	}else{
		return "0";
	}
}
//金额计数格式转换
function moneyTo(m,idName){
		$(idName).html(parseInt(m)+"<span>元</span>");
}
//竞标状态
function proStatic(s,idName){
	switch(s){
		case "1":
			$(idName).text("竞标中");
			break;
		case "2":
			$(idName).text("竞标成功");
			break;
		case "3":
			$(idName).text("竞标失败");
			break;
	}
} 


</script>
</head>
<body>
	 <div class="content">
        <div class="inner clearfix">
        	<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
        		<c:if test="${empty investSts}">
        		<div class="fr rightBox">
                <div class="tab__window">
                    <div class="tab__list active">
                    	<c:if test="${not empty rspBidCompet}">
                    		<div class="support__count clearfix">
                            <div class="fl count__num">
                                <div class="clearfix">
                                    <div class="fl count--title">累计佣金</div>
                                    <div class="fl count--num"><span id="tatalAmt"></span>万</div>
                                </div>
                                <div class="clearfix">
                                    <div class="fl count--title">累计辅导项目</div>
                                    <div class="fl count--num"><span><c:if test="${not empty rspBidSize}">${rspBidSize }</c:if><c:if test="${empty rspBidSize}">0</c:if></span>个</div>
                                </div>
                            </div>
                            <div class="fr count__banner">
                                <h3>综合评分</h3>
                                <div class="star clearfix">
                                    <div class="fl starNum">${invest.sumScore }</div>
                                    <div class="fl stars">
                                        <div class="list starList clearfix" id="serveiceStar">服务态度：<span><i></i></span><span><i></i></span><span><i></i></span><span><i></i></span><span><i></i></span></div>
                                        <div class="list starList clearfix"  id="jobStar">工作速度：<span><i></i></span><span><i></i></span><span><i></i></span><span><i></i></span><span><i></i></span></div>
                                        <div class="list starList clearfix"  id="massStar">完成质量：<span><i></i></span><span><i></i></span><span><i></i></span><span><i></i></span><span><i></i></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--正在辅导的项目-->
                        <div class="assistingPro list__box">
                            <h3>正在辅导的项目</h3>
                        	<c:if test="${not empty rspBidGoing}">
                            <div class="assist__pro__box">
                            	<c:forEach var="rsp" items="${rspBidGoing}" varStatus="p">
                            		<div class="list">
                            		<a href="${ctx}/PtlZm!taskDetails.action?ppCode=${rsp.prePrjCode}" target="_blank">
                                    <div class="proLogo"><img src="${ctx}${rsp.prjLogoStr }" alt="" ></div>
                                    <div class="proDesc">
                                        <div class="pro--name">${rsp.prjName }</div>
                                        <div class="pro--person">发起人：${rsp.relUserName }</div>
                                        <div class="pro--time">发起时间：<span id="faqi${p.index}"></span></div>
                                      <script>
                                         var fatime="${rsp.CTime}";
                                         var fqIndex="${p.index}";
                                         timeSub("#faqi"+fqIndex,fatime);
                                         </script>
                                    </div>
                                    <!--项目统计-->
                                    <div class="proCount">
                                        <div class="count__list">
                                            <div class="count--num">${rsp.bidAmt}元</div>
                                            <div class="count--title">辅导佣金</div>
                                        </div>
                                        <div class="count__list">
                                            <div class="count--num">${rsp.svcPercent }%</div>
                                            <div class="count--title">辅导进度</div>
                                        </div>
                                        <div class="count__list">
                                            <div class="count--num fudaoTime" id="fd${p.index}"></div>
                                          <script>
                                         	var fudaotime="${rsp.crtTime }";
                                         	var fuIndex="${p.index}";
                                         	timeSub("#fd"+fuIndex,fudaotime);
                                         </script> 
                                            <div class="count--title">辅导开始时间</div>
                                           
                                        </div>
                                    </div>
                                    <!--剩余天数-->
                                    <div class="days">剩余  <span id="syDay${p.index}" class=" downDay  odometer"></span> 天</div>
                                    <script>
                                    	var sydAY="${rsp.RTimeByMs}";
                                    	var syIndex="${p.index}";
                                    	eles.push("#syDay"+syIndex);
                                    	times.push(timeDown(sydAY));

                                    </script>
                                     </a>
                                </div>

                            	</c:forEach>
                            </div>
                        	</c:if>
                        	<c:if test="${empty rspBidGoing}">
                        		<h4 class="static__title">你没有正在辅导的项目，别灰心，这世界需要你</h4>
                        		<a class="dsBtn" href="${ctx}/PtlZm!prjList.action">看看壮苗项目</a>	
                        	</c:if>

                        </div>
                       </c:if>
                        <!--更多资助项目-->
                        <div class="support__pros  list__box">
                            <h3>竞标的项目</h3>
                            <c:if test="${empty rspBidCompet}">
                        		<h4 class="static__title">你没有竞标过项目，多多竞标，多多收货</h4>
                        		<a class="dsBtn" href="${ctx}/PtlZm!prjList.action">去竞标项目</a>
                        	</c:if>
                        	<c:if test="${not empty  rspBidCompet}">
                        		<div class="pros clearfix">
                            	<c:forEach var="rsp" items="${rspBidCompet}" varStatus="h">
                            		<div class="pro__list">
                            			<a href="${ctx}/PtlZm!prjDetail.action?prePrjCode=${rsp.prePrjCode }" target="_blank">
                                    	<div class="pro--logo"><img src="${ctx}${rsp.prjLogoStr}" alt="" ></div>
                                    		<div class="pro--text">
                                        	<div class="pro--name">${rsp.prjName }</div>
                                        	<div class="pro--desc"><span>${rsp.bidAmt}</span>元</div>
                                        	<div class="pro--label" id="bidSts${h.index}"></div>
                                        	<script>
                                        		var bidSts="${rsp.bidSts}";
                                        		proStatic(bidSts,"#bidSts${h.index}");
                                        	</script>
                                    		</div>
                                    	</a>
                                	</div>
                            	</c:forEach>
                            </div>
                            <!--更多资助项目-->
                            <div class="morePro__box">
                                <div class="more__btn more1">更多竞标项目</div>
                            </div>
                        	</c:if>

                        </div>
                        <!--辅导过的项目-->
                        <c:if test="${not empty rspBids}">
                        	<div class="assistdBox list__box">
                            <h3>辅导过的项目</h3>
                            <div class="assistds clearfix">
                            <c:forEach var="rsp" items="${firstBidList}"  varStatus="i">
                            	 <div class="list">
                            	 	<a href="${ctx}/PtlZm!taskDetails.action?ppCode=${rsp.prePrjCode}" target="_blank">
                                    <div class="list--top">
                                        <div class="list-pro-logo">
											<img src="${ctx}${rsp.prjLogoStr }"/>	
                                        </div>
                                        <div class="list-pro-desc">
                                            <div class="pro-name">${rsp.prjName }</div>
                                            <div class="pro-person">发起人：${rsp.relUserName } <span id="payableAmt${i.index}"></span></div>
                                            <script>
                                            	var payableAmt="${rsp.payableAmt }"; 
                                            	 console.log(payableAmt);
                                            	moneyTo(payableAmt,"#payableAmt${i.index}");
                                            </script>
                                            <div class="pro-time" >完成时间：<span id="wanchen${i.index}"></span></div>
                                          	<script>
                                         		var wantime="${rsp.prjEndTime }";
                                         		var wcTimeIndex="${i.index}";
                                         		timeSub("#wanchen"+wcTimeIndex,wantime);
                                         	</script>
                                        </div>
                                    </div>
                                    <div class="list--bottom">
                                        <div class="evaluate">创业者评价</div>
                                        <p>${rsp.commentDesc }</p>
                                    </div>
                                    </a>
                                </div>
                            </c:forEach>
                            </div>
                            <!--更多资助项目-->
                            <div class="morePro__box">
                                <div class="more__btn more2">更多历史辅导</div>
                            </div>
                        </div>
                        </c:if>

                    </div>
                    </div>
                <!--提交成功弹窗-->
                <div class="successLayer">
                    <p></p>
                </div>
            </div>
        		</c:if>

        		<!-- 导师未认证  认证审核中  信息不完善  没有竞标项目  三种状态 -->
        		<c:if test="${not empty investSts}">
        			<div class="fr rightBox rightBox2">
        			<!-- 未认证 -->
        				<c:if test="${investSts == 0 }">
        					<p>你还没有认证成为壮苗导师，通过审核就能辅导项目啦</p>
        					<a href="${ctx}/PtlZm!zmTtId.action" class="btn-success" target="_blank">认证导师<a/>
        				</c:if>
        			<!-- 审核中 -->
						<c:if test="${investSts == 2 }">
        					<p>你的认证信息正在审核中</p>
        					<a href="${ctx}/PtlZm!prjList.action" class="btn-success" target="_blank">看看壮苗项目<a/>
        				</c:if>
        			<!-- 完善信息 -->
        				<c:if test="${investSts == 4 }">
        					<p>你的信息有些不太完整，<br/>完善导师信息能大大提升审核通过概率哦</p>
        					<a href="${ctx}/PtlZm!zmTtId.action" class="btn-success" target="_blank">完善信息<a/>
        				</c:if>
        			</div>	
        		</c:if>

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
		var f="${investSts}";
		var o="${rspBidGoing}";
		//星星
		var tatalAmt="${totalAmt}";
		var starOne,starTwo,starThree;
		starOne="${invest.evalParm1}";
		starTwo="${invest.evalParm2}";
		starThree="${invest.evalParm3}";
		var sta="${investSts}";
		
	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/myAssistMain"></script>
</body>
</html>