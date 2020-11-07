<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>职员管理系统</title>
<%
	pageContext.setAttribute("Funs_Path", request.getContextPath());
%>
<!-- 引入jquery -->
<script type="text/javascript"
	src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js">
	
</script>
<!-- 引入样式 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Lato, Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.72222;
	color: #fff;
	background-color: #fff;
}

.text-white {
	color: #fff;
}

.wrap {
	min-width: 100%;
	position: absolute;
	background: #f8f8f8 bottom;
	min-height: 100%;
	overflow: hidden;
}

.left {
	margin-left: 0px;
	position: absolute;
	box-sizing: border-box;
	width: 200px;
	height: 100%;
	background: #4d5e70 bottom;
}

.logoDiv {
	padding-top: 20px;
	padding-bottom: 20px;
	height: 70px;
	background-color: #354457;
	font-size: 17px;
	color: #fff;
	vertical-align: bottom;
}

.logoTitle {
	margin-left: 15px;
	line-height: 1.7;
}

.menu-title {
	margin-left: 15px;
	color: #828e9a;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 14px;
	font-weight: bold;
}

.menu-item {
	padding-left: 15px;
	line-height: 40px;
	height: 40px;
	color: #aab1b7;
	cursor: pointer;
}

.menu-item-active {
	background-color: #3d4e60;
	border-right: 4px solid #647f9d;
	color: #fff;
}

.right {
	box-sizing: border-box;
	float: left;
	box-sizing: border-box;
	padding-left: 200px;
	overflow-y: overlay;
	overflow-x: hidden;
	clear: both;
	color: #717592;
	min-width: 100%;
	min-height: 500px;
}
</style>
</head>
<body>
	<div class="wrap">
		<!-- 左边内容 -->
		<div id="left" class="left">
			<div id="logoDiv" class="logoDiv">
				<p id="logoTitle" class="logoTitle">
					<img id="logo" alt="funsLogo" src="images/funsicon.jpg"
						style="height: 28px; padding-right: 5px; vertical-align: middle;">
					<span style="font-size: 18px;">职员管理系统</span>
				</p>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li><a class="text-white" href="${Funs_Path}/emplist">职员信息</a></li>
				<li><a class="text-white" href="${Funs_Path}/deptlist">部门信息</a></li>
			</ul>
		</div>
		<!-- 右边内容 -->
		<div id="right" class="tab-content right">
			<nav class="navbar navbar-default" role="navigation">
				<div class="container-fluid">
					<ul class="nav navbar-nav navbar-right">
						<li><a><span class="glyphicon glyphicon-user"></span>
								${sessionScope.LoginUser}</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
								退出</a></li>
					</ul>
				</div>
			</nav>
			<div>
			<h1>该功能板块暂未开发</h1>
			</div>
		</div>
	</div>
</body>
</html>