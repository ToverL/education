<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="80%" border="1">
		<caption>班主任信息</caption>
		<tr>
			<td>序号</td>
			<td>姓名</td>
			<td>类型</td>
			<td>状态</td>
			<td>备注</td>
		</tr>

	  	<c:forEach items="${list}" var="guide" varStatus="state">
			<tr>
				<td>${state.count}</td>
				<td>${guide.name }</td>
				<td>${guide.type}</td>
				<td>${guide.state }</td>
				<td>${guide.comment }</td>
			</tr>

		</c:forEach>

	</table>
</body>
</html>