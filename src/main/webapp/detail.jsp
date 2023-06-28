<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>竞赛详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- CSS
    ================================================== -->
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="./css/bootstrap.css" />
    <link rel="stylesheet" href="./css/bootstrap-responsive.css" />
    <link rel="stylesheet" href="http://www.room122.com/demo/html/piccolo/css/jquery.lightbox-0.5.css" />
    <link rel="stylesheet" href="./css/custom-styles.css" />

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="./css/style-ie.css" />
    <![endif]-->

    <!-- JS
    ================================================== -->
    <script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
    <script src="./js/bootstrap.js"></script>
    <script src="./js/jquery.custom.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div class="container main-container">

    <div class="row">

        <!-- Gallery Items
        ================================================== -->
        <div class="span12 gallery-single">

            <div class="row">
                <div class="span6">
                    <img src="./img/gallery/gallery-img-3-full.jpg" class="align-left thumbnail" alt="image" />
                </div>
                <div class="span6">
                    <h2>竞赛名称</h2>
                    <p class="lead">简介</p>
                    <p>简介内容</p>

                    <ul class="project-info">
                        <li><h6>开始日期:</h6>时间</li>
                        <li><h6>结束日期:</h6>时间</li>
                        <li><h6>竞赛主题:</h6>主题</li>
<%--                        <li><h6>Art Director:</h6> Jane Doe</li>--%>
<%--                        <li><h6>Designer:</h6> Jimmy Doe</li>--%>
                    </ul>
                    <a href="#"><button class="btn btn-inverse pull-left" type="button">报名参赛</button></a>
                    <a href="IndexServlet" class="pull-right"><i class="icon-arrow-left"></i>返回首页</a>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
