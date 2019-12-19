<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String ctx = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("ctx",ctx);
%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>统计集合</title>
    <base href="<%=basePath%>">
    <%@include file="/common-jsp/common-js.jsp"%>
    <%@include file="/common-jsp/common-css.jsp"%>
    <script src="${ctx}/statics/jiangjintao/echarts/dark.js"></script>
    <script src="${ctx}/statics/jiangjintao/echarts/echarts.js"></script>
    <script src="${ctx}/statics/jiangjintao/echarts/roma.js"></script>
    <script>
        function ch(obj){
            $(obj).addClass("active") ;
            $(obj).siblings().removeClass("active") ;
        }
    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">门诊统计</h3>
    </div>
    <div class="panel-body">
        <div class="container">
            <div class="col-sm-3">
                <div class="list-group">
                    <a onclick="javascript:ch(this)" target="f" href="${ctx}/jiangjintao/Statistic/Charge.jsp" class="list-group-item active">
                        收费统计
                    </a>
                    <a onclick="javascript:ch(this)" target="f"  href="${ctx}/jiangjintao/Statistic/Drug_access.jsp" class="list-group-item">
                        药品出入统计
                    </a>
                    <a onclick="javascript:ch(this)" target="f" href="${ctx}/jiangjintao/Statistic/Number.jsp" class="list-group-item">
                        就诊人数统计
                    </a>
                </div>
            </div>
            <div class="col-sm-9">
                <iframe width="100%" height="800px" frameborder="0" src="${ctx}/jiangjintao/Statistic/Charge.jsp" name="f"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
</html>
