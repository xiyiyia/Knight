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
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-3.2.0.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			body {
				margin-top:20px;
				padding-left: 30px;
				padding-right: 30px;
			}
			.tr {
				width: 80px;
			}
			.btn{
				width: 100px;
				cursor: pointer;
			}
			div{
				float: left;
			}
			.changeDiv {
				margin-left: 20%;
				margin-top: 10%;
				display: none;
			}
			.disp {
				display: none;
			}
			.errorColor {
				color: red;
			}
		</style>
		<script type="text/javascript">
			
			//页面加载完成 设置注册的信息
			window.onload = function() {
				<% StudentBean student = (StudentBean)session.getAttribute("student"); %>
				$("#college").text("<%=student.getCollege()%>");
				$("#number").text("<%=student.getStudentNumber()%>");
				$("#name").text("<%=student.getName()%>");
				$("#sex").text("<%=student.getSex()%>"); 
				$("#age").text("<%=student.getAge()%>");
				$("#phone").text("<%=student.getPhoneNumber()%>");
			};
			
			
			$(document).ready(function(){
				//修改密码 显示隐藏
  				$("#btnChange").click(function(){
    				$("#divChange").toggle();
  				});
  				
  				$("#oldPwd").click(function(){
  					$("#imgOp").hide();
  					$("#des").hide();
  				});
  				
  				$("#newPwd").click(function(){
  					$("#imgNp").hide();
  					$("#des").hide();
  				});
  				
				//ajax 方式修改密码
  				$("#btnOk").click(function(){
  					var id = <%=student.getId() %>
  					var type = "student";
  					var op = $("#oldPwd").val();
  					var np = $("#newPwd").val();
  					if(op == "") {
  						$("#imgOp").show();
  						return;
  					}
  					
  					if(np == "") {
  						$("#imgNp").show();
  						return;
  					}
  					
   					$.post("ChangePwd",
	    				{	id:id,
	      					oldPwd:op,
	      					newPwd:np,
	      					type:type
	    				},
	    				function(data,status){
	    					var resp = data.res;
	    					if(status == "success") {
	    						if(resp == "1") {
	    							$("#des").show().text("密码修改成功");
	    							//2秒后隐藏
	    							setTimeout(function () { 
	    								$("#oldPwd").val("");
	    								$("#newPwd").val("");
	    								$("#des").hide();
       									$("#divChange").hide();
    								}, 2000);
	    						} else if (resp == "2") {
	    							$("#des").show().text("原密码错误");
	    						} else if (resp == "0") {
	    							$("#des").show().text("密码修改失败");
	    						}
	    					} else {
	    						$("#des").show().text("密码修改失败");
	    					}
	    				},"json");
 			 	});
			});
		</script>
	</head>
	<body>
		<div>
			<table cellspacing="10px" cellpadding="10px">
				<tr>
					<td class="tr">院系</td>
					<td id="college">软件工程</td>
				</tr>
				<tr>
					<td>学号</td>
					<td id="number">20131001</td>
				</tr>
				<tr>
					<td>姓名</td>
					<td id="name">天天</td>
				</tr>
				<tr>
					<td>性别</td>
					<td id="sex">男</td>
				</tr>
				<tr>
					<td>年龄</td>
					<td id="age">21</td>
				</tr>
				<tr>
					<td>电话</td>
					<td id="phone">18986687528</td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="btnChange" class="btn">修改密码</button>
					</td>
				</tr>
			</table>
		</div>
		<div id="divChange" class="changeDiv">
			<table cellspacing="5px" cellpadding="5px">
				<tr>
					<td>原密码：</td>
					<td>
						<input id="oldPwd" type="password" />
						
					</td>
					<td><img id="imgOp" class="disp" src="img/error25.png"></td>
				</tr>
				<tr>
					<td>新密码:</td>
					<td>
						<input id="newPwd" type="password" />
					</td>
					<td><img id="imgNp" class="disp" src="img/error25.png" align="bottom"></td>
				</tr>
				<tr>
					<td colspan="3">
						<button id="btnOk" class="btn">确定</button>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p id="des" class="disp errorColor"></p>
					</td>
				</tr>
			</table>
		</div>
  </body>
</html>
