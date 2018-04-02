<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="description" content="${zmDesc }" />
<meta name="keywords" content="${zmKeys }" />
<link rel="shortcut icon" href="file/zmiao/favicon.ico" type="image/x-icon" />
    <!--导航栏-->
    <header>
        <div class="inner clearfix">
            <div class="header__logo fl">
            	<a href="${ctx}/zhuangmiao">
                	<img src="${ctx}/file/zmiao/images/index/logo.png" alt="logo">
                </a>
            </div>
            <div class="header__nav fl ">
                <ul class="clearfix nav__box">
                    <li ><a href="${ctx}/zhuangmiao">首页</a></li>
                    <li><a href="${ctx}/PtlZm!prjList.action">助创园地</a></li>
                    <li><a href="${ctx}/PtlZm!gardenerHome.action">园丁之家</a></li>
                    <li><a href="${ctx }/PtlZm!zmService.action">壮苗服务</a></li>
                    <li><a href="${ctx }/PtlZm!aboutZm.action">关于壮苗</a></li>
                </ul>
                <div class="nav__bar">
                    <div class="nav__bar--scroll"></div>
                </div>
            </div>
            <ul class="header__right fr clearfix">
				<c:if test="${empty session_member }">
                <li><a class="loginBtn" href="${ctx }/PtlZm!zmLogin.action">登录</a></li>
                <li><a href="${ctx }/PtlZm!zmRegister.action">注册</a></li>
				</c:if>
				<c:if test="${not empty session_member }">
				<li><a href="${ctx}/PtlZm!myInvestment.action" class="user__center"><img src="${ctx}/${session_member.userLogo}" <%-- onerror="javascript:this.src='${ctx}/data/common/tfUserLogo.jpg';"  --%>/></a></li>
				<li><a href="${ctx}/PtlZm!myInvestment.action">${session_member.userName }</a></li>
				<li><a href="###"><span onclick="location.href='${ctx }/PtlZm!logout.action?relogin=true'" class="link">退出</span></a></li> 
			    </c:if>

            </ul>
        </div>
    </header>
    
