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
			
			var rowCount, college, name, pwd;
			
			//页面加载完成，初始化表格
			window.onload=function(){
					// 从后台获取的json对象
					$.post("GetAllData",
	    				{	
	      					type:"college"
	    				},
	    				function(data,status){
	    					if(status == "success") {
	    						// 遍历对象
								for(var i = 0; i < data.length; i++) {
									college = data[i].college;
									name = data[i].name;
									pwd = data[i].pwd;
									addRow();
								}
	    					}
	    				},"json");
			};

			//添加行
			function addRow() {
				//最后一行第一列
				var last = $("#collegeTable tr:last").find("td:eq(0)").text();
				//序号递增
				if (last != "序号") {
					rowCount = ++last;
				} else {
					rowCount = 1;
				}
				var rowTemplate = '<tr class="mTr" id="tr_' + rowCount + '">' + 
					'<td class="mTd">' + rowCount + '</td>' + 
					'<td>' + college + '</td>' + 
					'<td>' + name + '</td>' + 
					'<td>' + pwd + '</td>' + 
					'<td class="mTd"><button style="margin-right: 15px" onclick=editRow(' + rowCount + ')>编辑</button><button onclick=delRow(' + rowCount + ')>删除</button></td></tr>';
				var tableHtml = $("#collegeTable tbody").html();
				tableHtml += rowTemplate;
				$("#collegeTable tbody").html(tableHtml);
			}
			
			//编辑行
			function editRow(_id) {
				parent.editCollege = $("#tr_" + _id).find("td:eq(1)").text();
				parent.editName = $("#tr_" + _id).find("td:eq(2)").text();	
				parent.editPwd = $("#tr_" + _id).find("td:eq(3)").text();
				$("#myiframe", window.parent.document).attr("src", "my/edit_college.jsp");
			}
			
			//删除行
			function delRow(_id) {
				//删除提示
				var r=confirm("确认删除吗？");
				if (r==true) {
					//通知后台删除数据
					var deleteName = $("#tr_" + _id).find("td:eq(2)").text();	
					$.post("DeleteData",
		    				{	
		      					type:"college",
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
			
			$(document).ready(function(){
					
				$("#addTr").click(function(){
					$("#bg").show();
					$("#dialog").show();
				});
				
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
					$.post("AddCollege",
	    				{	college:college,
	      					name:name,
	      					pwd:pwd
	    				},
	    				function(data,status){
	    					var resp = data.res;
	    					if(status == "success") {
	    						if(resp == "1") {
	    							$("#bg").hide();
									$("#dialog").hide();
									addRow();
	    						} else if (resp == "0") {
	    							$("#des").show().text("添加院系管理员失败");
	    						} else if (resp == "2") {
	    							$("#des").show().text("账号已存在");
	    						}
	    					} else {
	    						$("#des").show().text("添加院系管理员失败");
	    					}
	    				},"json");
				});
				
				$("#cancle").click(function(){
					$("#bg").hide();
					$("#dialog").hide();
				});
				
				$("#name").click(function(){
					$("#des").hide();
					$("#imgName").hide();
				});
				
				$("#pwd").click(function(){
					$("#des").hide();
					$("#imgPwd").hide();
				});
				
				$("#col").click(function(){
					$("#des").hide();
				});
			});
			
		</script>
	</head>

	<body style="margin: 0px; padding: 0px;">
		<div style="float: left; margin-left: 15%; margin-top: 20px">
			<table id="collegeTable" border="1" cellpadding="5px" cellspacing="0" width="800">
				<tr style="background-color: gainsboro;">
					<th>序号</th>
					<th>院系名称</th>
					<th>管理员账号</th>
					<th>管理员密码</th>
					<th>操作</th>
				</tr>
			</table>
			<input id="addTr" type="button" value="添加院系管理员" style="margin-top: 20px"/>
			<p id="del" style="color: red; display: none">删除失败</p>
		</div>
		<div id="bg" style="display: none; width: 100%; height: 100%; background-color: #292421; opacity: 0.5; position: absolute; float: left;"></div>
		<div id="dialog" align="left" style="display: none; float: left; width: 400px; height: 300px; background-color: antiquewhite; position: absolute; margin-left: 30%; margin-top: 10%; padding-left: 10%">
			<table cellspacing="5px" cellpadding="5px">
				<tr><th>添加院系</th></tr>
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
					<td>密码：<input type="password" id="pwd"/></td>
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
