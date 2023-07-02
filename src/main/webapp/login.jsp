<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请登录</title>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Furns - Furniture eCommerce HTML Template</title>
    <meta name="description" content="240+ Best Bootstrap Templates are available on this website. Find your template for your project compatible with the most popular HTML library in the world.">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="profile" href="#">
    <link rel="canonical" href="#">
    <!-- Open Graph (OG) meta tags are snippets of code that control how URLs are displayed when shared on social media  -->
    <meta property="og:locale" content="en_US">
    <meta property="og:type" content="website">
    <meta property="og:title" content="Furns - Responsive eCommerce HTML Template">
    <meta property="og:url" content="PAGE_URL">
    <meta property="og:site_name" content="Furns - Responsive eCommerce HTML Template">
    <!-- For the og:image content, replace the # with a link of an image -->
    <meta property="og:image" content="#">
    <meta property="og:description" content="Furns - Responsive eCommerce HTML Template">
    <meta name="robots" content="noindex, follow">
    <!-- Add site Favicon -->
    <meta name="msapplication-TileImage" content="assets/images/favicon/favicon.png">
    <link rel="stylesheet" href="css/css2.css" type="text/css">
    <link rel="stylesheet" href="css/vendor.min.css" type="text/css">
    <link rel="stylesheet" href="css/plugins.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.min.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
<!-- login area start -->
<div class="login-register-area pt-100px pb-100px">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                <div class="login-register-wrapper">
                    <div class="login-register-tab-list nav">
                        <a class="active" data-bs-toggle="tab" href="#lg1">
                            <h4>登录</h4>
                        </a>
                        <a data-bs-toggle="tab" href="#lg2">
                            <h4>注册</h4>
                        </a>
                    </div>
                    <div class="text-center" style="text-align: center">
                        <span style="color: red">${msg}</span>
                    </div>
                    <div class="tab-content">
                        <div id="lg1" class="tab-pane active">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <%--登录表单--%>
                                    <form action="${ctx}/LoginServlet" method="post">
                                        <%--输入用户名--%>
                                        <input type="text" name="email" placeholder="邮箱地址" value="${email}">
                                        <%--输入密码--%>
                                        <input type="password" name="pwd" placeholder="密码">
                                        <div class="button-box">
                                            <div class="login-toggle-btn">
                                                <input type="checkbox">
                                                <a class="flote-none" href="javascript:void(0)">记住我</a>
                                                <a href="#">忘记密码?</a>
                                            </div>
                                            <%--提交按钮，将数据传到LoginServlet--%>
                                            <button type="submit"><span>登录</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div id="lg2" class="tab-pane">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <%--注册表单--%>
                                    <form action="RegisterServlet" method="post">
                                        <input type="text" name="email" placeholder="邮箱地址">
                                        <input type="password" name="pwd" placeholder="密码">
                                        <input type="text" name="name" placeholder="真实姓名">
                                        <div class="button-box">
                                            <button type="submit"><span>注册</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- login area end -->


<script src="js/plugins.min.js"></script>

<!-- Main Js -->
<script src="js/main.js"></script>
</body>
</html>
