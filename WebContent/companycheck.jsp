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
	
%>
<%
String userid = request.getParameter("userid");

Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	
	pst=con.prepareStatement("select * from companydata where userid=?;");
	pst.setString(1,userid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		%>
		This UserID already exist please change....
		<%
		
	}
	
	
	
	con.close();
}
catch(Exception e)
{
out.println(e);
}

%>
<%}
else
{
	response.sendRedirect("Failureadmin.jsp?status=sessionexpired");
}%>
</body>
</html>