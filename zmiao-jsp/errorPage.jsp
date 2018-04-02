<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<title>壮苗文化-报错啦</title>
<link rel="stylesheet" type="text/css" href="file/zmiao/css/base.css">
<link rel="stylesheet" type="text/css" href="file/zmiao/css/errorPage.css">
</head>
<body>
	<div class="content inner">
   		<img src="${ctx }/file/zmiao/images/errorPage.png" alt="">
   		<p class="error_tip">${resultTip }</p>
   	</div>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp" %>>
</body>
</html>