<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String ctx = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("ctx",ctx);
%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8" />
    <title>as门诊管理系统</title>
    <base href="<%=basePath%>">
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/common-login.jsp"%>
</head>
<body background="${ctx}/statics/home/login/images/bodybg.jpg">
<section id="content" class="m-t-lg wrapper-md animated fadeInUp ">
    <div class="container aside-xl" style="margin-top: 48px;">
        <a class="navbar-brand block"><span class="h1 font-bold" style="color: #ffffff">as门诊管理系统</span></a>
        <section class="m-b-lg">
            <header class="wrapper text-center">
                <strong class="text-sucess">管理员登录</strong>
            </header>
            <form action="javascript:;" method="post" >
                <div class="form-group">
                    <input type="text" name="employeecode" id="employeecode" placeholder="员工编号" class="form-control  input-lg text-center no-border">
                </div>
                <div class="form-group">
                    <input type="password" name="psw" id="psw" placeholder="密码" class="form-control  input-lg text-center no-border">
                </div>

                <button type="submit" class="btn btn-lg btn-danger lt b-white b-2x btn-block" id="validate-submit" onclick="deng()">
                    <i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg" >登录</span></button>
            </form>
            <span style="color: white;font-size:15px">
                 <c:if test="${sessionScope.isLoad==null}">
                     欢迎你！！！
                 </c:if>
                <c:if test="${sessionScope.isLoad!=null}">
                    ${sessionScope.isLoad}
                </c:if>
            </span>
        </section>
    </div>
</section>
<!-- footer -->
<footer id="footer">
    <div class="text-center padder">

    </div>
</footer>
<!-- / footer -->
<div style="text-align:center;">

</div>
</body>
<script>
    function deng() {
        var employeecode=$("#employeecode").val();
        var psw=$("#psw").val();
        $.post(
            "${pageContext.request.contextPath}/employee/login",
            "employeecode="+employeecode+"&psw="+psw,
            function (data) {
            if(data==true){
                window.location.href="${ctx}/urlload/fromHome";
            }else if(data==false){
                window.location.href="${ctx}/urlload/fromLogin";
            }
            }
        );
    }
</script>
</html>
