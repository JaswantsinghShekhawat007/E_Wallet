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
String email = request.getParameter("email"); 
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	if(email == null)
	{
	pst=con.prepareStatement("select * from usersdata where userid=?;");
	pst.setString(1,userid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		%>
		This UserID already exist please change....
		<%
		
	}
	}
	if(userid == null)
	{
		pst=con.prepareStatement("select * from usersdata where email=?;");
		pst.setString(1,email);
		rs=pst.executeQuery();
		if(rs.next())
		{
			%>
			This Email already exist please change....
			<%
			
		}
	}
	
	con.close();
}
catch(Exception e)
{
out.println(e);
}

%>
</body>
</html>