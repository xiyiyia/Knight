<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'onload_pic.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-3.2.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script>
		
		$(document).ready(function(){
				$("#file0").change(function() {
					// getObjectURL是自定义的函数，见下面  
					// this.files[0]代表的是选择的文件资源的第一个，因为上面写了 multiple="multiple" 就表示上传文件可能不止一个  
					// ，但是这里只读取第一个   
					var objUrl = getObjectURL(this.files[0]);
					// 这句代码没什么作用，删掉也可以  
					// console.log("objUrl = "+objUrl) ;  
					if(objUrl) {
						// 在这里修改图片的地址属性  
						$("#img0").attr("src", objUrl);
					}
				});
				//建立一個可存取到該file的url  
				function getObjectURL(file) {
					var url = null;
					// 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已  
					if(window.createObjectURL != undefined) { // basic  
						url = window.createObjectURL(file);
					} else if(window.URL != undefined) { // mozilla(firefox)  
						url = window.URL.createObjectURL(file);
					} else if(window.webkitURL != undefined) { // webkit or chrome  
						url = window.webkitURL.createObjectURL(file);
					}
					return url;
				}
				
				$("#ok").click(function(){
					var pic = $("#file0").val();
					if (pic == "") {
						alert("请选择图片");
						return;
					}
					$("#des").show();
				});
				
				$("#file0").click(function(){
					$("#des").hide();
				});
			});
		</script>
  </head>
  
  <body style="padding-left: 30px; padding-top: 30px">
    <h3>请选择图片文件：JPG/PNG</h3>
		<form name="form0" id="form0">
			<!-- 这里特别说一下这个 multiple="multiple" 添加上这个之后可以一次选择多个文件进行上传，是 html5 的新属性-->
			<input type="file" name="file0" id="file0" multiple="multiple" />
			<br>
			<br>
			<img src="" id="img0" style="width: 200px; height: 200px;">
			<br>
			<br>
			<input id="ok" type="button" value="开始上传"/>
			<br>
			<p id="des" style="color: red; display: none">上传成功</p>
		</form>
  </body>
</html>
