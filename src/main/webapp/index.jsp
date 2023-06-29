<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>

<div class="container">
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
            <h3>等你来！第一届创意海报设计大赛！</h3>
            <p class="lead">“‘染’点激情，‘绘’聚创意”校园动态电子海报设计大赛。</p>
            <p>为进一步促进校园精神文明建设，创造更有利于学生健康成长的校园文化氛围，营造校园文化的集中展示，继续发扬“人文精神”。希望通过本次活动能够引起广大师生对大学生素质拓展风貌的建设、对校园活动宣传海报的艺术化（美观）的关注。</p>
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

            <ul class="nav nav-tabs">
                <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
                <li><a href="#profile" data-toggle="tab">Profile</a></li>
                <li><a href="#messages" data-toggle="tab">Messages</a></li>
                <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            <!-- Right Side Start -->
            <div class="select-shoing-wrap d-flex align-items-center">
                <div class="shop-select">
                    <form action="SearchServlet" method="post">
                        <input type="text" placeholder="输入您要搜索的书籍" class="shop-sort" name="key">
                    </form>
                </div>
            </div>
            <!-- Right Side End -->
            <!-- Gallery Thumbnails
            ================================================== -->

            <div class="row clearfix no-margin">
                <ul class="gallery-post-grid holder">
                    <c:forEach items="${matchList}" var="match">
                    <li class="span3 gallery-item" data-id="id-1" data-type="illustration">
                        <a href="${ctx}/DetailServlet?matchId=${match.id}"><img style="width: 270px;height: 370px" src="${ctx}/image/work/${match.url}.jpg" alt=${match.name} /></a>
                        <span class="project-details"><a href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a>For an international ad campaign.</span>
                    </li>
                    </c:forEach>
            </div>
            <!-- Gallery Item 1 -->
        </div>
    </div><!-- End Gallery Row -->
</div> <!-- End Container -->

<%@ include file="footer.jsp"%>