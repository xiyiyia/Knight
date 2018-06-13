<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'student.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
			body {
				margin-top:20px;
				line-height:1.5;
			}
		</style>
	</head>
	<body>
		<ul>
			<br />
			<li>考生网上填报。准备本人近期正面免冠半身彩色证件照（规格：浅蓝色背景；成像区大小为48mm×36mm<高×宽>，要求上下方向：头部以上空1/10，头颈部占7/10，肩身部占2/10；左右方向：肩身部左右各空1/10；图像像素最小为192×144<高×宽>，图像文件为.jpg格式，文件大小在20KB-200KB之间。不得使用生活照！），在任意一台互联网终端（电脑、PAD、手机等）均可完成填报操作。</li>
			<br />
			<li>考生网上缴费。考生等待考点24小时之内审核通过后上网缴纳考试费即可。</li>
			<br />
			<li>生成打印准考证。考生用报名账号登录报名网站即可完成该操作。</li>
		</ul>
  </body>
</html>
