
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<title>壮苗文化-个人设置-密码修改</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/userManage.css">
</head>
<body>
	 <div class="content">
        <div class="inner clearfix">
        	<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
        	<div class="fr">
        		 <div class="tab__window">
                    <!--密码重置-->
                    <div class="tabTwo__list active revisePwd">
                    <form role="form" method="post" action="${ctx }/PtlZm!savePwd.action">
                        <input type="hidden" name="userMobile"  value="${session_member.userMobile }" />
                        <div class="form__group">
                            <div class="list clearfix">
                                <div class="fl list__title"><span class="">新密码</span></div>
                                <div class="fl list__desc"><input id="pwd" placeholder="密码必须介于6到15个字符之间，包括字母和数字" maxlength="15" name="pwd" type="password" class="form__input"><div class="promptMessage">请输入正确的密码格式</div></div>
                            </div>
                            <div class="list clearfix">
                                <div class="fl list__title"><span class="">确认密码</span></div>
                                <div class="fl list__desc"><input  id="newPwd" placeholder="密码必须介于6到15个字符之间，包括字母和数字" maxlength="15"  name="repwd" type="password" class="form__input"><div class="promptMessage">输入的密码有误</div></div>
                            </div>
                            <div class="list clearfix">
                                <div class="fl list__title"><span class="">图形码</span></div>
                                <div class="fl list__desc imgBox"><input id="imgNum" type="text" name="randCode" maxlength="4" class="form__input imgInput"><div class="imGnum">
								<div title="换一张" class="check_img" id="checkImg">
									<img id="image1" src="<s:url value='/genVerifyCode.do'/>" style="border-width: 0px;width: 80px;" />
								</div>
							</div><div class="promptMessage">输入的图形码有误</div></div>
                            </div>
                            <div class="list clearfix">
                                <div class="fl list__title"><span class="">验证码</span></div>
                                <div class="fl list__desc yzmBox"><input id="yzNum" name="validateCode" type="tel" maxlength="4" class="form__input yzm__input"><button class="yzm" id="yzmBtn">获取验证码</button><div class="promptMessage">输入的验证码有误</div></div>
                            </div>
                        </div>
                        <button class="user__btn" type="submit" id="saveBtn">保存</button>
                    </form>
                    </div>
                </div>

        		</div>
        	</div>	
        </div>
     </div>
     <!--提交成功弹窗-->
      <div class="successLayer">
             <p></p>
     </div>
    <%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
	<!-- 个性化脚本引用 -->
	<script>
		var webroot="${ctx}";
		var count="${pageInfo.total}";
		var phone="${session_member.userMobile}";
		var err="${err_msg}";

	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/revisePwdMain"></script>
</body>
</html>