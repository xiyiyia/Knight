<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-3.2.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/messages_zh.js"></script>
	<style type="text/css">
			body {
				
				margin:0px;
				padding:0px;
				background:url(img/library.jpg) no-repeat;
				background-size:100% 
			}
			
			div.login {
				width: 350px;
				height: 200px;
				margin-left: auto;
				margin-right: auto;
				margin-top: 10%;
				
			}
			.logo {
				background-color: #FFE9A1;
			}
			.error {
				color: red;
			}
	</style>
	<script type="text/javascript">
		//提交表单
		$(document).ready(function () {
			$("#login").click(function () {
				$("#iform").submit();
			});
		}); 
	  
	    //验证表单
		$().ready(function() {
			// 在键盘按下并释放及提交后验证提交表单
			$("#iform").validate({
				rules: {
					userName: {
						required: true
					},
					userPwd: {
						required: true
					}
				},
				messages: {
					userName: {
						required: "请输入用户名",
					},
					userPwd: {
						required: "请输入密码",
					}
				}
			});
		});
		
		window.onload = function() {
			
			 <%	
			 	if(null != session){
					Object obj = session.getAttribute("loginResult");
					if(null != obj){
						String res = (String)obj;
						if(res.equals("nameError")) {
							%>
							$(document).ready(function(){
								$("#des").text("账号不存在").css("color","red").show();
							});
							<%
						} else {
							%>
							$(document).ready(function(){
								$("#des").text("密码不正确").css("color","red").show();
							});
							<%
						}
					}
				}
			%> 
		};
		
		$(document).ready(function(){
			$("#name,#pwd,#role").click(function(){
				$("#des").hide();
			});
		});
		
		$(document).ready(function(){
			$("#register").click(function(){
				window.location.href="common/register.jsp";
			});
		});
  	</script>
  </head>
  
  <body>
   	<div class="logo" align="center">
			<img src="image/12.jpg"/>
		</div>
		
		<h2 align="center">网上考试报名系统</h2>
		<div class="login">
			<form id="iform" action="CheckAccount" method="post">
				<table cellspacing="10px" cellpadding="5px" align="left">
					<tr>
						<td><font color="white">账号：</font></td>
						<td><input id="name" type="text" name="userName"/></td>
					</tr>
					<tr>
						<td><font color="white">密码：</font></td>
						<td><input id="pwd" type="password" name="userPwd" /></td>
					</tr>
					<tr>
						<td><font color="white">类型：</font></td>
						<td>
							<select id="role" name="role">
								<option value="student">学生</option>
								<option value="college">管理员</option>
								<option value="admin">系统管理员</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input id="login" type="button" value="登录 " />
							<input id="register" type="button" value="注册 " />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p id="des" style="display:none;"></p>
						</td>
					</tr>
				</table>
			</form>
		</div>
  </body>
</html>
