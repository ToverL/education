<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="saveGuide" method="post">
		姓          名 :<input type="text" name="name"><br/>
		班主任类型:<select name="type">
			<option value="1">教务班主任</option>
			<option value="2">就业班主任</option>
		</select><br/>
		备            注:<input type="text" name="comment"/><br/>
		<input type="submit" value="提交 "/>
	</form>
</body>
</html>