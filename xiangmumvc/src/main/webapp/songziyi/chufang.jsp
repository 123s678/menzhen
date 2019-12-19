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
                    处方
                </h1>
            </div><!--/.page-header-->
            <div class="page-header position-relative">
                <h3 style="color: #0e9aef">
                    病人姓名：<span id="sp1" style="color: black"></span>
                </h3>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <div id="zuida">
                        <div id="da">
                            <form class="form-inline">
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="registercode_chu">挂号编号</label>
                                    <input type="text" id="registercode_chu" name="registercode" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="prescriptioncode_chu">处方编号</label>
                                    <input type="text" id="prescriptioncode_chu" name="prescriptioncode" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="prescriptionname_chu">处方名称</label>
                                    <input type="text" id="prescriptionname_chu" name="prescriptionname" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="employeename_chu">医生名称</label>
                                    <input type="text" id="employeename_chu" name="employeename" class="form-control">
                                </div>
                                <!-- Indicates a successful or positive action -->
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <button type="button" class="btn btn-info" onclick="xuan()">选择病人</button>
                                    <button type="button" onclick="search()" class="btn btn-info">查询</button>
                                    <button type="button" class="btn btn-info"onclick="insert_chu_show1()">新增处方</button>
                                    <button type="button" class="btn btn-info"onclick="insert_chu_show2()">新增处方药品</button>
                                    <button type="button" class="btn btn-info"onclick="del_chu()">删除</button>
                                    <button type="button" class="btn btn-info" onclick="que()">确定就诊</button>
                                    <button type="button" class="btn btn-info" onclick="tuiHao()">退号</button>
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
        </div>
    </div>
</div>
<!--增加添加模态框-->
<div  class="modal inmodal" id="addModal1">
    <div class="modal-dialog">
        <form class="form-horizontal" id="addForm1"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">处方</h4>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="prescriptioncode_gh">处方单号</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="prescriptioncode" id="prescriptioncode_gh" readonly/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="prescriptionname_gh">名称</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="prescriptionname" id="prescriptionname_gh"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="doctorid_gh">选择医生</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="doctorid" id="doctorid_gh">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.yisho}">
                                <option value="${i.id}">${i.employeename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="prescriptiontypeid_gh">处方类型</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="prescriptiontypeid" id="prescriptiontypeid_gh">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.cflxif}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="classifyid_gh">处方分类</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="classifyid" id="classifyid_gh">
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
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="diagnosis_gh">处方诊断</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="diagnosis" id="diagnosis_gh"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="isvalid_gh">是否有效</label>
                    <div class="col-sm-6 text-left">
                        <select id="isvalid_gh" class="form-control" name="isvalid" >
                            <option>请选择</option>
                            <option value="1">有效</option>
                            <option value="2">无效</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addOb1()">添加</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>











<!--增加添加模态框-->
<div  class="modal inmodal" id="addModal2">
    <div class="modal-dialog">
        <form class="form-horizontal" id="addForm2"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加处方明细</h4>
                </div>
                <input type="hidden" name="prescriptionid" id="prescriptionid_cf2">
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="drugid_cf2">药品名称</label>
                    <div class="col-sm-6 text-left">
                        <select name="drugid" class="form-control" id="drugid_cf2" onchange="selectKuCun()">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugAll}">
                                <option value="${i.id}">${i.drugname}</option>
                            </c:forEach>
                        </select>
                        <span>库存数量：<span id="sp"></span></span>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="eachdosage_gh">每剂用量</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="eachdosage" id="eachdosage_gh"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="dosagequantity_gh">剂数</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="dosagequantity" id="dosagequantity_gh"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="medicineformid_cf2">用药方式</label>
                    <div class="col-sm-6 text-left">
                        <select name="medicineformid" class="form-control" id="medicineformid_cf2" onchange="selectKuCun()">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugyyfs}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="medicinefrequencyid_cf2">用药频率</label>
                    <div class="col-sm-6 text-left">
                        <select name="medicinefrequencyid" id="medicinefrequencyid_cf2" onchange="selectKuCun()" class="form-control">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.drugyypl}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="medicineamount_cf2">用药总量</label>
                    <div class="col-sm-4 text-left">
                        <input type="text" style="width: 150px; display: inline-block" name="medicineamount" id="medicineamount_cf2"/>
                        <span style="display: inline-block">是否够用：<span id="sp2"></span></span>
                        <input type="button" value="搜索" onclick="selectKuCun2()">
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="note_cf2">备注</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="note" id="note_cf2"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="isvalid_cf2">是否有效</label>
                    <div class="col-sm-6 text-left">
                        <select name="isvalid" class="form-control" id="isvalid_cf2">
                            <option value="">请选择</option>
                            <option value="1">有效</option>
                            <option value="2">无效</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addOb2()">添加</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</body>
<script>
    $(function () {
        loadTable();
        loadTab();
    });
    function queryParams(params) {
        var temp={
            "registercode":$("#registercode_chu").val(),
            "prescriptioncode":$("#prescriptioncode_chu").val(),
            "prescriptionname":$("#prescriptionname_chu").val(),
            "employeename":$("#employeename_chu").val(),
            "pageNumber":params.pageNumber,
            "pageSize":params.pageSize

        }
        return temp;
    }
    function search() {
        var registercode=$("#registercode_chu").val();
        var prescriptioncode=$("#prescriptioncode_chu").val();
        var prescriptionname=$("#prescriptionname_chu").val();
        var employeename=$("#employeename_chu").val();
        var opt = $("#table").bootstrapTable('getOptions');
        var pageSize=opt.pageSize;
        var pageNumber=opt.pageNumber;
        $.getJSON(
            "${ctx}/cf/getAll",
            {
                "registercode":registercode,
                "prescriptioncode":prescriptioncode,
                "prescriptionname":prescriptionname,
                "employeename":employeename,
                "pageSize":pageSize,
                "pageNumber":pageNumber
            },
            function (data) {
                $("#table").bootstrapTable("load",data);
            }
        );
    }
    function insert_chu_show1() {
        $.post(
            "${ctx}/bl/getNew",
            "",
            function (data) {
                if(data=="1"){
                    swal("提示","你还没有选择病人","error");
                    return;
                }else{
                    $("#prescriptioncode_gh").val(data);
                    $("#addModal1").modal("show");
                }

            }
        );

    }

    function addOb1() {
        var from=formToJson("addForm1");
        $.post(
            "${ctx}/cf/add1",
            from,
            function (data) {
                if(data=="3"){
                    swal("提示","你还没有选择病人","error");
                    return;
                }
                if(data=="true"){
                    $("#addModal1").modal("hide");
                    swal("提示","恭喜你添加成功","success");
                    $("#table").bootstrapTable("refresh");
                }
            }
        );
    }
    function insert_chu_show2() {
        var rows=$("#table").bootstrapTable("getSelections");
        if(rows.length==0){
            swal("提示","请选择处方后再添加药品","error");
            return;
        }else if(rows.length>1){
            swal("提示","只能选择一个","error");
            return;
        }else{
            $("#prescriptionid_cf2").val(rows[0].id);
            $("#addModal2").modal("show");
        }
    }

    function selectKuCun() {
        var id=$("#drugid_cf2").val();
        $.post(
            "${ctx}/cf/selectOne1",
            "id="+id,
            function (data) {
                if(data=="0"){
                    $("#sp").css("color","red");
                }else{
                    $("#sp").css("color","black");
                }
                $("#sp").text(data);
            }
        );
    }
    function selectKuCun2() {
        var sp=$("#sp").text();
        var shu=$("#medicineamount_cf2").val();
        $.post(
            "${ctx}/cf/selectT2",
            "num1="+sp+"&num2="+shu,
            function (data) {
                if(data=="true"){
                    $("#sp2").css("color","black");
                    $("#sp2").text("够用");
                }else{
                    $("#sp2").css("color","red");
                    $("#sp2").text("不够用");
                }
            }
        );

    }
    function addOb2() {
        var from=formToJson("addForm2");
        $.post(
            "${ctx}/cf/add2",
            from,
            function (data) {
                if(data=="true"){
                    swal("提示","恭喜你添加成功！！！","success");
                    $("#table").bootstrapTable("refresh");
                    $("#addModal2").modal("hide");
                }

            }
        );
    }
    function del_chu() {
        var rows=$("#table").bootstrapTable("getSelections");
        if(rows.length==0){
            swal("提示","请选中后再删除","error");
        }else if(rows.length>1){
            swal("提示","只能删除一个","error");
        }else{
            var id=rows[0].id;
            $.post(
                "${ctx}/cf/delChu",
                "id="+id,
                function (data) {
                    if(data=="true"){
                        swal("提示","恭喜你删除成功！！！","success");
                        $("#table").bootstrapTable("refresh");
                    }
                }
            );
        }
    }
    getRegistercode="";
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
                        $("#sp1").text(e);
                    }
                }
            );
        });




    }

    /*
    * 确诊
    * */
    function que() {
        infoinfo();
        if(getRegistercode!=""){
            $.ajax({
                type: "post",
                url: "${ctx}/cf/cardcodeinfo",
                cache: false,
                async: false,
                success: function (data) {
                    getRegistercode = data;
                    swal({
                        title: "您确定就诊吗",
                        text: "确定为：挂号单为"+getRegistercode+"就诊吗？",
                        type: "info",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "确认",
                        closeOnConfirm: false
                    }, function (data) {
                        if(data!=false){
                            $.post(
                                "${ctx}/cf/jz",
                                "registercode="+getRegistercode,
                                function (e) {
                                    if(e=="0"){
                                        swal("提示","挂号单不存在","error");
                                    }else if(e=="1"){
                                        swal("提示","就诊成功","success");
                                        $("#table").bootstrapTable("refresh");
                                    }
                                }
                            );
                        }
                    });
                }
            });
        }else{
            swal("提示","你还没有选择病人","error");
        }

    }
    /*
    * 退号
    * */
    function tuiHao() {

        infoinfo();
        if(getRegistercode!=""){
            $.ajax({
                type: "post",
                url: "${ctx}/cf/cardcodeinfo",
                cache: false,
                async: false,
                success: function (data) {
                    swal({
                        title: "您确定退号吗",
                        text: "确认为：挂号单为"+getRegistercode+"退号吗？",
                        type: "info",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "确认",
                        closeOnConfirm: false
                    }, function (data) {
                        if(data!=false){
                            $.post(
                                "${ctx}/cf/tuihao",
                                "",
                                function (e) {
                                    if(e=="0"){
                                        swal("提示","挂号单不存在","error");
                                    }else if(e=="1"){
                                        swal("提示","退号成功","success");
                                        $("#table").bootstrapTable("refresh");
                                    }
                                }
                            );
                        }
                    });
                }
            });
        }else{
            swal("提示","你还没有选择病人","error");
        }

    };



    function loadTable() {
        $("#table").bootstrapTable(
            {
                url:"${ctx}/cf/getAll",
                columns:[
                    {checkbox:true},
                    {  field:'id',
                        visible:false
                    },
                    {  field:'registercode',
                        title:'挂号编号'
                    },
                    {  field:'prescriptioncode',
                        title:'处方编号'
                    },
                    {  field:'prescriptionname',
                        title:'处方单号'
                    },
                    {  field:'employeename',
                        title:'医生名称'
                    },
                    {  field:'typename',
                        title:'处方类型'
                    },
                    {  field:'classname',
                        title:'处方分类'
                    },
                    {  field:'note',
                        title:'备注'
                    },
                    {  field:'prescriptiontime',
                        title:'处方时间'
                    },
                    {  field:'diagnosis',
                        title:'处方诊断'
                    },
                    {  field:'isvalid',
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
                sortOrder:'desc',
                detailView:true,
                onExpandRow:function (index,row,$detail) {
                    var table=$detail.html("<table></table>").find("table");
                    table.bootstrapTable({
                        url:'${ctx}/cf/getTailAll?prescriptionid='+row.id+'',
                        columns:[
                            {field:"id",visible:false},
                            {field:"prescriptionid",visible:false},
                            {field:"drugname",title:"药品名称"},
                            {field:"eachdosage",title:"每剂用量"},
                            {field:"dosagequantity",title:"剂数"},
                            {field:"forname",title:"用药方式"},
                            {field:"countname",title:"用药频率"},
                            {field:"medicineamount",title:"用药总量"},
                            {field:"note",title:"备注"},
                            {field:"isvalid",title:"是否有效",
                                formatter:function (value,row,index) {
                                    if(row.isvalid==1){
                                        return "有效"
                                    }else {
                                        return "无效"
                                    }
                                }
                            }
                        ],

                    });
                }
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
    function infoinfo() {
        $.ajax({
            type: "post",
            url: "${ctx}/bl/infoSing",
            cache: false,
            async: false,
            success: function (data) {
                if(data!=null){
                    getRegistercode=data;
                }
            }
        });
    }
</script>
</html>