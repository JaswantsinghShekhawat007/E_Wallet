<%@page import="mybeans.sendemail"%>
<%@page import="mybeans.OtpGenerate"%>
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
try{
String email = request.getParameter("email");
char[] s= OtpGenerate.generateOTP(6);
String otp=String.valueOf(s);
sendemail eml= new sendemail("Crown Digital Wallet","Verify Email","OTP is "+otp,email);
%>

<input type="hidden" name="oriotp" value="<%=otp%>">
otp has been succesfully send to <%=email %>
<%
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
</html>