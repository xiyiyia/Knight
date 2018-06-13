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
			.mTr:hover {
				background-color:#AAAAAB;
			}
			
			.mTd {
				text-align: center;
			}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
		<script type="text/javascript">
			
			var rowCount, name, pwd, college, sex, age, phone, number;
			
			//页面加载完成，初始化表格
			window.onload=function(){
					// 从后台获取的json对象
					$.post("GetAllData",
	    				{	
	      					type:"student"
	    				},
	    				function(data,status){
	    					if(status == "success") {
	    						// 遍历对象
								for(var i = 0; i < data.length; i++) {
									name = data[i].name;
									pwd = data[i].pwd;
									college = data[i].college;
									sex = data[i].sex;
									age = data[i].age;
									phone = data[i].phoneNumber;
									number = data[i].studentNumber;
									addRow();
								}
	    					}
	    				},"json");
			};

			//添加行
			function addRow() {
				//最后一行第一列
				var last = $("#studentTable tr:last").find("td:eq(0)").text();
				//序号递增
				if (last != "序号") {
					rowCount = ++last;
				} else {
					rowCount = 1;
				}
				var rowTemplate = '<tr class="mTr" id="tr_' + rowCount + '">' + 
					'<td class="mTd">' + rowCount + '</td>' + 
					'<td>' + name + '</td>' + 
					'<td>' + pwd + '</td>' + 
					'<td>' + college + '</td>' + 
					'<td>' + sex + '</td>' + 
					'<td>' + age + '</td>' + 
					'<td>' + phone + '</td>' + 
					'<td>' + number + '</td>' + 
					'<td class="mTd"><button onclick=delRow(' + rowCount + ')>删除</></td></tr>';
				var tableHtml = $("#studentTable tbody").html();
				tableHtml += rowTemplate;
				$("#studentTable tbody").html(tableHtml);
			}
			
			//删除行
			function delRow(_id) {
				var r=confirm("确认删除吗？");
				if (r==true) {
				//通知后台删除数据
				var deleteName = $("#tr_" + _id).find("td:eq(7)").text();	
				$.post("DeleteData",
	    				{	
	      					type:"student",
	      					name:deleteName
	    				},
	    				function(data,status){
	    					var resp = data.res;
	    					if(status == "success") {
	    						if(resp == "1") {
	    							//删除成功
	    							$("#tr_" + _id).remove();
	    						} else if (resp == "0") {
	    							//删除失败
	    							$("#del").show().text("删除失败");
	    							//2秒后隐藏
	    							setTimeout(function () { 
       									$("#del").hide();
    								}, 2000);
	    						}
	    					} else {
	    						//删除失败
	    						$("#del").show().text("删除失败");
	    						//2秒后隐藏
	    						setTimeout(function () { 
       								$("#del").hide();
    							}, 2000);
	    					}
	    				},"json"); 
	    				}
			}
		</script>
	</head>

	<body style="margin: 0px; padding: 0px;">
		<div style="float: left; margin-left: 15%; margin-top: 20px">
			<table id="studentTable" border="1" cellpadding="5px" cellspacing="0" width="800">
				<tr style="background-color: gainsboro;">
					<th>序号</th>
					<th>姓名</th>
					<th>密码</th>
					<th>院系</th>
					<th>性别</th>
					<th>年龄</th>
					<th>电话</th>
					<th>学号</th>
					<th>操作</th>
				</tr>
			</table>
			<p id="del" style="color: red; display: none; margin-top: 20px">删除失败</p>
		</div>
	</body>
</html>
