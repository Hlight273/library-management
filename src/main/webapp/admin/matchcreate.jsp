<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/header.jsp"%>
<form id="uploadForm" method="post">
  竞赛头图 <input type="file" id="file" name="file">
  <img src="" id="img" alt="图片预览" width="80" height="100">
  <input type="button" id="uploadBtn" value="上传">
</form>
<form action="${ctx}/MatchCreateServlet" method="post">
  竞赛名称 <input type="text" name="name" id="name"><br>
  海报主题 <input type="text" name="theme" id="theme"><br>
  竞赛类别
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
  举办时间 <input type="date" name="start"> <input type="date" name="end"><br>
  竞赛描述 <textarea name="description" rows="4" ></textarea><br>
          <input type="hidden" name="url">
  <input type="submit" value="发布竞赛">
</form>
<div class="card-footer text-center">
  <span class="text-danger">${msg}</span>
</div>

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
