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

		//加载学校
		$("#schoolId").load("../school/getAllforJson", {
			schoolId :${paramMap.schoolId==null?0:paramMap.schoolId}
		}, function() {
			$(this).html("<option value='0'>全部</option>" + $(this).html());
		});

		
		//日期赋初值
		
		$("#btn_query").click(function(){
			//判断学生和班级
			var className = $("#className").val();
	//		alert($.trim(className).length);
			if ($.trim(className).length==0) {
				$("#className").prop("disabled", true);
				//	alert(sDate+"无效");
			}
			
			var stuName = $("#stuName").val();
			if ($.trim(stuName).length==0) {
				$("#stuName").prop("disabled", true);
				//	alert("无效");
			}
			$("form")[0].submit();
		});
		
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
			<td colspan="12">
				<!-- 班级，时间，学校，方向 -->
				<div>
					<form action="getAll" method="post">

						<div style="clear: both">
							<div style="float: left; width: 60px">学校</div>

							<div style="float: left; width: 200px">
								<select id="schoolId" name="schoolId"
									style="width: 200px; height: 22px;"></select>
							</div>

						</div>
						<div style="clear: both">
							<div style="float: left; width: 60px">班级名称：</div>
							<div style="float: left; width: 200px">
								<input type="text" name="className" id="className" style="width: 180px; "
									value="${param.className}" />
							</div>

						</div>

						<div style="clear: both">
							<div style="float: left; width: 60px">学生姓名：</div>
							<div style="float: left; width: 200px">
								<input type="text" name="stuName" id="stuName" style="width: 180px;" 
									value="${param.stuName}" />
							</div>
							<div>
								<input type="button" value="查询" id="btn_query">
							</div>

						</div>
					</form>
				</div>

			</td>
		</tr>



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
				<td><a href="getStudentById?studentId=${s.studentId}">详细信息</a>
					| <a href="viewStudentJobById?studentId=${s.studentId}">就业管理</a> |
					<a href="viewChangeStudent?studentId=${s.studentId}">学生转班</a></td>
			</tr>

		</c:forEach>
		
		
			<tr>
			<td colspan="12" style="border-style:none;border-width:0px;">
				<%@include file="../include/subPage.jsp" %>
			</td>
		</tr>

		<tr>
			<td colspan="12"><input type="button" value="增加新学生"
				onclick="window.open('addStudent','_self')"></td>
		</tr>

	</table>
	<div style="height:100px"></div>
</body>
</html>