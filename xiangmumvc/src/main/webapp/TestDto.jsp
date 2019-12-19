<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
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
    <%@include file="/common-jsp/songziyi/common-tag.jsp"%>
</head>
<body>
<table id="table">

</table>
<div id="tool">
    <div class="text-center">
        <button type="button" class="btn btn-primary" data-toggle="modal" onclick="fileDownload()">
            <span class="glyphicon glyphicon-plus"> </span> &nbsp; 下载所有数据
        </button>
        <button type="button" class="btn btn-primary" data-toggle="modal" onclick="fileDownloadSelectData()">
            <span class="glyphicon glyphicon-plus"> </span> &nbsp; 处理下载所选数据
        </button>
        <button type="button" class="btn btn-primary" data-toggle="modal" onclick="sdf()">
            <span class="glyphicon glyphicon-plus"> </span> &nbsp; 上传
        </button>
    </div>
</div>


<script>
    $(
        function () {
            $('#myModal1').on('shown.bs.modal', function (e) {
                $(".myfile").fileinput({
                    language: 'zh',
                    uploadUrl: "${ctx}/testCon/uploadExcel",
                    maxFileSize: 0, //文件的大小
                    maxFileCount:2,//文件的数量
                    showUpload:true, //是否显示上传按钮
                    showRemove :false, //显示移除按钮
                    showPreview :true, //是否显示预览
                    showCaption:true,//是否显示标题
                    allowedFileExtensions: ["jpg", "png", "gif","xlsx"],
                    enctype: 'multipart/form-data', //二进制传递参数
                    browseClass: "btn btn-primary", //按钮样式
                    dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
                    previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                    msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
                    textEncoding:"GBK"
                }).on("fileuploaded", function (event, data, previewId, index){
                    alert(data.response.msg) ;
                });
            }) ;

        }
    );
    function sdf() {
        $("#myModal1").modal("show");
    }
</script>
<div class="modal inmodal" id="myModal1">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title">上传文件</h4>

            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" method="post" action="${ctx}/testCon/uploadExcel" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">文件名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="describ" class="col-sm-10 form-control" placeholder="文件名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">上传文件</label>
                        <div class="col-sm-10">
                            <input multiple type="file" name="myfile" class="col-sm-10 myfile" placeholder="文件名称">
                        </div>
                    </div>
                </form>
            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="smt();">保存</button>
            </div>

        </div>
    </div>
</div>
</body>
<script>
    $(
        function () {
            $("#table").bootstrapTable({
                    url: "${ctx}/testCon/query",
                    columns: [
                        {checkbox:true},
                        {field:'id', title:'编码'},
                        {field:'employeecode', title:'编号'},
                        {field:'psw', title:'密码'}],
                    pagination:true,
                    height:540,
                    search:true,
                    toolbar: '#tool',
                    clickToSelect:true,
                    pageSize:5
            }

            );
        }
    );

    function fileDownload() {
        $.getJSON(
            "${ctx}/testCon/fileDownloadData",
            "",
            function (data) {
            }
        );
    }
    function fileDownloadSelectData() {
        var rows=$("#table").bootstrapTable("getSelections");
        var ids="";
        for (var i in rows){
            var id=rows[i].id+"-";
            ids+=id;
        }
        $.post(
            "${ctx}/testCon/fileDownloadSelectData",
            "ids="+ids,
            function (data) {
            }
        );
    }
</script>
</html>
