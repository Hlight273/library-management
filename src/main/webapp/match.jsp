<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/header.jsp"%>
<div class="row gallery-row">
  <div class="span12">
    <h5 class="title-bg">最新
      <small>竞赛列表</small>
    </h5>

    <ul class="nav nav-tabs">
      <li class="active"><a href="${ctx}/MatchListServlet${param.sort!=null?'?sort=1':''}" data-toggle="tab">全部</a></li>
      <c:forEach items="${categoryList}" var="category">
        <li class="active"><a href="${ctx}/MatchListServlet?category_id=${category.id}${param.sort!=null?'&sort=1':''}" data-toggle="tab">${category.name}</a></li>
      </c:forEach>
      <div class="radios ${param.sort==null?'none':''}">
        <input type="radio" name="status" value="unpaid" checked>进行中
        <input type="radio" name="status" value="paid">已结束
      </div>
      <form action="MatchSearchServlet" method="post" id="searchFrom">
        <input type="text" placeholder="输入您要搜索的竞赛" id="search" name="key">
      </form>
    </ul>

    <div class="row clearfix no-margin">
      <ul class="gallery-post-grid holder">
        <c:forEach items="${matchList}" var="match">
        <li class="gallery-item match_box ${((match.isNow()&&param.sort!=null)||param.sort==null)?'':'none'}" data-id="id-1" data-type="illustration">
          <div class="img_box">
            <a href="${ctx}/DetailServlet?matchId=${match.id}">
              <img src="${ctx}/image/${match.url}" alt=${match.name} />
            </a>
          </div>
          <span class="project-details"><a href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a>For an international ad campaign.</span>
        </li>
        </c:forEach>
        <c:if test="${empty matchList}">
          <div class="empty_info">目前赛事空空如也</div>
        </c:if>
        <c:if test="${!empty matchList}">
          <div class="empty_info info2" style="display: none">目前赛事空空如也</div>
        </c:if>
    </div>
  </div>
</div>

<script type="text/javascript">
  $(document).ready(function () {
    update()
    $(".radios input[name='status']").change(function () {
      var l1 = $(".match_box.none");
      var l2 = $(".match_box:not(.none)");
      l1.removeClass("none");
      l2.addClass("none");
      update()
    })
    function update() {
      //如果全部隐藏，则显示空空如也
      let allHide = true;
      $.each($('.match_box'), (i, n) => {
        if(!$(n).hasClass('none')){
          allHide = false
          return 0
        }
      })
      if(allHide) $('.info2').show()
      else $('.info2').hide()
    }
  });
</script>

<style>
  .empty_info {
    margin: 100px 0 150px -30px;
    width: 1200px;
    text-align: center;
    color: darkgrey;
  }
  .match_box {
    width: 300px;
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
  .radios {
    float: left;
    margin: 8px;
  }
  .radios input {
    margin: 5px;
  }
  #searchFrom #search {
    margin-left: 200px;
    width: 300px;
    height: 40px;
    position: relative;
    border-radius: 10px;
  }
  .none {
    display: none;
  }
</style>
<%@ include file="/footer.jsp"%>
