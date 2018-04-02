<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>壮苗文化-我的项目-创业初衷</title>
	<link rel="stylesheet" href="file/zmiao/css/base.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/file/zmiao/css/itemMood.css" />
	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
	<script type="text/javascript" src="${ctx }/web/js/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/zmiao/js/app/itemCommon.js"></script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/itemMood"></script>
	<script type="text/javascript">
		var webroot="${ctx}";
	</script>
</head>
<body class="body_color">
	<div class="inner clearfix content">
		<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
		<div class="myCrowdfunds fr">
			<div class="procedure">
				<img class="rightOne" src="${ctx}/file/zmiao/images/person/top_03.png"/>
			</div>
			<div class="registration" id="registration">
			    <form id="ajaxForm" class="form-horizontal" enctype="multipart/form-data" role="form" method="post" action="${ctx }/PtlZm!saveMyPrj.action">
			  		<input type="hidden" name="prjBean.prePrjCode"  value="${prjBean.prePrjCode }" />
					<input type="hidden" name="compFeature.compCode"  value="${prjBean.prePrjCode }" />
					<input type="hidden" name="compFeature.objId"  value="${compFeature.objId}" />
					<input type="hidden" name="compFeature.featureCode"  value="02" />
					<input type="hidden" name="nextFCode"  value="03" />
			  		<input type="hidden" name="terminiPage"  value="itemTeam" />
			        <a href="${ctx}/PtlTf!toPage.action?named=tfexaple&pageNum=3" class="example" target="_blank">样例</a>
			        <ul class="colorChange">
					    <li class="info clearfix">
					    	<label class="fl"><b>*</b>创业初衷</label>
					    	<div class="fontControl fl">
					    		<textarea type="text" name="compFeature.featureDesc" placeholder="在过往的生命中，你深切感受到的切肤之痛"  class="form-control"  id="userAvatar">${compFeature.featureDesc}</textarea>
			        			<p class="compNameL"><strong>0</strong>/512</p>
					    	</div>
			        		<!-- <span class="err_msg_tip" id="userAvatarTip">写太多了</span> -->
			        	</li>
				    </ul>
				    <div class="login-submit">
				        <input type="button" id="btnLogin" class="i_button" value="下一步"/>
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