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
			
			var rowCount, grade, type, number, name, sex, age, phone, idNumber, college;
			
			//页面加载完成，初始化表格
			window.onload=function(){
					// 从后台获取的json对象
					$.post("GetAllData",
	    				{	
	      					type:"sign"
	    				},
	    				function(data,status){
	    					if(status == "success") {
	    						// 遍历对象
								for(var i = 0; i < data.length; i++) {
									grade = data[i].grade;
									type = data[i].type;
									number = data[i].number;
									name = data[i].name;
									sex = data[i].sex;
									age = data[i].age;
									phone = data[i].phone;
									idNumber = data[i].idNumber;
									college = data[i].colloge;
									addRow();
								}
	    					}
	    				},"json");
			};

			//添加行
			function addRow() {
				//最后一行第一列
				var last = $("#signTable tr:last").find("td:eq(0)").text();
				//序号递增
				if (last != "序号") {
					rowCount = ++last;
				} else {
					rowCount = 1;
				}
				var rowTemplate = '<tr class="mTr" id="tr_' + rowCount + '">' + 
					'<td class="mTd">' + rowCount + '</td>' + 
					'<td>' + grade + '</td>' + 
					'<td>' + type + '</td>' + 
					'<td>' + number + '</td>' + 
					'<td>' + name + '</td>' + 
					'<td>' + sex + '</td>' + 
					'<td>' + age + '</td>' + 
					'<td>' + phone + '</td>' + 
					'<td>' + idNumber + '</td>' + 
					'<td>' + college + '</td>' + 
					'<td class="mTd"><button onclick=delRow(' + rowCount + ')>删除</></td></tr>';
				var tableHtml = $("#signTable tbody").html();
				tableHtml += rowTemplate;
				$("#signTable tbody").html(tableHtml);
			}
			
			//删除行
			function delRow(_id) {
				var r=confirm("确认删除吗？");
				if (r==true) {
				//通知后台删除数据
				var deleteName = $("#tr_" + _id).find("td:eq(3)").text();	
				$.post("DeleteData",
	    				{	
	      					type:"sign",
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
		<div style="float: left; margin-left: 5%; margin-top: 20px">
			<table id="signTable" border="1" cellpadding="5px" cellspacing="0" width="1100">
				<tr style="background-color: gainsboro;">
					<th>序号</th>
					<th>考试等级</th>
					<th>考试科目</th>
					<th>考生学号</th>
					<th>考生姓名</th>
					<th>考生性别</th>
					<th>考生年龄</th>
					<th>考生电话</th>
					<th>身份证号</th>
					<th>所在院系</th>
					<th>操作</th>
				</tr>
			</table>
			<p id="del" style="color: red; display: none; margin-top: 20px">删除失败</p>
		</div>
	</body>
</html>
