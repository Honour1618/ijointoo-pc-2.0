<%@ include file="/WEB-INF/content/zmiao/header.jsp" %>
<title>壮苗文化-园丁之家-导师列表</title>
<link rel="stylesheet" type="text/css" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/pagination.css">
<link rel="stylesheet" type="text/css" href="file/zmiao/css/directorList.css">
</head>
<body>
	<div class="content inner">
   		<div class="platCondition">
   			<div class="conditionItem clearfix">
   				<div class="conditionLabel fl">所属行业</div>
   				<ul class="conditionSel fl" id="indBox">
   					<li class="active" data-val="">全部</li>
   					<c:forEach var="ind" items="${indList }" varStatus="indStatus">
						<li class="screen--list" data-val="${ind.fieldVal }" >${ind.fieldValChNm}</li>
					</c:forEach>
   				</ul>
   			</div>
   			<div class="conditionItem clearfix">
   				<div class="conditionLabel fl">排　　序</div>
   				<ul class="conditionSel fl" id="rankBox">
   					<li class="screen--list active" data-val="2">默认排序</li>
   					<li class="screen--list" data-val="0">好评率</li>
   					<li class="screen--list" data-val="1">成功项目</li>
   					<li class="screen--list" data-val="2">推荐等级</li>
   				</ul>
   			</div>
   		</div>
   		<div class="director">
   			<ul class="product__lists listDirector"></ul>
   			<div class="clearfix pageNav">
            	<div class="page__list clearfix">
            	    <ul class="Page navigation clearfix"  id="page__box"></ul>
            	  	<div class="page__total" id="pageTotal"></div>
            	</div>
            </div>
   		</div>
   	</div>
   	<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
   	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp" %>
	<script>
		var webroot="${ctx}";
		var count="${pageInfo.total}";
	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/directorListMain"></script>
</body>
</html>