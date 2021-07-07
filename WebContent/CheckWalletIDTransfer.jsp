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

String destwalletid=request.getParameter("destwalletid");
Connection con;
PreparedStatement pst;
ResultSet rs,rs1;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from usersdata where walletid=?;");
	pst.setString(1,destwalletid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		%>
		<input type="hidden" name="result" value='true'  />
		Transfering to <%=rs.getString("name")%><%
	}
	else
	{
		%><input type="hidden" name="result" value='false'  />
		Their is no such Wallet Exist with <%=destwalletid%> walletid Plz Check......<%
	}
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>