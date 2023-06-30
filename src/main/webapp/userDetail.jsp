<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/userDetail.css" type="text/css">
<header>
    <title>设置奖项</title>
</header>
    <div class="container main-container">

    <div class="row">
        <div class="span12 gallery-single">
            <div class="row">
                <div class="span6">
                    <img src="${ctx}/image/${match.url}" class="align-left thumbnail" alt="image" />
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
                </div>
            </div>

<%--            <c:if test="${!user.isAdmin()}">--%>
                <table>
<%--                    <c:forEach items="${teamList}" var="team">--%>
                        <tr>
                            <td class="firstTd">
                                <p>团队名称：${team.name}</p>
                                <p>团队作品：${team.workName}</p>
                            </td>
                            <td>
                                <c:forEach items="${team.getWorkList()}" var="work">
                                    <img src="${ctx}/image/${work.url}" width="270px" height="370px">
                                </c:forEach>
                            </td>
                            <td>
                                <a href="#"><button class="btn btn-inverse pull-left" type="button">提交作品</button></a>
                            </td>
                        </tr>
<%--                    </c:forEach>--%>
                </table>
<%--            </c:if>--%>


            <c:if test="${user.isAdmin()}">
                <table>
                    <c:forEach items="${teamList}" var="team">
                        <tr>
                            <td class="firstTd">
                                <p>队伍名称：${team.name}</p>
                                <p>作品名称：${team.workName}</p>
                            </td>
                            <td>
                                <c:forEach items="${team.getWorkList()}" var="work">
                                    <img src="${ctx}/image/${work.url}" width="50px" height="50px">
                                </c:forEach>
                            </td>
                            <td>
                                <select>
                                    <option>-请选择-</option>
                                    <option>一等奖</option>
                                    <option>二等奖</option>
                                    <option>三等奖</option>
                                </select>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </c:if>
        </div>
    </div>

</div>
<%@ include file="footer.jsp"%>