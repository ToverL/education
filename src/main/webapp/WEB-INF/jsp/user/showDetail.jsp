<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="../js/jquery11.js"></script>

<script type="text/javascript">
	$(function() {
		$("#btn_submit").click(function() {
			if ($("#password").val() == $("#repassword").val()) {
				$("form").submit();
			} else {
				alert("两次密码输入不一致,请重新输入");
			}
		});
	})
</script>

<link href="../css/table.css" rel="stylesheet" type="text/css">

</head>
<body>
	<form action="updatePassowrd" method="post">
		<input type="hidden" name="userNo" value="${user.userNo}" />
		<table border="1" align="center">
			<caption>用户信息</caption>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="userName" readonly
					value="${user.userName}"/></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input type="text" name="realName" readonly
					value="${user.realName}"/></td>
			</tr>
			<tr>
				<td>描述</td>
				<td><input type="text" name="comment" readonly
					value="${user.comment}"/></td>
			</tr>
			<tr>
				<td>角色</td>
				<td><input type="text" name="comment" readonly
					value="${user.role.roleName}"/></td>
			</tr>

			<tr align="right">
				<td colspan="2"><input type="button" value="修改" id="btn_submit"></td>
			</tr>
		</table>

	</form>
</body>
</html>