<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'upload.jsp' starting page</title>
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
  </head>
  
  <body>
  <h3>快来晒晒你的美照。。。。</h3>
    <form   action="${pageContext.request.contextPath}/do/doupload1" enctype="multipart/form-data" method="post">
    	<input type="text" name="desc" />
    	<input type="file" name="photo"  multiple onchange="PreviewImage(this)"/>
    	<div id="imgPreview"></div>
    	<input type="submit" value="提交" id="btn"/>
    </form>
  </body>
  <script type="text/javascript">

      var flag = true ;

 function ch(){
    return flag ;
 }

   function PreviewImage(imgFile) 
   { 
    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
    if(!pattern.test(imgFile.value)) 
    { 
     alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
     imgFile.focus();
     flag = false ;
    } 
    else 
    {
        flag  = true ;
     var path; 
     if(document.all)//IE 
     { 
      imgFile.select(); 
      path = document.selection.createRange().text; 
     } 
     else//FF 
     { 
    	 var str = "";
    	 for(var i=0;i<imgFile.files.length;i++){
    		 path = URL.createObjectURL(imgFile.files[i]);
    		 str +="<img src='"+path+"'/>";
    	 }
    	 document.getElementById("imgPreview").innerHTML = str;
        return;
     } 
	 document.getElementById("imgPreview").innerHTML = "<img src='"+path+"'/>";

    } 
   } 
  </script>
</html>














