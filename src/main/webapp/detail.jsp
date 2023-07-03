<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/detail.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery-3.6.0.min.js"></script>
<div class="container main-container">

    <!-- Gallery Items
    ================================================== -->
    <div class="row">
        <div class="span12 gallery-single">
            <div class="row">
                <div class="span6 match_imgbox">
                    <img src="${ctx}/image/${match.url}" class=thumbnail" alt="image"/>
                </div>
                <div class="span6">
                    <h2>${match.name}</h2>
                    <ul class="project-info">
                        <li><p class="lead">简介</p>${match.description}</li>
                    </ul>

                    <ul class="project-info">
                        <li><h6>竞赛时间:</h6>${match.getDateString(match.start)} - ${match.getDateString(match.end)}</li>
                        <li><h6>报名截止:</h6>${match.getDateString(match.applicationEnd)}</li>
                        <li><h6>竞赛主题:</h6>${match.theme}</li>
                    </ul>
                    <c:if test="${match.isApplicationNow()&&match.isNow()}">
                        <div class="big_info">竞赛进行中</div>
                        <br>
                        <div class="detail-button">
                            <c:if test="${!user.isAdmin()}">
                                <a href="application.jsp?matchId=${match.id}">
                                    <button class="btn btn-inverse pull-left" type="button">报名参赛</button>
                                </a>
                            </c:if>
                            <a href="IndexServlet">
                                <button class="btn btn-inverse pull-right" type="button">返回首页</button>
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${!match.isApplicationNow()&&match.isNow()}">
                        <div class="big_info">报名已结束</div>
                        <br>
                        <div class="detail-button">
                            <c:if test="${user.isAdmin()}">
                                <a href="MatchServlet?id=${match.id}">
                                    <button class="btn btn-inverse pull-left" type="button">修改竞赛</button>
                                </a>
                            </c:if>
                            <a href="IndexServlet">
                                <button class="btn btn-inverse pull-right" type="button">返回首页</button>
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${!match.isNow()}">
                        <div class="big_info">竞赛已结束</div>
                        <br>
                        <a href="IndexServlet">
                            <button class="btn btn-inverse pull-right" type="button">返回首页</button>
                        </a>
                    </c:if>
                    <div class="detail-msg">
                        <c:if test="${!empty msg}">
                            <p>${msg}</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <c:if test="${!user.isAdmin() && !match.isNow()}">
                <ul>
                    <c:forEach items="${teamList}" var="team">
                        <li class="infobox" data-teamid="${team.id}">
                            <div class="header">
                                <div class="team_name"><span>${team.name}</span></div>
                                <p>作品名：${team.workName}</p>
                                <p>成员：<c:forEach items="${team.getMemberList()}"
                                                 var="member">${member.getMemberRealname()}&nbsp;</c:forEach></p>
                                <div class="like ${team.ifMeLikedTeam(user.id) ? 'liked':''}">
                                    <i class="fa fa-thumbs-up"> <span>${team.like}</span></i>
                                </div>
                                <div class="check_award">
                                    <c:if test="${team.lv!=0}">获奖等第： ${team.getLvString()}</c:if>
                                    <c:if test="${team.lv==0&&!match.isNow()}">未能获奖</c:if>
                                </div>
                            </div>
                            <div class="description">简介：${team.description}</div>
                            <div class="msg" style="text-align: center">
                                <span style="color: red">${msg}</span>
                            </div>
                            <ul>
                                <li class="img_box template">
                                    <a><img class="img"></a>
                                    <button class="delete" type="button">X</button>
                                </li>
                                <c:forEach items="${team.getWorkList()}" var="work">
                                    <li class="img_box" data-workid="${work.id}">
                                        <a href="${ctx}/image/${work.url}">
                                            <img class="img" src="${ctx}/image/${work.url}">
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>

            <c:if test="${user.isAdmin()}">
                <ul>
                    <c:forEach items="${teamList}" var="team">
                        <li class="infobox" data-teamid="${team.id}">
                            <div class="header">
                                <div class="team_name"><span>${team.name}</span></div>
                                <p>作品名：${team.workName}</p>
                                <c:if test="${!match.isNow()}">
                                    <div class="check_award">
                                        <c:if test="${team.lv!=0}">获奖等第： ${team.getLvString()}</c:if>
                                        <c:if test="${team.lv==0&&!match.isNow()}">未能获奖</c:if>
                                    </div>
                                </c:if>
                            </div>
                            <div class="description">简介：${team.description}</div>
                            <div class="msg" style="text-align: center">
                                <span style="color: red">${msg}</span>
                            </div>
                            作品展示：
                            <ul>
                                <c:forEach items="${team.getWorkList()}" var="work">
                                    <li class="img_box" data-workid="${work.id}">
                                        <a href="${ctx}/image/${work.url}">
                                            <img class="img" src="${ctx}/image/${work.url}">
                                        </a>
                                        <button class="delete" type="button">X</button>
                                    </li>
                                </c:forEach>
                            </ul>
                            <c:if test="${empty team.getWorkList()}">
                                <div class="empty_info_mini">该团队还没有上传作品！</div>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
                <c:if test="${empty teamList}">
                    <div class="empty_info">当前还没有人报名竞赛！</div>
                </c:if>
            </c:if>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        //点赞&取赞
        $('.like').click(function () {
            if ('${user.id}' === '') {
                location.href = '${ctx}/login.jsp';
                return
            }
            //如果没登录，直接跳到登录页
            let $infobox = $(this).closest('.infobox');

            //交互，如果已赞则取消，反之
            changeLike($(this))

            //元素显示加减方法
            function changeLike($like) {
                //这个post给后端，后端返回200表示点赞或取赞成功
                let URL = "${ctx}/LikeServlet";
                let data = {
                    userid: '${user.id}',
                    teamid: $infobox.attr("data-teamid")
                };
                $.post(URL, data).then((msg) => {
                    if (msg == 200) displayLike($like, true)
                    else if (msg == 201) displayLike($like, false)
                })
            }

            //根据之前是赞还是没赞，改变点击后的样式
            function displayLike($like, shouldLike) {
                //去掉或添加红色样式
                shouldLike ? $like.closest('.like').addClass('liked') : $like.removeClass('liked')
                //增减数字
                let ans = parseInt($like.find('span').text()) + (shouldLike ? 1 : -1)
                $like.find('span').text(ans)
            }
        })
    })
</script>

<%@ include file="footer.jsp" %>

