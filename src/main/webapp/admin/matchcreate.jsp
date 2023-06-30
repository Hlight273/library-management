<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="./css/plugins.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.min.css" type="text/css">
<div class="cart-main-area pt-50px pb-100px">
  <div class="container" id="fineA">
    <h3 class="cart-page-title">competition</h3>
    <div class="col-lg-7">
      <div class="billing-info-wrap">
        <h3>发布新竞赛</h3>

        <div class="card-footer text-center" style="text-align: center">
          <span style="color: red">${msg}</span>
        </div>

        <form id="paramForm" action="${ctx}/MatchCreateServlet" method="post">
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
            <div class="billing-info mb-20px mr-15px" style="width: 23%;float:left">
              <label>竞赛类别</label>
              <select class="form-control" id="categoryid" name="categoryid">
                <c:forEach items="${categoryList}" var="category">
                  <c:if test="${category.id == match.categoryId}">
                    <option value="${category.id}" selected="selected">${category.name}</option>
                  </c:if>
                  <c:if test="${category.id != match.categoryId}">
                    <option value="${category.id}">${category.name}</option>
                  </c:if>
                </c:forEach>
              </select>
            </div>
          </div>
          <div class="col-lg-6 col-md-6" style="width: 50%;float:left">
            <div class="billing-info mb-20px">
              <label>举办时间</label>
              <input type="date" name="start" class="datebox">
              <input type="date" name="end" class="datebox">
            </div>
          </div>
          <div class="col-lg-6 col-md-6" style="width: 25%;float:left">
            <div class="billing-info mb-20px">
              <label>报名截止时间</label>
              <input type="date" name="applicationend">
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <label>竞赛描述</label>
              <textarea name="description" rows="4" ></textarea><br>
            </div>
          </div>

          <input type="hidden" name="url" id="url">
          <button class="btn btn-inverse" type="submit">发布竞赛</button>
        </form>

        <form id="uploadForm" method="post">
          <div class="col-lg-6 col-md-6">
            <div class="billing-info mb-20px">
              <label>竞赛头图</label>
              <input type="file" id="file" name="file">
              <input type="button" id="uploadBtn" value="上传">
            </div>
          </div>
          <img src="" id="img" alt="图片预览" width="200">
        </form>

      </div>
    </div>
  </div>
</div>

<style>
  #uploadForm {
    margin: 10px;
    float: left;
    width: 30%;
  }
  #uploadForm #img {
    margin: 10px 70px;
    display: block;
    border: 1px solid #c9c9c9;
  }
  #uploadForm #uploadBtn {
    display: block;
    line-height: 45px;
    text-align: center;
  }
  #paramForm {
    margin: 10px;
    float: left;
    width: 65%;
  }
  #paramForm input.datebox {
    width: 40%;
  }
</style>

<script type="text/javascript">
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
<%@ include file="/footer.jsp"%>
