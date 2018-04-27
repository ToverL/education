<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/table.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/contentstyle.css" />
<style type="text/css">
td {
	color: #000000;
	font-size: 12px;
	background-color: "d3eaef"
}
</style>



<script type="text/javascript" src="../js/jquery11.js"></script>

<script type="text/javascript">
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
	<table width="98%" border="1" align="center">
		<caption>学生信息</caption>




		<tr>
			<td>序号</td>
			<td>学生姓名</td>
			<td>性别</td>
			<td>班级</td>
			<td>讲师</td>
			<td>教务班主任</td>
			<td>就业班主任</td>
			<td>学校</td>
			<td>学历</td>
			<td>状态</td>
			<td width="160">备注</td>
			<td>功能</td>
		</tr>

		<c:forEach items="${list}" var="s" varStatus="state">
			<tr>
				<td>${state.count}</td>
				<td>${s.name }</td>
				<td>${s.sex }</td>
				<td>${s.tclass.className}</td>
				<td>${s.teacher.name}</td>
				<td>${s.classGuide.name }</td>
				<td>${s.jobGuide.name }</td>
				<td>${s.school.name }</td>
				<td>${s.degree.stateName }</td>
				<td>${s.state.stateName }</td>
				<td>${s.comment}</td>
				<td><a href="../student/getStudentById?studentId=${s.studentId}">详细信息</a>
					| <a href="../student/viewStudentJobById?flag=class&studentId=${s.studentId}">就业管理</a> |
					<a href="../student/viewChangeStudent?flag=class&studentId=${s.studentId}">学生转班</a></td>
			</tr>

		</c:forEach>
		
		


		<tr>
			<td colspan="12"><input type="button" value="增加新学生"
				onclick="window.open('../student/addStudent','_self')"></td>
		</tr>

	</table>
	<div style="height:100px"></div>
</body>
</html>