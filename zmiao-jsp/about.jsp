<%@ include file="/WEB-INF/content/zmiao/header.jsp" %>
<title>壮苗文化-关于壮苗</title>
<link rel="stylesheet" type="text/css" href="file/zmiao/css/base.css">
<link rel="stylesheet" type="text/css" href="file/zmiao/css/about.css">

</head>
<body>
	<div class="about_banner"></div>
	<div class="inner content">
		<div class="wrap">
			<div class="company_brief">
				<p><strong>上海壮苗文化发展有限公司</strong>是爱就投旗下一家专门为创业者提供创业辅导、培训服务的平台。</p>
				<p>创业者通过助创+众包的方式邀请平台上入驻并认证的创业导师对自己的项目进行创业辅导。创业导师通过壮苗计划，发现自己感兴趣的项目，用自己的专业知识、经验和资源，帮助创业者梳理商业计划，确立商业模式和明确定位，推荐战略资源，并引荐领投机构，同时收获助创金。平台上海量的微天使可以为创业者提供资源支持，帮助创业者发展。截至目前已经成功辅导几十家企业。</p>
				<div class="about01">
					<img src="${ctx }/file/zmiao/images/about/about01.png" />
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="contact_us">
				<div class="about02">
					<img src="${ctx }/file/zmiao/images/about/about02.png" />
				</div>
				<div class="contact_way">
					<img src="${ctx }/file/zmiao/images/about/company_img.jpg" />
					<p><strong>市场合作：</strong>陈兰飞  chenlf@ijointoo.com     微信ID：NancyCLF</p>
					<p><strong>项目合作：</strong>李远谋 liym@ijointoo.com      微信ID：liyuanmouxigua</p>
					<p><strong>媒体合作：</strong>张婷云 zhangty@ijointoo.com      微信ID：yyd2dashu</p>
					<p><strong>公司名称：</strong>上海壮苗文化发展有限公司</p>
					<p><strong>官方客服咨询热线：</strong>400-6391229</p>
					<p><strong>合作邮箱：</strong>market@ijointoo.com</p>
					<p><strong>电子邮箱：</strong>market@ijointoo.com</p>
					<p><strong>微信公众号：</strong>i9tou_pub</p>
					<p><strong>公司地址：</strong>上海市南翔镇沪宜公路1185号高科商务中心（爱就投大厦）二十楼</p>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp" %>
	<script type="text/javascript">
		var webroot = "${ctx}";
	</script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/about.js"></script>
</body>
</html>