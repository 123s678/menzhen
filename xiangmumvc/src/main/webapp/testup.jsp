<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-11-28
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/common-jsp/songziyi/common-tag.jsp"%>
</head>
<body>
<form class="form-horizontal" role="form" method="post" action="" enctype="multipart/form-data">
<div class="form-group">
    <label class="col-sm-2 control-label">文件名称</label>
    <div class="col-sm-10">
        <input type="text" name="describ" class="col-sm-10 form-control" placeholder="文件名称">
    </div>
</div>
    <div class="form-group">
        <label class="col-sm-2 control-label">上传文件</label>
        <div class="col-sm-10">
            <input multiple type="file" name="myfile" class="col-sm-10 myfile" placeholder="文件名称">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <input type="submit" value="上传">
        </div>
    </div>
</form>
</body>
<script>

</script>
</html>
