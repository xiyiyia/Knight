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
	<style type="text/css">
			
		</style>
		<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
		<script type="text/javascript">
			window.onload=function() {
				var college, name, pwd;
				$(document).ready(function(){
					//设置初始值
					if (parent.editCollege == "软件工程") {
						 $("#col").val("college1");
					} else if (parent.editCollege == "机械工程") {
						 $("#col").val("college2");
					} else if (parent.editCollege == "信息工程") {
						 $("#col").val("college3");
					} else if (parent.editCollege == "工商管理") {
						 $("#col").val("college4");
					} else if (parent.editCollege == "电器工程") {
						 $("#col").val("college5");
					}
					
					$("#name").val(parent.editName);
					$("#pwd").val(parent.editPwd);
					
					//按钮的点击事件
					$("#ok").click(function(){
						college = $("#col option:selected").val();
					if (college == "college1") {
						college = "软件工程";
					} else if (college == "college2") {
						college = "机械工程";
					} else if (college == "college3") {
						college = "信息工程";
					} else if (college == "college4") {
						college = "工商管理";
					} else if (college == "college5") {
						college = "电器工程";
					}
					
					name = $("#name").val();
					pwd = $("#pwd").val();
					
					if (name == "") {
						$("#imgName").show();
						return;
					}
					
					if (pwd == "") {
						$("#imgPwd").show();
						return;
					}
					
					//ajax 方式提交
					$.post("EditCollege",
	    				{	college:college,
	    					oldName:parent.editName,
	      					newName:name,
	      					pwd:pwd
	    				},
	    				function(data,status){
	    					var resp = data.res;
	    					if(status == "success") {
	    						if(resp == "1") {
	    							$("#myiframe", window.parent.document).attr("src", "my/admin_manage_college.jsp");
	    						} else if (resp == "0"){
	    							$("#des").show().text("信息修改失败");
	    						} else if (resp == "2"){
	    							$("#des").show().text("账号已存在");
	    						}
	    					} else {
	    						$("#des").show().text("信息修改失败");
	    					}
	    				},"json");
						
					});
					
					$("#cancle").click(function(){
						$("#myiframe", window.parent.document).attr("src", "my/admin_manage_college.jsp");
					});
				});
			};
		</script>
	</head>

	<body style="margin: 0px; padding: 0px;">
		
		<div style="width: 300dp; margin-top: 20px" align="center">
			<table cellspacing="5px" cellpadding="5px">
				<tr><th>修改院系管理员信息</th></tr>
				<tr><td></td></tr>
				<tr>
					<td>院系名称：
						<select id="col" name="college">
							<option value="college1">软件工程</option>
							<option value="college2">机械工程</option>
							<option value="college3">信息工程</option>
							<option value="college4">工商管理</option>
							<option value="college5">电器工程</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>账号：<input type="text" id="name"/></td>
					<td><img src="img/error25.png" id="imgName" style="display: none"></td>
				</tr>
				<tr>
					<td>密码：<input type="text" id="pwd"/></td>
					<td><img src="img/error25.png" id="imgPwd" style="display: none"></td>
				</tr>
				<tr>
					<td><p id="des" style="color: red; display: none">账号已存在</p></td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<input type="button"  id="ok" value="确定"/>
						<input type="button"  id="cancle" value="取消"/>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
