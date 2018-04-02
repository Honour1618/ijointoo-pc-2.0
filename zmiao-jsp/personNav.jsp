<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 个人中心侧边导航 -->
<div class="person_left fl">
	<div class="person_info">
		<%-- <img src="${ctx}/file/zmiao/images/person/default.jpg" class="user_logo" /> --%>
		<img src="${ctx}/${session_member.userLogo}" onerror="javascript:this.src='${ctx}/data/common/tfUserLogo.jpg';" class="user_logo"/>
		<h2>${session_member.userName }</h2>
		<div>
			<c:if test="${tfFlag == 1 }">
				<img src="${ctx }/file/zmiao/images/person/icon_cyz.png" class="user_rank" />
			</c:if>
			<c:if test="${tfInvFlag == 1}">
				<img src="${ctx }/file/zmiao/images/person/icon_ds.png" class="user_rank" />
			</c:if>
			<img src="${ctx }/file/zmiao/images/person/icon_wts.png" class="user_rank" />
		</div>
	</div>
    <ul class="person_nav">
		<li><a href="${ctx }/PtlZm!myInvestment.action">我的资助</a></li>
	    <li><a href="${ctx }/PtlZm!myProject.action">我的项目</a></li>
	    <li><a href="${ctx }/PtlZm!investCenter.action">我的辅导</a></li>
	    <li><a href="${ctx }/PtlZm!showUpdateMember.action" >个人设置</a></li>
	    	<div class="person_second">
				<a href="${ctx }/PtlZm!showUpdateMember.action">个人信息</a>
				<a href="${ctx }/PtlZm!showSetupPwd.action">修改密码</a>
				<a href="${ctx }/PtlZm!showRealAuth.action">实名认证</a>
			</div>
    </ul>

</div>