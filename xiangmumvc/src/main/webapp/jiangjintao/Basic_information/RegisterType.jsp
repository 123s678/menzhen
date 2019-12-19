<%--
  Created by IntelliJ IDEA.
  User: jianglaoban
  Date: 2019-11-23
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
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
    <title>as门诊管理系统-挂号类别</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/common-js.jsp"%>
    <%@include file="/common-jsp/common-css.jsp"%>
    <script type="text/javascript">
        console.log("江金涛");
        $(function () {
            console.log("刘京京");
            $("#table").bootstrapTable({

                url:'${ctx}/register/query',
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
                    field:'typesum',
                    title:'类别金额'
                },{
                    field:'note',
                    title:'备注'
                },{
                    field:'isvalid',
                    title:'是否有效',
                    formatter:function (value,row,index) {
                        if (row.isvalid==1){
                            return "有效"
                        } else {
                            return "无效"
                        }
                    }
                }]
            })
        })
        function todel() {
            var ide="";
            var rows=$("#table").bootstrapTable('getSelections')
            if (rows==0){
                swal('提示信息','请选择要删除的行','info');
            }else if (rows.length==1){
                swal({
                    title:"您确定要删除这条信息么？",
                    text:"删除后将无法恢复，请谨慎操作",
                    type:"warning",
                    showCancelButton:true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    closeOnConfirm: false
                },function () {
                    var id=rows[0].id;
                    //发送ajax请求
                    $.post("${ctx}/register/del",{id:id},function (data) {
                        //提示成功
                        swal("成功删除","已删除",'success')
                        $("#table").bootstrapTable("load",data)
                    })
               })
            }else {
                swal({
                    title:"您确定要删除此信息么",
                    text:"删除后无法恢复请谨慎操作",
                    type:"warning",
                    showCancelButton:true,
                    confirmButtonColor:"#DD6b55",
                    confirmButtonText:"删除",
                    closeOnConfirm:false
                },function () {
                    $.each(rows,function (index,row) {
                        ide=ide+row.id+"-"
                    })
                $.post("${ctx}/register/dels",{id:ide},function (data) {
                        swal("成功删除","已删除","success")
                    $("#table").bootstrapTable("load",data)
                    })
                })
            }
        }
        function toadd() {
            $("#addmodal").modal("show");
        }
        
        function doadd() {
            var formStr=$("#userform").serialize();
            var params=decodeURIComponent(formStr,true);
            $.ajax({
                url:'${ctx}/register/getadd',
                type:'post',
                data:params,
                success:function (data) {
                    $("#typecode").val("");
                    $("#typename").val("");
                    $("#typesum").val("");
                    $("#none").val("");
                    $("#addmodal").modal('hide');
                    $("#table").bootstrapTable("load",data);
                    return false;
                }
            });

        }

        function toup() {
            var rows=eval($("#table").bootstrapTable("getSelections"));
            if (rows.length==0){
                swal("提示信息","请选择要修改的行","info");
            }else if(rows.length>1){
                swal("提示信息","只能选中一个","error");
            } else if(rows.length==1){
                $("#userform1 [name=id]").val(rows[0].id);
                $("#userform1 [name=typecode]").val(rows[0].typecode);
                $("#userform1 [name=typename]").val(rows[0].typename);
                $("#userform1 [name=typesum]").val(rows[0].typesum);
                $("#userform1 [name=note]").val(rows[0].note);
                $("#userform1 [name=isvalid]").val(rows[0].isvalid);
                $("#addmo").modal("show");
            }
        }
        function doup() {

            var froms= $("#userform1").serialize();
            aaa=decodeURIComponent(froms,true);
            $.ajax({
                url:'${ctx}/register/update',
                type:'post',
                data:aaa,
                success:function (date) {
                    $("#addmo").modal("hide");
                    $("#table").bootstrapTable("load",date);
                }
            })
        }




// ----------------------------------


    </script>
</head>

<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h1 class="panel-title" style="font-size: 24px">挂号类别</h1>
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

<%--添加--%>
<div  class="modal inmodal" id="addmodal">
    <div class="modal-dialog" id="md">
        <iframe name="formSubmit" style="display:none;"></iframe>
        <form data-toggle="validator"  class="form-horizontal" id="userform"  method="post" role="form" target="formSubmit">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加挂号类别</h4>
                </div>
                <div class="modal-body" id="bd">
                    <div class="form-group">
                        <label for="typecode" class="col-sm-4 text-right" >编号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="typecode" name="typecode" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  for="typename" class="col-sm-4 text-right">类别名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="typename" name="typename" placeholder="名称必填"  required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">类别金额</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="typesum" name="typesum" placeholder="金额必填" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">备注</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="none" name="note" placeholder="可填或不填" />
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
                    <button onclick="doadd()"  type="submit" class="btn btn-primary">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>



<%--修改--%>
<div  class="modal inmodal" id="addmo">
    <div class="modal-dialog" id="md1">
        <form class="form-horizontal" id="userform1"  method="post" role="form">
            <input type="hidden" name="id" value="">
            <div class="modal-content animated bounceInLeft">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改挂号类别</h4>
                </div>
                <div class="modal-body" id="bd1">
                    <div class="form-group">
                        <label class="col-sm-4 text-right" >编号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="typecode1" name="typecode"  />
                            <input type="hidden" class="form-control" id="typecod1" name="id"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-4 text-right">类别名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="typename1" name="typename"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">类别金额</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="typesum1" name="typesum"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">备注</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="none1" name="note"  />
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
                    <button onclick="doup()" type="button" class="btn btn-primary">修改</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

