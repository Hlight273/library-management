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
<link rel="stylesheet" href="./css/index.css">
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
                <li class="gallery-item match_box" data-id="id-1" data-type="illustration">
                    <div class="img_box" >
                        <a href="${ctx}/DetailServlet?matchId=${match.id}">
                            <img src="${ctx}/image/${match.url}" alt=${match.name} />
                        </a>
                        <div class="top ${match.isNow()?'red':'gray'}">
                                ${match.isNow()?'进行中':'已过期'}
                        </div>
                    </div>
                    <div class="details">
                        <a class="title" href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a>
                        <p class="date">活动日期:
                            <c:if test="${match.isNow()}">${match.getDateString(match.start)}-${match.getDateString(match.end)}</c:if>
                            <c:if test="${!match.isNow()}">已结束</c:if>
                        </p>
                        <div class="desc">${match.description}</div>
                    </div>
                </li>
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
            <li class="gallery-item match_box" data-id="id-1" data-type="illustration">
                <div class="img_box" >
                    <a href="${ctx}/DetailServlet?matchId=${match.id}">
                        <img src="${ctx}/image/${match.url}" alt=${match.name} />
                    </a>
                    <div class="top ${match.isNow()?'red':'gray'}">
                            ${match.isNow()?'进行中':'已过期'}
                    </div>
                </div>
                <div class="details">
                    <a class="title" href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a>
                    <p class="date">活动日期:
                        <c:if test="${match.isNow()}">${match.getDateString(match.start)}-${match.getDateString(match.end)}</c:if>
                        <c:if test="${!match.isNow()}">已结束</c:if>
                    </p>
                    <div class="desc">${match.description}</div>
                </div>
            </li>
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
                旧密码<br><input type="text"  name="oldpwd">
            </div>
            <div class="input">
                新密码<br><input type="text"  name="newpwd" class="newpwd">
            </div>
            <div class="input">
                确认密码<br><input type="text"  name="newpwd2" class="newpwd2">
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
                <div class="input">
                    作品名称<br><input type="text" value="${team.workName}" name="workName">
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
