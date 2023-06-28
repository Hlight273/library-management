<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Piccolo Theme</title>
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

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="row headline"><!-- Begin Headline -->

    <!-- Slider Carousel
   ================================================== -->
    <div class="span8">
        <div class="flexslider">
            <ul class="slides">
                <li><a href="./gallery-single.htm.html"><img src="" alt="slider" /></a></li>
                <li><a href="./gallery-single.htm.html"><img src="" alt="slider" /></a></li>
                <li><a href="./gallery-single.htm.html"><img src="" alt="slider" /></a></li>
                <li><a href="./gallery-single.htm.html"><img src="" alt="slider" /></a></li>
                <li><a href="./gallery-single.htm.html"><img src="" alt="slider" /></a></li>
            </ul>
        </div>
    </div>

    <!-- Headline Text
    ================================================== -->
    <div class="span4">
        <h3>Welcome to Piccolo. <br />
            A Big Theme in a Small Package.</h3>
        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium vulputate magna sit amet blandit.</p>
        <p>Cras rutrum, massa non blandit convallis, est lacus gravida enim, eu fermentum ligula orci et tortor. In sit amet nisl ac leo pulvinar molestie. Morbi blandit ultricies ultrices.</p>
        <a href="#"><i class="icon-plus-sign"></i>Read More</a>
    </div>
</div><!-- End Headline -->

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>