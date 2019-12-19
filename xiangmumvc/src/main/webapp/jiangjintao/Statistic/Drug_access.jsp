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
    <title>药品出入</title>
    <base href="<%=basePath%>">
    <%@include file="/common-jsp/common-js.jsp"%>
    <%@include file="/common-jsp/common-css.jsp"%>
    <script src="${ctx}/statics/jiangjintao/echarts/dark.js"></script>
    <script src="${ctx}/statics/jiangjintao/echarts/echarts.js"></script>
    <script src="${ctx}/statics/jiangjintao/echarts/roma.js"></script>
</head>
<body>
<div id="main" style="width: 800px;height:600px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    myChart.showLoading();
    myChart.hideLoading();
    $.post("${ctx}/drug/quer",function (data) {
        var data1=[];
        var data2=[];
        $.each(data,function (index,time) {
            data1.push(time.drugname)
            data2.push(time.drugid)
        })
        myChart.setOption(
            {
                toolbox: {          //图表容器的右上角工具栏
                    feature: {
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line', 'bar']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: {
                    type: 'category',
                    data: data1
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data:data2,
                    type: 'line'
                }]
            }
        )
    })


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>
