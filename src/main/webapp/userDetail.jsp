<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="container main-container">
    <c:if test="${user.isAdmin()}">
        <div class="overall">
            <p>剩余奖项：</p>
            <p>一等奖: ${1-award.getLv1()}个</p>
            <p>二等奖: ${2-award.getLv2()}个</p>
            <p>三等奖: ${3-award.getLv3()}个</p>
        </div>
    </c:if>
    <div class="row">
        <div class="span12 gallery-single">
            <div class="row preview">
                <div class="span6 match_imgbox">
                    <img src="${ctx}/image/${match.url}" class="thumbnail" alt="image" />
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
                    <c:if test="${match.isApplicationNow()&&match.isNow()}"><div class="big_info">竞赛进行中</div></c:if>
                    <c:if test="${!match.isApplicationNow()&&match.isNow()}"><div class="big_info">报名已结束</div></c:if>
                    <c:if test="${!match.isNow()}"><div class="big_info">竞赛已结束</div></c:if>
                </div>
            </div>

            <c:if test="${!user.isAdmin()}">
                <ul>
                <c:forEach items="${teamList}" var="team">
                    <li class="infobox" data-teamid="${team.id}">
                        <div class="header">
                            <div class="team_name"><span>${team.name}</span> </div>
                            <p>作品名：<a href="${ctx}/MatchByUserServlet">${team.workName}</a></p>
                            <p>成员：<c:forEach items="${team.getMemberList()}" var="member">${member.getMemberRealname()}&nbsp;</c:forEach></p>
                            <div class="like ${team.ifMeLikedTeam(user.id) ? 'liked':''}">
                                <i class="fa fa-thumbs-up"> <span>${team.like}</span></i>
                            </div>
                            <div class="check_award">
                                <c:if test="${team.lv!=0}">恭喜你，获得 ${team.getLvString()}<a href="${ctx}/CreteServlet?teamId=${team.id}&matchId=${match.id}"> 查看奖状</a></c:if>
                                <c:if test="${team.lv==0&&!match.isNow()}">很遗憾，未能获奖</c:if>
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
                                    <button class="delete" type="button">X</button>
                                </li>
                            </c:forEach>
                            <li class="img_box add_box">
                                <form class="uploadForm" method="post">
                                    <div class="billing-info mb-20px">
                                        <label>添加作品</label>
                                        <input type="file" id="file" name="file">
                                        <input type="button" class="uploadBtn" value="上传">
                                    </div>
                                </form>
                            </li>
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
                            <form class="setAwardForm" action="${ctx}/SetAwardServlet" method="post">
                                <input type="hidden" name="matchId" value="${match.id}">
                                <input type="hidden" name="teamId" value="${team.id}">
                                <select name="lv" class="lv">
                                    <option value="0" ${team.lv eq 0?'selected':'' }>未获奖</option>
                                    <option value="1" ${team.lv eq 1?'selected':'' }>一等奖</option>
                                    <option value="2" ${team.lv eq 2?'selected':'' }>二等奖</option>
                                    <option value="3" ${team.lv eq 3?'selected':'' }>三等奖</option>
                                </select>
                                <button class="btn btn-mini btn-inverse hidden-phone" type="submit">评奖</button>
                            </form>
                        </div>
                        <div class="msg" style="text-align: center">
                            <span style="color: red">${msg}</span>
                        </div>
                        <div class="description">简介：${team.description}</div>
                        <div class="description">作品展示：${team.description}</div>
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
        <script type="text/javascript">
            $(document).ready(function (){
                //如果该比赛过期，全局隐藏修改界面
                if(${!match.isNow()}){
                    $('.add_box').remove()
                    $('.delete').remove()
                }

                //点赞&取赞
                $('.like').click(function () {
                    let $infobox = $(this).closest('.infobox');

                    //交互，如果已赞则取消，反之
                    changeLike($(this))

                    //元素显示加减方法
                    function changeLike($like){
                        //这个post给后端，后端返回200表示点赞或取赞成功
                        let URL = "${ctx}/LikeServlet";
                        let data = {
                            userid : ${user.id},
                            teamid : $infobox.attr("data-teamid")
                        };
                        $.post(URL,data).then((msg)=>{
                            console.log(msg)
                            if(msg == 200) displayLike($like, true)
                            else if (msg == 201) displayLike($like, false)
                        })
                    }
                    //根据之前是赞还是没赞，改变点击后的样式
                    function displayLike($like, shouldLike){
                        //去掉或添加红色样式
                        shouldLike ? $like.closest('.like').addClass('liked'):$like.removeClass('liked')
                        //增减数字
                        let ans = parseInt($like.find('span').text()) + (shouldLike?1:-1)
                        $like.find('span').text(ans)
                    }
                })

                //上传作品
                $('.uploadBtn').click(function (){
                    let $infobox = $(this).closest('.infobox');
                    let $form = $infobox.find('.uploadForm');
                    let $img_box_template = $infobox.find('.template');
                    let formData = new FormData($form[0]);
                    if($infobox.find("input[name='file']").val()=="") {
                        showMsg($infobox, "请先上传图片！")
                        return false;
                    }
                    $.ajax({
                        url: '${ctx}/FileUploadServlet',
                        type: 'post',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success:  (returnData) => {
                            //这里调用新建作品的servlet,在数据库插入新的work记录，并记下该图的url
                            $.ajax({
                                url: '${ctx}/WorkCreateServlet',
                                type: 'post',
                                data: {
                                    url: returnData,
                                    matchid: ${match.id},
                                    teamid: $infobox.attr("data-teamid"),
                                },
                                success: (msg) => {
                                    if(msg==-2) showMsg($infobox, "不在活动时间内！")
                                    else if(msg==-3) showMsg($infobox, "网络错误！")
                                    else {
                                        //添加一份作品
                                        let work_id = msg;
                                        let $img_box_clone = $img_box_template.clone().removeClass('template');
                                        $img_box_clone.find('a').attr('href','${ctx}/image/'+returnData)
                                            .find('.img').attr('src','${ctx}/image/'+returnData)
                                        $img_box_clone.attr('data-workid',work_id)
                                        $form.closest('li').before($img_box_clone);
                                    }
                                }
                            })
                        }
                    });
                })

                //删除作品
                $('body').on("click",'.img_box .delete',function (){
                    let $img_box = $(this).closest('.img_box');
                    $.ajax({
                        url: '${ctx}/WorkDeleteServlet',
                        type: 'post',
                        data: {
                            workid: $img_box.attr('data-workid')
                        },
                        success: (msg) => {
                            if(msg==603) showMsg($infobox, "删除失败！")
                            else $img_box.remove()
                        }
                    })
                })
            })

            showMsg = ($infobox, text) => $infobox.find('.msg span').text(text)
        </script>

</div>

<%@ include file="/footer.jsp"%>

