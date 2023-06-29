
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<%--<link rel="stylesheet" href="css/bootstrap.min.css">--%>
<%--<link rel="stylesheet" href="css/magnific-popup.css">--%>
<%--<link rel="stylesheet" href="css/animate.css">--%>
<%--<link rel="stylesheet" href="css/owl.carousel.min.css">--%>
<%--<link rel="stylesheet" href="css/font-awesome.min.css">--%>
<%--<link rel="stylesheet" href="css/et-line-icon.css">--%>
<%--<link rel="stylesheet" href="css/bicon.min.css">--%>
<%--<link rel="stylesheet" href="css/slick.css">--%>
<%--<link rel="stylesheet" href="css/meanmenu.min.css">--%>
<link rel="stylesheet" href="css/bundle.css">
<%--<link rel="stylesheet" href="css/responsive.css">--%>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/user.css">


<div class="causes-area ">
  <div class="select-menu">
    <table>
      <ul class="f-right mima">
        <li class="colorchange">修改密码</li>
      </ul>
      <ul class="f-right yonghu ">
        <li class="colorchange">用户中心</li>
      </ul>
      <ul class="f-right cansai ">
        <li class="colorchange">我的竞赛</li>
        <li class="colorchange">往届竞赛</li>
        <li class="colorchange">竞赛中</li>
      </ul>
    </table>
  </div>
  <!--往届竞赛-->
  <div class="user-row container">
    <c:forEach items="${matchList}" var="match">
      <c:if test="${!match.isNow()}">
        <div class="row-content">
          <div class="">
            <a href="${ctx}/UserDetailServlet?matchId=${match.id}"><img src="${ctx}/image/${match.url}" alt="${match.name}"/></a>
            <div class="match-msg">
              <h3><a href="${ctx}/UserDetailServlet?matchId=${match.id}">${match.name}</a></h3>
              <p>${match.description}</p>
              <div class="causes-meta">
                <div class="">
                  <h4>开始日期<span>${match.start}</span></h4>
                </div>
                <div class="">
                  <h4>结束日期 <span>${match.end}</span></h4>
                </div>
                <div class="">
                  <h4>报名截止日期 <span>${match.applicationEnd}</span></h4>
                </div>
              </div>
              <a class="button theme-bg" href="${ctx}/UserDetailServlet?matchId=${match.id}">了解更多</a>
            </div>
          </div>
        </div>
      </c:if>
    </c:forEach>
  </div>

  <!--新竞赛-->
  <div class="user-row container">
    <c:forEach items="${matchList}" var="match">
      <c:if test="${match.isNow()}">
      <div class="row-content">
        <div class="">
          <a href="${ctx}/UserDetailServlet?matchId=${match.id}"><img src="${ctx}/image/${match.url}" alt="${match.name}"/></a>
          <div class="match-msg">
            <h3><a href="${ctx}/UserDetailServlet?matchId=${match.id}">${match.name}</a></h3>
            <p>${match.description}</p>
            <div class="causes-meta">
              <div class="">
                <h4>开始日期<span>${match.start}</span></h4>
              </div>
              <div class="">
                <h4>结束日期 <span>${match.end}</span></h4>
              </div>
              <div class="">
                <h4>报名截止日期 <span>${match.applicationEnd}</span></h4>
              </div>
            </div>
            <a class="button theme-bg" href="${ctx}/UserDetailServlet?matchId=${match.id}">了解更多</a>
          </div>
        </div>
      </div>
      </c:if>
    </c:forEach>
  </div>
</div>

  <!--用户中心-->
  <div class="container">
    <!-- login area start -->
    <form action="" method="">
      <div class="input">
        姓名<br><input type="text" value="" name="name">
      </div>
      <div class="input">
        邮箱<br><input type="text" value="" name="email">
      </div>
      <div class="input2">
        <input type="submit" value="确认修改">
      </div>
    </form>
    <!-- login area end -->
  </div>


  <div class="container ">
    <!-- login area start -->
    <form action="" method="">
      <div class="input">
        旧密码<br><input type="text" value="" name="oldpwd">
      </div>
      <div class="input">
        新密码<br><input type="text" value="" name="newpwd " class="newpwd">
      </div>
      <div class="input">
        确认密码<br><input type="text" value="" name="newpwd2" class="newpwd2">
      </div>
      <div class="pwd-msg">
        <p>两次输入密码不一致</p>
      </div>
      <div class="input2">
        <input type="submit" value="确认修改">
      </div>

    </form>
  </div>

</div>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/user.js"></script>