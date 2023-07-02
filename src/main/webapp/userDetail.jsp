<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/userDetail.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="container main-container">
    <div class="row">
        <div class="span12 gallery-single">
            <div class="row">
                <div class="span6 match_imgbox">
                    <img src="${ctx}/image/${match.url}" class="align-left thumbnail" alt="image" />
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
                            <p>作品名：${team.workName}</p>
                            <p>成员：<c:forEach items="${team.getMemberList()}" var="member">${member.getMemberRealname()}&nbsp;</c:forEach></p>
                            <div class="like ${team.ifMeLikedTeam(user.id) ? 'liked':''}">
                                <i class="fa fa-thumbs-up"> <span>${team.like}</span></i>
                            </div>
                            <div class="check_award">
                                <c:if test="${team.lv!=0}">恭喜你，获得 ${team.getLvString()}<a href="${ctx}/CreteServlet?teamId=${team.id}"> 查看奖状</a></c:if>
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
                            <form class="setAwardForm" action="${ctx}/SetAwardServlet">
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

            showMsg = ($infobox, text) => $infobox.find('.msg span').text(text);
        </script>

</div>


<style>
    .big_info {
        color: red;
        font-size: 20px;
    }
    .match_imgbox {
        position: relative;
        width: 400px;
        height: 500px;
        border: 1px solid darkgrey;
        overflow: hidden;
    }
    .match_imgbox img {
        position: absolute;
        width: 400px;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .infobox {
        overflow:hidden;
        margin: 20px;
        padding-bottom: 40px;
        border: 1px solid darkgrey;
    }
    .infobox .header {
        width: 100%;
        height: 40px;
        font-size: 16px;
        line-height: 40px;
        overflow: hidden;
        border-bottom: 1px solid darkgrey;
    }
    .infobox .header .team_name {
        float: left;
        position: relative;
        width: 150px;
        height: 40px;
        padding-left: 40px;
        color: white;
        border-top: 42px solid #d8450b;
        border-right: 15px solid transparent;
    }
    .infobox .header .team_name span {
        position: absolute;
        top: -42px;
    }
    .infobox .header p {
        float: left;
        margin: 0 20px;
    }
    .infobox .header .check_award {
        float: right;
        margin-right: 10px;
    }
    .infobox .header .like {
        cursor: pointer;
        float: right;
        width: 60px;
        color: grey;
        font-size: 18px;
        margin: 10px;
    }
    .infobox .header .liked {
        color: #ff3333;
    }
    .infobox .description {
        margin: 10px
    }
    .infobox .img_box {
        margin-right: 20px;
        margin-top: 20px;
        float: left;
        position: relative;
        width: 330px;
        height: 300px;
        border: 1px solid darkgrey;
        overflow: hidden;
    }
    .infobox .template {
        display: none;
    }
    .infobox .img_box img {
        position: absolute;
        width: 300px;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .infobox .img_box .delete {
        position: absolute;
        right: 5px;
        top: 5px;
        width: 24px;
        height: 24px;
        line-height: 12px;
        color: grey;
        border-radius: 12px;
        background:white;
        border: 1px solid grey;
        transition: .3s all;
    }
    .infobox .img_box .delete:hover {
        color: red;
        border: 1px solid red;
    }
    /*上传文件div的样式*/
    .infobox .add_box {
        box-sizing: border-box;
        padding: 20px;
        color: grey;
        border: grey 1px solid;
    }
    /*评奖表单*/
    .infobox .header .setAwardForm {
        margin-right: 20px;
        float: right;
    }
    .infobox .header .setAwardForm .lv {
        margin-top: 5px;
        outline: none;
    }
    .infobox .header .setAwardForm button {
        margin-left: 5px;
        margin-top: -3px;
        outline: none;
    }
    .empty_info {
        margin: 100px 0 150px -30px;
        width: 1200px;
        text-align: center;
        color: darkgrey;
    }
    .empty_info_mini {
        margin: 20px 0 25px -30px;
        width: 1200px;
        text-align: center;
        color: darkgrey;
    }
</style>

<%@ include file="/footer.jsp"%>

