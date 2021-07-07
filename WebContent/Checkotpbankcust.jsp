<%@page import="mybeans.sendemail"%>
<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.*"%>
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
if(session.getAttribute("userid")!=null)
{
String oriotp = request.getParameter("oriotp");
String otp = request.getParameter("otp");
String accno = request.getParameter("accno");
if(oriotp.equals(otp))
{

Connection con;
PreparedStatement pst;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("update usersdata set bankaccount=? where userid=?;");
	pst.setString(1, accno);
	pst.setString(2, String.valueOf(session.getAttribute("userid")));
	pst.executeUpdate();
	con.close();
	sendemail eml= new sendemail("Crown Digital Wallet","Bank Link Status","Your Wallet is successfully linked with your Account",request.getParameter("email"));
	response.sendRedirect("customerprocess.jsp?type=addmoney");
}
catch(Exception e)
{
	System.out.println(e);
}
}
else
{
	%> You Have Entered Wrong OTP....<br>
	
	<%
}
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>