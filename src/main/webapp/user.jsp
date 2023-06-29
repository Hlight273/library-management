<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->

    <!-- all css here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/et-line-icon.css">
    <link rel="stylesheet" href="css/bicon.min.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <link rel="stylesheet" href="css/bundle.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="causes-area pt-120 pb-90">
    <div class="select-menu">
        <table>
            <ul class="f-right mima">
                <li class="colorchange">修改密码</li>
            </ul>
            <ul class="f-right yonghu ">
                <li class="colorchange">用户中心</li>
            </ul>
            <ul class="f-right cansai ">
                <li class="colorchange">我的竞赛</li>
                <li class="colorchange">往届竞赛</li>
                <li class="colorchange">竞赛中</li>
            </ul>
        </table>
    </div>


    <!--往届竞赛-->
    <div class="container">
        <div class="row">
            <c:forEach items="${matchList}" var="match">
                <c:if test="${!match.isNow()}">
                    <div class="col-md-4 col-sm-4">
                        <div class="single-causes mb-30">
                            <a href="${ctx}/DetailServlet?matchId=${match.id}"><img src="${ctx}/image/${match.url}" alt="${match.name}"/></a>
                            <div class="causes-info">
                                <h3><a href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a></h3>
                                <p>${match.description}</p>
                                <div class="causes-meta">
                                    <div class="doller-target f-left">
                                        <h4>开始日期<span>${match.start}</span></h4>
                                    </div>
                                    <div class="doller-target f-right">
                                        <h4>结束日期 <span>${match.end}</span></h4>
                                    </div>
                                </div>
                                <a class="button theme-bg" href="${ctx}/DetailServlet?matchId=${match.id}">了解更多</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <!--新竞赛-->
    <div class="container">
        <div class="row">
            <c:forEach items="${matchList}" var="match">
                <c:if test="${match.isNow()}">
                    <div class="col-md-4 col-sm-4">
                        <div class="single-causes mb-30">
                            <a href="${ctx}/DetailServlet?matchId=${match.id}"><img src="${ctx}/image/${match.url}" alt="${match.name}"/></a>
                            <div class="causes-info">
                                <h3><a href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a></h3>
                                <p>${match.description}</p>
                                <div class="causes-meta">
                                    <div class="doller-target f-left">
                                        <h4>开始日期<span>${match.start}</span></h4>
                                    </div>
                                    <div class="doller-target f-right">
                                        <h4>结束日期 <span>${match.end}</span></h4>
                                    </div>
                                </div>
                                <a class="button theme-bg" href="${ctx}/DetailServlet?matchId=${match.id}">了解更多</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <!--用户中心-->
    <div class="container ">
        <!-- login area start -->
        <form action="EditUserServlet" method="post">
            <div class="input">
                姓名<input type="text" value="${user.name}" name="name">
            </div>
            <div class="input">
                邮箱<input type="text" value="${user.email}" name="email">
            </div>
            <div class="input2">
                <input type="submit" value="确认修改">
            </div>
        </form>
        <!-- login area end -->
    </div>


    <div class="container ">
        <!-- login area start -->
        <form action="EditPwdServlet" method="post">
            <div class="input">
                旧密码<input type="text" value="" name="oldpwd">
            </div>
            <div class="input">
                新密码<input type="text" value="" name="newpwd">
            </div>
            <div class="input">
                确认密码<input type="text" value="" name="newpwd2">
            </div>
            <div class="pwd-msg">
                <p>两次输入密码不一致</p>
            </div>
            <div class="input2">
                <input type="submit" value="确认修改">
            </div>


        </form>
    </div>

</div>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/user.js"></script>
<%@ include file="footer.jsp"%>