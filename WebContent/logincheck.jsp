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
String userid = request.getParameter("userid");
String pswd = request.getParameter("pswd");
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from userlogin where userid=? and pswd=?;");
	pst.setString(1,userid);
	pst.setString(2,pswd);
	rs=pst.executeQuery();
	if(rs.next())
	{
		if(rs.getString("loginstatus").equals("active"))
		{
		session.setAttribute("userid", userid);
		if(rs.getString("usertype").equals("customer"))
		{
		if(rs.getString("profilestatus").equals("completed"))
		{
			response.sendRedirect("CustomerHome.jsp");
		}
		else
		{
			response.sendRedirect("uploadProfileCust.jsp");
		}
		}
		else if(rs.getString("usertype").equals("admin"))
		{
			response.sendRedirect("AdminHome.jsp");
		}
		else if(rs.getString("usertype").equals("company"))
		{
			response.sendRedirect("CompanyHome.jsp");
		}
		}
		else
		{
			response.sendRedirect("Failure.jsp?status=logininactive");
		}
		
	}
	else
	{
		response.sendRedirect("Failure.jsp?status=accdoesntexist");
	}
	con.close();
}
catch(Exception e)
{
out.println(e.getMessage());
}

%>
</body>
</html>