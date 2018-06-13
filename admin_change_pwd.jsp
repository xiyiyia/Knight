<%@page import="entity.AdminBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-3.2.0.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			
		</style>
		<script type="text/javascript">
			var oldPwd, newPwd, name, pwd, id, type;
			
			//页面加载完成
			window.onload = function() {
				<% AdminBean admin = (AdminBean)session.getAttribute("admin"); %>
					id = "<%=admin.getId()%>";
					name = "<%=admin.getAdminName()%>";
					pwd = "<%=admin.getAdminPwd()%>";
					type = "admin";
					$("#name").val(name);
			};
			
			$(document).ready(function(){
				
				$("#okBtn").click(function(){
					oldPwd = $("#oldPwd").val();
					newPwd = $("#newPwd").val();
					if (oldPwd == "") {
						$("#imgO").show();
						return;
					}
					
					if (newPwd == "") {
						$("#imgP").show();
						return;
					}
					
					if (pwd != oldPwd) {
						$("#des").show().text("原密码错误");
						return;
					}
					
					$.post("ChangePwd",
	    				{	id:id,
	      					oldPwd:oldPwd,
	      					newPwd:newPwd,
	      					type:type
	    				},
	    				function(data,status){
	    					var resp = data.res;
	    					if(status == "success") {
	    						if(resp == "1") {
	    							$("#des").show().text("密码修改成功");
	    							//3秒后隐藏
	    							setTimeout(function () { 
	    								$("#des").hide();
    								}, 2000);
	    						} else if (resp == "0") {
	    							$("#des").show().text("密码修改失败");
	    						}
	    					} else {
	    						$("#des").show().text("密码修改失败");
	    					}
	    				},"json");
				});
				
				$("#oldPwd").click(function() {
					$("#imgO").hide();
					$("#des").hide();
				});
				
				$("#newPwd").click(function() {
					$("#imgP").hide();
					$("#des").hide();
				});
			});
		</script>
	</head>
	<body style="text-align: center;">
		<div style="width:350px; margin-left: 35%">
			<table cellspacing="10px" cellpadding="10px">
				<tr>
					<td align="right">账号：</td>
					<td><input id="name" type="text" disabled="false" /></td>
				</tr>
				<tr>
					<td align="right">原密码：</td>
					<td><input type="password" id="oldPwd" /></td>
					<td><img id="imgO" src="img/error25.png" style="display: none"></td>
				</tr>
				<tr>
					<td >新密码：</td>
					<td><input type="password" id="newPwd" /></td>
					<td><img id="imgP" src="img/error25.png" style="display: none"></td>
				</tr>
				<tr>
					<td><button id="okBtn" style="width: 60px; cursor: pointer;">确定</button></td>
					<td><p id="des" style="color: red; display: none">密码修改成功</p></td>
				</tr>
			</table>
		</div>
	</body>
</html>
