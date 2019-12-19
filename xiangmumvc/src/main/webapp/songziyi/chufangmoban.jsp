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
                    处方模板
                </h1>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <div id="zuida">
                        <div id="da">
                            <form class="form-inline">
                                <div class="form-group container-fluid">
                                    <label for="employeename_iu">医生名称</label>
                                    <input type="text" id="employeename_iu" name="employeename_iu" class="form-control">
                                </div>
                                <div class="form-group container-fluid">
                                    <label for="templatename_iu">模板名称</label>
                                    <input type="text" id="templatename_iu" name="templatename_iu" class="form-control">
                                </div>
                                <!-- Indicates a successful or positive action -->
                                <div class="form-group container-fluid">
                                    <button type="button" class="btn btn-info" onclick="search_info()">查询</button>
                                    <button type="button" class="btn btn-info" onclick="ins1_info()">新增模板</button>
                                    <button type="button" class="btn btn-info" onclick="ins2_info()">新增模板明细</button>
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
            <div>
            </div>
        </div>
    </div>
</div>



<div  class="modal inmodal" id="add1Modal">
    <div class="modal-dialog">
        <form class="form-horizontal" id="fr1" action=""   method="post" role="form">
            <input type="hidden">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加处方模板</h4>
                </div>
                <div class="modal-body col-sm-12">
                    <div class="form-group col-sm-12 text-center">
                        <label class="col-sm-6">处方名称</label>
                        <div class="col-sm-6 text-left">
                            <input type="text" class="form-control" name="templatename"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12 text-center">
                        <label class="col-sm-6">选择医生</label>
                        <div class="col-sm-6 text-left">
                            <select class="form-control" name="doctorid">
                                <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.yisho}">
                                    <option value="${i.id}">${i.employeename}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-12 text-center">
                        <label class="col-sm-6">处方类型</label>
                        <div class="col-sm-6 text-left">
                            <select class="form-control" name="prescriptiontypeid">
                                <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.cflxif}">
                                    <option value="${i.tid}">${i.tname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-12 text-center">
                        <label class="col-sm-6">处方分类</label>
                        <div class="col-sm-6 text-left">
                            <select class="form-control" name="classifyid">
                                <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.cfflif}">
                                    <option value="${i.tid}">${i.tname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-12 text-center">
                        <label class="col-sm-6" for="note_gh">备注</label>
                        <div class="col-sm-6 text-left">
                            <input type="text" class="form-control" name="note" id="note_gh"/>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addio()">添加</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div  class="modal inmodal" id="add2Modal">
    <div class="modal-dialog">
        <form class="form-horizontal" id="frr"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加病历模板明细</h4>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <input type="hidden" name="prescriptiontemplateid" id="kid">
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6">药品名称</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="drugid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugAll}">
                                <option value="${i.id}">${i.drugname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6">每剂用量</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="eachdosage"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6">剂数</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="dosagequantity"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6">用药方式</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="medicineformid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugyyfs}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6">用药频率</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="medicinefrequencyid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugyypl}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6">用药总量</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="medicineamount"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6">备注</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="note"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addio2()">添加</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div  class="modal inmodal" id="up1Modal">
    <div class="modal-dialog">
        <form class="form-horizontal" id="up1"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改病历模板详情</h4>
                </div>
                <div class="form-group col-sm-12">
                    <input type="hidden" name="id" id="upid1">
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-6">药品名称</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="drugid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugAll}">
                                <option value="${i.id}">${i.drugname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-6 text-left">每剂用量</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="eachdosage"/>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-6 text-left">剂数</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="dosagequantity"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6 text-left">用药方式</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="medicineformid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugyyfs}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-6">用药频率</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="medicinefrequencyid">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugyypl}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label class="col-sm-6">用药总量</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="medicineamount"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6 text-left">备注</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="note"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="upio1()">修改</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
$(
    function () {
        $("#table").bootstrapTable(
            {
                url:"${ctx}/chuFang/getAllFile",
                columns:[
                    {checkbox:true},
                    { field:'id', visible:false},
                    {field:'templatename',title:'模板名称'},
                    { field:'employeename', title:'医生名称'},
                    { field:'typename', title:'处方类型'},
                    { field:'classname', title:'处方分类'},
                    { field:'diagnosis', title:'处方诊断'},
                    { field:'note', title:'备注'}
                ],
                queryParamsType:'',
                pagination:true,
                paginationLoop:true,
                height:500,
                pageList:[1,2,3],
                pageNumber:1,
                pageSize:3,
                sidePagination:'server',
                queryParams:queryParams,
                detailView:true,
                onExpandRow:function (index,row,$detail) {
                    var table=$detail.html("<table></table>").find("table");
                    table.bootstrapTable({
                        url:'${ctx}/chuFang/getAllTailList?pid='+row.id+'',
                        columns:[
                            {field:"id",visible:false},
                            {field:"pid",visible:false},
                            {field:"drugname",title:"药品名称"},
                            {field:"eachdosage",title:"每剂用量"},
                            {field:"dosagequantity",title:"剂数"},
                            {field:"forname",title:"用药方式"},
                            {field:"frename",title:"用药频率"},
                            {field:"medicineamount",title:"用药总量"},
                            {field:"note",title:"备注"},
                            {
                                title:'操作',
                                formatter:function (value,row,index) {
                                    return "<button class='btn btn-info' style='margin-right: 5px;' onclick=foa('"+row.id+"')>修改</button><button class='btn btn-info' style='margin-right: 5px;' onclick=fob('"+row.id+"')>删除</button><button class='btn btn-info' style='margin-right: 5px;'onclick=foc('"+row.id+"')>打印</button>";
                                }
                            }
                        ],

                    });
                }
            }
        );

    }
);


function queryParams(parpams) {
    var temp={
        "templatename":$("#templatename_iu").val(),
        "employeename":$("#employeename_iu").val(),
        "pageSize":parpams.pageSize,
        "pageNumber":parpams.pageNumber
    }
    return temp;
}
function search_info() {
    var templatename=$("#templatename_iu").val();
    var employeename=$("#employeename_iu").val();
    var opt = $("#table").bootstrapTable('getOptions');
    var pageSize=opt.pageSize;
    var pageNumber=opt.pageNumber;
    $.getJSON(
        "${ctx}/chuFang/getAllFile",
        {
            "templatename":templatename,
            "employeename":employeename,
            "pageSize":pageSize,
            "pageNumber":pageNumber
        },
        function (data) {
            $("#table").bootstrapTable("refresh");
        }
    );
}
    function foa(id) {
        $("#upid1").val(id);
        $("#up1Modal").modal("show");
    }



function fob(id) {
    swal({
        title: "您确定要删除",
        text: "删除后将无法恢复，请谨慎操作！",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "删除",
        closeOnConfirm: false
    }, function (e) {
       if(e==true){
           $.post(
               "${ctx}/chuFang/deprescriptiontemplatedetail",
               "id="+id,
               function (data) {
                   if(data=="true"){
                       swal("删除成功！","您已删除了这条信息","success");
                       $("#table").bootstrapTable("refresh");
                   }
               }
           );
       }
    });
}
function foc(id) {
    $.post(
        "${ctx}/chuFang/fileId",
        "ids="+id,
        function (data) {
            swal("提示","下载成功","success");
        }
    );
}
function ins1_info() {
    $("#add1Modal").modal("show");
}
function ins2_info() {
    var table=$("#table").bootstrapTable("getSelections");
    if(table.length==0){
        swal("提示","请选择后再添加","error");
        return;
    }
    if(table.length>1){
        swal("提示","只能选择一个","error");
        return;
    }
    var id = $("#table").bootstrapTable('getSelections')[0].id;
    $("#kid").val(id);
    $("#add2Modal").modal("show");
}
function addio() {
    var froms=formToJson("fr1");
    $.post(
        "${ctx}/chuFang/addPrescriptiontemplate",
        froms,
        function (data) {
            if(data=="true"){
                swal("提示","添加成功！！！","success");
                $("#table").bootstrapTable("refresh");
                $("#add1Modal").modal("hide");
            }
        }
    );
}
function addio2() {
var prescriptiontemplatedetail=formToJson("frr");
$.post(
    "${ctx}/chuFang/addprescriptiontemplatedetail",
    prescriptiontemplatedetail,
    function (data) {
        if(data=="true"){
            swal("提示","添加成功！！！","success");
            $("#table").bootstrapTable("refresh");
            $("#add2Modal").modal("hide");
        }
    }
);
}
function upio1() {
    var prescriptiontemplatedetail=formToJson("up1");
    $.post(
        "${ctx}/chuFang/upprescriptiontemplatedetail",
        prescriptiontemplatedetail,
        function (data) {
            if(data=="true"){
                swal("提示","修改成功！！！","success");
                $("#table").bootstrapTable("refresh");
                $("#up1Modal").modal("hide");
            }
        }
    );
}
</script>
</html>