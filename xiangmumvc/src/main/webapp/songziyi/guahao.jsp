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
    <title>挂号</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <%@include file="/common-jsp/common-css.jsp"%>
    <%@include file="/common-jsp/common-js.jsp"%>
    <script src="${ctx}/statics/songziyi/indo.js"></script>
    <script src="${ctx}/statics/publics.js"></script>
</head>
<body onresize="resize()">
<div class="main-container container-fluid" style="z-index:3000;">

    <div class="main-content">


        <div class="page-content">
            <div class="page-header position-relative">
                <h1 style="color: #0e9aef">
                    挂号登记
                </h1>
            </div><!--/.page-header-->
            <button class="btn btn-info" type="button" onclick="SelectBingRen()">查找病人</button>
            <button class="btn btn-info" type="button" onclick="AddBingRen()">添加病人信息</button>
            <button class="btn btn-info" type="button" onclick="GuaHao()">挂号</button>
            <div class="row">
                <div class="col-xs-12">
                    <div class="col-xs-6" style="border-right: 1px silver solid">
                        <div>

                            <div style="border-bottom:1px dotted #e2e2e2; margin:30px 0 10px 0;">
                                <h1>
                                <span style="margin-left:15px;">病人资料</span>
                                </h1>
                            </div>

                            <div class="row-fluid">
                                <div></div>
                                <div class="span3">
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">病人卡号</label>
                                            <input type="text" class="form-control" id="cardcode_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">病人名称</label>
                                            <input type="text" class="form-control" id="patientname_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">性别</label>
                                            <input type="text" class="form-control" id="sex_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">婚姻状况</label>
                                            <input  type="text" class="form-control" id="maritalstatusid_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">职业</label>
                                            <input type="text" class="form-control" id="job_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">病人类型</label>
                                            <input type="text" class="form-control" id="patienttypeid_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">年龄</label>
                                            <input type="text" class="form-control" id="age_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">参保类型</label>
                                            <input type="text" class="form-control" id="insuretypeid_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">医保卡号</label>
                                            <input type="text" class="form-control" id="medicarecode_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">联系电话</label>
                                            <input type="text" class="form-control" id="tel_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">联系地址</label>
                                            <input type="text" class="form-control" id="address_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">药品过敏史</label>
                                            <input type="text" class="form-control" id="drugallergyhistory_sc" readonly/>
                                        </div>
                                    </div>
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">身份证</label>
                                            <input type="text" class="form-control" id="identity_sc" readonly/>
                                        </div>
                                    </div>
                                </div><!--/span-->
                            </div><!--/.row-fluid-->
                        </div>
                    </div>
                    <div class="col-xs-6" >
                        <div>

                            <div style="border-bottom:1px dotted #e2e2e2; margin:30px 0 10px 0;">
                                <h1>
                                    <span style="margin-left:15px;">挂号</span>
                                </h1>

                            </div>

                            <div class="row-fluid">
                                <div></div>
                                <div class="span3">
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m" for="registercode_rc">挂号单号</label>
                                            <input type="text" class="form-control" placeholder="自动生成" name="registercode_rc" id="registercode_rc" readonly/>
                                        </div>
                                    </div>

                                </div><!--/span-->
                                <div class="span3">
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m" for="patientname_rc">病人名称</label>
                                            <input type="text" class="form-control" placeholder="自动扫描" id="patientname_rc" name="patientname_rc" readonly/>
                                        </div>
                                    </div>

                                </div><!--/span-->
                                <div class="span3">
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m" for="typesum_rc">挂号金额</label>
                                            <input type="text" class="form-control" placeholder="自动扫描" id="typesum_rc" name="typesum_rc" readonly/>
                                        </div>
                                    </div>

                                </div><!--/span-->
                                <div class="span3">
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">选择科室</label>
                                            <select id="ze" onchange="chs0()" class="form-control">
                                                <option value="">请选择</option>
                                                <c:forEach var="i" items="${sessionScope.ksks}">
                                                    <option value="${i.id}">${i.departmentname}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div><!--/span-->
                                <div class="span3">
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">选择医生</label>
                                            <select id="IUT_TWO" class="form-control">
                                                <option value="">请选择</option>
                                            </select>
                                        </div>
                                    </div>

                                </div><!--/span-->
                                <div class="span3">
                                    <div class="control-group control-group-m">

                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">会员类型</label>
                                            <select class="form-control">
                                                <option value="" >请选择</option>
                                                <c:forEach var="i" items="${sessionScope.vipList}">
                                                    <option value="${i.id}">${i.typename}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                </div><!--/span-->
                                <div class="span3">
                                    <div class="control-group control-group-m">
                                        <div class="col-sm-6">
                                            <label class="control-label control-label-m">挂号备注</label>
                                            <input type="text" class="form-control" width="50px"  id="note_rc"/>
                                        </div>
                                    </div>

                                </div><!--/span-->
                                <div class="span3">
                                    <div class="control-group control-group-m" >
                                        <div class="controls controls-l" >
                                            <label class="control-label control-label-m" style="margin-left: 15px">挂号类型</label>
                                            <div class="controls controls-m" >
                                                <c:forEach var="i" items="${sessionScope.ghlxs}">
                                                    <input type="radio"  value="${i.id}" name="registertype_rc" onchange="ter()" style="margin-left: 15px;margin-top: 10px"/>
                                                    <span> ${i.typename}</span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--/span-->
                            </div><!--/.row-fluid-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!--增加模态框-->
<div  class="modal inmodal" id="AddBingRenLing">
    <div class="modal-dialog" id="md">
        <form class="form-horizontal" id="patientfrom"  method="post" role="form">
            <input type="hidden" name="pn">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加病人</h4>
                </div>
                <div class="modal-body" id="bd">
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="cardcode">病人卡号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" class="form-control" name="cardcode" id="cardcode"  readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="patientname">病人名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="patientname" id="patientname"  placeholder="病人名称" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right">性别</label>
                        <div class="col-sm-6">
                            <div class="radio-inline" style="margin-top: -8px">
                                <input type="radio"  name="sex" value="2" style="margin-top: 2px">
                                男
                            </div>

                            <div class="radio-inline" style="margin-top: -8px">
                                <input type="radio"  name="sex" value="1" style="margin-top: 2px"> 女
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="maritalstatusid">婚姻状况</label>
                        <div class="col-sm-6">
                            <select id="maritalstatusid" name="maritalstatusid">
                                  <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.hyzk}">
                                    <option value="${i.tid}">${i.tname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="job">职业</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="job" id="job"  placeholder="职业" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="patienttypeid">病人类别</label>
                        <div class="col-sm-6">
                            <select id="patienttypeid" name="patienttypeid">
                                <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.brlb}">
                                    <option value="${i.id}">${i.typename}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="age">年龄</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="age" id="age"  placeholder="年龄" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="insuretypeid">参保类型</label>
                        <div class="col-sm-6">
                            <select id="insuretypeid" name="insuretypeid">
                                <option value="">请选择</option>
                                <c:forEach var="i" items="${sessionScope.cblb}">
                                    <option value="${i.tid}">${i.tname}</option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="medicarecode">医保卡号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="medicarecode" id="medicarecode"  placeholder="医保卡号" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="tel">联系电话</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="tel" id="tel"  placeholder="联系电话" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="address">联系地址</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="address" id="address"  placeholder="联系地址" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="taboo">个人忌讳</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="taboo" id="taboo"  placeholder="个人忌讳" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="drugallergyhistory">药物过敏史</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="drugallergyhistory" id="drugallergyhistory"  placeholder="药物过敏史" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right" for="identity">身份证</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="identity" id="identity"  placeholder="身份证" />
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button onclick="doTian()" type="button" class="btn btn-primary">添加</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
<script>
function SelectBingRen() {
    swal({
        title: "请输入要查找的病人卡号",
        type: "input",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "查找",
        closeOnConfirm: false
    }, function (cardcode) {
        $.post(
            "${ctx}/patient/selectPatient",
            "cardcode="+cardcode,
            function (e) {
                if(e!="0"){
                    if(e=="01"){
                        swal("提示","没有该用户","error");
                    }else{
                        swal("提示", "查找成功！", "success");

                        var date=e.substring(e.indexOf("(")+1,e.indexOf(")")).split(",");
                        for(var i=0;i<date.length;i++){
                           var str=date[i];
                           if(str.indexOf("cardcode=")==1){
                               $("#cardcode_sc").val(str.substring(str.indexOf("cardcode=")+"cardcode=".length,str.length));
                           }
                            if(str.indexOf("patientname=")==1){
                                $("#patientname_sc").val(str.substring(str.indexOf("patientname=")+"patientname=".length,str.length));
                            }
                            if(str.indexOf("sex=")==1){
                                var d=str.substring(str.indexOf("sex=")+"sex=".length,str.length);
                                if(d=="1"){
                                    $("#sex_sc").val("男");
                                }else{
                                    $("#sex_sc").val("女");
                                }

                            }
                            if(str.indexOf("maritalstatusid=")==1){
                                var d=str.substring(str.indexOf("maritalstatusid=")+"maritalstatusid=".length,str.length);
                                if(d=="18"){
                                    $("#maritalstatusid_sc").val("未婚");
                                }
                                if(d=="19"){
                                    $("#maritalstatusid_sc").val("已婚");
                                }
                                if(d=="20"){
                                    $("#maritalstatusid_sc").val("离异");
                                }
                                if(d=="21"){
                                    $("#maritalstatusid_sc").val("丧偶");
                                }

                            }
                            if(str.indexOf("job=")==1){
                                $("#job_sc").val(str.substring(str.indexOf("job=")+"job=".length,str.length));
                            }
                            if(str.indexOf("patienttypeid=")==1){
                                var d=str.substring(str.indexOf("patienttypeid=")+"patienttypeid=".length,str.length);
                                if(d=="1"){
                                    $("#patienttypeid_sc").val("普通病人");
                                }
                                if(d=="2") {
                                    $("#patienttypeid_sc").val("港澳台病人");
                                }
                                if(d=="3"){
                                    $("#patienttypeid_sc").val("外国病人");
                            }
                                if(d=="6"){
                                    $("#patienttypeid_sc").val("士大父是");
                                }

                            }
                            if(str.indexOf("age=")==1){
                                $("#age_sc").val(str.substring(str.indexOf("age=")+"age=".length,str.length));
                            }
                            if(str.indexOf("insuretypeid=")==1){
                                var d=str.substring(str.indexOf("insuretypeid=")+"insuretypeid=".length,str.length);
                                if(d=="428"){
                                    $("#insuretypeid_sc").val("医保");
                                }
                                if(d=="429"){
                                    $("#insuretypeid_sc").val("社保");
                                }

                            }
                            if(str.indexOf("medicarecode=")==1){
                                $("#medicarecode_sc").val(str.substring(str.indexOf("medicarecode=")+"medicarecode=".length,str.length));
                            }
                            if(str.indexOf("tel=")==1){
                                $("#tel_sc").val(str.substring(str.indexOf("tel=")+"tel=".length,str.length));
                            }
                            if(str.indexOf("address=")==1){
                                $("#address_sc").val(str.substring(str.indexOf("address=")+"address=".length,str.length));
                            }
                            if(str.indexOf("drugallergyhistory=")==0){
                                $("#drugallergyhistory_sc").val(str.substring(str.indexOf("drugallergyhistory=")+"drugallergyhistory=".length,str.length));
                            }
                            if(str.indexOf("identity=")==1){
                                $("#identity_sc").val(str.substring(str.indexOf("identity=")+"identity=".length,str.length));
                            }
                        }
                        SaoMiao();

                    }
                }
            }
        );
    });
}

    
function AddBingRen() {
    $.post(
        "${ctx}/patient/loadPat",
        "",
        function (data) {
           $("#cardcode").val(data);
        }
    );
$("#AddBingRenLing").modal("show");
}    
function doTian() {
    var e=$("#patientfrom").serializeJson();
    $.post(
        "${ctx}/patient/addPat",
        e,
        function (e) {
            if(e=="11"){
                swal("提示","手机号必须是1开头的11位数字","error");
            }else
            if(e=="18"){
                swal("提示","身份证号必须是15或者18位","error");
            }else
            if(e=="false"){
                swal("提示","不知是什么原因添加失败","error");
            }else{
                swal("提示", "添加成功！", "success");
                var date=e.substring(e.indexOf("(")+1,e.indexOf(")")).split(",");
                for(var i=0;i<date.length;i++){
                    var str=date[i];
                    if(str.indexOf("cardcode=")==1){
                        $("#cardcode_sc").val(str.substring(str.indexOf("cardcode=")+"cardcode=".length,str.length));
                    }
                    if(str.indexOf("patientname=")==1){
                        $("#patientname_sc").val(str.substring(str.indexOf("patientname=")+"patientname=".length,str.length));
                    }
                    if(str.indexOf("sex=")==1){
                        var d=str.substring(str.indexOf("sex=")+"sex=".length,str.length);
                        if(d=="1"){
                            $("#sex_sc").val("男");
                        }else{
                            $("#sex_sc").val("女");
                        }

                    }
                    if(str.indexOf("maritalstatusid=")==1){
                        var d=str.substring(str.indexOf("maritalstatusid=")+"maritalstatusid=".length,str.length);
                        if(d=="18"){
                            $("#maritalstatusid_sc").val("未婚");
                        }
                        if(d=="19"){
                            $("#maritalstatusid_sc").val("已婚");
                        }
                        if(d=="20"){
                            $("#maritalstatusid_sc").val("离异");
                        }
                        if(d=="21"){
                            $("#maritalstatusid_sc").val("丧偶");
                        }

                    }
                    if(str.indexOf("job=")==1){
                        $("#job_sc").val(str.substring(str.indexOf("job=")+"job=".length,str.length));
                    }
                    if(str.indexOf("patienttypeid=")==1){
                        var d=str.substring(str.indexOf("patienttypeid=")+"patienttypeid=".length,str.length);
                        if(d=="1"){
                            $("#patienttypeid_sc").val("普通病人");
                        }
                        if(d=="2") {
                            $("#patienttypeid_sc").val("港澳台病人");
                        }
                        if(d=="3"){
                            $("#patienttypeid_sc").val("外国病人");
                        }
                        if(d=="6"){
                            $("#patienttypeid_sc").val("士大父是");
                        }

                    }
                    if(str.indexOf("age=")==1){
                        $("#age_sc").val(str.substring(str.indexOf("age=")+"age=".length,str.length));
                    }
                    if(str.indexOf("insuretypeid=")==1){
                        var d=str.substring(str.indexOf("insuretypeid=")+"insuretypeid=".length,str.length);
                        if(d=="428"){
                            $("#insuretypeid_sc").val("医保");
                        }
                        if(d=="429"){
                            $("#insuretypeid_sc").val("社保");
                        }

                    }
                    if(str.indexOf("medicarecode=")==1){
                        $("#medicarecode_sc").val(str.substring(str.indexOf("medicarecode=")+"medicarecode=".length,str.length));
                    }
                    if(str.indexOf("tel=")==1){
                        $("#tel_sc").val(str.substring(str.indexOf("tel=")+"tel=".length,str.length));
                    }
                    if(str.indexOf("address=")==1){
                        $("#address_sc").val(str.substring(str.indexOf("address=")+"address=".length,str.length));
                    }
                    if(str.indexOf("drugallergyhistory=")==0){
                        $("#drugallergyhistory_sc").val(str.substring(str.indexOf("drugallergyhistory=")+"drugallergyhistory=".length,str.length));
                    }
                    if(str.indexOf("identity=")==1){
                        $("#identity_sc").val(str.substring(str.indexOf("identity=")+"identity=".length,str.length));
                    }
                }
                SaoMiao();
                $("#AddBingRenLing").modal("hide");
            }
        }
    );
}


function GuaHao() {

    var patientname_rc=$("#patientname_sc").val();
    var registertype_rc = $("input[name='registertype_rc']:checked").val();
    var registercode_rc=$("#registercode_rc").val();
    var departmentid_rc=$("#ze").val();
    var doctorid_rc= $("#IUT_TWO").val();
    var registersum_rc=$("#typesum_rc").val();
    var registerpersonid_rc=$("#IUT_TWO").val();
    var note_rc= $("#note_rc").val();
    var registerstatus_rc=493;
    var isvalid_rc=1;
    $.post(
        "${ctx}/guahao/guaGuaHao",
        {
            "patientname":patientname_rc,
            "registertypeid":registertype_rc,
            "registercode":registercode_rc,
            "departmentid":departmentid_rc,
            "doctorid":doctorid_rc,
            "registersum":registersum_rc,
            "registerpersonid":registerpersonid_rc,
            "note":note_rc,
            "registerstatus":registerstatus_rc,
            "isvalid":isvalid_rc
        },
        function (data) {
            if(data=="true"){
                swal("提示", "挂号成功！", "success");
            }
        }
    );
}

















function chs0() {
    $.getJSON(
        "${ctx}/guahao/chs0",
        {id:$("#ze").val()},
        function (result) {
            var json=eval(result);
            var spuStr ="";
            $("#IUT_TWO>option:gt(0)").remove();
            $.each(json,function (i,element) {
                spuStr+="<option value="+element.id+">"+element.employeename+"</option>";
            });

            $("#IUT_TWO").append(spuStr);

        }
    );
}
function SaoMiao() {
    $("#patientname_rc").val($("#patientname_sc").val());
    $.post(
        "${ctx}/guahao/smInfo",
        "",
        function (data) {
            $("#registercode_rc").val(data);
        }
    );
}
function ter() {
    var id = $("input[name='registertype_rc']:checked").val();
    $.post(
        "${ctx}/guahao/getTypeSum",
        "id="+id,
        function (data) {
            $("#typesum_rc").val(data);
        }
    );
}
</script>
</html>
