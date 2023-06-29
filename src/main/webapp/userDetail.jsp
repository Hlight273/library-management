
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<header>
    <title>设置奖项</title>
</header>
    <div class="container main-container">

    <div class="row">

        <!-- Gallery Items
        ================================================== -->
        <div class="span12 gallery-single">

            <div class="row">
                <div class="span6">
                    <img src="" class="align-left thumbnail" alt="image" />
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
<%--                    <a href="application.jsp?matchId=${match.id}"><button class="btn btn-inverse pull-left" type="button">报名参赛</button></a>--%>
<%--                    <a href="IndexServlet" class="pull-right"><i class="icon-arrow-left"></i>返回首页</a>--%>
                </div>
            </div>
            <c:if test="${user.isAdmin()}">
                <c:forEach items="${teamList}" var="team">
                    <ul>
                        <li>
                            <p>${team.id}</p>
                            <p>${team.name}</p>
                        </li>
                        <li>
                            <c:forEach items="workList" var="work">
                                <img src="${work.url}" width="50px" height="50px">
                            </c:forEach>
                        </li>
                        <li>
                            <select>
                                <option>-请选择-</option>
                                <option>一等奖</option>
                                <option>二等奖</option>
                                <option>三等奖</option>
                            </select>
                        </li>
                    </ul>
                </c:forEach>
            </c:if>
        </div>
    </div>

</div>
<%@ include file="footer.jsp"%>