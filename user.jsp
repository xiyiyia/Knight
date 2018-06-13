<%@page import="entity.StudentBean"%>
<%@page import="entity.StudentSignBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

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
		</style>
		<script type="text/javascript" charset="utf-8">
			var grade, type, number, name, sex, age, phone, idNumber, college;
			//页面加载完成
			window.onload = function() {
					
					<% StudentBean student = (StudentBean)session.getAttribute("student"); %>
					number = "<%=student.getStudentNumber()%>";
					
					//ajax 方式提交
					$.post("SelectSign",
	    				{	
	      					type:"student",
	      					number:number
	    				},
	    				function(data,status){
	    					if(status == "success") {
	    						grade = data.grade;
								type = data.type;
								number = data.number;
								name = data.name;
								sex = data.sex;
								age = data.age;
								phone = data.phone;
								idNumber = data.idNumber;
								college = data.colloge;
								
								$(document).ready(function(){
									$("#grade").text(grade);
									$("#type").text(type);
									$("#number").text(number);
									$("#name").text(name);
									$("#sex").text(sex);
									$("#age").text(age);
									$("#phone").text(phone);
									$("#idNumber").text(idNumber);
									$("#college").text(college);
								});
	    					}
	    				},"json");
			};
			
			$(document).ready(function(){
				$("#btnChange").click(function(){
					parent.idNum = idNumber;
					$("#myiframe", window.parent.document).attr("src", "student/sign.jsp");
				});
			});
		</script>
	</head>
	<body>
		<div>
			<table cellspacing="10px" cellpadding="10px">
				<tr>
					<td class="tr">考试等级</td>
					<td id="grade">暂未报考</td>
				</tr>
				<tr>
					<td>考试科目</td>
					<td id="type">暂未报考</td>
				</tr>
				<tr>
					<td>你的学号</td>
					<td id="number">暂未报考</td>
				</tr>
				<tr>
					<td>你的姓名</td>
					<td id="name">暂未报考</td>
				</tr>
				<tr>
					<td>你的性别</td>
					<td id="sex">暂未报考</td>
				</tr>
				<tr>
					<td>你的年龄</td>
					<td id="age">暂未报考</td>
				</tr>
				<tr>
					<td>联系方式</td>
					<td id="phone">暂未报考</td>
				</tr>
				<tr>
					<td>身份证号</td>
					<td id="idNumber">暂未报考</td>
				</tr>
				<tr>
					<td>所在院系</td>
					<td id="college">暂未报考</td>
				</tr>
				<tr>
					<td colspan="2"><button id="btnChange">修改报名信息</button></td>
				</tr>
			</table>
		</div>
	</body>
</html>
