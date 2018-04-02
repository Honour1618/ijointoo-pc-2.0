
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>

<title>壮苗文化-园丁之家</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/pagination.css">
<link rel="stylesheet" href="file/zmiao/css/gardenerHome.css">

</head>
<body>
	    <!--内容盒-->
    <div class="content">
        <div class="content__banner"><%-- <img src="${ctx }/file/zmiao/images/gardenerHome/teacher-banner.png" alt="唯美"> --%></div>
        <!--导师列表-->
        <div class="inner">
            <div class="gardener__Box">
                <h2 class="gardener--title title">推荐导师</h2>
                <div class="angel__lists clearfix">
 					<c:forEach var="list" items="${investMemList}"  varStatus="itr">
                    	<div class="gardener--list">
                    		<a href="${ctx}/PtlZm!investDetail.action?userId=${list.userId}" />
                        	 <img src="${ctx}/${list.photo}" alt="icon" style="display: block" onerror="javascript:this.src='${ctx}/file/zmiao/images/gardenerHome/${itr.index}.png';"> 
                        	<div class="list__text__box">
                            	<div class="text--name">${list.userName }</div>
                            	<div class="text--partner">${list.position }</div>
                            	<div class="text--company">${list.compName }</div>
                        	</div>
                        	<div class="list__desc">
                            	<p>${list.userDesc }</p>
                        	</div>
                        	</a>
                    	</div>
                	</c:forEach>
				</div>
             </div>
                <button class="btn btn-more-teacher" onclick="location.href='${ctx}/PtlZm!investorList.action'">发现更多导师</button>
            </div>
        <!--分割线-->
        <div class="line"></div>
        <!--最新资助天使-->
        <div class="inner">
            <div class="angel__helper__box">
                <h3 class="angel--title title">最新助创天使</h3>
                <div class="angel__lists clearfix">
                	<c:forEach var="angel" items="${tfChouList}" varStatus="itr">
                		<div class="angel--list">
                			<a href="${ctx}/PtlZm!angelDetail.action?userId=${angel.userId}">
                        		<div class="angel__icon"><img src="${ctx}/${angel.userLogo}" onerror="javascript:this.src='${ctx}/file/zmiao/images/gardenerHome/default.jpg';"/></div>
                        		<div class="angel__text">
                            		<div class="angel--name">${angel.userName}</div>
                            		<div class="angel--desc">${angel.prjName}</div>
                        		</div>
                        	</a>
                    	</div>
                	</c:forEach>
                </div>
            </div>
        </div>
	</div>
 	<script>
		var webroot="${ctx}";
	</script>
	<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
	<!-- 个性化脚本引用 -->
	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/gardenerMain"></script>
</body>
</html>