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
	
String accno = request.getParameter("accno");
String amount = request.getParameter("amount");
String walletid = request.getParameter("walletid");
String email = request.getParameter("email");
String status;
Connection con;
CallableStatement cst;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	cst=con.prepareCall("{call trans(?,?,?,?,?)}");
	cst.setString(1, walletid);
	cst.setString(2, walletid);
	cst.setString(3, "self");
	cst.setString(4,amount);
	cst.setString(5,email);
	cst.execute();
	status="Money Added Successfully to wallet....";
	sendemail eml= new sendemail("Crown Digital Wallet","Add Money to Wallet",amount+" is added successfully to wallet....",email);
	response.sendRedirect("customerprocess.jsp?type=addmoneystatus&status="+status);
	con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>