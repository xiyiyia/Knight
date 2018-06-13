<%@page import="entity.StudentBean"%>
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
			}
			.errorColor {
				color: red;
			}
			.disp {
				display: none;
			}
		</style>
		<script type="text/javascript">
			var number, name, age, phone, college, sex, idNumber, grade, type;
			//页面加载完成 设置注册的信息
			window.onload = function() {
				<% StudentBean student = (StudentBean)session.getAttribute("student"); %>
				$(document).ready(function(){
					number = "<%=student.getStudentNumber()%>";
					name = "<%=student.getName()%>";
					age = "<%=student.getAge()%>";
					phone = "<%=student.getPhoneNumber()%>";
					college = "<%=student.getCollege()%>";
					sex = "<%=student.getSex()%>";
					
					$("#number").val(number);
					$("#name").val(name);
					$("#age").val(age);
					$("#phone").val(phone);
					$("#college").val(college);
					$("#idNumber").val(parent.idNum);
					if(sex == "男") {
						$("input:radio:first").attr("checked", "true");
					} else {
						$("input:radio:last").attr("checked", "true");
					}
				});
			};
			
			
			$(document).ready(function(){
				//提交注册信息
				$("#btnOk").click(function(){
					phone = $("#phone").val();
					if(phone == "") {
						$("#imgP").show();
						return;
					}
					
					idNumber = $("#idNumber").val();
					if(idNumber == "") {
						$("#imgI").show();
						return;
					}
					
					grade = $("#grade option:selected").val();
					if(grade == "grade1") {
						grade = "计算机一级";
					} else if (grade == "grade2") {
						grade = "计算机二级";
					} else if (grade == "grade3") {
						grade = "计算机三级";
					} else if (grade == "grade4") {
						grade = "计算机四级";
					}
					
					type = $("#type option:selected").val();
					if(type == "type1") {
						type = "计算机基础及 WPS Office 应用";
					} else if (type == "type2") {
						type = "C 语言程序设计";
					} else if (type == "type3") {
						type = "VB 语言程序设计";
					} else if (type == "type4") {
						type = "Java 语言程序设计";
					}
					
					//给身份证号 赋值
					parent.idNum = idNumber;
					
					//ajax 方式提交
					$.post("StudentSign",
	    				{	grade:grade,
	      					type:type,
	      					number:number,
	      					name:name,
	      					sex:sex,
	      					age:age,
	      					phone:phone,
	      					idNumber:idNumber,
	      					college:college
	    				},
	    				function(data,status){
	    					var resp = data.res;
	    					if(status == "success") {
	    						if(resp == "1") {
	    							$("#des").show().text("报名成功（点击确定可重新报考）");
	    						} else if (resp == "0") {
	    							$("#des").show().text("报名失败");
	    						} else if (resp == "2") {
	    							$("#des").show().text("重新报名成功（点击确定可重新报考）");
	    						} else if (resp == "3") {
	    							$("#des").show().text("重新报名失败");
	    						} 
	    					} else {
	    						$("#des").show().text("报名失败");
	    					}
	    				},"json");
				});
				
				$("#phone").click(function(){
					$("#imgP").hide();
				});
				
				$("#idNumber").click(function(){
					$("#imgI").hide();
				});
				
				//隐藏提示信息
				$("#grade, #type, #phone, #idNumber").click(function(){
					$("#des").hide();
				});
			});
		</script>
	</head>
	<body>
		<div style="width: 400px; margin-left: auto; margin-right: auto">
			<table cellspacing="10px" cellpadding="10px" align="left">
				<tr>
					<td>考试等级：</td>
					<td>
						<select id="grade" name="grade">
							<option value="grade1">计算机一级</option>
							<option value="grade2">计算机二级</option>
							<option value="grade3">计算机三级</option>
							<option value="grade4">计算机四级</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>考试科目：</td>
					<td>
						<select id="type" name="type">
							<option value="type1">计算机基础及 WPS Office 应用</option>
							<option value="type2">C 语言程序设计</option>
							<option value="type3">VB 语言程序设计</option>
							<option value="type4">Java 语言程序设计</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>你的学号：</td>
					<td><input type="number" id="number" disabled="true" value="123"/></td>
				</tr>
				<tr>
					<td>你的姓名：</td>
					<td><input type="text" id="name" disabled="true" value="天天"/></td>
				</tr>
				<tr>
					<td>你的性别：</td>
					<td>
						<input type="radio" id="male" name="sex" checked="true" disabled="true" value="male"/>男
						<input type="radio" id="female" name="sex" disabled="true" value="female"/>女
					</td>
				</tr>
				<tr>
					<td>你的年龄：</td>
					<td><input type="number" id="age" disabled="true" value="2"/></td>
				</tr>
				<tr>
					<td>联系方式：</td>
					<td><input type="number" id="phone" value="189"/></td>
					<td><img id="imgP" class="disp" src="img/error25.png"></td>
				</tr>
				<tr>
					<td>身份证号：</td>
					<td><input type="text" id="idNumber"/></td>
					<td><img id="imgI" class="disp" src="img/error25.png"></td>
				</tr>
				<tr>
					<td>所在院系：</td>
					<td><input type="text" id="college" disabled="true" value="院系1"/></td>
				</tr>
				<tr>
					<td>
						<button id="btnOk" style="width: 80px;">确定</button>
					</td>
					<td>
						<p id="des" class="errorColor"></p>
					</td>
				</tr>
			</table>
		</div>
  </body>
</html>
