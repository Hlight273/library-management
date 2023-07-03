<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="./css/index.css">


<div class="container">
    <%--首页介绍：轮播图+介绍--%>
    <div class="row headline">
        <div class="span8">
            <div class="lunbox">
                <ul>
                    <li><img src="img/lunbo/1.jpg" alt=""></li>
                    <li><img src="img/lunbo/2.jpg" alt=""></li>
                    <li><img src="img/lunbo/3.jpg" alt=""></li>
                    <li><img src="img/lunbo/4.jpg" alt=""></li>
                    <li><img src="img/lunbo/5.jpg" alt=""></li>
                </ul>
                <div id="back" class="swithc_btn"><i class="fa fa-angle-left"></i></div>
                <div id="next" class="swithc_btn"><i class="fa fa-angle-right"></i></div>
                <ol></ol>
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
                    <li class="gallery-item match_box" data-id="id-1" data-type="illustration">
                        <div class="img_box" >
                            <a href="${ctx}/DetailServlet?matchId=${match.id}">
                                <img src="${ctx}/image/${match.url}" alt=${match.name} />
                            </a>
                            <div class="top ${match.isNow()?'red':'gray'}">
                                ${match.isNow()?'进行中':'已过期'}
                            </div>
                        </div>
                        <div class="details">
                            <a class="title" href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a>
                            <p class="date">活动日期:
                                <c:if test="${match.isNow()}">${match.getDateString(match.start)}-${match.getDateString(match.end)}</c:if>
                                <c:if test="${!match.isNow()}">已结束</c:if>
                            </p>
                            <div class="desc">${match.description}</div>
                        </div>
                    </li>
                    </c:forEach>
                    <c:if test="${empty matchList}">
                    <div class="empty_info">目前赛事空空如也</div>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    //默认移动间隔时间3s
    let interTime = 3000;
    //按钮
    var back = document.getElementById('back');
    var next = document.getElementById('next');
    // 标签
    var ul = document.querySelector('.lunbox ul');
    var ol = document.querySelector('.lunbox ol');

    //图片宽度
    var imgWidth = ul.getElementsByTagName('li')[0].offsetWidth;

    //记录图片对应脚标
    var countN = 0;
    //记录小圆圈对应脚标
    var countC = 0;
    //生成小圆圈
    for (var i = 0; i < ul.children.length; i++) {
        var li = document.createElement('li');
        ol.appendChild(li);
    }

    //第一个圆圈选中
    ol.children[0].className = 'orange';
    //点击小圆圈
    for (let i = 0; i < ol.children.length; i++) {
        ol.children[i].addEventListener('click', function () {
            //变色
            for (var j = 0; j < ol.children.length; j++) {
                ol.children[j].className = '';
            }
            this.className = 'orange';
            // 对应图片
            countN = i;
            countC = i;
            animate(ul, -i * imgWidth);

        })
    }

    //第一张图片复制到最后
    var first = ul.children[0].cloneNode(true);
    ul.appendChild(first);

    //下一个按钮点击事件
    next.addEventListener('click', function () {
        countN++;
        // countN = countN >= ul.children.length ? 0 : countN;
        if (countN >= ul.children.length) {
            countN = 1;
            ul.style.left = 0;
            animate(ul, -countN * imgWidth);

        }
        animate(ul, -countN * imgWidth);


        countC++;
        countC = countC >= ol.children.length ? 0 : countC;
        for (var j = 0; j < ol.children.length; j++) {
            ol.children[j].className = '';
        }
        ol.children[countC].className = 'orange';
    })

    back.addEventListener('click', function () {
        countN--;
        // countN = countN < 0 ? ul.children.length : countN;
        if (countN < 0) {
            countN = ul.children.length - 2;
            ul.style.left = -(ul.children.length - 1) * imgWidth + 'px';
            animate(ul, -countN * imgWidth);
        }
        animate(ul, -countN * imgWidth);


        countC--;
        countC = countC < 0 ? ol.children.length - 1 : countC;
        for (var j = 0; j < ol.children.length; j++) {
            ol.children[j].className = '';
        }
        ol.children[countC].className = 'orange';
    })

    //自动播放
    var interval = setInterval(function () {
        //调用下一张按钮点击事件
        next.click();
    }, interTime)

    //鼠标经过清除计时器
    var div = document.querySelector('div.lunbox');
    div.addEventListener('mouseenter', function () {
        clearInterval(interval);

    })
    //离开
    div.addEventListener('mouseleave', function () {
        interval = setInterval(function () {
            next.click();
        }, interTime)
    })

    //缓动
    function animate(obj, target, callback) {
        // 清除以前的定时器
        clearInterval(obj.timer);
        obj.timer = setInterval(function () {
            // 步长写到定时器  步长公式：（目标值-现在的位置）/10
            var step = (target - obj.offsetLeft) / 10;
            // 把步长改为整数，不要出现小数问题
            step = step > 0 ? Math.ceil(step) : Math.floor(step);
            if (obj.offsetLeft == target) {
                // 停止定时器
                clearInterval(obj.timer);
                // 动画结束后调用，例：节流阀！！！
                if (callback) {
                    callback();
                }
            }
            // 把每次加1这个步长改变为一个慢慢变小的值
            obj.style.left = obj.offsetLeft + step + 'px';
        }, 10)
    }
</script>

<%@ include file="footer.jsp"%>