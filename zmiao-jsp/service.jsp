
<%@ include file="/WEB-INF/content/zmiao/header.jsp"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<title>壮苗文化-壮苗服务</title>
<!-- 个性化样式引用 -->
<link rel="stylesheet" href="file/zmiao/css/base.css">
<link rel="stylesheet" href="file/zmiao/css/swiper.min.css">
<link rel="stylesheet" href="file/zmiao/css/services.css">
</head>
<body>
	    <!--内容盒-->
    <div class="content">
        <div class="content__banner"><%-- <img src="${ctx}/file/zmiao/images/gardenerHome/teacher-banner.png" alt="唯美"> --%></div>
        <div class="inner">
            <div class="services__title">经过无数次打磨，为创业者精心定制了4+1服务，以满足早期创业者资本对接和发展的需要</div>
            <div class="tab__box clearfix">
                <div class="tab active">
                    <div class="tab__icon active"></div>
                    <div class="tab__text active">一对一导师辅导</div>
                </div>
                <div class="tab">
                    <div class="tab__icon"></div>
                    <div class="tab__text">一场培训<br>（路演七步法）</div>
                </div>
                <div class="tab">
                    <div class="tab__icon"></div>
                    <div class="tab__text">一部专题片制作</div>
                </div>
                <div class="tab">
                    <div class="tab__icon"></div>
                    <div class="tab__text">一次线上线下粉丝资源对接会</div>
                </div>
                <div class="tab">
                    <div class="tab__icon"></div>
                    <div class="tab__text">优秀项目的天使见面会</div>
                </div>
            </div>
        </div>
    </div>
        <!--tab切换盒子-->
    <div class="tabs">
        <!--导师辅导-->
        <div class="tab__list tab__fd active">
            <div class="inner">
                <div class="tab__header">分析行业信息，梳理商业计划，提升企业竞争力，扩大企业资源。</div>
                <div><button class="ds__btn">寻找资深导师 ></button></div>
                <div class="tab__fd__banner">
                    <img src="${ctx}/file/zmiao/images/services/ds_03.png" alt="">
                </div>

            </div>
        </div>
        <!--培训-->
        <div class="tab__list tab__px">
            <div class="inner">
                <div class="tab__header">为了创业资金，处处碰壁的日子，你还在继续吗？企业发展需要资本的支持，但资本市场有其固有的规律和标准。创业者该如何做路演，如何一招制胜讲来投资，助力企业飞速发展？
                    路演七步法培训，由i就投和复旦大学联合打造，2天2夜的高强度实战型培训，为创业者量身定制，成就每个创富梦想，更有机会获得复旦大学授权证书。
                </div>
            </div>
            <div class="tab__content">
                <div class="inner">
                    <div class="tab_img_run">
                        <div class="img__box">
                        	<div class="run__icon clearfix">
                                <div class="fl prev">上一期</div>
                                <div class="fl run__icon__text">第一期（2017-06-02 ～ 2017-06-04）</div>
                                <div class="fr next">下一期</div>
                            </div>
                            <div class="swiper-container" id="angelToday">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide" ><img src="${ctx}/file/zmiao/images/services/1.jpg" alt=""></div>
                                    <div class="swiper-slide" ><img src="${ctx}/file/zmiao/images/services/2.jpg" alt=""></div>
                                    <div class="swiper-slide" ><img src="${ctx}/file/zmiao/images/services/3.jpg" alt=""></div>
                                    <div class="swiper-slide" ><img src="${ctx}/file/zmiao/images/services/4.jpg" alt=""></div>
                                    <div class="swiper-slide" ><img src="${ctx}/file/zmiao/images/services/5.jpg" alt=""></div>
                                    <div class="swiper-slide" ><img src="${ctx}/file/zmiao/images/services/6.jpg" alt=""></div>
                                    <div class="swiper-slide" ><img src="${ctx}/file/zmiao/images/services/7.jpg" alt=""></div>
                                    <div class="swiper-slide" ><img src="${ctx}/file/zmiao/images/services/8.jpg" alt=""></div>
                                </div>

                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>

                        </div>



                    </div>
                    <div class="student__title">本期学员评价</div>
                    <div class="tab_student_say">
                        <div class="say_list active">
                            通过这两天学习发现自己还有很多不足，同时感受到了小爱对创业者的大爱，对路演有了独特的理解，也感受到了团队的热情，再次说声感谢！通过这两天的学习，发现自己以前的路演讲的太发散了，通过这次学习体验到了七步法的精髓！
                        </div>
                        <div class="say_list">
                            以前每次路演基本上都要见40位左右的投资人，虽然也有人教我如何路演，但都没重视，觉得把商业模式讲清楚就可以了，但这次培训后，我发现自己一直忽视了跟投资人的心灵沟通，没有产生交流，而只有产生共鸣，才能创造强大的力量，这就是感召力！感谢徐老师！                        </div>
                        <div class="say_list">
                            上课后我才知道原来自我介绍还有这么多道道，一步步该如何做？为什么要这样做？路演七步法也让我明白了该如何一步一步打开投资人的心，从目光的连接、到心的连接、到状态的连接。太赞了，感谢徐老师，“你想成为谁就先活成谁”，您的状态感染了我们每一个人。                        </div>
                        <div class="say_list">
                            以前觉得创业向朋友筹钱很不好，而徐老师说，这很可能是给别人一个机会，于是午夜就发出了项目信息，结果马上筹到了80%多，第二天还有朋友过来问“怎么回事，没了？！”真的是心往哪想，事就往哪走。七步法对我，很有帮助，接下来去路演，分分钟搞定。
                        </div>
                    </div>
                    <div class="jd__box"><div class="active"></div></div>
                    <div class="students clearfix">
                        <div class="student clearfix">
                            <div class="student__icon"><img src="${ctx}/file/zmiao/images/services/name2.jpg" alt=""></div>
                            <div class="student__text">
                                <div class="student__name">孟宪国</div>
                                <div class="student__desc">找了么创始人</div>
                            </div>
                        </div>
                        <div class="student clearfix">
                            <div class="student__icon"><img src="${ctx}/file/zmiao/images/services/name3.jpg" alt=""></div>
                            <div class="student__text">
                                <div class="student__name">杨松</div>
                                <div class="student__desc">原创猫创始人</div>
                            </div>
                        </div>
                        <div class="student clearfix">
                            <div class="student__icon"><img src="${ctx}/file/zmiao/images/services/name4.jpg" alt=""></div>
                            <div class="student__text">
                                <div class="student__name">张志胜</div>
                                <div class="student__desc">筋斗云创始人</div>
                            </div>
                        </div>
                        <div class="student clearfix">
                            <div class="student__icon"><img src="${ctx}/file/zmiao/images/services/name1.jpg" alt=""></div>
                            <div class="student__text">
                                <div class="student__name">伋升彪</div>
                                <div class="student__desc">琴悦书院创始人</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--专题片制作-->
        <div class="tab__list tab__film">
            <div class="inner">
                <div class="tab__header">制作由东方财经冠名的专业级企业宣传片。</div>

            </div>
        </div>
        <!--粉丝-->
        <div class="tab__list tab__fans">
            <div class="inner">
                <div class="tab__header">由导师带领创业者进行实战型线上路演，更精确的匹配多方资本和资源。</div>

            </div>
        </div>
        <!--优秀投资人见面会-->
        <div class="tab__list tab__tzr">
            <div class="inner">
                <div class="tab__header">从壮苗项目中挑选出成熟项目直接参与资本对接，包括数百名天使投资人、FA、投资机构以及我们的互联网非公开股权投资。</div>

            </div>
        </div>
    </div>
        <div class="tab__bottom">
             <button class="plan__btn">发起壮苗计划</button>
        </div>
	<%@ include file="/WEB-INF/content/zmiao/loginLayer.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/sidebar.jsp"%>
	<%@ include file="/WEB-INF/content/zmiao/footer.jsp"%>
	<!-- 个性化脚本引用 -->
	<script>
		var webroot="${ctx}";
	</script>	

	<script src="${ctx}/file/zmiao/js/lib/require.js" defer async="true" data-main="${ctx}/file/zmiao/js/servicesMain"></script>
</body>
</html>