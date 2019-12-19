<%--
  Created by IntelliJ IDEA.
  User: jianglaoban
  Date: 2019-11-23
  Time: 15:18
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
    <title>as门诊管理系统-收费类别</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/common-js.jsp"%>
    <%@include file="/common-jsp/common-css.jsp"%>
    <script type="text/javascript">
        $(function () {
            $("#table").bootstrapTable({
                url:'${ctx}/charge/query',
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
                    field:'itemmark',
                    title:'项目标志'
                },{
                    field:'discount',
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
            var rows=$("#table").bootstrapTable("getSelections");
            if (rows.length==0){
                swal("提示信息","请您选择要删除的行","info")
            }else if(rows.length==1){
                swal({
                    title:"您确定要删除此信息么",
                    text:"删除后无法恢复，请谨慎操作",
                    type:"warning",
                    showCancelButton:true,
                    confirmButtonColor:"#DD6B55",
                    confirmButtonText:"删除",
                    closeOnConfirm:false
                },function () {
                    var id=rows[0].id;
                    $.post("${ctx}/charge/del",{id:id},function (data) {
                        swal("提示信息","成功删除","success");
                        $("#table").bootstrapTable("load",data)
                    })
                })
            }else {
                swal({
                    title:"您确定要删除此信息么",
                    text:"删除后无法恢复",
                    type:"warning",
                    showCancelButton:true,
                    confirmButtonColor:"#DD6",
                    confirmButtonText:"删除",
                    closeOnConfirm:false
                },function () {
                    $.each(rows,function (index,row) {
                        ids=ids+row.id+"-"
                    })
                    $.post("${ctx}/charge/dels",{id:ids},function (data) {
                        swal("提示信息","成功删除","success");
                        $("#table").bootstrapTable("load",data);
                    })
                })

            }

        }

        function toadd() {

            $("#addmodal").modal("show")
        }

        function doadde() {
            var formss=$("#userform").serialize();
            var parasm=decodeURIComponent(formss,true);
            $.ajax({
                url:'${ctx}/charge/getadd',
                type:'post',
                data:parasm,
                success:function (data) {
                    $("#typecode").val("");
                    $("#typename").val("");
                    $("#itemmark").val("");
                    $("#discount").val("");
                    $("#note").val("");
                    $("#addmodal").modal("hide");
                    $("#table").bootstrapTable("load",data)
                }

            })
        }

        function toup() {
            var rows=eval($("#table").bootstrapTable("getSelections"));
                $("#userfor [name=id]").val(rows[0].id);
                $("#userfor [name=typecode]").val(rows[0].typecode);
                $("#userfor [name=typename]").val(rows[0].typename);
                $("#userfor [name=itemmark]").val(rows[0].itemmark);
                $("#userfor [name=discount]").val(rows[0].discount);
                $("#userfor [name=note]").val(rows[0].note);
                $("#userfor [name=isvalid]").val(rows[0].isvalid);
                $("#update").modal("show");
        }

            function doup() {
                var forms=$("#userfor").serialize();
                var params=decodeURIComponent(forms,true);
                $.post("${ctx}/charge/getup",params,function (data) {
                    $("#update").modal("hide");
                    $("#table").bootstrapTable("load",data);
                })


            }


    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h1 class="panel-title" style="font-size: 24px">收费类别</h1>
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
    <div class="modal-dialog" id="md1">
        <iframe name="formSubmit" style="display:none;"></iframe>
        <form data-toggle="validator"  class="form-horizontal" id="userform"  method="post" role="form" target="formSubmit">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加收费类别</h4>
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
                        <label class="col-sm-4 text-right">项目标志</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="itemmark" name="itemmark" placeholder="金额必填" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right">类别折扣</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="discount" name="discount" placeholder="可填或不填" />
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
                    <button onclick="doadde()"  type="submit" class="btn btn-primary">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>




<%--修改--%>

<div  class="modal inmodal" id="update">
    <div class="modal-dialog" id="md">
        <form class="form-horizontal" id="userfor"   method="post" role="form">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改收费类别</h4>
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
                            <input type="text" class="form-control"  name="typename"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right">项目标志</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="itemmark"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right">类别折扣</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="discount"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right">备注</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="note"  />
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
