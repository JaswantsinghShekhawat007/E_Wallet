<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password Admin</title>
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
	String userid=request.getParameter("userid");
	String pswd=request.getParameter("pswd");
	
Connection con;
PreparedStatement pst;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("update userlogin set pswd=? where userid=?;");
	pst.setString(1,pswd);
	pst.setString(2,userid);
	int i=pst.executeUpdate();
	if(i>0)
	{
		%>Password Change successfully!!!!<%
	}
	else
	{
		%>No Such Userid Exist please check!!!<%
	}
	
}
catch(Exception e)
{
	System.out.println(e.getMessage());
		
}
%>
<a href="AdminHome.jsp">Home</a>



<%}
else
{
	response.sendRedirect("Failureadmin.jsp?status=sessionexpired");
}%>
</body>
</html>