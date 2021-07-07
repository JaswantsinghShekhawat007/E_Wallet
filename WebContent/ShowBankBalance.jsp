<%@page import="mybeans.BankDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userid= String.valueOf(session.getAttribute("userid"));
if(userid != null)
{
BankDetails bd = new BankDetails();
bd.setUserid(userid);
%>
<%=bd.getBalance() %>
<% 
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>