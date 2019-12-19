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
    <meta charset="utf-8" />
    <base href="<%=basePath%>">
    <title>收费单</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/songziyi/common-boot.jsp"%>
</head>
<body>
<div class="main-container container-fluid" style="z-index:3000;">

    <div class="main-content">


        <div class="page-content">
            <div class="page-header position-relative">
                <h1 style="color: #0e9aef">
                    发药
                </h1>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <form class="form-inline">
                        <div class="form-group container-fluid" style="margin-bottom: 15px">
                            <button type="button" class="btn btn-info" onclick="fayao()">发药</button>
                        </div>
                        <div class="form-group container-fluid" style="margin-bottom: 15px">
                            <button type="button" class="btn btn-info" onclick="tuiyao()">退药</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="page-header position-relative">
                <h3 style="color: #0e9aef">
                    处方信息
                </h3>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <table id="tab">

                    </table>
                </div>
            </div>
            <div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(
        function () {
            loadWithPatient();
            loadWithDrug();
            loadPrescription();
        }
    );


    function loadWithPatient() {
        $.getJSON(
            "${ctx}/sfInfo/withPatient",
            {},
            function (data) {
                $("#patientname").val(data.patientname);
                $("#cardcode").val(data.cardcode);
                $("#sex").val(data.sex);
                $("#age").val(data.age);
                $("#job").val(data.job);
                $("#tel").val(data.tel);
                $("#address").val(data.address);
                $("#identity").val(data.identity);
            }
        );
    }
    function loadWithDrug() {
        $("#table").bootstrapTable(
            {
                url:"${ctx}/sfInfo/WithDrug",
                columns:[
                    {  field:'drugname',
                        title:'药品名称'
                    },
                    {  field:'ismedicare',
                        title:'是否医保',
                        formatter:function (value,row,index) {
                            if(row.ismedicare==1){
                                return "是"
                            }else {
                                return "否"
                            }
                        }
                    },
                    {  field:'medicareprice',
                        title:'医保价格'
                    },
                    {  field:'inbulksellprice',
                        title:'零售价格'
                    }
                ]
            }
        );
    }

function loadPrescription() {
    $("#tab").bootstrapTable({
        url:'${ctx}/fy/selectAllPrescription',
        pagination:true,
        striped:true,
        sortName:'id',
        sortOrder:'desc',
        paginationLoop:true,
        pageSize:5,
        pageList:[5,8],
        // search:true,
        clickToSelect:true,
        columns:[
            {field:'id', visible:false},
            {field:'prescriptioncode', title:'处方单号'},
            {field:'prescriptionname', title:'处方名称'},
            {field:'diagnosis', title:'处方诊断'},
            {field:'prescriptiontime', title:'处方时间'}
        ]
    });
}

    function fayao() {
        swal({
            title: "提示",
            text: "请输入处方单号,请谨慎操作！",
            type: "input",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确认",
            closeOnConfirm: false
        }, function (e) {
            $.post(
                "${ctx}/fy/woYaoFaYao",
                "prescriptioncode="+e,
                function (data) {
                    if(data=="0"){
                        swal("提示","你还没有付费不能拿药","error");
                    }else if(data=="1"){
                        swal("提示","你已经退费不能拿药","error");
                    }else if(data=="2"){
                        swal("提示","库存不足","error");
                    }else if(data=="3"){
                        swal("提示","发药成功！！！","success");
                    }
                }
            );
        })
    };




    function tuiyao() {
        swal({
            title: "提示",
            text: "请输入处方单号,请谨慎操作！",
            type: "input",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确认",
            closeOnConfirm: false
        }, function (e) {
            $.post(
                "${ctx}/fy/woYaoTuiYao",
                "prescriptioncode="+e,
                function (data) {
                    if(data==""){
                        swal("提示","退药成功","success");
                    }
                }
            );
        })
    };
</script>
</html>
