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
                    收费单
                </h1>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                            <form class="form-inline">
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <button type="button" class="btn btn-info" onclick="shouFei()">确认收费</button>
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <button type="button" class="btn btn-info" onclick="tuiFei()">退费</button>
                                </div>
                            </form>
                </div>
            </div>
            <div class="page-header position-relative">
                <h3 style="color: #0e9aef">
                    收费信息
                </h3>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <table id="tab">

                    </table>
                </div>
            </div>
            <div class="page-header position-relative">
                <h3 style="color: #0e9aef">
                    处方信息
                </h3>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <table id="tabChuFang">

                    </table>
                </div>
            </div>
            <div>
            </div>
        </div>
    </div>
</div>
<%--
收费确认
--%>
<div  class="modal inmodal" id="cfModal">
    <div class="modal-dialog">
        <form class="form-horizontal" id="cfForm"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">收费确认</h4>
                </div>
                <input type="hidden" id="id_cf" name="id">
                <input type="hidden" id="operationpersonid_cf" name="operationpersonid">
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="receiptcode_cf">收费号</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="receiptcode_cf" name="receiptcode" class="form-control col-sm-6" readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="invoicecode_cf">发票号</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="invoicecode_cf" name="invoicecode" class="form-control col-sm-6" readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="beforereceivable_cf">折前应收</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="beforereceivable_cf" name="beforereceivable" class="form-control col-sm-6" readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="afterreceivable_cf">折后应收</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="afterreceivable_cf" name="afterreceivable" class="form-control col-sm-6" readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="invoicecode_cf">医保可付</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="medicarecanpay_cf" name="medicarecanpay" class="form-control col-sm-6" readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10">是否医保</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <div class="radio-inline" style="margin-top: -8px">
                            <input type="radio"  name="is" value="1" onchange="xs()">
                            是
                        </div>

                        <div class="radio-inline" style="margin-top: -8px">
                            <input type="radio" name="is" value="0" onchange="xs()">
                            否
                        </div>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="cost_cf">费用</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="cost_cf" name="cost" class="form-control col-sm-6" readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="operationpersonname_cf">操作员姓名</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="operationpersonname_cf" name="operationpersonname" class="form-control col-sm-6" readonly>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="ShouFeiInfo()">收费</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    $(
        function () {
            loadCharge();
            loadTabChuFang();
        }
    );

    /*
    * 收费操作
    * */
    function shouFei() {
        swal({
            title: "提示",
            text: "请输入处方单号",
            type: "input",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确认",
            closeOnConfirm: false
        },function(e){
            if(e!=false){
                 $.post(
                   "${ctx}/sfInfo/loadShouFei",
                    {"prescriptioncode":e},
                    function (data) {
                        if(data=="0"){
                            swal("提示","您输入的处方号不存在","error");
                        }else{
                            swal("提示","您输入正确","success");
                            loadInfo();
                        }
                    }
                );
            }




        })
    }
    function loadInfo() {
        $.getJSON(
            "${ctx}/sfInfo/getNo",
            {},
            function (e) {
                $("#beforereceivable_cf").val(e);
            }
        );
        $.getJSON(
            "${ctx}/sfInfo/getYes",
            {},
            function (e) {
                $("#afterreceivable_cf").val(e);
                $("#medicarecanpay_cf").val(e);
            }
        );
        $.getJSON(
            "${ctx}/sfInfo/getLoadSho",
            {},
            function (e) {
                $("#receiptcode_cf").val(e.receiptcode);
                $("#invoicecode_cf").val(e.invoicecode);
                $("#operationpersonname_cf").val(e.employeename);
            }
        );
        $("#cfModal").modal("show");
    }















/*
* 切换is传值
* */
    function xs() {
        var is= $("input[name='is']:checked").val();
        if(is=="1"){
            $("#cost_cf").val($("#afterreceivable_cf").val());
        }else{
            $("#cost_cf").val($("#beforereceivable_cf").val());
        }
    }
    function ShouFeiInfo() {
        var f=formToJson("cfForm");
        $.getJSON(
            "${ctx}/sfInfo/addCharge",
            f,
            function (data) {
                if(data==true){
                    swal("提示","收费成功","success");
                    $("#cfModal").modal("hide");
                    $("#prescriptioncode_sfd1").val("");
                    $("#table").bootstrapTable("refresh");
                    $("#tab").bootstrapTable("refresh");
                }
            }
        );
    }
    function loadCharge() {
        $("#tab").bootstrapTable({
            url:'${ctx}/sfInfo/ChargeAll',
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
                {field:'receiptcode', title:'收据号'},
                {field:'invoicecode', title:'发票号'},
                {field:'chargestatus', title:'收费状态',
                    formatter:function (value,row,index) {
                        if(row.chargestatus==1){
                            return "已收费"
                        }else {
                            return "已退费"
                        }
                    }
                },
                {field:'cost', title:'费用'}
              ]
        });
    }
    function tuiFei() {
        swal({
            title: "您确定要退费吗",
            text: "请输入收据号,请谨慎操作！",
            type: "input",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确认",
            closeOnConfirm: false
        }, function (e) {
            $.post(
                "${ctx}/sfInfo/woYaoQin",
               "receiptcode="+e,
                function (receiptcode) {
                    if(receiptcode=="0"){
                        swal("提示","你还没有退药","error");
                    }else{
                        swal("提示","退费成功","success");
                        $("#tab").bootstrapTable("refresh");
                    }
                }
            );
        })
    }
    function loadTabChuFang() {
        $("#tabChuFang").bootstrapTable({
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
    function chaFei() {
        swal({
            title: "提示",
            text: "请输入处方单号",
            type: "input",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确认",
            closeOnConfirm: false
        },function(e){
            $.post(
                "${ctx}/sfInfo/loadChaFei",
                {"prescriptioncode":e},
                function (data) {
                    if(data=="0"){
                        swal("提示","您输入的处方号不存在","error");
                    }else{
                        swal("提示","查看成功","success");
                        loadWithDrug();
                    }
                }
            );
        })
    }
</script>
</html>
