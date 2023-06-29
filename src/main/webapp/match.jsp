<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/header.jsp"%>
<div class="row gallery-row">
  <div class="span12">
    <h5 class="title-bg">最新
      <small>竞赛列表</small>
    </h5>

    <ul class="nav nav-tabs">
      <li class="active"><a href="${ctx}/MatchListServlet" data-toggle="tab">全部</a></li>
      <c:forEach items="${categoryList}" var="category">
        <li class="active"><a href="${ctx}/MatchListServlet?category_id=${category.id}" data-toggle="tab">${category.name}</a></li>
      </c:forEach>
      <form action="MatchSearchServlet" method="post" id="searchFrom">
        <input type="text" placeholder="输入您要搜索的竞赛" id="search" name="key">
      </form>
    </ul>

    <div class="row clearfix no-margin">
      <ul class="gallery-post-grid holder">
        <c:forEach items="${matchList}" var="match">
        <li class="span3 gallery-item" data-id="id-1" data-type="illustration">
          <a href="${ctx}/DetailServlet?matchId=${match.id}"><img style="width: 270px;height: 370px" src="${ctx}/image/${match.url}" alt=${match.name} /></a>
          <span class="project-details"><a href="${ctx}/DetailServlet?matchId=${match.id}">${match.name}</a>For an international ad campaign.</span>
        </li>
        </c:forEach>
        <c:if test="${empty matchList}">
          <div class="empty_info">目前赛事空空如也</div>
        </c:if>
    </div>
  </div>
</div>
<style>
  .empty_info {
    margin: 100px 0 150px -30px;
    width: 1200px;
    text-align: center;
    color: darkgrey;
  }
  #searchFrom #search {
    margin-left: 200px;
    width: 300px;
    height: 40px;
    position: relative;
    border-radius: 10px;
  }
</style>
<%@ include file="/footer.jsp"%>
