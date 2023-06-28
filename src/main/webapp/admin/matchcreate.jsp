<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- JS
  =================================================== -->
  <script src="../js/jquery-3.6.0.min.js"></script>
  <!-- CSS
  ================================================== -->
  <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
  <link rel="stylesheet" href="../css/bootstrap.css" />
  <link rel="stylesheet" href="../css/bootstrap-responsive.css" />
  <%--    <link rel="stylesheet" href="http://www.room122.com/demo/html/piccolo/css/jquery.lightbox-0.5.css" />--%>
  <link rel="stylesheet" href="../css/custom-styles.css" />

  <!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <link rel="stylesheet" href="../css/style-ie.css" />
  <![endif]-->

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <link rel="stylesheet" href="../css/css2.css" type="text/css">
  <link rel="stylesheet" href="../css/vendor.min.css" type="text/css">
  <link rel="stylesheet" href="../css/plugins.min.css" type="text/css">
  <link rel="stylesheet" href="../css/style.min.css" type="text/css">
</head>
<div class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="row breadcrumb_box  align-items-center">
          <div class="col-lg-6 col-md-6 col-sm-12 text-center text-md-start">
            <h2 class="breadcrumb-title">Competition</h2>
          </div>
          <div class="col-lg-6  col-md-6 col-sm-12">
            <!-- breadcrumb-list start -->
            <ul class="breadcrumb-list text-center text-md-end">
              <li class="breadcrumb-item"><a id="fA">发布竞赛</a></li>
              <li class="breadcrumb-item active"><a href="${ctx}/IndexServlet" id="fB">返回主页</a></li>
            </ul>
            <!-- breadcrumb-list end -->
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="cart-main-area pt-100px pb-100px">
  <div class="container" id="fineA">
    <h3 class="cart-page-title">competition</h3>
    <div class="col-lg-7">
      <div class="billing-info-wrap">
        <h3>Add New competiton</h3>
        <form id="uploadForm" method="post">
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <label>竞赛头图</label>
              <input type="file" id="file" name="file">
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <img src="" id="img" alt="图片预览" width="80" height="100">
              <input type="button" id="uploadBtn" value="上传">
            </div>
          </div>
        </form>
        <form action="${ctx}/MatchCreateServlet" method="post">
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <label>竞赛名称</label>
              <input type="text" name="name" id="name"><br>
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <label>海报主题</label>
              <input type="text" name="theme" id="theme"><br>
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <label>竞赛类别</label>
              <select class="form-control" id="categoryid" name="categoryid">
                <c:forEach items="${categoryList}" var="category">
                  <c:if test="${category.id == categoryid}">
                    <option value="${category.id}" selected="selected">${category.name}</option>
                  </c:if>
                  <c:if test="${category.id != categoryid}">
                    <option value="${category.id}">${category.name}</option>
                  </c:if>
                </c:forEach>
              </select>
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <label>举办时间</label>
              <input type="date" name="start"> <input type="date" name="end"><br>
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <label>竞赛描述</label>
              <textarea name="description" rows="4" ></textarea><br>
            </div>
          </div>

          <input type="hidden" name="url" id="url">
          <button type="submit"><span>发布竞赛</span></button>
<%--          <input type="submit" value="发布竞赛">--%>
          <div class="card-footer text-center">
            <span class="text-danger">${msg}</span>
          </div>
        </form>

      </div>
    </div>
  </div>
</div>
<%--<form id="uploadForm" method="post">--%>
<%--  竞赛头图 <input type="file" id="file" name="file">--%>
<%--  <img src="" id="img" alt="图片预览" width="80" height="100">--%>
<%--  <input type="button" id="uploadBtn" value="上传">--%>
<%--</form>--%>
<%--<form action="${ctx}/MatchCreateServlet" method="post">--%>
<%--  竞赛名称 <input type="text" name="name" id="name"><br>--%>
<%--  海报主题 <input type="text" name="theme" id="theme"><br>--%>
<%--  竞赛类别--%>
<%--  <select class="form-control" id="categoryid" name="categoryid">--%>
<%--    <c:forEach items="${categoryList}" var="category">--%>
<%--      <c:if test="${category.id == categoryid}">--%>
<%--        <option value="${category.id}" selected="selected">${category.name}</option>--%>
<%--      </c:if>--%>
<%--      <c:if test="${category.id != categoryid}">--%>
<%--        <option value="${category.id}">${category.name}</option>--%>
<%--      </c:if>--%>
<%--    </c:forEach>--%>
<%--  </select>--%>
<%--  举办时间 <input type="date" name="start"> <input type="date" name="end"><br>--%>
<%--  竞赛描述 <textarea name="description" rows="4" ></textarea><br>--%>
<%--  <input type="hidden" name="url" id="url">--%>
<%--  <input type="submit" value="发布竞赛">--%>
<%--</form>--%>
<%--<div class="card-footer text-center">--%>
<%--  <span class="text-danger">${msg}</span>--%>
<%--</div>--%>



<%@ include file="/footer.jsp"%>
<script>
  //使用Ajax请求上传宠物图片，页面不刷新
  $(document).ready(function (){
    //图片预览默认隐藏
    $('#img').hide();
    $('#uploadBtn').click(function (){
      let formData = new FormData($('#uploadForm')[0]);//获取封装表单数据
      $.ajax({
        url: '${ctx}/FileUploadServlet', //表单提交url
        type: 'post',                    //表单提交方式
        data: formData,                  //表单提交数据
        contentType: false,              //文件上传时需设置contentType=false
        processData: false,              //文件上传时需设置processData=false
        success: function (returnData){  //returnData是FileUploadServlet返回的字符串，内容为宠物图片的新文件名
          $('span.text-danger').text("图片上传成功");      //显示提示信息
          $('#img').show().prop('src','${ctx}/image/'+returnData); //预览上传图片
          $('#url').val(returnData);                       //表单隐藏元素photo的值设置为新文件名
        },error:function (returnData){
          $('span.text-danger').text("图片上传失败");
        }
      });
    })
  })
</script>
