<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.*"%>
<%@page import="mybeans.WalletID_genrator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Viewing KYC</title>
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
	
%>
<%=String.valueOf(session.getAttribute("userid")) %>
<% String userid = request.getParameter("usrid"); %>

<%
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from usersdata where userid=?");
	pst.setString(1,userid);
	
	rs=pst.executeQuery();
	if(rs.next())
	{
	String Wid = rs.getString("walletid");
	%>
	<h3> uploads<%=Wid%>profile.png </h3>
	<p>
	<a href="uploads/<%=Wid %>aadhar.png" target="_blank">view aadhar</a>	<br>
	<a href="uploads/<%=Wid %>profile.png" target="_blank">view Profile</a>
	</p>
	<a href="AdminHome.jsp">Home</a>
	<% 
	
	}
	else{
	
	response.sendRedirect("Failureadmin.jsp?status=notfound");
	
	}
	
	
	
	%>
	
	<% 
	
	
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