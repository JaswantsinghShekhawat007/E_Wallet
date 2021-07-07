<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Login Form</h2>
<hr>
<form name="frm" method="post" action="logincheck.jsp">
<table>
<tr>
<td>UserID </td>
<td><input type="text" name="userid" required></td>
</tr>
<tr>
<td>Password </td>
<td><input type="password" name="pswd" required></td>
</tr>
<tr>
<td><input type="submit" value="Submit"></td>
</tr> 
</table>
</form>
</body>
</html>