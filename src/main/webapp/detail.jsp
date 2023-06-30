<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<header>
    <title>竞赛详情</title>
    <link rel="stylesheet" href="./css/detail.css">
</header>
    <div class="container main-container">

        <!-- Gallery Items
        ================================================== -->
        <div class="span12 gallery-single">

            <div class="row h700">
                <div class="span6 h500">
                    <img src="${ctx}/image/${match.url}" class="align-left thumbnail" alt="${match.name}" />
                </div>
                <div class="span6">
                    <h2>竞赛名称</h2>${match.name}
                    <p class="lead">简介</p>
                    <p>简介内容</p>
                    ${match.description}
                    <ul class="project-info">
                        <li><h6>开始日期:</h6>${match.start}</li>
                        <li><h6>结束日期:</h6>${match.end}</li>
                        <li><h6>竞赛主题:</h6>${match.theme}</li>
                    </ul>
                    <div class="detail-button">
                        <a href="application.jsp?matchId=${match.id}"><button class="btn btn-inverse pull-left" type="button">报名参赛</button></a>
                        <a href="IndexServlet"><button class="btn btn-inverse pull-right" type="button">返回首页</button></a>
                    </div>
                    <div class="detail-msg">
                        <c:if test="${!empty msg}">
                            <p>${msg}</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

</div>
<%@ include file="footer.jsp"%>

