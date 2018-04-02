
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<title>壮苗文化-个人设置-实名认证</title>
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
					<div class="tab__list active userSettings clearfix">
						<!--实名认证-->
                        <div class="tabTwo__list active certification clearfix">
                        	<form  method="post" action="${ctx }/PtlZm!saveRealAuth.action" id="smrz" enctype="multipart/form-data">
                        	<!-- 未认证的情况下 -->
                        		<div class="perfect  <c:if test="${member.authFlg == 0}">display</c:if> <c:if test="${member.authFlg != 0}">hidden</c:if>">
                                <div class="form__group">
                                    <div class="list clearfix">
                                        <div class="fl list__title"><span class="mustFillIn">真实姓名</span></div>
                                        <div class="fl list__desc"><input type="text" name="member.userName" id="name" value="${member.userName }" class="form__input"><div class="promptMessage">请输入正确的中文姓名</div></div>
                                    </div>
                                    <div class="list clearfix">
                                        <div class="fl list__title"><span class="mustFillIn">证件号码</span></div>
                                        <div class="fl list__desc"><input type="text" name="member.certNo" id="peopleNum" value="${member.certNo }"  maxlength="18" class="form__input" onKeyUp="value=value.replace(/[\W]/g,'')"><div class="promptMessage">输入正确的身份号码</div></div>
                                    </div>
                                    <div class="list clearfix">
                                        <div class="fl list__title"><span class="">所属公司</span></div>
                                        <div class="fl list__desc"><input type="text" name="member.userComp" id="home" value="${member.userComp }" class="form__input"><div class="promptMessage"> </div></div>
                                    </div>
                                    <div class="list clearfix">
                                        <div class="fl list__title"><span class="">你的职位</span></div>
                                        <div class="fl list__desc "><input type="text" name="member.position" id="pos" value="${member.position}" class="form__input"><div class="promptMessage"> </div></div>
                                    </div>
                                    <div class="list clearfix">
                                        <div class="fl list__title"><span class="mustFillIn">证件图片</span></div>
                                        <div class="fl list__desc imgcheckBox ">
                                            <input type="file" accept="image" class="imgcheckBtn" id="imgUp" name="attach">
                                            <div id="user_avatar_show" class="user-img-show"><img src="${ctx }/${not empty member.certImg ? member.certImg : 'data/common/default.jpg'}"/></div>
                                            <input type="hidden"  id="user_avatar_data"  />
                                            <p class="imgtitle">（支持jpg，png格式图片：推荐尺寸640*360）</p>
                                            <div class="promptMessage">请上传证件照</div>
                                        </div>
                                    </div>
                                </div>
                                <button class="user__btn" id="reBtn">提交认证</button>
                                </form>
                            	</div>
                            <!--已认证状态-->
                            <div class="subEnd <c:if test="${member.authFlg !=0}">display</c:if> <c:if test="${member.authFlg ==0}">hidden</c:if>">
                                <div class="static__box">
                                    <div class="statics">
                                    	<c:if test="${member.authFlg ==1}"><img src="${ctx}/file/zmiao/images/myAssist/subOk.png" alt="认证通过"></c:if>
                                    	<c:if test="${member.authFlg ==2}"><img src="${ctx}/file/zmiao/images/myAssist/subIng.png" alt="审核中"></c:if>
                                    	<c:if test="${member.authFlg ==9}"><img src="${ctx}/file/zmiao/images/myAssist/subError.png" alt="认证失败"></c:if>
                                    </div>
                                    <c:if test="${member.authFlg ==1}"><p>恭喜！你已通过实名认证</p></c:if>
                                    <c:if test="${member.authFlg ==2}"><p>您的实名认证正在审核中，我们会在三日之内完成审核</p></c:if>
                                    <c:if test="${member.authFlg ==9}"><p>对不起！你提交的信息未能通过壮苗审核，请填写正确信息后再重新认证</p></c:if>
                                </div>
                                <div class="static__desc">
                                    <div class="desc__list clearfix">
                                        <div class="fl">真实姓名：</div>
                                        <div class="fr">${member.userName }</div>
                                    </div>
                                    <div class="desc__list clearfix">
                                        <div class="fl">证件号码：</div>
                                        <div class="fr">${member.certNo }</div>
                                    </div>
                                    <div class="desc__list clearfix">
                                        <div class="fl">所属公司：</div>
                                        <div class="fr">${member.userComp }</div>
                                    </div>
                                    <div class="desc__list clearfix">
                                        <div class="fl">你的职位：</div>
                                        <div class="fr">${member.position }</div>
                                    </div>
                                    <div class="desc__list clearfix">
                                        <div class="fl">证件照片：</div>
                                        <div class="fr zjzBox"><img src="${ctx }/${not empty member.certImg ? member.certImg : 'data/common/default.jpg'}"/></div>
                                    </div>
                                    <button class="user__btn" id="rerzBtn">重新认证</button>
                                </div>
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
		console.log("${member.authFlg}");
	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/certicationMain"></script>
</body>
</html>