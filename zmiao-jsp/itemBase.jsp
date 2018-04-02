<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>壮苗文化-我的项目-基础信息</title>
	<link rel="stylesheet" href="file/zmiao/css/base.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/file/zmiao/css/itemBase.css" />
	<script type="text/javascript" src="${ctx }/file/commonJs/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/commonJs/exif.js"></script>
	<script type="text/javascript" src="${ctx }/web/js/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="${ctx}/file/zmiao/js/app/itemCommon.js"></script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/itemBase"></script>
	<script type="text/javascript">
		var webroot="${ctx}";
		var compRngList = "${compRngList }";//所属行业
		var industry = "${prjBean.industryStr}";
		var provinces = "${provinces }";//所属区域
		var address = "${prjBean.address}";
		var finStageList = "${finStageList }"; //所属阶段
		var stage = "${prjBean.finStageStr}";
		var prjLogoStr = "${prjBean.prjLogoStr}";//项目LOGO
	</script>
</head>
<body>
	<div class="body_color">
		<div class="inner clearfix content">
			<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
			<div class="myCrowdfunds fr">
				<div class="procedure">
					<img class="rightOne" src="${ctx}/file/zmiao/images/person/top_01.png"/>
				</div>
				<div class="registration" id="registration">
				    <form id="ajaxForm" class="form-horizontal" enctype="multipart/form-data" role="form" method="post" action="${ctx }/PtlZm!saveMyPrj.action">
				  		<input type="hidden" name="prjBean.update"  value="${prjBean.update }" />
				  		<input type="hidden" name="prjBean.objId"  value="${prjBean.objId }" />
				  		<input type="hidden" name="prjBean.prePrjCode"  value="${prjBean.prePrjCode }" />
				  		<input type="hidden" name="terminiPage"  value="itemCreater" />
				        <a href="${ctx}/PtlTf!toPage.action?named=tfexaple&pageNum=1" class="example" target="_blank">样例</a>
				        <ul class="colorChange">
						    <li class="info">
						    	<label><strong></strong>项目简称</label>
						    	<p class="brief_title">${prjBean.prjName }</p>
						    </li>
						    <li class="info">
						    	<label><strong>*</strong>所属行业</label>
						    	<input type="hidden" class="form-control" name="prjBean.industry" value="" id="compRngStr"/>
				        		<select class="compRangStr" id="industry">
				        			<c:forEach var="comp" items="${compRngList }" varStatus="status">
				        				<option value="${comp.value}">${comp.key}</option>
				        			</c:forEach>
				        		</select>
						    </li>
				        	<li class="info">
				        		<label><strong>*</strong>所在区域</label>
				        		<input type="hidden" class="form-control" name="prjBean.address" value="" id="compRangStr"/>
				        		<select class="compRangStr" id="address">
				        			<c:forEach var="prj" items="${provinces }" varStatus="status">
				        				<option value="${prj.value}">${prj.value}</option>
				        			</c:forEach>
				        		</select>
				        	</li>
						    <li class="info">
						    	<label><strong>*</strong>所处阶段</label>
						    	<input type="hidden" class="form-control" name="prjBean.stage" value="" id="finStageStr"/>
				        		<select class="compRangStr" id="stage">
				        			<c:forEach var="fin" items="${finStageList }" varStatus="status">
				        				<option value="${fin.value}">${fin.key}</option>
				        			</c:forEach>
				        		</select>
						    </li>
						    <li class="info">
						    	<label><strong></strong>项目标签</label>
				        		<div class="compRangList">
					        		<c:forEach  var="item" items="${prjBean.prjTag}" varStatus="status">
										<a>${item}</a>
									</c:forEach>
								</div>
				        	</li>
				        	<li class="info">
				        		<label><strong>*</strong>企业名称</label>
				        		<input type="text" class="form-control" placeholder="如上海爱就投金融信息服务股份有限公司"  value="${prjBean.compName}" id="compName" name="prjBean.compName"/>
				        	</li>
				        	<li class="info">
				        		<label class="itemSign"><strong></strong>项目logo</label>
				        		<div class="upload"><img src="${ctx }/file/zmiao/images/person/add_logo.png" /></div>
						    	<input type="file" name="attach" placeholder="请上传PNG、JPG、GIF格式你的电子名片或名片照片"  class="form-control"  id="itemLogo" accept="image" capture="camera" value="${ctx }${prjBean.prjLogoStr}"/>
								<div class="show_item" id="item_logo_show">
									<c:if test="${not empty prjBean.prjLogoStr }">
										<img src="${ctx }${prjBean.prjLogoStr}" class="item" />
									</c:if>
								</div>
								<div class="alt_pic">
									<img src="${ctx }/file/zmiao/images/person/alt_pic.png" />
									<input type="file" name="attach" placeholder="请上传PNG、JPG、GIF格式你的电子名片或名片照片"  class="form-control"  id="itemLogo2" accept="image" capture="camera" />
								</div>
				        	</li>
				        	<li class="info">
				        		<label><strong></strong>视频地址</label>
				        		<input type="text" placeholder="提供腾讯视频视频码，展示项目详情风采" value="${prjBean.videoUrl}" name="prjBean.videoUrl" id="videoUrl"/>
				        		<a href="${ctx}/htmlview/appDoc/agreement/videoUpHelp.html" class="tvLink" target="_blank"><img src="${ctx}/file/tf/tfup/images/tv_help.png" class="tv_help" /></a>
				        	</li>
				        	<li class="info">
				        		<label><strong></strong>寻求资源</label>
				        		<input type="text" placeholder="一句话讲述一下我当前最希望获得的资源信息"  value="${prjBean.rscDesc}" name="prjBean.rscDesc" id="rscDesc"/>
				        	</li>
					    </ul>
				        <div class="login-submit">
				        	<input type="hidden" id="item_logo_data" name="prjLogo"/>
					        <input type="button" id="btnLogin" class="i_button" value="下一步"/>
					    </div>
				    </form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
</body>
</html>