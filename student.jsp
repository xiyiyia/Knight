<%@page import="entity.StudentBean"%>
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
	<link rel="stylesheet" type="text/css" href="css/title.css"/>
		<style type="text/css">
			body {
				margin: 0px;
				padding: 0px;
			}
			.out {
				position: fixed;
				width: 100%;
			}
			.parent {
			    background-color: #E9EDFB; 
			    height: 45px; 
			}
			.item {
				font-weight: bold;
				margin-right: 10px;
				margin-left: 30px;
				cursor: pointer;
				border: none;
				background-color: #E9EDFB;
				width: 80px;
				height: 45px;
				
			}
			.toRight {
				float: right;
				margin-right: 30px;
			}
			
			.outDiv {
				top: 90px;
				position: fixed;
				bottom: 0px;
				width:100%;
			}
			
			.iframe {
				position: absolute;
				width: 100%;
				height: 100%;
			}
			
		</style>
		<script type="text/javascript">
			//考生身份证号
			var idNum;
			
			//页面加载完成
			window.onload = function() {
				<% StudentBean student = (StudentBean)session.getAttribute("student"); %>
				$(document).ready(function(){
					name = "<%=student.getName()%>";
					$("#btnName").text("欢迎您：" + name);
				});
			};
		
			//鼠标悬浮离开
			$(document).ready(function() {
				$("#btnProcess, #btnKnow, #btnSign, #btnMessage, #btnUser, #btnOut, #btnMoney, #btnPic").hover(
					function() {
						$(this).css("background-color", "#AAAAAB");
					},
					function() {
						$(this).css("background-color", "#E9EDFB");
					}
				)
			});
			//鼠标按下
			$(document).ready(function() {
				$("#btnProcess, #btnKnow, #btnSign, #btnMessage, #btnUser, #btnOut").mousedown(function() {
					$(this).css("background-color", "#DDDDDD");
				});
			});
			//鼠标松开
			$(document).ready(function() {
				$("#btnProcess, #btnKnow, #btnSign, #btnMessage, #btnUser, #btnOut").mouseup(function() {
					$(this).css("background-color", "#E9EDFB");
				});
			});
			
			//切换到报名流程页面
			$(document).ready(function(){
				$("#btnProcess").click(function(){
					$("#myiframe").attr("src", "student/process.jsp");
				});
			});
			
			//切换到考生须知页面
			$(document).ready(function(){
				$("#btnKnow").click(function(){
					$("#myiframe").attr("src", "student/known.jsp");
				});
			});
			
			//切换到在线报名页面
			$(document).ready(function(){
				$("#btnSign").click(function(){
					$("#myiframe").attr("src", "student/sign.jsp");
				});
			});
			
			//切换到在线缴费页面
			$(document).ready(function(){
				$("#btnMoney").click(function(){
					$("#myiframe").attr("src", "student/pay.jsp");
				});
			});
			
			//切换到上传头像页面
			$(document).ready(function(){
				$("#btnPic").click(function(){
					$("#myiframe").attr("src", "student/onload_pic.jsp");
				});
			});
			
			//切换到修改密码页面
			$(document).ready(function(){
				$("#btnMessage").click(function(){
					$("#myiframe").attr("src", "student/message.jsp");
				});
			});
			
			//切换到我的报名页面
			$(document).ready(function(){
				$("#btnUser").click(function(){
					$("#myiframe").attr("src", "student/user.jsp");
				});
			});
			
			//退出登录
			$(document).ready(function(){
				$("#btnOut").click(function(){
					//360
					window.location.href="common/login.jsp";
					//IE
					//window.location.href="register.jsp";
				});
			});
		</script>
	</head>

	<body>
		<div class="out">
			<div class="title">
				<h2 align="center" class="pt textColor">全国计算机等级考试报名系统</h2>
			</div>
			
			<div class="parent">
				<button id="btnProcess" class="item">报名流程</button>
				<button id="btnKnow" class="item">考生须知</button>
				<button id="btnSign" class="item">在线报名</button>
				<button id="btnMoney" class="item">在线缴费</button>
				<button id="btnPic" class="item">上传头像</button>
				<button id="btnMessage" class="item">修改密码</button>
				<button id="btnUser" class="item">我的报名</button>
				<button id="btnName"class="item" style="width: 120px;">欢迎您：测试值</button>
				<button id="btnOut" class="item toRight">注销退出</button>
			</div>
		</div>
		<div class="outDiv">
			<iframe class="iframe" src="student/process.jsp" id="myiframe" frameborder="0"></iframe>
		</div>
  </body>
</html>
