<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>海报设计</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="js/jquery-3.6.0.min.js"></script>
    <!-- CSS-->
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="font/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.css"/>
<%--        <link rel="stylesheet" href="http://www.room122.com/demo/html/piccolo/css/jquery.lightbox-0.5.css" />--%>
    <link rel="stylesheet" href="css/custom-styles.css"/>
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    <script src="js/header.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
<div class="row header">
    <div class="span5 logo">
        <a href="${ctx}/IndexServlet"><img src="image/newlogo.png" alt="logo" style="height: 80px;margin:-20px;" /></a>
<%--        <h5>Big Things... Small Packages</h5>--%>
    </div>
    <div class="span7 navigation">
        <div class="navbar hidden-phone">

            <ul class="nav">
                <li class="dropdown" id="a1"><a href="${ctx}/IndexServlet">首页</a></li>
                <c:if test="${!user.isAdmin()}">
                    <li class="dropdown" id="a2"><a class="dropdown-toggle" data-toggle="dropdown" href="${ctx}/MatchListServlet?sort=1">报名竞赛</a></li>
                </c:if>
                <c:if test="${user.isAdmin()}">
                    <li class="dropdown" id="a3"><a class="dropdown-toggle" data-toggle="dropdown" href="${ctx}/MatchServlet">发布竞赛</a></li>
                </c:if>
<%--                <li class="dropdown" id="a4"><a class="dropdown-toggle" data-toggle="dropdown" href="${ctx}/MatchListServlet">往届竞赛</a></li>--%>
                <c:if test="${empty user}">
                    <li class="dropdown" id="a5"><a href="${ctx}/login.jsp">请登录！</a></li>
                </c:if>
                <c:if test="${!empty user}">
                    <li class="dropdown">
                        <c:if test="${!user.isAdmin()}">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="${ctx}/MatchByUserServlet">个人中心<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown"><a href="${ctx}/MatchByUserServlet">我的竞赛</a></li>
                                <li class="dropdown"><a href="${ctx}/LogoutServlet">退出登录</a></li>
                            </ul>
                        </c:if>
                        <c:if test="${user.isAdmin()}">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="${ctx}/MatchByUserServlet">管理中心<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class=""><a href="${ctx}/StatServlet">统计信息</a></li>
                                <li class=""><a href="${ctx}/LogoutServlet">退出登录</a></li>
                            </ul>
                        </c:if>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>

