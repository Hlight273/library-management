<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<%--固定宣传部分--%>
<div class="row headline"><!-- Begin Headline -->
    <!-- Slider Carousel
   ================================================== -->
    <div class="span8">
        <div class="flexslider">
            <ul class="slides">
                <li><a href="./gallery-single.htm.html"><img src="image/match/img.png" alt="slider" /></a></li>
<%--                <li><a href="./gallery-single.htm.html"><img src="image/match/img_1.png" alt="slider" /></a></li>--%>
<%--                <li><a href="./gallery-single.htm.html"><img src="image/match/img_2.png" alt="slider" /></a></li>--%>
<%--                <li><a href="./gallery-single.htm.html"><img src="image/match/img_3.png" alt="slider" /></a></li>--%>
<%--                <li><a href="./gallery-single.htm.html"><img src="image/match/img_4.png" alt="slider" /></a></li>--%>
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

<%--参赛作品部分--%>
<div class="row gallery-row"><!-- Begin Gallery Row -->

    <div class="span12">
        <h5 class="title-bg">Recent Work
            <small>That we are most proud of</small>
            <button class="btn btn-mini btn-inverse hidden-phone" type="button">View Portfolio</button>
        </h5>

        <!-- Gallery Thumbnails
        ================================================== -->

        <div class="row clearfix no-margin">
            <ul class="gallery-post-grid holder">
                <c:forEach items="${matchList}" var="match">
                    <li class="span3 gallery-item" data-id="id-1" data-type="illustration">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="${ctx}/${match.url}.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                <a href="./gallery-single.htm.html" class="item-details-link"></a>
                            </span>
                        </span>
                        <a href="./gallery-single.htm.html"><img src="image/work/${match.url}.jpg" alt="Gallery" /></a>
                        <span class="project-details"><a href="./gallery-single.htm.html">Custom Illustration</a>For an international ad campaign.</span>
                    </li>
                </c:forEach>
            </div>
                <!-- Gallery Item 1 -->
    </div>
</div><!-- End Gallery Row -->
<%@ include file="footer.jsp"%>