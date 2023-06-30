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
                <div class="span6 match_imgbox">
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

            <c:if test="${!user.isAdmin()}">
                <ul>
                <c:forEach items="${teamList}" var="team">
                    <li class="infobox" data-teamid="${team.id}">
                        <div class="header">
                            <div class="team_name"><span>${team.name}</span></div>
                            <p>作品名：${team.workName}</p>
                            <p>成员：<c:forEach items="${team.getMemberList()}" var="member">${member.getMemberRealname()}&nbsp;</c:forEach></p>
                        </div>
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
            <script type="text/javascript">
                $(document).ready(function (){
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
                                        if(msg==600) showMsg($infobox, "不在活动时间内！")
                                        else if(msg==601) showMsg($infobox, "网络错误！")
                                        else {
                                            //添加一份作品
                                            let work_id = msg;
                                            let $img_box_clone = $img_box_template.clone().removeClass('template');
                                            $img_box_clone.find('a').attr('href','${ctx}/image/'+returnData)
                                                .find('.img').attr('src','${ctx}/image/'+returnData).attr('data-workid',work_id)
                                            $form.closest('li').before($img_box_clone);
                                        }
                                    }
                                })
                            }
                        });
                    })

                    $('.delete').click(function (){
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
                //msg改变信息
                showMsg = ($infobox, text) => $infobox.find('.msg span').text(text);

            </script>

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

<style>
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
    }
    .infobox .header {
        width: 100%;
        height: 40px;
        font-size: 16px;
        line-height: 40px;
        overflow: hidden;
        border: 1px solid darkgrey;
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
</style>

<%@ include file="/footer.jsp"%>

