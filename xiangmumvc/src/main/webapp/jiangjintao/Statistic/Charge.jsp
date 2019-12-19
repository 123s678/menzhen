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
    <title>Title</title>
    <base href="<%=basePath%>">
    <%@include file="/common-jsp/common-js.jsp"%>
    <%@include file="/common-jsp/common-css.jsp"%>
    <script src="${ctx}/statics/jiangjintao/echarts/dark.js"></script>
    <script src="${ctx}/statics/jiangjintao/echarts/echarts.js"></script>
    <script src="${ctx}/statics/jiangjintao/echarts/roma.js"></script>
</head>
<body>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 800px;height:600px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    myChart.showLoading();
    $.post("${ctx}/statistics/queryGroup",function (data) {
        myChart.hideLoading();
        // 指定图表的配置项和数据
       myChart.setOption({
           title: {
               text: '收费统计'
           },
           tooltip: {
               trigger: 'item',
               //模板变量有 {a}, {b}，{c}，{d}，{e}，分别表示系列名，数据名，数据值等
               formatter: "{a} <br/>{b}: {c}"
           },
           toolbox: {          //图表容器的右上角工具栏
               feature: {
                   dataView: {show: true, readOnly: false},
                   magicType: {show: true, type: ['line', 'bar']},
                   restore: {show: true},
                   saveAsImage: {show: true}
               }
           },
           legend: {
               data:['月份']
           },
           xAxis: {
               data: data.yf
           },
           yAxis: {},
           series: [{
               name: '金额',
               type: 'bar',
               data:data.je
           }]
       }) ;
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    })
</script>
</body>
</html>
