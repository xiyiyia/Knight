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
				padding-right: 25px;
				padding-left: 25px;
				line-height:1.5;
			}
		</style>
	</head>
	<body>
		<p>各位考生：</p>
		<p>2018年3月全国计算机等级考试（NCRE）全省统一网上报名工作定于2016年12月13日开始。本次报名按照考生网上填报、考点网上审核、考生网上缴费、网上打印准考证、现场熟悉考试环境的步骤进行。现将有关安排通知如下：</p>
		<dl>
			<dt>一、报名时间</dt>
			<dt> 2016年12月13日—2017年1月7日。</dt>
			<br />
			<dt>二、报名网站</dt>
			<dt>报名网站地址为http://ncre.gs.edu.cn</dt>
			<br />
			<dt>三、网上缴费时间</dt>
			<dt>2017年12月13日—2018年2月17日</dt>
			<br />
			<dt> 四、网上准考证打印时间</dt>
			<dt>2018年3月10日—24日</dt>
			<br />
			<dt>五、网报要求</dt>
			<dd>1．考生首次报考，须注册登录账号。一旦获得账号，以后可以长期使用。如需修改账号密码或个人注册信息，可登录ETEST通行证(网址：http://passport.etest.net.cn/register)进行管理。务必妥善保存好本人账号及密码，每次账号登录完成操作后，须及时退出，以防泄密带来不必要的损失。</dd>
			<dd>2．每次考试每个考生只能在一个考点报考，并且可报考多个级别科目(最多3科)，但不能重复报考同一科目。</dd>
			<dd>3．我校学生只能在我校考点报考，在其他考点报名无效。</dd>
			<dd>4．关键报考信息和考生照片只能由考生本人通过网络在报名前台填报，在校生个人基本信息以学籍库为准，不允许修改，如确有错误，考生应通过考点上报甘肃省教育考试院修正后重报。</dd>
			<dd>5．提交审核申请前，考生可以自行修正本人报考信息；提交审核申请缴费前，须经考点确认未通过审核后，考生方可修正本人报考信息。一旦网上缴费成功，考生即无权再行修改本人报考信息。</dd>
			<dd>6．网上缴费通过第三方支付平台——首信易支付进行，根据《甘肃省财政厅关于对教育考试院相关非学历考试收费分成的批复》（甘财教[2015]199号），我省NCRE考试收费标准为每人每科次100元，不向考生额外收取手续费。</dd>
			<dd>7．编排考场后，考生方可在规定时间内生成打印准考证。</dd>
		</dl>
  </body>
</html>
