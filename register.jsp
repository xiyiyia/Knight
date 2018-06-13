<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <script src="js/jquery-3.2.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery.js"></script>
		<script src="js/jquery.validate.min.js"></script>
		<script src="js/messages_zh.js"></script>
		<style type="text/css">
			
			body {
				background-color: #3AB3FF;
				margin:0px;
				padding:0px;
			}
			
			.textColor{
				color: white;
			}
			.error {
				color: red;
			}
			.logo {
				background-color: #FFE9A1;
			}
		</style>
		<script type="text/javascript">
			
			$().ready(function() {
				// 在键盘按下并释放及提交后验证提交表单
				$("#register").validate({
					rules: {
						studentNumber: "required",
						studentName: "required",
						studentAge: "required",
						studentPhone: "required",
						studentPwd: "required",
					},
					messages: {
						studentNumber: "请输入学号",
						studentName: "请输入姓名",
						studentAge: "请输入年龄",
						studentPhone: "请输入电话",
						studentPwd: "请输入密码",
					}
				});
			});
			
			//页面加载完成
			window.onload = function() {
			
			 	<%	
			 		if(null != session){
						Object obj = session.getAttribute("registerReslut");
						if(null != obj){
							String res = (String)obj;
							if(res.equals("unknownError")) {
								%>
								$(document).ready(function(){
									$("#des").text("注册失败，错误未知").css("color","red").show();
								});
								<%
							} else {
								%>
								$(document).ready(function(){
									$("#des").text("学号已存在").css("color","red").show();
								});
								<%
							}
						}
					}
				%> 
			};
		
			//消失提示信息
			$(document).ready(function(){
				$("#college,#studentNumber,#studentName, #sex1, #sex2, #studentAge, #studentPhone, #studentPwd").click(function(){
					$("#des").hide();
				});
			});
		</script>
	</head>

	<body>
		<div class="logo" align="center">
			<img src="img/logo.png"/>
		</div>
		<div align="center" style="margin-top: 6%;">
			
		<form id="register" method="post" action="Register">
			<fieldset style="width: 315px; padding-top: 30px; padding-bottom: 30px;">
				<legend>用户注册</legend>
				<table cellspacing="10px" cellpadding=""5px align="left">
					<tr>
						<td class="textColor">院系：</td>
						<td>
							<select name="college">
								<option value="college1">软件工程</option>
								<option value="college2">机械工程</option>
								<option value="college3">信息工程</option>
								<option value="college4">工商管理</option>
								<option value="college5">电器工程</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="textColor">学号：</td>
						<td><input id="studentNumber" type="number" name="studentNumber"></td>
					</tr>
					<tr>
						<td class="textColor">姓名：</td>
						<td><input id="studentName" type="text" name="studentName"></td>
					</tr>
					<tr>
						<td class="textColor">性别：</td>
						<td>
							<input id="sex1" type="radio" name="sex" value="male" checked="true">男
							<input id="sex2" type="radio" name="sex" value="female">女
						</td>
					</tr>
					<tr>
						<td class="textColor">年龄：</td>
						<td><input id="studentAge" type="number" name="studentAge"></td>
					</tr>
					<tr>
						<td class="textColor">电话：</td>
						<td><input id="studentPhone" type="number" name="studentPhone"></td>
					</tr>
					<tr>
						<td class="textColor">密码：</td>
						<td><input id="studentPwd" type="password" name="studentPwd"></td>
					</tr>
					<tr>
						<td><input id="submit" type="submit" value="提交"></td>
						<td><input id="reset" type="reset" value="重置"></td>
					</tr>
					<tr>
						<td colspan="2">
							<p id="des" style="display:none;"></p>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
		</div>
	</body>
</html>
