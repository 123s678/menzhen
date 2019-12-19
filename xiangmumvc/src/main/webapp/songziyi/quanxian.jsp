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
    <title>权限管理</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/songziyi/common-boot.jsp"%>
    <script>
         iii=0;
        function tofenpei(id) {
            //当以话框加载完成后，才展示树形菜单
            //弹出对话框
            iii=id;
            $("#modal-id").modal('show') ;
            $.getJSON('${ctx}/qx/getView',{'id':id},function(data){
                $("#searchTree").treeview({
                    showCheckbox: true,
                    data: data,
                    onNodeChecked: nodeChecked,
                    onNodeUnchecked: nodeUnchecked
                }) ;
            }) ;



        }
        function toadd() {
            $("#modal-id").modal("show") ;
        }

        function fenpei() {
            var pmid = "" ;
            //1.
            var cks = $("#searchTree").treeview('getChecked') ;
            $.each(cks,function (i,n) {
                //2.
                pmid = pmid  + n.id+ "-" ;
            })

            $.post('${ctx}/qx/getFenPei',{'id':iii,'pm':pmid},function (data) {
                $("#modal-id").modal("hide") ;
                swal("提示","修改成功","success");
            })
        }


    </script>
</head>
<body>
<table id="table">

</table>
<!--分配权限的模态框-->
<div class="modal fade" id="modal-id">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <div id="searchTree"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button onclick="fenpei()" type="button" class="btn btn-primary">分配</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
<script>
    $(
        function () {
            loadTable();
        }
    );
    function loadTable() {
        $("#table").bootstrapTable({
            url:'${ctx}/qx/getAllEmployee',
            columns:[
                {field:'employeecode', title:'员工编号'},
                {field:'employeename', title:'员工姓名'},
                {field:'employeecode', title:'身份',
                    formatter:function (value,row,index) {
                        if(row.employeecode=="admin"){
                            return "超级管理员"
                        }else {
                            return "普通管理员"
                        }
                    }
                },
                {
                    title:'操作',
                    formatter:function (value,row,index) {
                        if(row.employeecode=="admin"){
                            return "<button class='btn btn-danger'>禁用</button>";
                        }else{
                            return "<button class='btn btn-success' onclick=tofenpei('"+row.id+"')>管理</button>";
                        }

                    }
                }
            ]
        });
    }


</script>
</html>
<script>
    var treeData = [{
        text: "Parent 1",
        nodes: [{
            text: "Child 1",
            nodes: [{
                text: "Grandchild 1"
            }, {
                text: "Grandchild 2",
                nodes: [{
                    text: "Grandchild 2-1",
                    nodes: [{
                        text: "Grandchild 2-1-1"
                    }, {
                        text: "Grandchild 2-2-1",
                    }]
                }, {
                    text: "Grandchild 1-2",
                }]
            }]
        }, {
            text: "Child 2",
            nodes: [{
                text: "Grandchild 2-1"
            }, {
                text: "Grandchild 2-2",
            }]
        }]
    }, {
        text: "Parent 2",
        id:'11111'
    }, {
        text: "Parent 3"
    }, {
        text: "Parent 4"
    }, {
        text: "Parent 5"
    }];

    var nodeCheckedSilent = false;

    function nodeChecked(event, node) {
        if (nodeCheckedSilent) {
            return;
        }
        nodeCheckedSilent = true;
        checkAllParent(node);
        checkAllSon(node);
        nodeCheckedSilent = false;
    }

    var nodeUncheckedSilent = false;

    function nodeUnchecked(event, node) {
        if (nodeUncheckedSilent)
            return;
        nodeUncheckedSilent = true;
        uncheckAllParent(node);
        uncheckAllSon(node);
        nodeUncheckedSilent = false;
    }

    //选中全部父节点
    function checkAllParent(node) {
        $('#searchTree').treeview('checkNode', node.nodeId, {
            silent: true
        });
        var parentNode = $('#searchTree').treeview('getParent', node.nodeId);
        if (!("nodeId" in parentNode)) {
            return;
        } else {
            checkAllParent(parentNode);
        }
    }
    //取消全部父节点
    function uncheckAllParent(node) {
        $('#searchTree').treeview('uncheckNode', node.nodeId, {
            silent: true
        });
        var siblings = $('#searchTree').treeview('getSiblings', node.nodeId);
        var parentNode = $('#searchTree').treeview('getParent', node.nodeId);
        if (!("nodeId" in parentNode)) {
            return;
        }
        var isAllUnchecked = true; //是否全部没选中
        for (var i in siblings) {
            if (siblings[i].state.checked) {
                isAllUnchecked = false;
                break;
            }
        }
        if (isAllUnchecked) {
            uncheckAllParent(parentNode);
        }

    }

    //级联选中所有子节点
    function checkAllSon(node) {
        $('#searchTree').treeview('checkNode', node.nodeId, {
            silent: true
        });
        if (node.nodes != null && node.nodes.length > 0) {
            for (var i in node.nodes) {
                checkAllSon(node.nodes[i]);
            }
        }
    }
    //级联取消所有子节点
    function uncheckAllSon(node) {
        $('#searchTree').treeview('uncheckNode', node.nodeId, {
            silent: true
        });
        if (node.nodes != null && node.nodes.length > 0) {
            for (var i in node.nodes) {
                uncheckAllSon(node.nodes[i]);
            }
        }
    }

</script>