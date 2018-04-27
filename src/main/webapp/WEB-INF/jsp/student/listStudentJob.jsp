<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/table.css" rel="stylesheet" type="text/css">

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
		
		
		//加载学校
		$("#schoolId").load("../school/getAllforJson", {
			schoolId :${paramMap.schoolId==null?0:paramMap.schoolId}
		}, function() {
			$(this).html("<option value='0'>全部</option>" + $(this).html());
		});

		//加载方向
		$("#classTypeId").load("../common/getStatesById", {
			type : 5,
			stateId :${paramMap.classTypeId==null?0:paramMap.classTypeId}
		}, function() {
			$(this).html("<option value='0'>全部</option>" + $(this).html());
			$("#classTypeId").change();
		});

		//更新方向
		$("#classTypeId").change(function() {
			$.get("../class/getActiveClassforType", {
				typeId : $(this).val(),
				stateId :${paramMap.classId==null?0:paramMap.classId}
			}, function(data) {
				$("#classId").html("<option value='0'>全部</option>" + data);
			});
		});
		
		//日期赋初值
		

		$("#btn_query").click(function() {
			//判断日期是否无效
			var reg = /[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}/;
			var sDate = $("#startDate").val();
			if (!reg.test(sDate)) {
				$("#startDate").prop("disabled", true)
				//	alert(sDate+"无效");
			}
			if (!reg.test($("#endDate").val())) {
				$("#endDate").prop("disabled", true);
				//	alert("无效");
			}
			$("form")[0].submit();

		});
		
		
		
	});
</script>


</head>
<body>
	<table width="99%" border="1" align="center">
		<tr class="tr_title">
			<td colspan="15">
				<!-- 班级，时间，学校，方向 -->
				<div>
					<form action="getJobList" method="post">
						<div>
							<div style="float: left; width: 60px">方向：</div>
							<div style="float: left;">
								<select name="classTypeId" style="width: 120px; height: 22px;"
									id="classTypeId">
								</select>
							</div>
							<div style="float: left; width: 50px">班级：</div>
							<div style="float: left">
								<select name="classId" style="width: 120px; height: 22px;"
									id="classId">
								</select>
							</div>

						</div>



						<div style="clear: both">
							<div style="float: left; width: 60px">学校</div>

							<div style="float: left; width: 200px">
								<select id="schoolId" name="schoolId"
									style="width: 200px; height: 22px;"></select>
							</div>

						</div>

						<div style="clear: both">
							起始日期：<input type="text" name="startDate" id="startDate"
								value="${param.startDate}" /> 结束日期：<input type="text"
								name="endDate" id="endDate" value="${param.endDate}" /> <input
								type="button" value="查询" id="btn_query">
						</div>
					</form>
				</div>
			</td>
		</tr>
		<tr class="tr_title">
			<td>序号</td>
			<td>学生姓名</td>
			<td>性别</td>
			<td>班级</td>
			<td>讲师</td>
			<td>教务班主任</td>
			<td>就业班主任</td>
			<td>学校</td>
			<td>学历</td>
			<td>就业状态</td>
			<td>就业城市</td>
			<td>公司</td>
			<td>职位</td>
			<td>工资</td>
			<td>年薪</td>
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
				<td>${s.workcity}</td>
				<td>${s.company}</td>
				<td>${s.job}</td>
				<td>${s.salary}</td>
				<td>${s.salaryOfYear}</td>
			</tr>

		</c:forEach>

	</table>
	<table width="99%" border="1" align="center">
		<tr>
			<td colspan="11">就业统计</td>
		</tr>
		<tr>
			<td>总人数</td>
			<td>就业人数</td>
			<td>在读人数</td>
			<td>结课人数</td>
			<td>考研，专升本</td>
			<td>考公务员，当兵</td>
			<td>退学</td>
			<td>延迟就业</td>
			<td>转行</td>
			<td>未就业</td>
			<td>休学</td>
		</tr>

		<tr>
			<td>${jobMap.amount}</td>
			<td>${jobMap.job}</td>
			<td>${jobMap.doing}</td>
			<td>${jobMap.endclass}</td>
			<td>${jobMap.goonstudy}</td>
			<td>${jobMap.government}</td>
			<td>${jobMap.exitClass}</td>
			<td>${jobMap.delay}</td>
			<td>${jobMap.changeJob}</td>
			<td>${jobMap.unemployeement}</td>
			<td>${jobMap.absence}</td>
		</tr>


	</table>
	<table width="99%" border="1" align="center">
		<tr>
			<td colspan="11">就业统计</td>
		</tr>
		<tr>
			<td>平均工资:</td>
			<td>${jobMap.job!=0?jobMap.salary/jobMap.job:"无"}</td>
			<td>应就业人数(已就业人数+未就业+转行+结课):</td>
			<td>${jobMap.job+jobMap.unemployeement+jobMap.changeJob+jobMap.endclass}</td>
			<td>就业率:</td>
			<td>${(jobMap.job+jobMap.unemployeement+jobMap.changeJob)/(jobMap.job+jobMap.endclass)*100}%</td>
			
		</tr>
		<tr>
			<td colspan="11">
			<%@include file="../include/subPage.jsp" %>
			</td>
		</tr>
	</table>
	<div style="height: 100px;">
	</div>
</body>
</html>