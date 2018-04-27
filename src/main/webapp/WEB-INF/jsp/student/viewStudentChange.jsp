<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
		$.get("../class/getActiveClassforGson?classId=${stu.tclass.classId}",
				function(data) {
					$("#classId").html(data);
					//	$("#classId").change();
				});
		//加载学校
		$("#schoolId").load(
				"../school/getAllforJson?schoolId=${stu.school.schoolId}");

		$("#teacherId").load(
				"../teacher/getAllforGson?teacherId=${stu.teacher.teacherId}");

		$("#classGuideId")
				.load(
						"../guide/getClassGuidesforGson?guideId=${stu.classGuide.guideId}");

		$("#jobGuideId").load(
				"../guide/getJobGuidesforGson?guideId=${stu.jobGuide.guideId}");

		$("#degree").load("../common/getStatesById", {
			type : 3,
			stateId : "${stu.degree.stateId}"
		});

		$("#stateId").load("../common/getStatesById", {
			type : 1,
			stateId : "${stu.state.stateId}"
		});

	});
</script>
<head>
<link href="../css/table.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="save" method="post">
		<input type="hidden" name="studentId" value="${stu.studentId}">
		<table border="1" align="center"
			style="background-color: silver; font-size: 6px; border: solid; border-width: 1px">
			<caption>学员信息管理</caption>
			<tr>
				<td colspan="6"><span style="color: #0000EE">学员基本信息</span></td>
			</tr>
			<tr>
				<td>学生姓名</td>
				<td><input type="text" name="name" value="${stu.name}"></td>

				<td>性别</td>
				<td><input type="radio" name="sex"
					${stu.sex=='男'?"checked='checked'":""} value="男">男<input
					type="radio" name="sex" value="女"
					${stu.sex=='女'?"checked='checked'":""}>女</td>
				<td>学历</td>
				<td><select name="degree.stateId" id="degree"
					style="width: 130px">
				</select></td>
			</tr>
			<tr>
				<td>身份证号</td>
				<td><input type="text" name="idcard" value="${stu.idcard}"></td>
				<td>班级</td>
				<td colspan="3"><select name="tclass.classId" id="classId"
					style="width: 130px">
				</select></td>


			</tr>
			<tr>
				<td>讲师</td>
				<td><select name="teacher.teacherId" id="teacherId"
					style="width: 130px"></select></td>
				<td>教务班主任</td>
				<td><select name="classGuide.guideId" id="classGuideId"
					style="width: 130px"></select></td>
				<td>就业班主任</td>
				<td><select name="jobGuide.guideId" id="jobGuideId"
					style="width: 130px"></select></td>

			</tr>
			<tr>
				<td>学校</td>
				<td><select name="school.schoolId" id="schoolId"
					style="width: 160px"></select></td>

				<td>专业</td>
				<td><input type="text" name="major" value="${stu.major}"></td>
				<td>年级</td>
				<td><input type="text" name="grade" value="${stu.grade}"></td>

			</tr>
			<tr>

				<td>联系电话</td>
				<td><input type="text" name="tel" value="${stu.tel}"></td>
				<td>父亲电话</td>
				<td><input type="text" name="ftel" value="${stu.ftel}"></td>

				<td>母亲电话</td>
				<td><input type="text" name="mtel" value="${stu.mtel}"></td>
			</tr>
			<tr>
				<td>家庭住址</td>
				<td><input type="text" name="address" value="${stu.address}"></input></td>
				<td>备注</td>
				<td><input type="text" name="comment" value="${stu.comment}"></input></td>
				<td>推荐就业方式</td>
				<td><input type="text" name="recommendTypeName"
					value="${stu.recommendType.stateName}"></input></td>
			</tr>


			<tr>
				<td colspan="6"><span style="color: #0000EE">就业信息</span></td>
			</tr>
			<tr>

				<td>学员状态</td>
				<td><select name="state.stateId" id="stateId"
					style="width: 130px">
				</select></td>
				<td>期望就业城市</td>
				<td><input type="text" name="intendCity"
					value="${stu.intendCity}"></td>

				<td>就业城市</td>
				<td><input type="text" name="workcity" value="${stu.workcity}"></td>

			</tr>

			<tr>

				<td>就业公司</td>
				<td><input type="text" name="company" value="${stu.company}"></td>

				<td>就业时间</td>
				<td colspan="3"><input type="text" name="worktime"
					value="${stu.worktime}"></td>



			</tr>
			<tr>

				<td>职位</td>
				<td><input type="text" name="job" value="${stu.job}"></td>
				<td>薪资情况</td>
				<td><input type="text" name="salary" value="${stu.salary}"></td>
				<td>年薪</td>
				<td><input type="text" name="salaryOfYear"
					value="${stu.salaryOfYear}"></td>
			<tr>
		</table>
	</form>
</body>
</html>