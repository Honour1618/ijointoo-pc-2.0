
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<link rel="stylesheet" href="file/zmiao/images/index/themes/default/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="file/zmiao/images/index/themes/pascal/pascal.css" type="text/css" media="screen" />
<link rel="stylesheet" href="file/zmiao/images/index/themes/orman/orman.css" type="text/css" media="screen" />
<title>壮苗文化-助创园地</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/paging.css">
<link rel="stylesheet" href="file/zmiao/css/helpGarden.css">

</head>


<body>
	<!--内容盒-->
    <div class="content">
        <div class="content__banner"><%-- <img src="${ctx}/file/zmiao/images/helpGarden/helpGardenBg.png" alt="唯美"> --%></div>
        <!--列表-->
        <div class="inner">
            <div class="product__box">
                <!--筛选条件-->
                <div class="screen__box">
                    <!--所属行业-->
                    <div class="screen__industry clearfix">
                        <div class="screen--title">所属行业：</div>
                        <div class="screen--term clearfix" id="induBox">
                        	<div class="screen--list active" data-val="">全部</div>
                        	<c:forEach var="ind" items="${industries }" varStatus="itr">
<%-- 									${ind.key}-${ind.value } --%>
									<div class="screen--list" data-val="${ind.value }" >${ind.key}</div>
							</c:forEach>
                        </div>
                    </div>
                    <!--项目状态-->
                    <div class="screen__product">
                        <div class="screen--title">项目状态：</div>
                        <div class="screen--term clearfix" id="proBox">
                            <div class="screen--list active" data-val="0">全部</div>
                            <div class="screen--list" data-val="1">尚未开始</div>
                            <div class="screen--list " data-val="2">进行中</div>
                            <div class="screen--list" data-val="3">成功项目</div>
                            <div class="screen--list" data-val="4">失败项目</div>
                        </div>
                    </div>
                    <!--所属区域-->
                    <div class="screen__region clearfix">
                        <div class="screen--title">所在区域：</div>
                        <div class="screen--term clearfix" id="regiBox">
                        	<div class="screen--list active" data-val="" >全部</div>
                        	<c:forEach var="province" items="${provinces }" varStatus="itr">
								<div class="screen--list" data-val="${province.value }" >${province.value}</div>
							</c:forEach>
                        </div>
                        <div class="zd-btn" id="zd"></div>	
                    </div>
                </div>
                <!--排序-->
                <div class="sort__box clearfix">
                    <div class="sort__left">排&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序：</div>
                    <div class="sort__right"><div  id="sort__btn">上线时间<input type="button"  class="sort--sty" data-type="1"/></div></div>
                </div>
                <!--搜索列表-->
                <div class="product__Box">
                    <div class="product--title clearfix">
                        <div class="title--desc">项目</div>
                        <div class="title--industry">行业</div>
                        <div class="title--term">所在区域</div>
                        <div class="title--static">项目状态</div>
                    </div>
                    <!--列表-->
                    <div class="product__lists"></div>
                    <div class="clearfix pageNav">
                    	<div class="page__list clearfix">
                    	    <ul class="Page navigation clearfix" id="page__box"></ul>
                    	  	<div class="page__total" id="pageTotal"></div>	
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
	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/helpGardenMain"></script>
</body>
</html>