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
<div class="color-bar-1"></div>
<div class="color-bar-2 color-bg"></div>

<div class="container main-container">

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
                        <a class="dropdown-toggle" data-toggle="dropdown" href="./index.htm.html">Home <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="./index.htm.html">Full Page</a></li>
                            <li><a href="./index-gallery.htm.html">Gallery Only</a></li>
                            <li><a href="./index-slider.htm.html">Slider Only</a></li>
                        </ul>
                    </li>
                    <li><a href="./features.htm.html">Features</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="./page-full-width.htm.html">Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="./page-full-width.htm.html">Full Width</a></li>
                            <li><a href="./page-right-sidebar.htm.html">Right Sidebar</a></li>
                            <li><a href="./page-left-sidebar.htm.html">Left Sidebar</a></li>
                            <li><a href="./page-double-sidebar.htm.html">Double Sidebar</a></li>
                        </ul>
                    </li>
                    <li class="dropdown active">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="./gallery-4col.htm.html">Gallery <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="./gallery-3col.htm.html">Gallery 3 Column</a></li>
                            <li><a href="./gallery-4col.htm.html">Gallery 4 Column</a></li>
                            <li><a href="./gallery-6col.htm.html">Gallery 6 Column</a></li>
                            <li><a href="./gallery-4col-circle.htm.html">Gallery 4 Round</a></li>
                            <li><a href="./gallery-single.htm.html">Gallery Single</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="./blog-style1.htm.html">Blog <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="./blog-style1.htm.html">Blog Style 1</a></li>
                            <li><a href="./blog-style2.htm.html">Blog Style 2</a></li>
                            <li><a href="./blog-style3.htm.html">Blog Style 3</a></li>
                            <li><a href="./blog-style4.htm.html">Blog Style 4</a></li>
                            <li><a href="./blog-single.htm.html">Blog Single</a></li>
                        </ul>
                    </li>
                    <li><a href="./page-contact.htm.html">Contact</a></li>
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

    </div><!-- End Header -->

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

</div>
<div class="footer-container"><!-- Begin Footer -->
    <div class="container">
        <div class="row footer-row">
            <div class="span3 footer-col">
                <h5>About Us</h5>
                <img src="./img/piccolo-footer-logo.png" alt="Piccolo" /><br /><br />
                <address>
                    <strong>Design Team</strong><br />
                    123 Main St, Suite 500<br />
                    New York, NY 12345<br />
                </address>
                <ul class="social-icons">
                    <li><a href="#" class="social-icon facebook"></a></li>
                    <li><a href="#" class="social-icon twitter"></a></li>
                    <li><a href="#" class="social-icon dribble"></a></li>
                    <li><a href="#" class="social-icon rss"></a></li>
                    <li><a href="#" class="social-icon forrst"></a></li>
                </ul>
            </div>
            <div class="span3 footer-col">
                <h5>Latest Tweets</h5>
                <ul>
                    <li><a href="#">@room122</a> Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                    <li><a href="#">@room122</a> In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Morbi blandit ultricies ultrices.</li>
                    <li><a href="#">@room122</a> Vivamus nec lectus sed orci molestie molestie. Etiam mattis neque eu orci rutrum aliquam.</li>
                </ul>
            </div>
            <div class="span3 footer-col">
                <h5>Latest Posts</h5>
                <ul class="post-list">
                    <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                    <li><a href="#">Consectetur adipiscing elit est lacus gravida</a></li>
                    <li><a href="#">Lectus sed orci molestie molestie etiam</a></li>
                    <li><a href="#">Mattis consectetur adipiscing elit est lacus</a></li>
                    <li><a href="#">Cras rutrum, massa non blandit convallis est</a></li>
                </ul>
            </div>
            <div class="span3 footer-col">
                <h5>Flickr Photos</h5>
                <ul class="img-feed">
                    <li><a href="#"><img src="./img/gallery/flickr-img-1.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-2.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-3.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-4.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-5.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-6.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-7.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-8.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-9.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-10.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-11.jpg" alt="Image Feed" /></a></li>
                    <li><a href="#"><img src="./img/gallery/flickr-img-12.jpg" alt="Image Feed" /></a></li>
                </ul>
            </div>
        </div>

        <div class="row"><!-- Begin Sub Footer -->
            <div class="span12 footer-col footer-sub">
                <div class="row no-margin">
                    <div class="span6"><span class="left">&copy; Copyright &copy; 2013.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></span></div>
                    <div class="span6">
                            <span class="right">
                            <a href="#">Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Features</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Gallery</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Blog</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Contact</a>
                            </span>
                    </div>
                </div>
            </div>
        </div><!-- End Sub Footer -->

    </div>
</div><!-- End Footer -->

<!-- Scroll to Top -->
<div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
