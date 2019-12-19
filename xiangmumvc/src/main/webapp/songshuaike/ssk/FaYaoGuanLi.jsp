
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String ctx = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("ctx",ctx);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发药管理</title>
    <base href="<%=basePath%>">
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/common-css.jsp"%>
    <%@include file="/common-jsp/common-js.jsp"%>


    <script type="text/javascript">

    </script>


</head>
<body>

<div>
    <div>
    <form class="form-inline">
        <div class="form-group">
            <label for="exampleInputName2">Name</label>
            <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail2">Email</label>
            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
        </div>
        <button type="submit" class="btn btn-default">Send invitation</button>
    </form>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-sm-12" style="width: 100%;padding: 0px;margin-left: 10px">
            <table id="table" style="width: 100%;margin-left: 0px"></table>
        </div>
    </div>
</div>



<div>
    <div>
        <form class="form-inline">
            <div class="form-group">
                <label for="exampleInputName2">Name</label>
                <input type="text" class="form-control" id="exampleInputName" placeholder="Jane Doe">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">Email</label>
                <input type="email" class="form-control" id="exampleInputEmail" placeholder="jane.doe@example.com">
            </div>
            <button type="submit" class="btn btn-default">Send invitation</button>
        </form>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-sm-12" style="width: 100%;padding: 0px;margin-left: 10px">
            <table id="tab1" style="width: 100%;margin-left: 0px"></table>
        </div>
    </div>
</div>


<div>
    <div>
        <form class="form-inline">
            <div class="form-group">
                <label for="exampleInputName2">Name</label>
                <input type="text" class="form-control" id="exampleInputName1" placeholder="Jane Doe">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">Email</label>
                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="jane.doe@example.com">
            </div>
            <button type="submit" class="btn btn-default">Send invitation</button>
        </form>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-sm-12" style="width: 100%;padding: 0px;margin-left: 10px">
            <table id="tab2" style="width: 100%;margin-left: 0px"></table>
        </div>
    </div>
</div>

</body>
</html>
