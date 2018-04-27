<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
caption{
	color: #ee0000;
	text-align: left;
	font-size: 8px;
}
</style>

<script type="text/javascript" src="../js/jquery11.js"></script>

<script type="text/javascript">
	$(function() {			
		$("#classTypeId").load("../common/getStatesById", {
			type : 5,
			stateId:${c.classType.stateId}
		});
		$("#teacherId").load("../teacher/getAllforGson",{teacherId:${c.teacher.teacherId}});
		$("#classGuideId").load("../guide/getClassGuidesforGson",{guideId:${c.classGuide.guideId}});
		$("#jobGuideId").load("../guide/getJobGuidesforGson",{guideId:${c.jobGuide.guideId}});	
	});
	
</script>

</head>
<body>
	<table border="1" width="98%" align="center">
		<caption>班级基本信息</caption>
		<tr>
			<td>班号</td>
			<td><input readonly="readonly" type="text" name="className"
				value="${c.className}"></td>
			<td>班级类型</td>
			<td align="left"><select name="classType.stateId"
				id="classTypeId" disabled="disabled" style="width: 100px">
			</select></td>
			<td>讲师</td>
			<td align="left"><select name="teacher.teacherId" id="teacherId"
				disabled="disabled" style="width: 100px"></select></td>
			<td>教务班主任</td>
			<td align="left"><select name="classGuide.guideId"
				id="classGuideId" disabled="disabled" style="width: 100px"></select></td>
		</tr>
		<tr>
			<td>就业班主任</td>
			<td align="left"><select name="jobGuide.guideId" id="jobGuideId"
				disabled="disabled" style="width: 100px"></select></td>
			<td>开班时间</td>
			<td><input type="text" name="createdDate"
				value="${c.createdDate}" readonly="readonly"></td>

			<td>结班时间</td>

			<td><input type="text" name="endDate"
				value='<fmt:formatDate  value="${c.endDate}" pattern="yyyy-MM-dd"/>'></td>

			<td>备注</td>
			<td><input type="text" name="comment" value="${c.comment}"
				readonly="readonly"></td>
		</tr>

	</table>

	<table border="1" width="98%" align="center">
		<caption>学员流动信息</caption>
		<tr>
			<td>开班人数</td>
			<td align="left"><input type="text" value="${detail.beginCount}"
				readonly="readonly"></td>
			<td>结班人数</td>
			<td align="left"><input type="text" value="${detail.endCount}"
				readonly="readonly"></td>

			<td>休学人数</td>
			<td align="left"><input type="text"
				value="${detail.blockingCount}" readonly="readonly"></td>
			<td>退学人数</td>
			<td align="left"><input type="text" value="${detail.exitCount}"
				readonly="readonly"></td>
		</tr>


		<tr>
			<td>转出人数</td>
			<td align="left"><input type="text"
				value="${detail.exportCount}" readonly="readonly"></td>
			<td>转入人数</td>
			<td align="left"><input type="text"
				value="${detail.importCount}" readonly="readonly"></td>

			<td>降班人数</td>
			<td align="left"><input type="text"
				value="${detail.fallOutCount}" readonly="readonly"></td>
			<td>降入人数</td>
			<td align="left"><input type="text"
				value="${detail.fallInCount}" readonly="readonly"></td>
		</tr>
	</table>

	<table border="1" width="98%" align="center">
		<caption>学员流转日志</caption>

		<tr>
			<td>序号</td>
			<td>时间</td>
			<td>学员姓名</td>
			<td>类型</td>
			<td>原班级</td>
			<td>转后班级</td>
			<td>说明</td>
		</tr>

		<c:forEach items="${list}" var="c" varStatus="state">
			<tr>
				<td>${state.count}</td>
				<td>${c.exeDate }</td>
				<td>${c.stuName }</td>
				<td>${c.changeType }</td>
				<td>${c.fromClassName }</td>
				<td>${c.toClassName }</td>
				<td>${c.comment }</td>
			</tr>
		</c:forEach>

	</table>
	
	
	
	<!-- 就业统计信息 -->
	
		<table width="98%" border="1" align="center">
		<caption>就业信息统计</caption>
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
			<td>${jobMap.jobAmount}</td>
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
	<table width="98%" border="1" align="center">
		<caption>就业率统计</caption>
		<tr>
			<td>平均工资:</td>
			<td>${jobMap.jobAmount!=0?jobMap.salary/jobMap.jobAmount:"无"}</td>
			<td>应就业人数(已就业人数+未就业+转行+结课):</td>
			<td>${jobMap.jobAmount+jobMap.unemployeement+jobMap.changeJob+jobMap.endclass}</td>
			<td>就业率:</td>
			<td>${(jobMap.jobAmount+jobMap.unemployeement+jobMap.changeJob)/(jobMap.jobAmount+jobMap.endclass)*100}%</td>			
		</tr>
	</table>
	
	<div style="height:50px"></div>

</body>
</html>