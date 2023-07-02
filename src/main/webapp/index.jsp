<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>

<div class="container">
    <%--首页介绍：轮播图+介绍--%>
    <div class="row headline">
        <div class="span8">
            <div class="flexslider">
<%--                <ul class="slides">--%>
                    <a href="./gallery-single.htm.html"><img src="image/img.png" alt="slider" class="d-block w-100" id="img1" style="width:667px;height:381px;"/></a></li>
                    <a href="image/img_1.png"><img src="image/img_1.png" alt="slider" class="d-block w-100" style="width:667px;height:381px;"/></a>
                    <a href="image/img_2.png"><img src="image/img_2.png" alt="slider" class="d-block w-100" style="width:667px;height:381px;"/></a>
                    <a href="image/img_3.png"><img src="image/img_3.png" alt="slider" class="d-block w-100" style="width:667px;height:381px;"/></a>
<%--                </ul>--%>
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
                        <div class="img_box" >
                            <div class="photo">
                                <a href="${ctx}/DetailServlet?matchId=${match.id}">
                                    <img src="${ctx}/image/${match.url}" style="height: 362px;width: 270px" alt=${match.name} />
                                </a>
                            </div>
                            <div class="top" style="position: absolute;top:15px;left: 15px;color: white;font-size: large;">
                                <c:if test="${match.isNow()}">
                                    <div style="background: red;border-radius:15px">进行中</div>
                                </c:if>
                                <c:if test="${!match.isNow()}">
                                    <div style="background: gray;border-radius:15px">已过期</div>
                                </c:if>
                            </div>
                        </div>
                        <span class="project-details" style="width: 270px;height: 120px; overflow: hidden">
                            <a  class="smallname" href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a>
                            <p class="start">起始日期:<br>${match.start}-${match.end}</p>
                                ${match.description}

                        </span>

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
    .flexslider{
        width:  695px;
        height: 380px;
        /*border: 1px solid #000;*/
        overflow: hidden;    //超出隐藏
    }
    .top{
        width: 60px;
        height: 30px;
        line-height: 30px;
        text-align: center;
    }
    .photo{
        height: 362px;
    }
    .empty_info {
        margin: 100px 0 150px -30px;
        width: 1200px;
        text-align: center;
        color: darkgrey;
    }
    .img_box {
        position: relative;
        width: 270px;
        height: 360px;
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
<script>
        var img1=document.getElementById("img1");
        var i=0;


        // 5行代码解最简单的轮播图
        setInterval("lubo()",1000);  //定时器没过1000毫秒执行该函数一次
        function lubo(){
        img1.style.marginLeft=i+"px";//修改css样式：图片距离box左边的距离
        i-=667;  //距离 减(向左)  1张图片宽度
        if(i==-667*4){
            i=0
        }   //一共有4张图片，所以到4的时候回到最开始
    }
</script>

<%@ include file="footer.jsp"%>