<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文�档</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/chili-1.7.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.dimensions.js"></script>
<script type="text/javascript" src="js/jquery.accordion.js"></script>
<script language="javascript">
	jQuery().ready(function() {
		jQuery('#navigation').accordion({
			header : '.head',
			navigation1 : true,
			event : 'click',
			fillSpace : true,
			animated : 'bounceslide'
		});
	});
</script>
<style type="text/css">
<!--
body {
	margin: 0px;
	padding: 0px;
	font-size: 12px;
}

#navigation {
	margin: 0px;
	padding: 0px;
	width: 147px;
}

#navigation a.head {
	cursor: pointer;
	background: url(images/main_34.gif) no-repeat scroll;
	display: block;
	font-weight: bold;
	margin: 0px;
	padding: 5px 0 5px;
	text-align: center;
	font-size: 12px;
	text-decoration: none;
}

#navigation ul {
	border-width: 0px;
	margin: 0px;
	padding: 0px;
	text-indent: 0px;
}

#navigation li {
	list-style: none;
	display: inline;
}

#navigation li li a {
	display: block;
	font-size: 12px;
	text-decoration: none;
	text-align: center;
	padding: 3px;
}

#navigation li li a:hover {
	background: url(images/tab_bg.gif) repeat-x;
	border: solid 1px #adb9c2;
}
-->
</style>
</head>
<body>
	<div style="height: 100%;">
		<ul id="navigation">
			<li><a class="head">班级管理</a>
				<ul>
					<li><a href="class/getAll" target="rightFrame">班级管理</a></li>
					<li><a href="class/addClass" target="rightFrame">创建班级</a></li>
					<!--right-->
				</ul></li>
			<li><a class="head">学生管理</a>
				<ul>
					<li><a href="student/getAll" target="rightFrame">学生列表</a></li>
					<li><a href="student/addStudent" target="rightFrame">增加学生</a></li>
					
				</ul></li>
			<li><a class="head">就业管理</a>
				<ul>
					<li><a href="student/listStudentJob" target="rightFrame">就业统计</a></li>
				</ul></li>
			<li><a class="head">基本信息管理</a>
				<ul>
					<li><a href="school/getAll" target="rightFrame">学校管理</a></li>
					<li><a href="school/addSchool" target="rightFrame">增加学校</a></li>
				</ul></li>
			<li><a class="head">版本信息</a>
				<ul>
					<li><a href="http://www.oraclewdp-china.com/" target="_blank">by
							华育兴业</a></li>
				</ul></li>
		</ul>
	</div>
</body>
</html>