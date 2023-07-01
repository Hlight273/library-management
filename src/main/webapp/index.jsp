<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>

<div class="container">
    <%--首页介绍：轮播图+介绍--%>
    <div class="row headline">
        <div class="span8">
            <div class="flexslider">
                <ul class="slides">
                    <li><a href="./gallery-single.htm.html"><img src="image/img.png" alt="slider" /></a></li>
                    <%--                <li><a href="./gallery-single.htm.html"><img src="image/match/img_1.png" alt="slider" /></a></li>--%>
                    <%--                <li><a href="./gallery-single.htm.html"><img src="image/match/img_2.png" alt="slider" /></a></li>--%>
                    <%--                <li><a href="./gallery-single.htm.html"><img src="image/match/img_3.png" alt="slider" /></a></li>--%>
                    <%--                <li><a href="./gallery-single.htm.html"><img src="image/match/img_4.png" alt="slider" /></a></li>--%>
                </ul>
            </div>
        </div>
        <div class="span4">
            <h3>等你来！第一届创意海报设计大赛！</h3>
            <p class="lead">“‘染’点激情，‘绘’聚创意”校园动态电子海报设计大赛。</p>
            <p>为进一步促进校园精神文明建设，创造更有利于学生健康成长的校园文化氛围，营造校园文化的集中展示，继续发扬“人文精神”。希望通过本次活动能够引起广大师生对大学生素质拓展风貌的建设、对校园活动宣传海报的艺术化（美观）的关注。</p>
            <a href="#"><i class="icon-plus-sign"></i>Read More</a>
        </div>
    </div>

    <%--竞赛列表--%>
    <div class="row gallery-row">
        <div class="span12">
            <h5 class="title-bg">最新
                <small>竞赛列表</small>
                <button class="btn btn-mini btn-inverse hidden-phone" type="button"><a href="${ctx}/MatchListServlet" style="color: white">查看全部</a></button>
            </h5>
            <div class="row clearfix no-margin">
                <ul class="gallery-post-grid holder">
                    <c:forEach items="${matchList}" var="match">
                    <li class="gallery-item" data-id="id-1" data-type="illustration" style="width: 300px;">
                        <div class="img_box">
                                <a href="${ctx}/DetailServlet?matchId=${match.id}">
                                    <img src="${ctx}/image/${match.url}" alt=${match.name} />
                                </a>
                        </div>
                        <span class="project-details" style="width: 270px;height: 75px; overflow: hidden">
                            <a  class="smallname" href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a>${match.description}</span>
                            <p class="start">开始日期:${match.start}</p>
                            <p class="end">结束日期:${match.end}</p>
                    </li>
                    </c:forEach>
                    <c:if test="${empty matchList}">
                    <div class="empty_info">目前赛事空空如也</div>
                    </c:if>
            </div>
        </div>
    </div>
</div>

<style>
    .empty_info {
        margin: 100px 0 150px -30px;
        width: 1200px;
        text-align: center;
        color: darkgrey;
    }
    .img_box {
        position: relative;
        width: 270px;
        height: 370px;
        border: 1px solid darkgrey;
        overflow: hidden;
    }
    .img_box img {
        position: absolute;
        width: 270px;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    p{
        text-align: center;
        width: 270px;
    }

</style>

<%@ include file="footer.jsp"%>