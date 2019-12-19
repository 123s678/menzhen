
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
    <title>as门诊管理系统-病人类别</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/common-js.jsp"%>
    <%@include file="/common-jsp/common-css.jsp"%>
    <script type="text/javascript">
        $(function () {
            $("#table").bootstrapTable({
                url:'${ctx}/patient2/query',
                pagination:true,
                pageSize:2,
                pageList:[2,3],
                columns:[{
                    checkbox:true
                },{
                    field:'typecode',
                    title:'编号'
                },{
                    field:'typename',
                    title:'类别名称'
                },{
                    field:'typediscount',
                    title:'类别折扣'
                },{
                    field:'note',
                    title:'备注'
                },{
                    field:'isvalid',
                    title:'是否有效',
                    formatter:function (varue,row,index) {
                        if (row.isvalid==1){
                            return"有效"
                        } else {
                            return "无效"
                        }
                    }
                }]
            })
        })
        function todel() {
            var ids="";
            var rows=$("#table").bootstrapTable("getSelections")
            if (rows.length==0){
                swal("提示信息","请选择要删除的行","info");
            }else if(rows.length==1){
                swal({
                    title:"您确定要删除此信息么",
                    text:"删除后无法恢复，请谨慎操作",
                    type:"warning",
                    showCancelButton:true,
                    confirmButtonColor:"#DD6",
                    confirmButtonText:"删除"
                },function () {
                    var id=rows[0].id;
                    console.log(rows);
                    $.post("${ctx}/patient2/del",{id:id},function (data) {
                        swal("提示信息","成功删除","success");
                        $("#table").bootstrapTable("load",data);
                    })
                })
            }else {
                swal({
                    title:"您确定要删除吗",
                    text:"删除后无法恢复",
                    type:"warning",
                    showCancelButton:true,
                    confirmButtonColor:"#DD6",
                    confirmButtonText:"删除"
                },function () {
                    $.each(rows,function (index,row) {
                        ids=ids+row.id+"-";
                    })

                    $.post("${ctx}/patient2/dels",{id:ids},function (data) {
                        swal("成功删除","已删除","success");
                        $("#table").bootstrapTable("load",data)
                    })
                })
            }
        }
        function toadd() {
            $("#addmodal").modal("show")
        }
        function jian() {
            var froms=$("#userform").serialize();
            var params=decodeURIComponent(froms,true);
            $.post("${ctx}/patient2/getadd",params,function (data) {
                $("#addmodal").modal("hide");
                $("#table").bootstrapTable("load",data);
            })
        }

        function toup() {
            var rows=eval($("#table").bootstrapTable("getSelections"));
            if (rows.length==0){
                swal("提示信息","请选择要修改的行","info");
            }  else if (rows.length>1){
                swal("提示信息","只能选择一个","error");
            }else if (rows.length==1){
                $("#userfor [name=id]").val(rows[0].id);
                $("#userfor [name=typecode]").val(rows[0].typecode);
                $("#userfor [name=typename]").val(rows[0].typename);
                $("#userfor [name=typediscount]").val(rows[0].typediscount);
                $("#userfor [name=note]").val(rows[0].note);
                $("#userfor [name=isvalid]").val(rows[0].isvalid);
                $("#addmoda").modal("show");
            }

        }

        function doadd() {
            var forms=$("#userfor").serialize();
            var params=decodeURIComponent(forms,true);
            $.post("${ctx}/patient2/getup",params,function (data) {
                $("#addmoda").modal("hide");
                $("#table").bootstrapTable("load",data);
            })
        }
        

    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h1 class="panel-title" style="font-size: 24px">病人类别</h1>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-6">
                <button onclick="toadd()" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;增加</button>
                <button onclick="todel()" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;删除</button>
                <button onclick="toup()" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;修改</button>
            </div>
        </div>
        <div class="row" style="margin-top: 15px">
            <div class="col-sm-12">
                <table id="table"></table>
            </div>
        </div>
    </div>
</div>

<%--增加--%>
<div  class="modal inmodal" id="addmodal">
    <div class="modal-dialog" id="md">
        <form class="form-horizontal" id="userform"  method="post" role="form">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加病人类别</h4>
                </div>
                <div class="modal-body" id="bd">
                    <div class="form-group">
                        <label class="col-sm-4 text-right" >编号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="typecode"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-4 text-right">类别名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="typename"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">类别折扣</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="typediscount"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">备注</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="note"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right">是否有效</label>
                        <div class="col-sm-6">
                            <select  class="form-control" name="isvalid" >
                                <option value="1">有效</option>
                                <option value="2">无效</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button onclick="jian()" type="button" class="btn btn-primary">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>


<%--修改--%>
<div  class="modal inmodal" id="addmoda">
    <div class="modal-dialog" id="md1">
        <form class="form-horizontal" id="userfor"  method="post" role="form">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改病人类别</h4>
                </div>
                <div class="modal-body" id="bd1">
                    <div class="form-group">
                        <label class="col-sm-4 text-right" >编号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="typecode"  />
                            <input type="hidden" class="form-control" name="id"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-4 text-right">类别名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="typename"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">类别折扣</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="typediscount"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">备注</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="note"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right">是否有效</label>
                        <div class="col-sm-6">
                            <select  class="form-control" name="isvalid" >
                                <option value="1">有效</option>
                                <option value="2">无效</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button onclick="doadd()" type="button" class="btn btn-primary">修改</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

</html>
