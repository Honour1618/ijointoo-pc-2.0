
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<title>壮苗文化-个人设置-个人信息</title>
<!-- 个性化样式引用 -->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">  
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/jquery.Jcrop.min.css">
<link rel="stylesheet" href="file/zmiao/css/userManage.css">

</head> 
<body>
	 <div class="content">
        <div class="inner clearfix">
        	<%@ include file="/WEB-INF/content/zmiao/personNav.jsp"%>
        	<div class="fr">
        		 <div class="tab__window">
        		      <!--个人信息-->
        		        <form id="formGroup1" method="post" action="${ctx }/PtlZm!updateMember.action"  enctype="multipart/form-data">
                        <div class="tabTwo__list active userMessage clearfix">
                            <div class="user__logo2">
                            	<!-- <input type="file" accept="image" class="imgcheckUp" id="imgupBtn" name="attach"> -->
                            	<div id="user_avatar_show" class="user-img-show2"><img src="${ctx}/${session_member.userLogo}" id="userLogo"/></div>
<!--                             	<input type="hidden"  id="user_avatar_data"  />
                            	<input type="hidden" id="x" name="x" value="0"/>
								<input type="hidden" id="y" name="y" />
								<input type="hidden" id="w" name="w" />
								<input type="hidden" id="h" name="h" />
								<input type="hidden" id="tempLogo" name="tempLogo" /> -->
                            </div>
<%--                            	<div id="jcropPreview_box" style="width: 150px;height: 150px;overflow: hidden;cursor: pointer;">
				        		<img  id="jcropPreview" width="150px" src="${ctx}/${session_member.userLogo}" title="点击修改"/>
				        	</div> --%>
                            <div class="user__name">${session_member.userName}</div>
                            <div class="form__group">
                                <div class="list clearfix">
                                    <div class="fl list__title"><span class="mustFillIn mustStyle">姓 名</span></div>
                                    <div class="fl list__desc"><input type="text" class="form__input" id="name" name="member.userName" value="${memberInfo.userName}"><div class="promptMessage">请输入正确的中文姓名</div></div>
                                </div>
                                <div class="list clearfix">
                                    <div class="fl list__title"><span class="mustFillIn mustStyle">昵 称</span></div>
                                    <div class="fl list__desc"><input maxlength="20" type="text" name="member.nickName" id="littleName" value="${memberInfo.nickFmtName}" class="form__input"><div class="promptMessage nc">请正确填写昵称</div></div>
                                </div>
                                <div class="list clearfix">
                                    <div class="fl list__title sexCheck"><span class="mustFillIn mustStyle">性 别</span></div>
                                    <div class="fl list__desc sexBox">
	                                    <c:forEach var="list" items="${genderList}">
	                                    	 <label class="radioBtn" for="<c:if test="${list.value == 0}">man</c:if><c:if test="${list.value == 1}">women</c:if>"><c:if test="${list.value == 0}">男</c:if><c:if test="${list.value == 1}">女</c:if><input type="radio"  name="member.gender" id="<c:if test="${list.value == 0}">man</c:if><c:if test="${list.value == 1}">women</c:if>" value="${list.value}" ${list.value == memberInfo.gender ? 'checked="checked"' : '' }></label>
	                                    </c:forEach>
	                                    <div class="promptMessage"></div>
                                    </div>
                                </div>
                                <div class="list clearfix">
                                    <div class="fl list__title"><span class="mustFillIn">会员邮箱</span></div>
                                    <div class="fl list__desc"><input type="text"  id="email" class="form__input" name="member.userMail" value="${memberInfo.userMail }"><div class="promptMessage">你输入的不是标准邮箱，请重新输入</div></div>
                                </div>
                                <div class="list clearfix">
                                    <div class="fl list__title"><span class="mustFillIn">所在区域</span></div>
                                    <div class="fl list__desc">
                                        <select name="member.province" class="selectObj" id="area">
                                        	<option <c:if test="${empty memberInfo.province}">selected="selected"</c:if>>所在区域</option>
	        		   						<c:forEach var="dq" items="${provinceList}" varStatus="status">
	        									<option data-value="${dq.value}" <c:if test="${dq.value == memberInfo.province}">selected="selected"</c:if>>${dq.value}</option>
	        								</c:forEach>
                                        </select>
                                        <div class="promptMessage">请选择所在区域</div>
                                    </div>
                                </div>
                                <div class="list clearfix">
                                    <div class="fl list__title"><span class="mustFillIn">关注领域</span></div>
                                    <div class="fl list__desc">
                                        <div class="checkArr clearfix">
                                       		 <c:forEach var="list" items="${compRngList}" varStatus="status">
                                   				<span data-id="${list.value}" class="<c:if test='${list.key == memberInfo.userRang}'>active</c:if>">${list.key}</span>    		 
                                       		 </c:forEach>

                                        </div>
                                       <input type="hidden" id="gz" name="member.userRang"/>
                                        <div class="promptMessage ">最少选择一项</div>
                                    </div>
                                </div>
                                <div class="list clearfix">
                                    <div class="fl list__title"><span class="">投资理念</span></div>
                                    <div class="fl list__desc" id="descBox">
                                        <textarea name="member.investIdea" id="desc"  cols="30" rows="10" placeholder="">${memberInfo.investIdea }</textarea>
                                    	<div class="txt__num"><span>0</span>/50</div>
                                    </div>
                                </div>
                            </div>
                            <button class="user__btn"  id="saveBtn">保存</button> 
                        </div>
                         </form>
                        <form id="formGroup2" method="post" action="${ctx }/PtlZm!updateMember.action"  enctype="multipart/form-data">
                        <!-- 选择图片弹窗 -->
                        <div id="imgUpWindow" class="imgUpBOX">
                        	<div class="closeBox clearfix"><button class="imgClose"></button></div>
                        	<div class="checkImgBox">
                        		<img src="${ctx}/${session_member.userLogo}" id="uploadifyPreview" class="imgaaaa"/>
                        		<%-- <img  id="jcropPreview" display="none" width="150px" src="${ctx}/${session_member.userLogo}" title="logo"/> --%>
                        		<div class="imgcheckMask"><img src="${ctx}/file/zmiao/images/myAssist/imgcheckMask.jpg">选择图片</div>
                        		<input type="file" accept="image" class="imgcheck"  name="tempLogo" id="imgupBtn">
                        		<!-- 后台传参 -->
                        		<input type="hidden" id="x" name="x" value="0"/>
								<input type="hidden" id="y" name="y" />
								<input type="hidden" id="w" name="w" />
								<input type="hidden" id="h" name="h" />
								<!-- <input type="hidden" id="tempLogo" name="tempLogo" /> -->
                        	</div>
                        	<div class="imgBtnBox">
                        		<button class="btn-cancel">取消</button><button class="btn-success">确定</button>
                        	</div>
                        </div>	
                        </form>
        			  <!-- 弹窗提示 -->
        			  <div class="promptWindow">
        			  	<p></p>
        			  </div>
        		</div>
        	</div>	
        </div>
     </div>

    <%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
	<!-- 个性化脚本引用 -->
	<script>
		var webroot="${ctx}";
		var count="${pageInfo.total}";
		var a="${memberInfo.userRang }";
		var f="${compRngList}";
		var err="${err_msg}";

	</script>	
	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/userMessageMain"></script>
</body>
</html>