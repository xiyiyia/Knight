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
	<script>
			$(document).ready(function(){
				$("#btnOk").click(function(){
					var ps=$('input:radio[name="payStyle"]:checked').val();
		            if(ps == null){
		                alert("请选择支付方式！");
		                return;
		            }
		            
		            var account = $("#account").val();
					var pwd = $("#pwd").val();
					if (account == "") {
						$("#imgA").show();
						return;
					}
					if (pwd == "") {
						$("#imgP").show();
						return;
					}
					
					$("#des").text("支付成功").show();
				})
				$("#account").click(function(){
						$("#imgA").hide();
						$("#des").hide();
					})
					
					$("#pwd").click(function(){
						$("#imgP").hide();
						$("#des").hide();
					})
			})
			
		</script>
	</head>
	<body style="padding-left: 30px; padding-top: 30px">
		<h3>报名费用：<font color="red">85￥</font></h3>
		<h3>缴费方式</h3>
		<div>
			<table border="0" cellspacing="5" cellpadding="5">
				<tr>
					<td><input type="radio" name="payStyle"/></td>
					<td><img src="image/yhk.jpg" /></td>
					<td><p>银行卡</p></td>
				</tr>
				<tr>
					<td><input type="radio" name="payStyle"/></td>
					<td><img src="image/zfb.jpg" /></td>
					<td><p>支付宝</p></td>
				</tr>
				<tr>
					<td><input type="radio" name="payStyle"/></td>
					<td><img src="image/wx.jpg" /></td>
					<td><p>微信</p></td>
				</tr>
			</table>
		</div>
		<table border="0" cellspacing="5" cellpadding="5">
			
			<tr>
				<td>支付账户：<input id="account" type="text"/></td>
				<td><img id="imgA" src="image/error25.png" style="display: none;"/></td>
			</tr>
			<tr>
				<td>支付密码：<input id="pwd" type="password"/></td>
				<td><img id="imgP" src="image/error25.png" style="display: none;"/></td>
			</tr>
			<tr><td colspan="2"><button id="btnOk">确认支付</button></td></tr>
			<tr><td colspan="2"><p id="des" style="color: red; display: none;">缴费成功</p></td></tr>
		</table>
	</body>
</html>
