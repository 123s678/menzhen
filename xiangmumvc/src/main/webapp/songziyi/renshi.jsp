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
    <title>人事管理</title>
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
                    人事管理
                </h1>
            </div><!--/.page-header-->
            <div class="row">
                <div class="col-xs-12">
                    <div id="zuida">
                        <div id="da">
                            <form class="form-inline">
                                <!-- Indicates a successful or positive action -->
                                <div class="form-group container-fluid" style="margin-bottom: 15px">
                                    <button type="button" class="btn btn-info" onclick="addSong()">添加员工</button>
                                    <button type="button" class="btn btn-info" onclick="updateSong()">修改员工</button>
                                    <button type="button" class="btn btn-info" onclick="removeSong()">删除员工</button>
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
<div  class="modal inmodal" id="wenJianShangChuan">
    <div class="modal-dialog">
        <form class="form-horizontal" id="wjscForm"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加员工</h4>
                </div>

                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="employeecode_add1">员工编码</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="employeecode" id="employeecode_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="employeename_add1">员工姓名</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="employeename" id="employeename_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="psw_add1">员工密码</label>
                    <div class="col-sm-6 text-left">
                        <input type="password" class="form-control" name="psw" id="psw_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="pinyincode_add1">拼音简码</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="pinyincode" id="pinyincode_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="wubicode_add1">五笔简码</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="wubicode" id="wubicode_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="jobtitleid_add1">职称</label>
                    <div class="col-sm-6 text-left">
                        <select name="jobtitleid" class="form-control" id="jobtitleid_add1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.syzc}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="positionid_add1">职务</label>
                    <div class="col-sm-6 text-left">
                        <select name="positionid" class="form-control" id="positionid_add1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.syzw}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="wubicode_add1">性别</label>
                    <div class="col-sm-6 text-left">
                        <div class="radio-inline" style="margin-top: -8px">
                            <input type="radio" name="sex" value="1" style="margin-top: 2px">
                            男
                        </div>

                        <div class="radio-inline" style="margin-top: -8px">
                            <input type="radio" name="sex" value="2" style="margin-top: 2px"> 女
                        </div>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="tel_add1">联系电话</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="tel" id="tel_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="departmentid_add1">所属科室</label>
                    <div class="col-sm-6 text-left">
                        <select name="departmentid" class="form-control" id="departmentid_add1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.ksks}">
                                <option value="${i.id}">${i.departmentname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="email_add1">邮箱</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="email" id="email_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="idcard_add1">身份证</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="idcard" id="idcard_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="address_add1">地址</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="address" id="address_add1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="birthday_add1">出生日期</label>
                    <div class="col-sm-6 text-left">
                        <input name="birthday" type='text' id="birthday_add1" class="form-control" />
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="inductiontime_add1">入职时间</label>
                    <div class="col-sm-6 text-left">
                        <input name="inductiontime" type='text' id="inductiontime_add1" class="form-control" />
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="maxeducationid_add1">最高学历</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="maxeducationid" id="maxeducationid_add1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.zgxl}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="majorid_add1">专业</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="majorid" id="majorid_add1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.xxzy}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="politicsstatusid_add1">政治面貌</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="politicsstatusid" id="politicsstatusid_add1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.zzmm}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="isoperator_add1">是否操作员</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="isoperator" id="isoperator_add1">
                            <option value="">请选择</option>
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="picture_add1">上传头像</label>
                    <div class="col-sm-6 text-left">
                        <input name="picture" type='file' id="picture_add1" class="form-control" />
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="note_add1">备注</label>
                    <div class="col-sm-6 text-left">
                        <input name="note" type='text' id="note_add1" class="form-control" />
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="roleid_up1">选择角色</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="roleid" id="roleid_up1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.roleAllInfo}">
                                <option value="${i.id}">${i.rolename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addRen()">确认</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>

    </div>
</div>
<div  class="modal inmodal" id="xiuGaiYuanGongModal">
    <div class="modal-dialog">
        <form class="form-horizontal" id="xiuGaiYuanGongFrom"   method="post" role="form">
            <div class="modal-content animated bounceInLeft col-sm-12">
                <input type="hidden" name="id" id="seid">
                <div class="modal-header col-sm-12">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改员工</h4>
                </div>

                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="employeename_up1">员工姓名</label>
                    <div class="col-sm-6 text-left">
                        <input type="text" class="form-control" name="employeename" id="employeename_up1"/>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="psw_up1">员工密码</label>
                    <div class="col-sm-6 text-left">
                        <input type="password" class="form-control" name="psw" id="psw_up1"/>
                    </div>
                </div>


                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="jobtitleid_upd1">职称</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="jobtitleid" id="jobtitleid_upd1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.syzc}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="positionid_upd1">职务</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="positionid" id="positionid_upd1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.syzw}">
                                <option value="${i.tid}">${i.tname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>



                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="picture_up1">修改头像</label>
                    <div class="col-sm-6 text-left">
                        <input name="picture" type='file' id="picture_up1" class="form-control" />
                    </div>
                </div>

                <div class="form-group col-sm-12 text-center">
                    <label class="col-sm-6" for="roleid_add1">修改角色</label>
                    <div class="col-sm-6 text-left">
                        <select class="form-control" name="roleid" id="roleid_add1">
                            <option value="">请选择</option>
                            <c:forEach var="i" items="${sessionScope.roleAllInfo}">
                                <option value="${i.id}">${i.rolename}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="xiuRen()">确认</button>
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
        loadSong();
        }
    );
    function loadTable() {
        $("#table").bootstrapTable({
            url:'${ctx}/rs/getAllDoo',
            columns:[
                {field:'id', visible:false},
                {checkbox:true},
                {field:'employeename', title:'员工姓名'},
                {field:'psw', title:'密码',visible:false},
                {field:'zhicheng', title:'职称'},
                {field:'zhiwu', title:'职务'},
                {field:'sex', title:'性别',
                    formatter:function (value,row,index) {
                        if(row.sex==1){
                            return "男"
                        }else {
                            return "女"
                        }
                    }},
                {field:'departmentname', title:'所属科室'},
                {field:'inductiontime', title:'入职时间'},
                {field:'xueli', title:'最高学历'},
                {field:'zhuanye', title:'专业'},
                {field:'mianmao', title:'政治面貌'},
                {
                    field:'picture',title:'头像',
                    formatter:function (value,row,index) {

                        return "<img alt='image' class='img-container' src='${ctx}/statics/"+row.picture+"' style='width:50px;height:50px'/>"

                    }
                }
            ],
            pagination:true,
            striped:true,
            sortName:'id',
            sortOrder:'asc',
            paginationLoop:true,
            pageSize:3,
            // search:true,
            clickToSelect:true
        })
    };
</script>
<script>
    function addSong() {
        $("#wenJianShangChuan").modal("show");
    }
    function loadSong() {
        $(function () {

            <!--时间日历-->
            $('#birthday_add1').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
            <!--时间日历-->
            $('#inductiontime_add1').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
        }) ;
    }
    function addRen() {
        var price=$("#picture_add1").val();
        $.post(
            "${ctx}/rs/pictureInfo",
            "price="+price,
            function (data) {

            }
        );

        var from=formToJson("wjscForm");
        $.post(
            "${ctx}/rs/addInfo",
            from,
            function (data) {
                $("#wenJianShangChuan").modal("hide");
                $("#table").bootstrapTable("refresh");
            }
        );
    }
    function removeSong() {
        var rows=$("#table").bootstrapTable("getSelections");
        if(rows.length==0){
            swal("提示","请选中后再删除！！！","error");
        }else if(rows.length>1){
            swal("提示","只能删除一个！！！","error");
        }else if(rows.length==1){
            var id=rows[0].id;
            $.post(
                "${ctx}/rs/removeInfo",
                "id="+id,
                function (data) {
                    if(data=="0"){
                        swal("提示","不能删除超级管理员","error");
                    }
                    if(data=="1"){
                        swal("提示","删除成功","success");
                        $("#table").bootstrapTable("refresh");
                    }

                }
            );
        }
    }
    function updateSong() {
        var rows=$("#table").bootstrapTable("getSelections");
        if(rows.length==0){
            swal("提示","请选中后再修改！！！","error");
        }else if(rows.length>1){
            swal("提示","只能修改一个！！！","error");
        }else if(rows.length==1){
            var id=rows[0].id;
            $("#employeename_up1").val(rows[0].employeename);
            $("#psw_up1").val(rows[0].psw);
            $("#seid").val(id);
            $("#xiuGaiYuanGongModal").modal("show");
        }
    }

    function xiuRen() {
        var price=$("#picture_up1").val();
        $.post(
            "${ctx}/rs/pictureInfo2",
            "price="+price,
            function (data) {

            }
        );
        var from=formToJson("xiuGaiYuanGongFrom");
        $.post(
            "${ctx}/rs/updateInfo",
            from,
            function (data) {
                $("#xiuGaiYuanGongModal").modal("hide");
                $("#table").bootstrapTable("refresh");
            }
        );
    }
</script>
</html>