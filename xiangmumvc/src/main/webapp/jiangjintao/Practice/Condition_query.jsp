<%--
  Created by IntelliJ IDEA.
  User: jianglaoban
  Date: 2019-12-07
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/common-jsp/common-js.jsp"%>
    <%@include file="/common-jsp/common-css.jsp"%>
    <script type="text/javascript">
            $(function () {
                $("#table").bootstrapTable({

                    url:'/employee/query',
                    pagination:true,
                    pageList:[2,4,8,16],
                    //启用服务器端分页
                    sidePagination:'server',
                    //默认第几页
                    pageNumber:1,
                    queryParams:function(params){
                        var temp = {  //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                            limit: params.limit,  //页面大小
                            offset: params.offset,//页码
                            jiang:$("#employee").val()
                        };
                        return temp;
                    },
                    columns:[{
                        checkbox:true
                    },{
                        field:'employeecode',
                        title:'员工编号'
                    },{
                        field:'employeename',
                        title:'员工姓名'
                    },{
                        field:'sex',
                        title:'性别'
                    },{
                        field:'tel',
                        title:'联系电话'
                    }]
                })
            })

       function sear() {
          // 返回表格的Options
           var opan=$("#table").bootstrapTable("getOptions");
           var limit=opan.pageSize;
           var offset=(opan.pageNumber-1)*limit;
           var employee=$("#employee").val();
           console.log(employee);
           $.get("/employee/query",{'employeename':employee,'limit':limit,'offset':offset},function (data) {
               console.log("111")
               console.log(limit+"\t"+offset);
               $("#table").bootstrapTable("load",data);
           })

       }
    </script>
</head>
<body>
<div class="col-sm-6">
    <form  class="form-inline pull-right">
        <input id="employee" type="text" class="form-control">
        <button class="btn btn-primary" onclick="sear()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
    </form>
</div>
<div class="row" style="margin-top: 15px">
    <div class="col-sm-12">
        <table id="table"></table>
    </div>

</div>
</body>
</html>
