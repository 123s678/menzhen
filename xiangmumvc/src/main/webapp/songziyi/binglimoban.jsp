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
                    病例模板<br/>
                </h1>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <div id="zuida">
                        <div id="da">
                            <form class="form-inline">
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="templatecode_it">模板编号</label>
                                    <input type="text" id="templatecode_it" name="templatecode_it" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="templatename_it">模板名称</label>
                                    <input type="text" id="templatename_it" name="templatename_it" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="departmentname_it">撰写科室</label>
                                    <input type="text" id="departmentname_it" name="departmentname_it" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="employeename_it">撰写医生</label>
                                    <input type="text" id="employeename_it" name="employeename_it" class="form-control">
                                </div>
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <label for="fitstatus_it">适合情况</label>
                                    <input type="text" id="fitstatus_it" name="fitstatus_it" class="form-control">
                                </div>
                                <!-- Indicates a successful or positive action -->
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <button type="button" onclick="search()" class="btn btn-info">查询</button>
                                    <button type="button" class="btn btn-info" onclick="insert_info()">新增</button>
                                    <button type="button" class="btn btn-info" onclick="dayin()">打印</button>
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



<!--增加修改模态框-->
<div  class="modal inmodal" id="updateModal">
    <div class="modal-dialog">
        <form class="form-horizontal" id="patientfrom"  method="post" role="form">
            <input type="hidden">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改病历模板</h4>
                </div>
                <div class="form-group col-sm-12">
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="templatecode_aac">模板编号</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="templatecode_aac" id="templatecode_aac"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="templatename_aac">模板名称</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="templatename_aac" id="templatename_aac"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="diseaseid_aac">疾病类型</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <select id="diseaseid_aac" class="form-control" name="diseaseid_aac" class="form-control">
                                <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.jjbbllxx}">
                                    <option value="${i.id}">${i.diseasename}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="fitstatus_aac">适合情况</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="fitstatus_aac" id="fitstatus_aac"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="note_aac">模板备注</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="note_aac" id="note_aac"/>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updateMedical()">修改</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!--增加添加模态框-->
<div  class="modal inmodal" id="addModal">
    <div class="modal-dialog">
        <form class="form-horizontal"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <input type="hidden">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加病历模板</h4>
                </div>
                <div class="modal-body col-sm-12">
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="templatecode_bbc">模板编号</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="templatecode_bbc" id="templatecode_bbc" readonly/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="templatename_bbc">模板名称</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="templatename_bbc" id="templatename_bbc"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="doctorid_bbc">选择医生</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <select id="doctorid_bbc" class="form-control" name="doctorid_bbc">
                                <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.yisho}">
                                    <option value="${i.id}">${i.employeename}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="diseaseid_bbc">疾病类型</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <select id="diseaseid_bbc" class="form-control" name="diseaseid_bbc">
                                <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.jjbbllxx}">
                                    <option value="${i.id}">${i.diseasename}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="fitstatus_bbc">适用情况</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="fitstatus_bbc" id="fitstatus_bbc"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="note_bbc">模板备注</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="note_bbc" id="note_bbc"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="patientappeal_bbc">病人主诉</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="patientappeal_bbc" id="patientappeal_bbc"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="medicalhistory_bbc">病人病史</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="medicalhistory_bbc" id="medicalhistory_bbc"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="physicalstatus_bbc">提交情况</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="physicalstatus_bbc" id="physicalstatus_bbc"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="primarydiagnosis_bbc">初步诊断</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="primarydiagnosis_bbc" id="primarydiagnosis_bbc"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-10 text-left" for="opinion_bbc">处理意见</label>
                        <div class="col-sm-8 text-left container-fluid">
                            <input type="text" class="form-control" name="opinion_bbc" id="opinion_bbc"/>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addM()">添加</button>
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
            $("#table").bootstrapTable(
                {
                    url:"${ctx}/medicalDCon/getMedicalDtoList",
                    columns:[
                        {checkbox:true},
                        {
                            field:'id',
                            title:'id',
                            visible:false
                        },
                        {
                            field:'templatecode',
                            title:'模板编号'
                        },
                        {
                            field:'templatename',
                            title:'模板名称'
                        },
                        {
                            field:'departmentname',
                            title:'科室名称'
                        },
                        {
                            field:'employeename',
                            title:'医生名称'
                        },
                        {
                            field:'diseasename',
                            title:'类别名称'
                        },
                        {
                            field:'fitstatus',
                            title:'适用情况'
                        },
                        {
                            title:'操作',
                            formatter:function (value,row,index) {
                                return "<button class='btn btn-info' style='margin-right: 5px;' onclick=fromSing('"+row.id+"')>修改</button><button class='btn btn-info' style='margin-right: 5px;' onclick=shanSing('"+row.id+"','"+row.templatename+"')>删除</button>";
                            }
                        }
                    ],
                    queryParamsType:null,
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
                            url:'${ctx}/medicalDCon/getMecDtoOne?id='+row.id+'',
                            columns:[
                                {field:"departmentname",title:"科室名称"},
                                {field:"patientappeal",title:"病人主诉"},
                                {field:"medicalhistory",title:"病人病史"},
                                {field:"physicalstatus",title:"体检情况"},
                                {field:"primarydiagnosis",title:"初步诊断"},
                                {field:"opinion",title:"处理意见"}
                            ],

                        });
                    }
                }
            );
        }
    );
    function queryParams(parpams) {
        var temp={
            "templatecode":$("#templatecode_it").val(),
            "templatename":$("#templatename_it").val(),
            "departmentname":$("#departmentname_it").val(),
            "employeename":$("#employeename_it").val(),
            "fitstatus":$("#fitstatus_it").val(),
            "pageSize":parpams.pageSize,
            "pageNumber":parpams.pageNumber
        };
        return temp;
    }
    function search() {
        var templatecode=$("#templatecode_it").val();
        var templatename=$("#templatename_it").val();
        var departmentname=$("#departmentname_it").val();
        var employeename=$("#employeename_it").val();
        var fitstatus=$("#fitstatus_it").val();
        var opt = $("#table").bootstrapTable('getOptions');
        var pageSize=opt.pageSize;
        var pageNumber=opt.pageNumber;
        $.getJSON(
            '${ctx}/medicalDCon/getMedicalDtoList',
            {
                'templatecode':templatecode,
                'templatename':templatename,
                'departmentname':departmentname,
                'employeename':employeename,
                'fitstatus':fitstatus,
                'pageSize':pageSize,
                'pageNumber':pageNumber
            },
            function (data) {
                $("#table").bootstrapTable("load",data);
            }
        );
    }

    function shanSing(id,templatename) {
        swal({
            title: "您确定要删除"+templatename+"吗",
            text: "删除后将无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            closeOnConfirm: false
        }, function (e) {
            if(e==true){
                $.getJSON(
                    "${ctx}/medicalDCon/shanSing",
                    {"id":id},
                    function (data) {
                        if(data==true){
                            swal("删除成功！","您已删除了这条信息","success");
                            $("#table").bootstrapTable("refresh");
                        }

                    }
                );
            }


        });
    }
    vid=0;
    function fromSing(id) {
        vid=id;
        $.getJSON(
            "${ctx}/medicalDCon/fromSession",
            {"id":id},
            function (result) {
                var object=eval(result);
                var templatecode=object.templatecode;
                var templatename=object.templatename;
                var fitstatus=object.fitstatus;
                var note=object.note;
                $("#templatecode_aac").val(templatecode);
                $("#templatename_aac").val(templatename);
                $("#fitstatus_aac").val(fitstatus);
                $("#note_aac").val(note);
                $("#updateModal").modal("show");
            }
        );
    }

    function updateMedical() {
        var templatecode=  $("#templatecode_aac").val();
        var templatename=  $("#templatename_aac").val();
        var fitstatus=  $("#fitstatus_aac").val();
        var note= $("#note_aac").val();
        var diseaseid=$("#diseaseid_aac").val();
        var id=vid;
        $.getJSON(
            "${ctx}/medicalDCon/updateMedical",
            {
                "templatecode":templatecode,
                "templatename":templatename,
                "fitstatus":fitstatus,
                "note":note,
                "diseaseid":diseaseid,
                "id":id
            },
            function (e) {
                if(e==true){
                    $("#updateModal").modal("hide");
                    swal("提示","恭喜你修改成功","success");
                    $("#table").bootstrapTable("refresh");
                }
            }
        );
    }
    function insert_info() {
        $.post(
            "${ctx}/medicalDCon/loadInsert",
            "",
            function (e) {
                $("#templatecode_bbc").val(e);
            }
        );
        $("#addModal").modal("show");
    }

    function addM() {
        var templatecode=$("#templatecode_bbc").val();
        var templatename=$("#templatename_bbc").val();
        var doctorid=$("#doctorid_bbc").val();
        var diseaseid=$("#diseaseid_bbc").val();
        var fitstatus=$("#fitstatus_bbc").val();
        var note=$("#note_bbc").val();
        var patientappeal=$("#patientappeal_bbc").val();
        var medicalhistory=$("#medicalhistory_bbc").val();
        var physicalstatus=$("#physicalstatus_bbc").val();
        var primarydiagnosis=$("#primarydiagnosis_bbc").val();
        var opinion=$("#opinion_bbc").val();
        $.getJSON(
            "${ctx}/medicalDCon/addM",
            {
                "templatecode":templatecode,
                "templatename":templatename,
                "doctorid":doctorid,
                "diseaseid":diseaseid,
                "fitstatus":fitstatus,
                "note":note,
                "patientappeal":patientappeal,
                "medicalhistory":medicalhistory,
                "physicalstatus":physicalstatus,
                "primarydiagnosis":primarydiagnosis,
                "opinion":opinion
            },
            function (data) {
                $("#addModal").modal("hide");
                swal("提示","恭喜你添加成功","success");
                $("#table").bootstrapTable("refresh");
            }
        );
    }

    function dayin() {
        var rows=$("#table").bootstrapTable("getSelections");
        if(rows.length==0){
            swal("提示","请选择后再打印","error");
            return;
        }else{
            var ids="";
            for (var i in rows){
                var id=rows[i].id+"-";
                ids+=id;
            };
            $.post(
                "${ctx}/medicalDCon/ddinfo",
                "ids="+ids,
                function (data) {
                    swal("提示","下载成功！","success");
                }
            );
        }
    }
</script>
</html>