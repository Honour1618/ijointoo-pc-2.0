<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<link rel="shortcut icon" href="file/zmiao/favicon.ico" type="image/x-icon" />
	<title>壮苗文化-导师认证</title>
	<link rel="stylesheet" type="text/css" href="file/zmiao/css/base.css">
	<link rel="stylesheet" type="text/css" href="file/zmiao/css/tutorIdentify.css">
</head>
<body>
	<div class="inner">
		<div class="wrap clearfix">
			<div class="main">
				<div class="jumpTest">
					<iframe src="${ctx }/PtlTf!memLead.action" name="mainFrame" id="mainFrame" frameborder="0" marginheight="0" marginwidth="0" height="436" width="253"></iframe>
					<%-- <jsp:include page="${ctx }/PtlTest!fin.action"></jsp:include> --%>
					<%-- <jsp:include page="PtlTest!finRst.action?prjCode=PP2017063009413334635"></jsp:include> --%>
				</div>
			</div>
			
			<div class="word">
				<img src="${ctx }/file/zmiao/images/tutorIdentify/wenan.png" /><br/>
				<img src="${ctx }/file/zmiao/images/tutorIdentify/qrcodeTest.png" class="qrcodeTest" />
				<img src="${ctx }/file/zmiao/images/tutorIdentify/logo.png" />
			</div>
		</div>
	</div>
	<script>
		var webroot = "${ctx}";
	</script>
	<%-- <script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/startPlan.js"></script> --%>
</body>
</html>