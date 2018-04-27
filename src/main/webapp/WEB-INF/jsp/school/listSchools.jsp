<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/contentstyle.css" />
<style type="text/css">
tr {
	color: #000000;
	font-size: 12px;
	background-color: #eeeeee;
	text-align: center;
}

.tr_title {
	background-color: #d3eaef;
	color: #000000;
	font-size: 12;
}

body {
	background-color: #f3f3f3;
}

table {
	border-collapse: collapse;
	border-style: solid;
}

td, table {
	border-color: #1243FF;
}
</style>

<script type="text/javascript" src="../js/jquery11.js"></script>

<script>
	$(function() {

		$("tr:not(.tr_title)").hover(function() {
			//	alert("sss");
			$(this).css("background-color", "#dddddd");
		}, function() {
			$(this).css("background-color", "#eeeeee");
		});

	});
</script>
</head>
<body>
	<table width="80%" align="center" border=1>
		<caption>班级信息</caption>
		<tr class="tr_title">
			<td>序号</td>
			<td>学校姓名</td>
			<td>备注</td>
		</tr>

		<c:forEach items="${list}" var="s" varStatus="state">
			<tr>
				<td>${state.count}</td>
				<td style="text-align: left">${s.name}</td>
				<td style="text-align: left">${s.comment}</td>
			</tr>

		</c:forEach>

		<tr>
			<td style="text-align: left" colspan="11"><input type="button"
				value="增加新学校" onclick="window.open('addSchool','_self')"></td>
		</tr>

	</table>
	<div style="height:80px"></div>
</body>
</html>