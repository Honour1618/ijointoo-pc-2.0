<%@ include file="/WEB-INF/content/zmiao/header.jsp" %>
<title>壮苗文化-注册</title>
<link rel="stylesheet" type="text/css" href="file/zmiao/css/base.css">
<link rel="stylesheet" type="text/css" href="file/zmiao/css/register.css">

</head>
<body>
	<div class="content_wrap">
		<div class="content inner clearfix">
			<img class="leftPic fl" src="${ctx }/file/zmiao/images/register/registerPic.png" />
			<form action="${ctx }/PtlZm!register.action" method="post">
				<div class="regBox fr">
					<table class="regTable">
						<tr>
							<td class="tr_title"><h3>会员注册</h3></td>
						</tr>
						<tr>
							<td class="tr_input">
								<div>
									<input name="member.userName" id="userName" type="text" value="${member.userName }" placeholder="会员姓名" rangelength="[1,12]" />
									<span class="err_msg_tip" id="userNameTip">请输入正确的中文姓名</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tr_input">
								<div>
									<input name="member.nickName" id="nickName" type="text" value="${member.nickName }" placeholder="昵称" rangelength="[1,20]" />
									<span class="err_msg_tip" id="nickNameTip">请输入昵称</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tr_input">
								<div>
									<input name="member.userMobile" id="userMobile" type="tel" value="${member.userMobile }" placeholder="手机号码" maxlength="11" />
									<span class="err_msg_tip" id="userMobileTip">请输入手机号</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tr_input yzm">
								<div>
									<input name="randCode" id="randCode" type="tel" value="" placeholder="验证码" maxlength="4" />
									<span class="err_msg_tip" id="randCodeTip">请输入验证码</span>
								</div>
								<a class="check_img" title="换一张">
									<img id="image1" src="${ctx }/genVerifyCode.do" />
								</a>
							</td>
						</tr>
						<tr>
							<td class="tr_input yzm">
								<div>
									<input name="validateCode" id="vcode" type="tel" value="" placeholder="短信验证码" maxlength="6" />
									<input type="button"  class="yanZheng" value="获取验证码" id="btnSendCode" onclick="sendMessage()" />
									<input class="yanZheng" value="60s" id="btnSendCodeTime" />
									<span id="vcodeTip" class="err_msg_tip">请输入短信验证码</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" id="btnReg" value="注册" />
							</td>
						</tr>
						<tr class="toLogin">
							<td>
								<p>已有账号？<a href="${ctx }/PtlZm!zmLogin.action">立即登录</a></p>
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
	</script>
	<script type="text/javascript" src="${ctx }/file/zmiao/js/app/checkInfo.js"></script>
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/app/register"></script>
</body>
</html>