<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Piccolo Theme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- JS
    =================================================== -->
    <script src="../js/jquery-3.6.0.min.js"></script>
    <!-- CSS
    ================================================== -->
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="./css/bootstrap.css" />
    <link rel="stylesheet" href="./css/bootstrap-responsive.css" />
    <%--    <link rel="stylesheet" href="http://www.room122.com/demo/html/piccolo/css/jquery.lightbox-0.5.css" />--%>
    <link rel="stylesheet" href="./css/custom-styles.css" />

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="../css/style-ie.css" />
    <![endif]-->

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<!-- Begin Header -->
<div class="row header"><!-- Begin Header -->

    <!-- Logo
    ================================================== -->
    <div class="span5 logo">
        <a href="./index.htm.html"><img src="./img/piccolo-logo.png" alt="" /></a>
        <h5>Big Things... Small Packages</h5>
    </div>

    <!-- Main Navigation
    ================================================== -->
    <div class="span7 navigation">
        <div class="navbar hidden-phone">

            <ul class="nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="./index.htm.html">首页<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="./index.htm.html">FULL PAGE</a></li>
                        <li><a href="./index-gallery.htm.html">GALLERY ONLY</a></li>
                        <li><a href="./index-slider.htm.html">SILDER ONLY</a></li>
                    </ul>
                </li>
                <li><a href="./features.htm.html">分类</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="./page-full-width.htm.html"> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="./page-full-width.htm.html">FULL WIDTH</a></li>
                        <li><a href="./page-right-sidebar.htm.html">RIGHT SIDEBAR</a></li>
                        <li><a href="./page-left-sidebar.htm.html">LEFT SIDEBAR</a></li>
                        <li><a href="./page-double-sidebar.htm.html">DOUBLE SIDEBAR</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="./gallery-4col.htm.html">个人中心<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="./gallery-3col.htm.html">Gallery 3 Column</a></li>
                        <li><a href="./gallery-4col.htm.html">Gallery 4 Column</a></li>
                        <li><a href="./gallery-6col.htm.html">Gallery 6 Column</a></li>
                        <li><a href="./gallery-single.htm.html">Gallery Single</a></li>
                        <c:if test="${user.isAdmin()}">
                            <li><a href="./gallery-single.htm.html">管理员</a></li>
                        </c:if>
                    </ul>
                </li>
                <li class="dropdown active">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="./blog-style1.htm.html">博客 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="./blog-style1.htm.html">Blog Style 1</a></li>
                        <li><a href="./blog-style2.htm.html">Blog Style 2</a></li>
                        <li><a href="./blog-style3.htm.html">Blog Style 3</a></li>
                        <li><a href="./blog-style4.htm.html">Blog Style 4</a></li>
                        <li><a href="./blog-single.htm.html">Blog Single</a></li>
                    </ul>
                </li>
                <li><a href="${ctx}/login.jsp">登录</a></li>
            </ul>

        </div>

        <!-- Mobile Nav
       ================================================== -->
        <form action="#" id="mobile-nav" class="visible-phone" />
        <div class="mobile-nav-select">
            <select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
                <option value="" />Navigate...
                <option value="index.htm" />Home
                <option value="index.htm" />- Full Page
                <option value="index-gallery.htm" />- Gallery Only
                <option value="index-slider.htm" />- Slider Only
                <option value="features.htm" />Features
                <option value="page-full-width.htm" />Pages
                <option value="page-full-width.htm" />- Full Width
                <option value="page-right-sidebar.htm" />- Right Sidebar
                <option value="page-left-sidebar.htm" />- Left Sidebar
                <option value="page-double-sidebar.htm" />- Double Sidebar
                <option value="gallery-4col.htm" />Gallery
                <option value="gallery-3col.htm" />- 3 Column
                <option value="gallery-4col.htm" />- 4 Column
                <option value="gallery-6col.htm" />- 6 Column
                <option value="gallery-4col-circle.htm" />- Gallery 4 Col Round
                <option value="gallery-single.htm" />- Gallery Single
                <option value="blog-style1.htm" />Blog
                <option value="blog-style1.htm" />- Blog Style 1
                <option value="blog-style2.htm" />- Blog Style 2
                <option value="blog-style3.htm" />- Blog Style 3
                <option value="blog-style4.htm" />- Blog Style 4
                <option value="blog-single.htm" />- Blog Single
                <option value="page-contact.htm" />Contact
            </select>
        </div>
        </form>
    </div>
</div>

