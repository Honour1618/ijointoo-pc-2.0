<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>壮苗文化-我的项目-项目介绍</title>
    <link rel="stylesheet" href="file/zmiao/css/base.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/file/zmiao/css/itemBrief.css" />
	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
	<script type="text/javascript" src="${ctx }/web/js/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/zmiao/js/app/itemCommon.js"></script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/itemBrief"></script>
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
				<img class="rightOne" src="${ctx}/file/zmiao/images/person/top_05.png"/>
			</div>
			<div class="registration" id="registration">
			    <form id="ajaxForm" class="form-horizontal" enctype="multipart/form-data" role="form" method="post" action="${ctx }/PtlZm!saveMyPrj.action">
					<input type="hidden" name="prjBean.prePrjCode"  value="${prjBean.prePrjCode }" />
					<input type="hidden" name="compFeature.compCode"  value="${prjBean.prePrjCode }" />
					<input type="hidden" name="compFeature.objId"  value="${compFeature.objId}" />
					<input type="hidden" name="compFeature.featureCode"  value="04" />
			  		<input type="hidden" name="terminiPage"  value="itemBP" />
			        <a href="${ctx}/PtlTf!toPage.action?named=tfexaple&pageNum=5" class="example" target="_blank">样例</a>
			        <ul class="colorChange">
			        	<li class="info" id="prjUp">
					    	<label><b></b>项目图片</label>
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
					    	<label class="fl"><b>*</b>项目简介</label>
					    	<div class="fontControl fl">
					    		<textarea name="compFeature.featureDesc" placeholder="请描述一下你的项目内容以及你已经做到了什么"  class="form-control" id="itemDesc">${compFeature.featureDesc}</textarea>
			        			<p class="compNameL"><strong>0</strong>/512</p>
			        		</div>
			        	</li>
			        	<li class="info clearfix">
					    	<label class="fl"><b>*</b>对标企业</label>
					    	<div class="fontControl fl">
					    		<textarea name="content2" placeholder="请举例说明2-3家当前市场上同类型的有影响力的企业，及他们的特点信息如果没有，可填无" id="itemFeature" class="form-control">${content2}</textarea>
			        			<p class="compNameL"><strong>0</strong>/512</p>
			        		</div>
			        	</li>
			        	<li class="info clearfix">
					    	<label class="fl"><b>*</b>竞争优势</label>
					    	<div class="fontControl fl">
					    		<textarea name="content3" placeholder="为什么是我， 我有什么优势来做这个事情"  class="form-control" id="itemAdvantage">${content3}</textarea>
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