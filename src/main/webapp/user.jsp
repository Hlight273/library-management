<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%--<link rel="stylesheet" href="css/bootstrap.min.css">--%>
<%--<link rel="stylesheet" href="css/magnific-popup.css">--%>
<%--<link rel="stylesheet" href="css/animate.css">--%>
<%--<link rel="stylesheet" href="css/owl.carousel.min.css">--%>
<%--<link rel="stylesheet" href="css/font-awesome.min.css">--%>
<%--<link rel="stylesheet" href="css/et-line-icon.css">--%>
<%--<link rel="stylesheet" href="css/bicon.min.css">--%>
<%--<link rel="stylesheet" href="css/slick.css">--%>
<%--<link rel="stylesheet" href="css/meanmenu.min.css">--%>
<link rel="stylesheet" href="css/bundle.css">
<%--<link rel="stylesheet" href="css/responsive.css">--%>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/user.css">
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'/>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/user.js"></script>

<div class="causes-area ">
    <div class="select-menu">
        <table>
            <ul class="f-left cansai">
                <li class="colorchange">我的竞赛</li>
                <li class="colorchange">往届竞赛</li>
                <li class="colorchange">竞赛中</li>
            </ul>
            <ul class="f-left team">
                <li class="colorchange">我的团队</li>
            </ul>
            <ul class="f-left yonghu ">
                <li class="colorchange">用户中心</li>
            </ul>
            <ul class="f-left mima">
                <li class="colorchange">修改密码</li>
            </ul>
        </table>
    </div>
    <!--往届竞赛-->
    <div class="user-row container">
        <div class="match-title">
            <p>往届竞赛</p>

        </div>
        <c:forEach items="${matchList}" var="match">
            <c:if test="${!match.isNow()}">
                <div class="row-content">
                    <div class="">
                        <a href="${ctx}/UserDetailServlet?matchId=${match.id}"><img src="${ctx}/image/${match.url}"
                                                                                    alt="${match.name}"/></a>
                        <div class="match-msg">
                            <h3><a href="${ctx}/UserDetailServlet?matchId=${match.id}">${match.name}</a></h3>
                            <p>${match.description}</p>
                            <div class="causes-meta">
                                <div class="">
                                    <h4>开始日期<span>${match.getDateString(match.start)}</span></h4>
                                </div>
                                <div class="">
                                    <h4>结束日期 <span>${match.getDateString(match.end)}</span></h4>
                                </div>
                                <div class="">
                                    <h4>报名截止日期 <span>${match.getDateString(match.applicationEnd)}</span></h4>
                                </div>
                            </div>
                            <a class="button theme-bg" href="${ctx}/UserDetailServlet?matchId=${match.id}">了解更多</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <!--新竞赛-->
    <div class="user-row container">
        <div class="match-title">
            <p>竞赛中</p>
        </div>
        <c:forEach items="${matchList}" var="match">
            <c:if test="${match.isNow()}">
                <div class="row-content">
                    <div class="">
                        <a href="${ctx}/UserDetailServlet?matchId=${match.id}"><img src="${ctx}/image/${match.url}"
                                                                                    alt="${match.name}"/></a>
                        <div class="match-msg">
                            <h3><a href="${ctx}/UserDetailServlet?matchId=${match.id}">${match.name}</a></h3>
                            <p>${match.description}</p>
                            <div class="causes-meta">
                                <div class="">
                                    <h4>开始日期<span>${match.getDateString(match.start)}</span></h4>
                                </div>
                                <div class="">
                                    <h4>结束日期 <span>${match.getDateString(match.end)}</span></h4>
                                </div>
                                <div class="">
                                    <h4>报名截止日期 <span>${match.getDateString(match.applicationEnd)}</span></h4>
                                </div>
                            </div>
                            <a class="button theme-bg" href="${ctx}/UserDetailServlet?matchId=${match.id}">了解更多</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <!--用户中心-->
    <div class="container">
        <div class="match-title">
            <p>修改用户信息</p>
        </div>
        <form action="EditUserServlet" method="post">
            <div class="input">
                UID ${user.id}<br><br><br>
            </div>
            <div class="input">
                姓名<br><input type="text" value="${user.name}" name="name">
            </div>
            <div class="input">
                邮箱<br><input type="text" value="${user.email}" name="email">
            </div>
            <div class="input2">
                <input type="submit" value="确认修改" class="btn btn-inverse">
            </div>
        </form>
        <!-- login area end -->
    </div>

    <%--修改密码--%>
    <div class="container">
        <div class="match-title">
            <p>修改密码</p>
        </div>
        <form action="EditPwdServlet" method="post">
            <div class="input">
                旧密码<br><input type="text" value="" name="oldpwd">
            </div>
            <div class="input">
                新密码<br><input type="text" value="" name="newpwd " class="newpwd">
            </div>
            <div class="input">
                确认密码<br><input type="text" value="" name="newpwd2" class="newpwd2">
            </div>
            <div class="pwd-msg">
                <p>两次输入密码不一致</p>
            </div>
            <div class="input2">
                <input type="submit" value="确认修改" class="btn btn-inverse">
            </div>

        </form>
    </div>
    <div class="container">
        <div class="match-title">
            <p>修改团队</p>
        </div>
        <c:forEach items="${teamList}" var="team">
            <form action="EditTeamServlet" method="post">
                <c:forEach items="${matchList}" var="match">
                    <c:if test="${match.id == team.matchId}">
                        <div class="input">
                            竞赛名称： ${match.id}<br>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="input">
                    团队名称<br><input type="text" value="${team.name}" name="teamName">
                </div>
                <div class="input">
                    团队简介<br><input type="text" value="${team.description}" name="description">
                </div>
                <c:if test="${!empty team.getMemberList()}">
                    <div class="input">
                    </div>
                    <c:if test="${team.getMemberList().size() == 1}">
                        <div class="input">
                            队员1<br><input type="text" value="" name="member1">
                        </div>
                        <input type="hidden" value="add" name="way1">
                        <div class="input">
                            队员2<br><input type="text" value="" name="member2">
                        </div>
                        <input type="hidden" value="add" name="way2">
                        <div class="input">
                            队员3<br><input type="text" value="" name="member3">
                        </div>
                        <input type="hidden" value="add" name="way3">
                    </c:if>
                    <c:if test="${team.getMemberList().size() == 2}">
                        <div class="input">
                            队员1<br><input type="text" value="${team.getMemberList().get(1).userId}" name="member1">
                        </div>
                        <input type="hidden" value="edit" name="way1">
                        <div class="input">
                            队员2<br><input type="text" value="" name="member2">
                        </div>
                        <input type="hidden" value="add" name="way2">
                        <div class="input">
                            队员3<br><input type="text" value="" name="member3">
                        </div>
                        <input type="hidden" value="add" name="way3">
                    </c:if>
                    <c:if test="${team.getMemberList().size() == 3}">
                        <div class="input">
                            队员1<br><input type="text" value="${team.getMemberList().get(1).userId}" name="member1">
                        </div>
                        <input type="hidden" value="edit" name="way1">
                        <div class="input">
                            队员2<br><input type="text" value="${team.getMemberList().get(2).userId}" name="member2">
                        </div>
                        <input type="hidden" value="edit" name="way2">
                        <div class="input">
                            队员3<br><input type="text" value="" name="member3">
                        </div>
                        <input type="hidden" value="add" name="way3">
                    </c:if>
                    <c:if test="${team.getMemberList().size() == 4}">
                        <div class="input">
                            队员1<br><input type="text" value="${team.getMemberList().get(1).userId}" name="member1">
                        </div>
                        <input type="hidden" value="edit" name="way1">
                        <div class="input">
                            队员2<br><input type="text" value="${team.getMemberList().get(2).userId}" name="member2">
                        </div>
                        <input type="hidden" value="edit" name="way2">
                        <div class="input">
                            队员3<br><input type="text" value="${team.getMemberList().get(3).userId}" name="member3">
                        </div>
                        <input type="hidden" value="edit" name="way3">
                    </c:if>

                        <input type="hidden" value="${team.id}" name="teamId">
                    <c:if test="${team.getMemberList().size() >= 2}">
                        <input type="hidden" value="${team.getMemberList().get(1).id}" name="member1Id">
                    </c:if>
                    <c:if test="${team.getMemberList().size() >= 3}">
                        <input type="hidden" value="${team.getMemberList().get(2).id}" name="member2Id">
                    </c:if>
                    <c:if test="${team.getMemberList().size() >= 4}">
                        <input type="hidden" value="${team.getMemberList().get(3).id}" name="member3Id">
                    </c:if>
                </c:if>
                <div class="input2">
                    <input type="submit" value="确认修改" class="btn btn-inverse">
                </div>
            </form>
        </c:forEach>
    </div>

</div>
