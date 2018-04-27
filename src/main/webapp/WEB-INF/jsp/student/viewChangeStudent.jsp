<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
		$.get("../class/getActiveClassforGson?classId=${stu.tclass.classId}",
				function(data) {
					$("#fromClassId").html(data);
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

		$("#recommendTypeId").load("../common/getStatesById", {
			type : 2,
			stateId : "${stu.recommendType.stateId}"
		});
		
		//目标班级
		$("#toClassId").load(
		"../class/getActiveClassforGson?classId=${stu.tclass.classId}");
		
		
		$(".changeType").click(function(){
		//	alert($(this).val());
			var v=$(this).val();
			if(v==302 || v==303){
				
			//	$("#toClassId").attr("name","toClass.classId");
				$("#toClassId").prop("disabled",false);
			//	alert($("#toClassId").attr("name"));
			}else{
			//	$("#toClassId").attr("name","abc");
				$("#toClassId").prop("disabled",true);
			//	alert($("#toClassId").attr("name"));
			}
		});

	});
</script>

</head>
<body>
	<form action="changeStudent" method="post">
		<input type="hidden" name="student.studentId" value="${stu.studentId}">
		<input type="hidden" name="fromClass.classId" value="${stu.tclass.classId}">
		<input type="hidden" name="flag" value="${flag}">
		<table border="1" align="center"
			style="background-color: silver; font-size: 6px; border: solid; border-width: 1px">
			<caption>学员信息管理</caption>
			<tr>
				<td colspan="6"><span style="color: #0000EE">学员基本信息</span></td>
			</tr>
			<tr>
				<td>学生姓名</td>
				<td><input type="text" name="name" value="${stu.name}"
					readonly="readonly"></td>

				<td>性别</td>
				<td><input type="radio" name="sex"
					${stu.sex=='男'?"checked='checked'":""} value="男">男<input
					type="radio" name="sex" value="女"
					${stu.sex=='女'?"checked='checked'":""}>女</td>
				<td>学历</td>
				<td><select name="degree.stateId" id="degree"
					disabled="disabled" style="width: 100px">
				</select></td>
			</tr>
			<tr>
				<td>身份证号</td>
				<td><input type="text" name="idcard" value="${stu.idcard}"
					readonly="readonly"></td>
	

				<td>联系电话</td>
				<td colspan="3"><input type="text" name="tel" value="${stu.tel}"></td>

			</tr>

			<tr>
				<td>学校</td>
				<td><select name="school.schoolId" id="schoolId"
					disabled="disabled" style="width: 160px" style="color:black"></select></td>

				<td>专业</td>
				<td><input type="text" name="major" value="${stu.major}"
					readonly="readonly"></td>
				<td>年级</td>
				<td><input type="text" name="grade" value="${stu.grade}"
					readonly="readonly"></td>

			</tr>
			<tr>
				<td>讲师</td>
				<td><select name="teacher.teacherId" id="teacherId"
					disabled="disabled" style="width: 100px"></select></td>
				<td>教务班主任</td>
				<td><select name="classGuide.guideId" id="classGuideId"
					disabled="disabled" style="width: 100px"></select></td>
				<td>就业班主任</td>
				<td><select name="jobGuide.guideId" id="jobGuideId"
					disabled="disabled" style="width: 100px"></select></td>

			</tr>
			
			<tr>
				<td>原班级</td>
				<td colspan="5"><select name="classId" id="fromClassId"
					disabled="disabled" style="width: 100px">
				</select></td>

			</tr>


			<tr>
				<td colspan="6"><span style="color: #0000EE">就业信息</span></td>
			</tr>
			<tr>

				<td>学生变动类型</td>
	

				<td colspan="5">
					<input type="radio" value="302" class="changeType" name="changeType.stateId" checked="checked"/>转班
					<input type="radio" value="303" class="changeType" name="changeType.stateId"/>降班
					<input type="radio" value="304" class="changeType" name="changeType.stateId"/>休学
					<input type="radio" value="305" class="changeType" name="changeType.stateId"/>退学
					<input type="radio" value="306" class="changeType" name="changeType.stateId"/>结课
				</td>



			</tr>

			<tr>

				<td>转换后班级</td>
				
				<td><select name="toClass.classId" id="toClassId"
					 style="width: 100px">
				</select></td>
				<td>更新日期</td>
				<td colspan="3"><input type="text" name="exeDate" value='<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>' ></td>

			</tr>
			
			<tr>
				<td>备注说明</td>
				<td colspan="5"><textArea rows="3" cols="80" name="comment"></textArea></td>
			</tr>
			<tr>
				<td align="right" colspan="6"><input type="submit" value="更新学生信息" /></td>
			<tr>
		</table>
	</form>
</body>
</html>