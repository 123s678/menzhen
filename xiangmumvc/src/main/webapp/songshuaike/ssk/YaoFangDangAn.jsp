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
    <title>as门诊管理系统</title>
    <%--//文件上串--%>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <style type="text/css">
        img{
            width: 200px;
            height: 150px;
        }
    </style>
    <base href="<%=basePath%>">
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/common-js.jsp"%>
    <%@include file="/common-jsp/common-css.jsp"%>
    <script src="${ctx}/statics/songshuaike/bootstrap-datetimepicker.min.js"></script>
    <script src="${ctx}/statics/songshuaike/Moment.js"></script>

    <style>
        #zuida{
            margin-left:30px;
            margin-top: 30px;
        }
        *{
            font-family: 微软雅黑;
        }
        .form-group{
            width: 500px;
        }
        input{
            padding-left: 15px;
        }
        label{
            padding-right: 15px;
        }
        #zuida{
            width: 100%;
        }
        #da{
            width: 100%;
            margin: 0px auto;
        }
        #da .form-inline .form-group{
            margin-left:30px;
            margin-top: 30px;
        }
        #g1{
            margin: 3px 5px 3px 10px;
        }
        #g2{
            margin: 3px 5px 3px 5px;
        }
    </style>

    <script type="text/javascript">

        $(function () {
            $("#table").bootstrapTable({
                url:'${ctx}/dur/durca1',
                // pagination:true,
                // striped:true,
                sortName:'id',
                sortOrder:'asc',
                // paginationLoop:true,
                pageSize:3,
                pageList:[5,10,15],
                // search:true,
                // clickToSelect:true,
                columns:[{
                    checkbox:true
                },{
                    field:'id',
                    title:'编号'
                },{
                    field:'drugname',
                    title:'药品名称'
                },{
                    field:'drugcode',
                    title:'药品编码'
                },{
                    field:'pinyincode',
                    title:'拼音简码'
                },{
                    field:'unitdosage',
                    title:'单位剂量'
                },{
                    field:'norms',
                    title:'规格'
                },{
                    field:'inbulksellprice',
                    title:'散装售价'
                },{
                    field:'ismedicare',
                    title:'是否医保',
                    formatter:function (value,row,index) {
                        if (row.ismedicare==1){
                            return"是"
                        }else {
                            return"否"
                        }
                    }
                },{
                    field:'cunrushu',
                    title:'库存数量'
                }]
            });

            <!--时间日历-->
            $('#productiondata2').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
            <!--时间日历-->
            $('#typeindatetime12').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });

            <!--时间日历-->
            $('#expiration12').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });

            <!--时间日历-->
            $('#expiration1').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
            <!--时间日历-->
            $('#typeindatetime1').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });

            <!--时间日历-->
            $('#alterdatetime2').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
            <!--时间日历-->
            $('#alterdatetime3').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });

        });

        $(function () {
            $("#tab").bootstrapTable({
                url:'${ctx}/dur/Guoqi',
                striped:true,
                sortName:'id',
                sortOrder:'asc',
                // paginationLoop:true,
                // clickToSelect:true,
                columns:[{
                    checkbox:true
                },{
                    field:'id',
                    title:'编号'
                },{
                    field:'drugname',
                    title:'药品名称'
                },{
                    field:'drugcode',
                    title:'药品编码'
                },{
                    field:'pinyincode',
                    title:'拼音简码'
                },{
                    field:'unitdosage',
                    title:'单位剂量'
                },{
                    field:'norms',
                    title:'规格'
                },{
                    field:'inbulksellprice',
                    title:'散装售价'
                },{
                    field:'ismedicare',
                    title:'是否医保',
                    formatter:function (value,row,index) {
                        if (row.ismedicare==1){
                            return"是"
                        }else {
                            return"否"
                        }
                    }
                },{
                    field:'cunrushu',
                    title:'库存数量'
                }]
            });
        })




        <!--添加-->
        function toadd() {
            $.post(
                "${ctx}/ssssupp/selectId",
                "",
                function (id) {
                    $("#typeinpersonnelid").val(id);
                    $("#alterpersonnelid").val(id);
                }
            );
            $("#addmodal").modal("show");

        }

        function doadd() {
            var id= $("#typeinpersonnelid").val();
            var params =$("#userform").serialize();
            //处理表单中的中文乱码
            params = decodeURIComponent(params,true);
            var state1=$("#state1").val();
            params = params + "&state="+ state1;
            $.ajax({
                url:"${ctx}/dur/durgadd",
                type:"post",
                data:params,
                success:function (data) {
                    //关闭对话框
                    $("#addmodal").modal('hide');
                    //重新加载表格
                    // $("#tab").bootstrapTable('load',data) ;
                    $("#table").bootstrapTable('load',data);
                    //提示添加成功
                }
            })
        }
        // 过期模态
        function Guoqidel() {
            $("#guoqimo").modal("show");
        }




        // 过期药品
        //删除用户
        function doadddel() {
            var ids = "" ;
            //1.得到要删除的行
            //返回所选的行，当没有选择任何行的时候返回一个空数组。
            var rows = $("#tab").bootstrapTable("getSelections") ;
            if (rows.length==0){
                swal("提示信息","请选择要删除的数据！","info");
            }
            else if (rows.length==1) {
                swal({
                    title: "您确定要删除这条信息吗",
                    text: "删除后将无法恢复，请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    closeOnConfirm: false
                }, function () {
                    var id = rows[0].id ;
                    $.ajax({
                        url:"${ctx}/dur/DelDuge1123",
                        type:"post",
                        data:{id:id},
                        success:function (data) {
                            swal("删除成功！", "您已经永久删除了这条信息。", "success");
                            $("#tab").bootstrapTable('load',data) ;
                            // $("#table").bootstrapTable('load',data);
                        }
                    })
                });
            }
            else{
                swal({
                    title: "您确定要删除这条信息吗",
                    text: "删除后将无法恢复，请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    closeOnConfirm: false
                },function () {
                    $.each(rows,function (index,row) {
                        ids=ids+row.id+"-"
                    })
                    $.post("/dur/dels123",{id:ids},function (data) {
                        swal("成功删除","已删除","success")
                        $("#tab").bootstrapTable("load",data)
                        // $("#table").bootstrapTable('load',data);
                    })
                })
            }
        }
        
        
        


        //删除用户
        function delto() {
            var ids = "" ;
            //1.得到要删除的行
            //返回所选的行，当没有选择任何行的时候返回一个空数组。
            var rows = $("#table").bootstrapTable("getSelections") ;
            if (rows.length==0){
                swal("提示信息","请选择要删除的数据！","info");
            }
            else if (rows.length==1) {
                swal({
                    title: "您确定要删除这条信息吗",
                    text: "删除后将无法恢复，请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    closeOnConfirm: false
                }, function () {
                    var id = rows[0].id ;
                    $.ajax({
                        url:"${ctx}/dur/DelDuge1",
                        type:"post",
                        data:{id:id},
                        success:function (data) {
                            swal("删除成功！", "您已经永久删除了这条信息。", "success");
                            $("#table").bootstrapTable('load',data) ;
                        }
                    })
                });
            }
            else{
                swal({
                    title: "您确定要删除这条信息吗",
                    text: "删除后将无法恢复，请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    closeOnConfirm: false
                },function () {
                    $.each(rows,function (index,row) {
                        ids=ids+row.id+"-"
                    })
                    $.post("/dur/dels",{id:ids},function (data) {
                        swal("成功删除","已删除","success")
                        $("#table").bootstrapTable("load",data)
                    })
                })
            }
        }
        


        //修改
        function TianJia() {
            $.post(
                "${ctx}/ssssupp/selectId",
                "",
                function (id) {
                    $("#alterpersonnelid1").val(id);
                }
            );
            var ids = "" ;
            //1.得到要删除的行
            //返回所选的行，当没有选择任何行的时候返回一个空数组。
            var rows = eval($("#table").bootstrapTable("getSelections")) ;
            if (rows.length==0){
                swal("提示信息","请选择要修改的数据！","info");
            }else if (rows.length>=2){
                swal("提示信息","修改数据最多选中一行","info");
            }
            else {

                $("#userform2 [name=chargetypeid]").val(rows[0].chargetypeid);
                $("#userform2 [name=drugname]").val(rows[0].drugname);
                $("#userform2 [name=drugcode]").val(rows[0].drugcode);
                $("#userform2 [name=medicalsciencecode]").val(rows[0].medicalsciencecode);
                $("#userform2 [name=enname]").val(rows[0].enname);
                $("#userform2 [name=pinyincode]").val(rows[0].pinyincode);
                $("#userform2 [name=drugtypeid]").val(rows[0].drugtypeid);
                $("#userform2 [name=agenttypeid]").val(rows[0].agenttypeid);
                $("#userform2 [name=dosageunit]").val(rows[0].dosageunit);
                $("#userform2 [name=unitdosage]").val(rows[0].unitdosage);
                $("#userform2 [name=norms]").val(rows[0].norms);
                $("#userform2 [name=inbulksellprice]").val(rows[0].inbulksellprice);
                $("#userform2 [name=ismedicare]").val(rows[0].ismedicare);
                $("#userform2 [name=medicaretypeid]").val(rows[0].medicaretypeid);
                $("#userform2 [name=medicarecode]").val(rows[0].medicarecode);
                $("#userform2 [name=medicareprice]").val(rows[0].medicareprice);
                $("#userform2 [name=isspecialdrug]").val(rows[0].isspecialdrug);
                $("#userform2 [name=productiondata]").val(rows[0].productiondata);
                $("#userform2 [name=supplierid]").val(rows[0].supplierid);
                $("#userform2 [name=usestatus]").val(rows[0].usestatus);
                $("#userform2 [name=applysymptom]").val(rows[0].applysymptom);
                $("#userform2 [name=mainefficacy]").val(rows[0].mainefficacy);
                $("#userform2 [name=inventoryquantity]").val(rows[0].inventoryquantity);
                $("#userform2 [name=inventoryprice]").val(rows[0].inventoryprice);
                $("#userform2 [name=typeinpersonnelid]").val(rows[0].typeinpersonnelid);
                $("#userform2 [name=typeindatetime]").val(rows[0].typeindatetime);
                // $("#userform2 [name=alterpersonnelid]").val(rows[0].alterpersonnelid);
                $("#userform2 [name=alterdatetime]").val(rows[0].alterdatetime);
                $("#userform2 [name=picture]").val(rows[0].picture);
                $("#userform2 [name=isvalid]").val(rows[0].isvalid);
                $("#userform2 [name=remarks]").val(rows[0].remarks);
                $("#userform2 [name=drugid]").val(rows[0].drugid);
                $("#userform2 [name=expiration]").val(rows[0].expiration);
                $("#userform2 [name=cunrushu]").val(rows[0].cunrushu);


                $("#userform2 [name=id]").val(rows[0].id);
                $("#addmodal2").modal("show");
                // var id = rows[0].id ;
                // var dd = $.val("#id");
                // dd=id

            }
        }
        
        function doaddX() {
            var params =$("#userform2").serialize();
            // alert(params);
            //处理表单中的中文乱码
            params = decodeURIComponent(params,true);
            $.getJSON(
                "${ctx}/dur/xiugai",
                params,
                function (data) {
                    $("#addmodal2").modal('hide');
                    //重新加载表格
                    $("#table").bootstrapTable('load',data);
                    //提示添加成功
                    swal("提示信息","修改成功！","succes");
                    alert(params);
                }
            );
        }



        // function Guo(){
        //     $("#guoqi").modal("show");
        // }




        //模糊查询
        function finds() {
            var drug=$("#exampleInputName2").val();
            if ((drug=="")){
                alert("不能为空");
                return false;
            }
            else
            {
                $.ajax({
                    type:'post',
                    url:'${ctx}/dur/finds',
                    dataType:"json",
                    async:true,
                    data:{drugname:drug},
                    succes:function (data) {
                        // if (data=null){
                        //     alert("没有这个用户")
                        // } else {
                            alert("大哥你好");
                            window.location.href="showuser";
                            $("#table").bootstrapTable("load", (data));
                            $("#tab").bootstrapTable("refresh");

                    }
                });
                <%--var opts=$("#table").bootstrapTable("getOptions");--%>
                <%--alert("gearsefd")--%>
                <%--$.post("${ctx}/dur/finds",{'drug':drug},function (date) {--%>
                    <%--alert("huihnooi");--%>
                    <%--var  gg= $("#table").bootstrapTable('load',date);--%>
                    <%--alert(gg)--%>
                <%--})--%>
            }
        }




    </script>
</head>
<body>

<div id="zuida">
    <h2 style="color: #0e9aef">药品档案</h2>
    <div id="da">
        <form class="form-inline">
            <div class="form-group" id="bh">
                <label for="exampleInputEmail1">药品编号</label>
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="jane.doe@example.com">
            </div>
            <div class="form-group" id="nc">
                <label for="exampleInputName2">药品名称</label>
                <input type="text" class="form-control" id="exampleInputName2" name="drugname" placeholder="请输入">
                <%--<input type="button" value="搜索" onclick="finds()">--%>
            </div>
            <div class="form-group" id="sflb">
                <label>收费类别</label>
                <select class="form-control" id="leiBie" style="width: 190px">
                    <option>全部</option>
                    <c:forEach items="${sessionScope.chargetype}" var="y2">
                        <option>${y2.typename}</option>
                    </c:forEach>
                </select>
            </div>
            <!-- Indicates a successful or positive action -->
        </form>
    </div>


</div>
<hr/>

<button id="g1" onclick="TianJia()" class="btn btn-info">修改</button>
<%--<button  type="button" onclick="GuaHao()">挂号</button>--%>
<button id="g2" onclick="delto()" class="btn btn-info">删除</button>
<button onclick="toadd()" type="button" class="btn btn-info" >添加</button>
<%--过期药品--%>
<button id="guoqi" onclick="Guoqidel()" class="btn btn-info" >查看过期药品</button>
<div class="row" style="margin-top: 15px">
    <div class="col-sm-12" style="width: 100%;padding: 0px;margin-left: 10px">
        <table id="table" style="width: 100%;margin-left: 0px"></table>
    </div>
</div>



<!--增加模态框-->
<div  class="modal inmodal" id="addmodal">
    <div class="modal-dialog" id="md">
        <form class="form-horizontal" id="userform"  action="${pageContext.request.contextPath}/doupload1" enctype="multipart/form-data"  method="post" role="form">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加信息</h4>
                </div>
                <div class="modal-body" id="bd">

                    <div class="form-group">
                        <label  class="col-sm-4 text-right">收费类别：</label>
                        <div class="col-sm-6">
                        <select class="form-control" id="chargetypeid" name="chargetypeid" style="width: 220px">
                            <option>全部</option>
                            <c:forEach items="${sessionScope.chargetype}" var="y2">
                                <option value="${y2.id}">${y2.typename}</option>
                            </c:forEach>
                        </select>
                        </div>
                    </div>

                    <%--<div>--%>
                        <%--<label>id</label>--%>
                        <%--<div>--%>
                            <%--<input id="id" type="text" value="${sessionScope.drug.id}" class="form-control" name="id">--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="drugname">药品名称：</label>
                        <div class="col-sm-6">
                            <input id="drugname" type="text" class="form-control" name="drugname"  placeholder="药品名称" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="drugcode" class="col-sm-4 text-right">药品编码：</label>
                        <div class="col-sm-6">
                            <input id="drugcode" type="text" class="form-control" name="drugcode" placeholder="药品编码" />
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label for="attendDate" class="col-sm-4 text-right">日期：</label>--%>
                        <%--<div class="col-sm-6">--%>
                            <%--<div class="input-group" id="datetimepicker1">--%>
                                <%--<input id="attendDate" name="attendDate" type='text' class="form-control" placeholder="年--月--日"/>--%>
                                <%--<span class="input-group-addon"><span class="glyphicon glyphicon-calendar" ></span></span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<!--<div class="col-sm-6">-->--%>
                        <%--<!--<input type="text" class="form-control" name="workname"  />-->--%>
                        <%--<!--</div>-->--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="medicalsciencecode" class="col-sm-4 text-right">医学编码：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="medicalsciencecode" name="medicalsciencecode" style="width: 220px">
                                <option>全部</option>
                                <c:forEach items="${sessionScope.medtm}" var="y2">
                                    <option value="${y2.id}">${y2.templatename}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="enname" class="col-sm-4 text-right">英文名称：</label>
                        <div class="col-sm-6">
                            <input id="enname" type="text" class="form-control" name="enname"  placeholder="英文名称"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pinyincode" class="col-sm-4 text-right">拼音简码：</label>
                        <div class="col-sm-6">
                            <input id="pinyincode" type="text" class="form-control" name="pinyincode"  placeholder="拼音简码"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="drugtypeid" class="col-sm-4 text-right">药品类型id：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="drugtypeid" name="drugtypeid" style="width: 220px">
                                <option>全部</option>
                                <c:forEach items="${sessionScope.attdate2}" var="y2">
                                    <option value="${y2.id}">${y2.detailname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="agenttypeid" class="col-sm-4 text-right">药品剂型id：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="agenttypeid" name="agenttypeid" style="width: 220px">
                                <option>请选择</option>
                                <c:forEach items="${sessionScope.attdate3}" var="y2">
                                    <option value="${y2.id}">${y2.detailname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dosageunit" class="col-sm-4 text-right">剂量单位：</label>
                        <div class="col-sm-6">
                            <input id="dosageunit" type="text" class="form-control" name="dosageunit"  placeholder="剂量单位"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="unitdosage" class="col-sm-4 text-right">单位剂量：</label>
                        <div class="col-sm-6">
                            <input id="unitdosage" type="text" class="form-control" name="unitdosage"  placeholder="单位剂量"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="norms" class="col-sm-4 text-right">规格：</label>
                        <div class="col-sm-6">
                            <input id="norms" type="text" class="form-control" name="norms"  placeholder="规格"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inbulksellprice" class="col-sm-4 text-right">散装售价：</label>
                        <div class="col-sm-6">
                            <input id="inbulksellprice" type="text" class="form-control" name="inbulksellprice"  placeholder="散装售价"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ismedicare" class="col-sm-4 text-right">是否医保：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="ismedicare" name="ismedicare" style="width: 220px">
                                <option>请选择</option>
                                <option value="1">是</option>
                                <option value="2">否</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="medicaretypeid" class="col-sm-4 text-right">医保类别id：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="medicaretypeid" name="medicaretypeid" style="width: 220px">
                                <option>请选择</option>
                                <c:forEach items="${sessionScope.attdate4}" var="y2">
                                <option value="${y2.id}">${y2.detailname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="medicarecode" class="col-sm-4 text-right">医保编码：</label>
                        <div class="col-sm-6">
                            <input id="medicarecode" type="text" class="form-control" name="medicarecode"  placeholder="医保编码"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="medicareprice" class="col-sm-4 text-right">医保价格：</label>
                        <div class="col-sm-6">
                            <input id="medicareprice" type="text" class="form-control" name="medicareprice"  placeholder="医保价格"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="isspecialdrug" class="col-sm-4 text-right">是否特殊药品：</label>
                        <div class="col-sm-6">
                        <select class="form-control" id="isspecialdrug" name="isspecialdrug" style="width: 220px">
                            <option>请选择</option>
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="productiondata" class="col-sm-4 text-right">生产日期：</label>
                        <div class="col-sm-6">
                            <div class="input-group" id="productiondata2">
                                <input id="productiondata" name="productiondata" type='text' class="form-control" placeholder="年--月--日"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" ></span></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="supplierid" class="col-sm-4 text-right">供应商id：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="supplierid" name="supplierid" style="width: 220px">
                                <option>请选择</option>
                                <c:forEach items="${sessionScope.supp}" var="y2">
                                    <option value="${y2.id}">${y2.suppliername}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="usestatus" class="col-sm-4 text-right">使用状态：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="usestatus" name="usestatus" style="width: 220px">
                                <option>全部</option>
                                <c:forEach items="${sessionScope.attdate}" var="y2">
                                    <option value="${y2.id}">${y2.detailname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="applysymptom" class="col-sm-4 text-right">适用症状：</label>
                        <div class="col-sm-6">
                            <input id="applysymptom" type="text" class="form-control" name="applysymptom"  placeholder="适用症状"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="mainefficacy" class="col-sm-4 text-right">主要功效：</label>
                        <div class="col-sm-6">
                            <input id="mainefficacy" type="text" class="form-control" name="mainefficacy"  placeholder="主要功效"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inventoryquantity" class="col-sm-4 text-right">库存数量：</label>
                        <div class="col-sm-6">
                            <input id="inventoryquantity" type="text" class="form-control" name="inventoryquantity"  placeholder="库存数量"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inventoryprice" class="col-sm-4 text-right">库存单价：</label>
                        <div class="col-sm-6">
                            <input id="inventoryprice" type="text" class="form-control" name="inventoryprice"  placeholder="库存单价"/>
                        </div>
                    </div>

                    <%--录入人员--%>
                    <input id="typeinpersonnelid" type="hidden" name="typeinpersonnelid"/>

                    <div class="form-group">
                        <label for="typeindatetime" class="col-sm-4 text-right">录入时间：</label>
                        <div class="col-sm-6">
                            <div class="input-group" id="typeindatetime1">
                                <input id="typeindatetime" name="typeindatetime" type='text' class="form-control" placeholder="年--月--日"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" ></span></span>
                            </div>
                        </div>
                    </div>

                            <%--修改人员--%>
                            <input id="alterpersonnelid" type="hidden" class="form-control" name="alterpersonnelid"  placeholder="修改人员id"/>

                    <div class="form-group">
                        <label for="alterdatetime" class="col-sm-4 text-right">修改时间：</label>
                        <div class="col-sm-6">
                            <div class="input-group" id="alterdatetime2">
                                <input id="alterdatetime" name="alterdatetime" type='text' class="form-control" placeholder="年--月--日"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" ></span></span>
                            </div>
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                        <%--<label for="picture" class="col-sm-4 text-right">图片：</label>--%>
                        <%--<div class="col-sm-6">--%>
                            <%--<input id="picture" type="text" class="form-control" name="picture"  placeholder="图片"/>--%>
                        <%--</div>--%>
                            <%--&lt;%&ndash;<input type="text" name="desc" />&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<input id="picture" type="file" name="photo"  multiple onchange="PreviewImage(this)"/>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div id="imgPreview"></div>&ndash;%&gt;--%>

                    <%--</div>--%>

                    <div class="form-group">
                        <label for="isvalid" class="col-sm-4 text-right">是否有效：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="isvalid" name="isvalid" style="width: 220px">
                                <option>请选择</option>
                                <option value="1">是</option>
                                <option value="2">否</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="remarks" class="col-sm-4 text-right"> 备注：</label>
                        <div class="col-sm-6">
                            <input id="remarks" type="text" class="form-control" name="remarks"  placeholder="备注"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="expiration" class="col-sm-4 text-right"> 保质期：</label>
                        <div class="col-sm-6">
                            <div class="input-group" id="expiration1">
                                <input id="expiration" name="expiration" type='text' class="form-control" placeholder="年--月--日"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" ></span></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cunrushu" class="col-sm-4 text-right"> 库存数量：</label>
                        <div class="col-sm-6">
                            <input id="cunrushu" type="text" class="form-control" name="cunrushu"  placeholder="库存数量"/>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button onclick="doadd()" type="button" class="btn btn-primary">保存</button>
                </div>
            </div>
            </form>
    </div>
</div>


<!--修改模态框-->
<div  class="modal inmodal" id="addmodal2">
    <div class="modal-dialog" id="md2">
        <form class="form-horizontal" id="userform2"  method="post" role="form">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改信息</h4>
                </div>
                <div class="modal-body" id="bd2">


                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="drugname">药品名称：</label>
                        <div class="col-sm-6">

                            <input id="id" type="hidden" name="id">
                            <input id="drugname2" type="text" class="form-control" name="drugname"  placeholder="药品名称" />
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inbulksellprice" class="col-sm-4 text-right">散装售价：</label>
                        <div class="col-sm-6">
                            <input id="inbulksellprice2" type="text" class="form-control" name="inbulksellprice"  placeholder="散装售价"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ismedicare" class="col-sm-4 text-right">是否医保：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="ismedicare2" name="ismedicare" style="width: 220px">
                                <option>请选择</option>
                                <option value="1">是</option>
                                <option value="2">否</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="medicaretypeid" class="col-sm-4 text-right">医保类别id：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="medicaretypeid2" name="medicaretypeid" style="width: 220px">
                                <option>请选择</option>
                                <c:forEach items="${sessionScope.attdate4}" var="y2">
                                    <option value="${y2.id}">${y2.detailname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="medicareprice" class="col-sm-4 text-right">医保价格：</label>
                        <div class="col-sm-6">
                            <input id="medicareprice2" type="text" class="form-control" name="medicareprice"  placeholder="医保价格"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="isspecialdrug" class="col-sm-4 text-right">是否特殊药品：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="isspecialdrug2" name="isspecialdrug" style="width: 220px">
                                <option>请选择</option>
                                <option value="1">是</option>
                                <option value="2">否</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="applysymptom" class="col-sm-4 text-right">适用症状：</label>
                        <div class="col-sm-6">
                            <input id="applysymptom1" type="text" class="form-control" name="applysymptom"  placeholder="适用症状"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="mainefficacy" class="col-sm-4 text-right">主要功效：</label>
                        <div class="col-sm-6">
                            <input id="mainefficacy1" type="text" class="form-control" name="mainefficacy"  placeholder="主要功效"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inventoryquantity" class="col-sm-4 text-right">库存数量：</label>
                        <div class="col-sm-6">
                            <input id="inventoryquantity1" type="text" class="form-control" name="inventoryquantity"  placeholder="库存数量"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inventoryprice" class="col-sm-4 text-right">库存单价：</label>
                        <div class="col-sm-6">
                            <input id="inventoryprice1" type="text" class="form-control" name="inventoryprice"  placeholder="库存单价"/>
                        </div>
                    </div>


                    <%--修改人员--%>
                    <input id="alterpersonnelid1" type="hidden" class="form-control" name="alterpersonnelid"  placeholder="修改人员id"/>


                    <div class="form-group">
                        <label for="alterdatetime" class="col-sm-4 text-right">修改时间：</label>
                        <div class="col-sm-6">
                            <div class="input-group" id="alterdatetime3">
                                <input id="alterdatetime1" name="alterdatetime" type='text' class="form-control" placeholder="年--月--日"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" ></span></span>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="cunrushu" class="col-sm-4 text-right"> 库存数量：</label>
                        <div class="col-sm-6">
                            <input id="cunrushu1" type="text" class="form-control" name="cunrushu"  placeholder="库存数量"/>
                        </div>
                    </div>





                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button onclick="doaddX()" type="button" class="btn btn-primary">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>




<!--过期药品-->
<div  class="modal inmodal" id="guoqimo" style="margin: 0px auto">
    <div class="modal-dialog" id="md3" style="margin: 0px auto">
        <form class="form-horizontal" id="userform3"  method="post" role="form">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft" style="width: 1200px ; margin-left: -300px" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">过期药品</h4>
                </div>
                <div class="modal-body" id="bd3" style="width: 1190px">

                    <div class="row" style="margin-top: 15px">
                        <div class="col-sm-12" style="width: 100%;padding: 0px;margin-left: 10px">
                            <table id="tab" style="width: 100%;margin-left: 0px"></table>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button onclick="doadddel()" type="button" class="btn btn-primary">删除</button>
                </div>
            </div>
        </form>
    </div>
</div>













</body>
</html>