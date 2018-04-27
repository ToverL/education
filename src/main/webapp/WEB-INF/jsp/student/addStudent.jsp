<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../css/table.css" rel="stylesheet" type="text/css">

<style>
td {
	border-width: 1px;
	border-style: solid;
}
</style>

<script type="text/javascript" src="../js/jquery11.js"></script>

<script type="text/javascript">
	$(function() {
		//加载班级信息
		$.get("../class/getActiveClassforGson", function(data) {
			$("#classId").html(data);
			$("#classId").change();
		});
		//加载学校
		$("#schoolId").load("../school/getAllforJson");

		//班级连动
		$("#classId").change(function() {
			$("#classGuideId").load("../guide/getClassGuideByClass", {
				classId : $("#classId").val()
			});
			$("#jobGuideId").load("../guide/getJobGuideByClass", {
				classId : $("#classId").val()
			});
			$("#teacherId").load("../teacher/getTeacherByClass", {
				classId : $("#classId").val()
			});
			
			$("#degree").load("../common/getStatesById", {
				type : 3,
				stateId:36
			});
			
		});
	});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="save" method="post">
		<table border="1" align="center"
			style="background-color: silver; font-size: 6px; border: solid; border-width: 1px">
			<caption>学员信息管理</caption>
			<tr>
				<td>学生姓名</td>
				<td><input type="text" name="name"></td>

				<td>性别</td>
				<td><input type="radio" name="sex" checked="checked" value="男">男<input
					type="radio" name="sex" value="女">女</td>
			<tr>
			<tr>
				<td>学历</td>
				<td><select name="degree.stateId" id="degree" style="width: 100px">
				</select></td>
				<td>身份证号</td>
				<td><input type="text" name="idcard"></td>
			<tr>
			<tr>
				<td>班级</td>
				<td><select name="tclass.classId" id="classId"
					style="width: 100px">
				</select></td>
				<td>讲师</td>
				<td><select name="teacher.teacherId" id="teacherId"
					style="width: 100px"></select></td>
			<tr>
			<tr>
				<td>教务班主任</td>
				<td><select name="classGuide.guideId" id="classGuideId"
					style="width: 100px"></select></td>
				<td>就业班主任</td>
				<td><select name="jobGuide.guideId" id="jobGuideId"
					style="width: 100px"></select></td>
			<tr>
			<tr>
				<td>学校</td>
				<td><select name="school.schoolId" id="schoolId"
					style="width: 160px"></select></td>

				<td>专业</td>
				<td><input type="text" name="major"></td>
			<tr>
			<tr>
				<td>年级</td>
				<td><input type="text" name="grade"></td>

				<td>联系电话</td>
				<td><input type="text" name="tel"></td>
			<tr>
			<tr>
				<td>父亲电话</td>
				<td><input type="text" name="ftel"></td>

				<td>母亲电话</td>
				<td><input type="text" name="mtel"></td>
			<tr>
			<tr>
				<td>家庭住址</td>

				<td><textarea rows="4" cols="30" name="address"></textarea></td>
				<td>备注</td>
				<td><textarea rows="4" cols="30" name="comment"></textarea></td>
			<tr>
			<tr align="right">
				<td colspan="4"><input type="submit" value="创建"></td>
			<tr>
		</table>
	</form>
</body>
</html>