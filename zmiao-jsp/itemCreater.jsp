<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>壮苗文化-我的项目-创始人简介</title>
	<link rel="stylesheet" href="file/zmiao/css/base.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/file/zmiao/css/itemCreater.css" />
	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
	<script type="text/javascript" src="${ctx }/web/js/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/zmiao/js/app/itemCommon.js"></script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/itemCreater"></script>
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
				<img class="rightOne" src="${ctx}/file/zmiao/images/person/top_02.png"/>
			</div>
			<div class="registration" id="registration">
			    <form id="ajaxForm" class="form-horizontal" enctype="multipart/form-data" role="form" method="post" action="${ctx }/PtlZm!saveMyPrj.action">
					<input type="hidden" name="prjBean.prePrjCode"  value="${prjBean.prePrjCode }" />
					<input type="hidden" name="compFeature.compCode"  value="${prjBean.prePrjCode }" />
					<input type="hidden" name="compFeature.featureCode"  value="01" />
					<input type="hidden" name="compFeature.objId"  value="${compFeature.objId}" />
					<input type="hidden" name="nextFCode"  value="02" />
			  		<input type="hidden" name="terminiPage"  value="itemMood" />
			        <a href="${ctx}/PtlTf!toPage.action?named=tfexaple&pageNum=2" class="example" target="_blank">样例</a>
			        <ul class="colorChange">
					    <li class="info">
					    	<label class="vertical_top"><b>*</b>个人风采</label>
					    	<div class="upload"><img src="${ctx }/file/zmiao/images/person/add_logo.png" /></div>
					    	<input type="file" name="attach" placeholder="请上传PNG、JPG、GIF格式你的电子名片或名片照片"  class="form-control"  id="userAvatar" accept="image" capture="camera" value="${ctx }${compFeature.featureImgUrl}"/>
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
			        		<label class="fl"><b>*</b>自我介绍</label>
			        		<div class="fontControl fl">
			        			<textarea type="text" class="form-control" placeholder="告诉大家你是谁，可以使得投资人或投资行家对你更加青睐！（例如：我的职责是XXX，我的工作/创业经历等）" id="compName" name="compFeature.featureDesc">${compFeature.featureDesc}</textarea>
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