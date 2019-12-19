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
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <title></title>
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
                    病例
                </h1>
            </div><!--/.page-header-->
            <div class="page-header position-relative">
                <h3 style="color: #0e9aef">
                    病人姓名：<span id="sp" style="color: black"></span>
                </h3>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <div id="zuida">
                        <div id="da">
                            <form class="form-inline">
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="registercode_g">挂号编码</label>
                                    <input type="text" id="registercode_g" name="registercode" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="medicalrecordcode_g">病例编码</label>
                                    <input type="text" id="medicalrecordcode_g" name="medicalrecordcode" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="medicalrecordname_g">病例名称</label>
                                    <input type="text" id="medicalrecordname_g" name="medicalrecordname" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="employeename_g">撰写医生</label>
                                    <input type="text" id="employeename_g" name="employeename" class="form-control">
                                </div>
                                <!-- Indicates a successful or positive action -->
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <button type="button" class="btn btn-info" onclick="xuan()">选择病人</button>
                                    <button type="button" class="btn btn-info" onclick="search()">查询</button>
                                    <button type="button" class="btn btn-info"onclick="insert_bl()">新增</button>
                                    <button type="button" class="btn btn-info"onclick="up_bl()">修改</button>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>
                <div class="col-xs-12" style="margin-top: 15px;">
                    <table id="table"  style="width: 90%;height: 90%;">

                    </table>
                </div>

            </div>
            <div class="page-header position-relative">
                <h3 style="color: #0e9aef">
                   挂号信息
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




<div  class="modal inmodal" id="addBinLiModal">
    <div class="modal-dialog">
        <form class="form-horizontal" id="addBinLiForm"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加病例</h4>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="medicalrecordcode_ty">病例编号</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="medicalrecordcode_ty" name="medicalrecordcode" class="form-control col-sm-6" readonly>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="medicalrecordname_ty">病例名称</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="medicalrecordname_ty" name="medicalrecordname" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="doctorid_ty">选择医生</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <select class="form-control" id="doctorid_ty" name="doctorid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.yisho}">
                                <option value="${i.id}">${i.employeename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="diseaseid_ty">疾病类型</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <select id="diseaseid_ty" class="form-control" name="diseaseid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.jjbbllxx}">
                                <option value="${i.id}">${i.diseasename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="note_ty">备注</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="note_ty" name="note" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="patientappeal_ty">病人主诉</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="patientappeal_ty" name="patientappeal" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="medicalhistory_ty">病人病史</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="medicalhistory_ty" name="medicalhistory" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="physicalstatus_ty">体检情况</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="physicalstatus_ty" name="physicalstatus" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="primarydiagnosis_ty">初步诊断</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="primarydiagnosis_ty" name="primarydiagnosis" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="opinion_ty">处理意见</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="opinion_ty" name="opinion" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="isvalid_ty">是否有效</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <select class="form-control" id="isvalid_ty" name="isvalid">
                            <option>请选择</option>
                            <option value="1">有效</option>
                            <option value="2">无效</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addBing()">添加</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div  class="modal inmodal" id="updBinLiModal">
    <div class="modal-dialog">
        <form class="form-horizontal" id="updBinLiForm"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改病例</h4>
                </div>
                <input type="hidden" id="id_upd" name="id">

                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="medicalrecordname_upd">病例名称</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="medicalrecordname_upd" name="medicalrecordname" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="doctorid_upd">选择医生</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <select id="doctorid_upd" class="form-control" name="doctorid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.yisho}">
                                <option value="${i.id}">${i.employeename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="diseaseid_upd">疾病类型</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <select id="diseaseid_upd" class="form-control" name="diseaseid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.jjbbllxx}">
                                <option value="${i.id}">${i.diseasename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="note_upd">备注</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="note_upd" name="note" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="patientappeal_upd">病人主诉</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="patientappeal_upd" name="patientappeal" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="medicalhistory_upd">病人病史</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="medicalhistory_upd" name="medicalhistory" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="physicalstatus_upd">体检情况</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="physicalstatus_upd" name="physicalstatus" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="primarydiagnosis_upd">初步诊断</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="primarydiagnosis_upd" name="primarydiagnosis" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="opinion_upd">处理意见</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <input type="text" id="opinion_upd" name="opinion" class="form-control col-sm-6">
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-10" for="isvalid_upd">是否有效</label>
                    <div class="col-sm-8 text-left container-fluid">
                        <select id="isvalid_upd" name="isvalid">
                            <option>请选择</option>
                            <option value="1">有效</option>
                            <option value="2">无效</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updBing()">修改</button>
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
            loadTable();
            loadTab();
        }
    );
    function queryParams(params) {
        var temp={
            "registercode":$("#registercode_g").val(),
            "medicalrecordcode":$("#medicalrecordcode_g").val(),
            "medicalrecordname":$("#medicalrecordname_g").val(),
            "employeename":$("#employeename_g").val(),
            "pageNumber":params.pageNumber,
            "pageSize":params.pageSize

        }
        return temp;
    }
    function search() {
        var registercode=$("#registercode_g").val();
        var medicalrecordcode=$("#medicalrecordcode_g").val();
        var medicalrecordname=$("#medicalrecordname_g").val();
        var employeename=$("#employeename_g").val();
        var opt = $("#table").bootstrapTable('getOptions');
        var pageSize=opt.pageSize;
        var pageNumber=opt.pageNumber;
        $.getJSON(
            "${ctx}/bl/getAll",
            {
                "registercode":registercode,
                "medicalrecordcode":medicalrecordcode,
                "medicalrecordname":medicalrecordname,
                "employeename":employeename,
                "pageSize":pageSize,
                "pageNumber":pageNumber
            },
            function (data) {
                $("#table").bootstrapTable("load",data);
            }
        );
    }
    testval="";
    function insert_bl() {
        if(testval!=""){
            $.post(
                "${ctx}/bl/getNew",
                "",
                function (data) {
                    $("#medicalrecordcode_ty").val(data);
                }
            );
            $("#addBinLiModal").modal("show");
        }else{
            swal("提示","你还没有选择病人","error");
        }
    }
    function addBing() {
            var form=formToJson("addBinLiForm");
            $.post(
                "${ctx}/bl/addBing",
                form,
                function (data) {
                    if(data=="true"){
                        swal("提示","恭喜你添加成功！！！","success");
                        $("#table").bootstrapTable("refresh");
                        $("#addBinLiModal").modal("hide");
                    }
                }
            );
    }
    function up_bl() {
        var rows=$("#table").bootstrapTable("getSelections");
        if(rows.length==0){
            swal("提示","请选中后再修改","error");
        }else if(rows.length>1){
            swal("提示","只能修改一个","error");
        }else{
            var id=rows[0].id;
            $("#id_upd").val(id);
            $("#updBinLiModal").modal("show");
        }
    }
    function updBing() {
        var updBinLiForm=formToJson("updBinLiForm");
        $.post(
            "${ctx}/bl/updBing",
            updBinLiForm,
            function (data) {
                if(data=="true"){
                    swal("提示","恭喜你修改成功！！！","success");
                    $("#table").bootstrapTable("refresh");
                    $("#updBinLiModal").modal("hide");
                }
            }
        );
    }
    function xuan() {
        swal({
            title: "提示",
            text: "请输入挂号单号",
            type: "input",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确认",
            closeOnConfirm: false
        }, function (data) {
            $.post(
                "${ctx}/bl/queRen",
                "registercode="+data,
                function (e) {
                    if(e=="0"){
                        swal("提示","挂号单号不存在！！！","error");
                    }else{
                        swal("提示","查找成功！！！","success");
                        $("#sp").text(e);
                        testval=e;
                    }
                }
            );
        });
    }

    function loadTable() {
        $("#table").bootstrapTable(
            {
                url:"${ctx}/bl/getAll",
                columns:[
                    {checkbox:true},
                    {
                        field:'id',
                        visible:false
                    },
                    {
                        field:'registercode',
                        title:'挂号编号'
                    },
                    {
                        field:'medicalrecordcode',
                        title:'病例编号'
                    },
                    {
                        field:'medicalrecordname',
                        title:'病例名称'
                    },
                    {
                        field:'employeename',
                        title:'医生名称'
                    },
                    {
                        field:'diseasename',
                        title:'疾病类别'
                    },
                    {
                        field:'note',
                        title:'备注'
                    },
                    {
                        field:'patientappeal',
                        title:'病人主诉'
                    },
                    {
                        field:'medicalhistory',
                        title:'病人病史'
                    },
                    {
                        field:'physicalstatus',
                        title:'体检情况'
                    },
                    {
                        field:'primarydiagnosis',
                        title:'初步诊断'
                    },
                    {
                        field:'opinion',
                        title:'处理意见'
                    },
                    {
                        field:'recordtime',
                        title:'记录时间'
                    },
                    {
                        field:'isvalid',
                        title:'是否有效',
                        formatter:function (value,row,index) {
                            if(row.isvalid==1){
                                return "有效"
                            }else {
                                return "无效"
                            }
                        }
                    }
                ],
                queryParamsType:'',
                queryParams:queryParams,
                height:550,
                pageList:[3,4,5],
                pageNumber:1,
                pageSize:5,
                pagination:true,
                sidePagination:'server',
                sortName:'id',
                sortOrder:'desc'
            }
        );
    }
    function loadTab() {
        $("#tab").bootstrapTable({
            url:'${ctx}/bl/getRegisterDtoAll',
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
                {field:'registercode', title:'挂号单号'},
                {field:'patientname', title:'病人名称'},
                {field:'employeename', title:'医生名称'},
                {field:'registertime', title:'处方时间'}
            ]
        });
    }
</script>
</html>