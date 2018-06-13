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
    
    <title>计算机等级考试报名系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  	<script src="js/jquery-3.2.0.min.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
			body {
				margin: 0px;
				padding: 0px;
				background-color: darkgray;
			}
			.title {
				height: 60px;
				background-color: #3AB3FF;
			}
			.left {
				width: 130px;
				top: 60px;
				bottom: 0px;
				position: fixed;
				background-color: #E9EDFB;
				text-align: center;
			}
			.right {
				top: 60px;
				left: 130px;
				position: fixed;
				bottom: 0px;
				right: 0px;
				background-color: gainsboro;
			}
			.leftItem {
				cursor: pointer;
				padding: 10px;
				font-weight: bold;
			}
			.miframe {
				background-color: white;
				position: absolute;
				width: 100%;
				height: 100%;
			}
			.textColor{
				color: white;
			}
			
			.pt{
				padding-top: 15px;
			}
		</style>
		<script type="text/javascript">
			//编译院系管理员所用到的变量
			var editCollege, editName, editPwd;
			
			//点击事件
			$(document).ready(function(){
				//鼠标悬浮离开
				$("#changePwd, #manageCollege, #manageUser, #manageSign, #logout").hover(
					function() {
						$(this).css("background-color", "#AAAAAB");
					},
					function() {
						$(this).css("background-color", "#E9EDFB");
					}
				);
				
				//鼠标按下
				$("#changePwd, #manageCollege, #manageUser, #manageSign, #logout").mousedown(function() {
					$(this).css("background-color", "#DDDDDD");
				});
				
				//鼠标松开
				$("#changePwd, #manageCollege, #manageUser, #manageSign, #logout").mouseup(function() {
					$(this).css("background-color", "#E9EDFB");
				});
			
				$("#changePwd").click(function(){
					$("#myiframe").attr("src", "my/admin_change_pwd.jsp");
				});
				
				$("#manageCollege").click(function(){
					$("#myiframe").attr("src", "my/admin_manage_college.jsp");
				});
				
				$("#manageUser").click(function(){
					$("#myiframe").attr("src", "my/admin_manage_user.jsp");
				});
				
				$("#manageSign").click(function(){
					$("#myiframe").attr("src", "my/admin_manage_sign.jsp");
				});
				
				$("#logout").click(function(){
					//360
					window.location.href="common/login.jsp";
					//IE
					//window.location.href="register.jsp";
				});
			});
		</script>
	</head>
	<body>
		<div class="title">
			<h2 align="center" class="pt textColor">全国计算机等级考试报名系统</h2>
		</div>
		<div class="left">
			<p id="changePwd" class="leftItem">修改个人密码</p>
			<p id="manageCollege" class="leftItem">院系信息管理</p>
			<p id="manageUser" class="leftItem">注册用户管理</p>
			<p id="manageSign" class="leftItem">报名信息管理</p>
			<p id="logout" class="leftItem">安全退出系统</p>
		</div>
		<div class="right">
			<iframe id="myiframe" src="my/admin_change_pwd.jsp" class="miframe" frameborder="0"></iframe>
		</div>
  </body>
</html>
