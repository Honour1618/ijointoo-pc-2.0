<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>壮苗文化-我的项目-团队介绍</title>
    <link rel="stylesheet" href="file/zmiao/css/base.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/file/zmiao/css/itemTeam.css" />
	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
	<script type="text/javascript" src="${ctx }/web/js/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/zmiao/js/app/itemCommon.js"></script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/itemTeam"></script>
	<script type="text/javascript">
		var webroot="${ctx}";
		var featureImgUrl = "${compFeature.featureImgUrl}";
	</script>
</head>
<body class="body_color">
	<div class="inner clearfix content">
		<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
		<div class="myCrowdfunds fr">
			<div class="procedure">
				<img class="rightOne" src="${ctx}/file/zmiao/images/person/top_04.png"/>
			</div>
			<div class="registration" id="registration">
			    <form id="ajaxForm" class="form-horizontal" enctype="multipart/form-data" role="form" method="post" action="${ctx }/PtlZm!saveMyPrj.action">
					<input type="hidden" name="prjBean.prePrjCode"  value="${prjBean.prePrjCode }" />
					<input type="hidden" name="compFeature.compCode"  value="${prjBean.prePrjCode }" />
					<input type="hidden" name="compFeature.objId"  value="${compFeature.objId}" />
					<input type="hidden" name="compFeature.featureCode"  value="03" />
					<input type="hidden" name="nextFCode"  value="04" />
			  		<input type="hidden" name="terminiPage"  value="itemBrief" />
			  		<a id="jumpNext">跳过</a>
			        <a href="${ctx}/PtlTf!toPage.action?named=tfexaple&pageNum=4" class="example" target="_blank">样例</a>
			        <ul class="colorChange">
			        	<li class="info">
					    	<label><strong></strong>团队风采</label>
					    	<div class="upload"><img src="${ctx }/file/zmiao/images/person/add_logo.png" /></div>
					    	<input type="file" name="attach" placeholder="请上传PNG、JPG、GIF格式你的电子名片或名片照片" id="userAvatar" class="form-control" accept="image" capture="camera" value="${ctx }${compFeature.featureImgUrl}"/>
							<div class="show_item"  id="user_avatar_show">
								<c:if test="${not empty compFeature.featureImgUrl}">
									<img src="${ctx }${compFeature.featureImgUrl}" class="item" />
								</c:if>
							</div>
							<div class="alt_pic">
								<img src="${ctx }/file/zmiao/images/person/alt_pic.png" />
								<input type="file" name="attach" placeholder="请上传PNG、JPG、GIF格式你的电子名片或名片照片"  class="form-control"  id="userAvatar2" accept="image" capture="camera" />
							</div>
							<div class="alt_msg">
								<p class="alt_msg_con">支持jpg、png格式图片：推荐尺寸640*360</p>
								<span class="err_msg_tip" id="userAvatarTip">图片还没上传呢</span>
							</div>
			        	</li>
					    <li class="info clearfix">
					    	<label class="fl"><strong></strong>核心团队</label>
					    	<div class="fontControl fl">
					    		<textarea type="text" placeholder="有实力的核心团队，会让投资人对你的项目更加信任。（例如：CTO:xxxxxx）" id="heiNum"  class="form-control" name="compFeature.featureDesc">${compFeature.featureDesc}</textarea>
			        			<p class="compNameL"><strong>0</strong>/512</p>
			        		</div>
			        	</li>
				    </ul>
				    <div class="login-submit">
				    	<input type="hidden" id="user_avatar_data" name="zipHeadPic"/>
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