<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>壮苗文化-我的项目-上传BP</title>
    <link rel="stylesheet" href="file/zmiao/css/base.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/file/zmiao/css/itemBP.css" />
	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
	<script type="text/javascript" src="${ctx }/web/js/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/zmiao/js/app/itemCommon.js"></script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/itemBP"></script>
	<script type="text/javascript">
		var webroot="${ctx}";
		var rspBussPPT = "${tfPrjInfo.bpUrl}";
	</script>
</head>
<body class="body_color">
	<div class="inner clearfix content">
		<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
		<div class="myCrowdfunds fr">
			<div class="procedure">
				<img class="rightOne" src="${ctx}/file/zmiao/images/person/top_06.png"/>
			</div>
			<div class="registration" id="registration">
			    <form id="ajaxForm" class="form-horizontal" enctype="multipart/form-data" role="form" method="post" action="${ctx }/PtlZm!saveMyPrj.action">
					<input type="hidden" name="compFeature.compCode"  value="${prjBean.prePrjCode }" />
			  		<input type="hidden" name="terminiPage"  value="myProject" />
			  		<input type="hidden" name="prjBean.prePrjCode" value="${prjBean.prePrjCode }"/>
			  		<input type="hidden" name="bpUpFlag"  value="1"/>
			        <ul class="colorChange">
			        	<li class="info">
							<label id="tfup_icon2"><b>*</b>进展附件(如修改好的商业计划书)</label>
							<%-- <a href="${ctx }/data/comm/ijointoo_bp_t.pdf" class="bussiness_plan cred">BP制作帮助文档</a> --%>
							<c:if test="${empty prjBean.bpUrl}">
								<span class="upload">上传文件</span>
								<input type="file" class="form-control" accept="application/pdf,.pdf" id="plantBook" name="attach" value="${ctx }/${prjBean.bpUrl}"/>
							</c:if>
							<div class="preImageContent">
								<pre class="abLoad">${prjBean.bpUrl }</pre>
							</div>
							<c:if test="${not empty prjBean.bpUrl}">
								<div class="alt_pic">
									<span class="reupload">重新上传</span>
									<a href="${ctx}/PtlTf!toPage.action?named=tfpreview&compFeature.compCode=${prjBean.prePrjCode}" name="user_avatar_data" target="_blank">预览</a>
									<input type="file" class="form-control" accept="application/pdf,.pdf" id="plantBook2" name="attach" value="${ctx }/${prjBean.bpUrl}"/>
								</div>
							</c:if>
							<p>请选择PDF文件，文件大小不要超过20M<a href="${ctx}/htmlview/appDoc/agreement/bSecret.html" class="secret" target="_blank">《商业计划书保密协议》</a></p>
						</li>
				    </ul>
				    <div class="login-submit">
				        <input type="button" id="btnLogin" class="i_button" value="提交"/>
				        <a href="${ctx }/htmlview/appDoc/agreement/entreprisePromise.html" class="cred" target="_blank">提交即同意<span>《创业者承诺》</span></a>
				    </div>
			    </form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
</body>
</html>