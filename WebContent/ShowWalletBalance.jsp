<%@page import="mybeans.CustomerDetails"%>
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
CustomerDetails cd = new CustomerDetails();
cd.setUserid(userid);
%>
<%=cd.getBalance() %>
<% 
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>