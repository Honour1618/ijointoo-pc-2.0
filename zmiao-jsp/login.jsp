﻿<%@ include file="/WEB-INF/content/zmiao/header.jsp" %>
<title>壮苗文化-登录</title>
<link rel="stylesheet" type="text/css" href="file/zmiao/css/base.css">
<link rel="stylesheet" type="text/css" href="file/zmiao/css/login.css">

</head>
<body>
	<div class="content_wrap">
		<div class="content inner clearfix">
			<img class="leftPic fl" src="${ctx }/file/zmiao/images/register/registerPic.png" />
			<!-- 密码登录 -->
			<form action="${ctx }/PtlZm!login.action" method="post" id="pwdForm">
				<input type="hidden" name="loginFlag" value="password"/>
				<div class="regBox pwd_box fr">
					<table class="regTable">
						<tr>
							<td class="tr_title">
								<div class="clearfix">
									<span class="pwLogin fl">密码登录</span>
									<span class="yzmLogin fr active" onclick="showCodeLogin();">验证码登录</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tr_input">
								<p class="minInfo">爱就投用户可直接使用会员手机号登录</p>
							</td>
						</tr>
						<tr>
							<td class="tr_input">
								<div>
									<input id="userMobile" type="tel" name="member.userMobile" value="${member.userMobile }" placeholder="手机号码" maxlength="11" />
									<span class="err_msg_tip" id="userMobileTip">请输入手机号</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tr_input">
								<div>
									<input id="userpass" type="password" value="${member.password }" name="member.password" placeholder="密码" />
									<span class="err_msg_tip" id="userpassTip">请输入密码</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" id="pwdLogin" class="btnReg" value="登录" onclick="mmLogin()" />
							</td>
						</tr>
						<tr class="toLogin">
							<td>
								<p>没有账号？<a href="${ctx }/PtlZm!zmRegister.action">立即注册</a></p>
							</td>
						</tr>
					</table>
				</div>
			</form>
			<!-- 验证码登录 -->
			<form action="${ctx }/PtlZm!login.action" method="post" id="codeForm">
				<input type="hidden" name="loginFlag" value="v_code"/>
				<div class="regBox code_box fr">
					<table class="regTable">
						<tr>
							<td class="tr_title">
								<div class="clearfix">
									<span class="pwLogin fl active" onclick="showPwdLogin();">密码登录</span>
									<span class="yzmLogin fr">验证码登录</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tr_input">
								<p class="minInfo">爱就投用户可直接使用会员手机号登录</p>
							</td>
						</tr>
						<tr>
							<td class="tr_input">
								<div>
									<input id="userNum" type="tel" name="member.userMobile" value="${member.userMobile }" placeholder="手机号码" maxlength="11" />
									<span class="err_msg_tip" id="userNumTip">请输入手机号</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tr_input yzm">
								<div>
									<input id="randCode" type="tel" name="randCode" placeholder="验证码" maxlength="4" />
									<span class="err_msg_tip" id="randCodeTip">请输入验证码</span>
								</div>
								<a title="换一张" class="check_img">
									<img id="image1" src="${ctx }/genVerifyCode.do" />
								</a>
							</td>
						</tr>
						<tr>
							<td class="tr_input yzm">
								<div>
									<input type="tel" id="vCode" name="validateCode" value="${validateCode }" placeholder="短信验证码" maxlength="6" />
									<input type="button"  class="yanZheng" value="获取验证码" id="btnSendCode" onclick="sendMessage()" />
									<input class="yanZheng" value="60s" id="btnSendCodeTime" />
									<span class="err_msg_tip" id="vCodeTip">请输入短信验证码</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" id="codeReg" class="btnReg" value="登录" onclick="codeLogin()" />
							</td>
						</tr>
						<tr class="toLogin">
							<td>
								<p>没有账号？<a href="${ctx }/PtlZm!zmRegister.action">立即注册</a></p>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp" %>
	<script type="text/javascript">
		var webroot="${ctx}";
		var err_msg = "${err_msg}";
		var loginFlag = "${loginFlag}";
	</script>
	<script type="text/javascript" src="${ctx }/file/zmiao/js/app/checkInfo.js"></script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/login.js"></script>
</body>
</html>