<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="../js/jquery11.js"></script>

<script type="text/javascript">

</script>

<link href="../css/table.css" rel="stylesheet" type="text/css">

</head>
<body>
	<form action="save" method="post">
		<table border="1" align="center">
			<caption>学校信息管理</caption>
			<tr>
				<td>学校名称</td>
				<td><input type="text" name="name"></td>
			<tr>			
			<tr>
				<td>备注</td>
				<td><textarea name="comment" rows="4" cols="20"></textarea></td>
			<tr>
			
			<tr align="right">
				<td colspan="2"><input type="submit" value="创建"></td>
			<tr>
		</table>

	</form>
</body>
</html>