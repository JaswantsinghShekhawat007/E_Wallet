<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
	
%>
<h5>Admin Home</h5>
<%=String.valueOf(session.getAttribute("userid")) %>
<hr>

//Viewing KYC 

<h3>Have A Look At KYC Documents</h3>

<form name="frm" method="post" action="View_KYC.jsp">

<table>

<tr>
<td> Enter UserID </td>
<td><input type="text" name="usrid" required autocomplete="off"></td>
</tr>

<tr>
<td><input type="submit" value="View KYC"></td>
</tr>
 
</table>
</form>
<hr>
<h3>Have A Look At Company Documents</h3>
//view company documents
<form name="frm" method="post" action="View_logo.jsp">

<table>

<tr>
<td> Enter UserID </td>
<td><input type="text" name="usrid" required autocomplete="off"></td>
</tr>

<tr>
<td><input type="submit" value="View Docs"></td>
</tr>
 
</table>
</form>
<hr>

// Adding Payment Company

<h3> Add Company </h3>
<h6>You Will Be Redirected To New Page</h6>

<a href="Regiform_Company.jsp">Add Payment Company</a>
<hr>

<%
Connection con;
PreparedStatement pst;
ResultSet rs;
try{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select count(*) as cou from usersdata where dt=Now();");
	rs=pst.executeQuery();
	rs.next();
	%>Total <%=rs.getString("cou")%> Joined Today!!!!<br><%
	pst=con.prepareStatement("select sum(amount) as total,count(*) as cou from acctransactions where transdt=Now();");
	rs=pst.executeQuery();
	rs.next();
	%>Total <%=rs.getString("cou")%> transactions performed and Total Amount is <%=rs.getString("total")%>Rs.<%
	pst=con.prepareStatement("select sum(amount) as total,count(*) as cou from acctransactions where transdt=Now() and transactiontype='self';");
	rs=pst.executeQuery();
	rs.next();
	%>Total <%=rs.getString("cou")%> added Rs.<%=rs.getString("total") %> to wallet
	<%
	
}
catch(Exception e)
{
	System.out.println(e.getMessage());
		
}

%>
<hr>

// Activate / Deactivate User

<h3>Enter UserId That You Need To Activate or Deactivate</h3>

<form name="frm" method="post" action="ActivateDeactivate.jsp">
<table>

<tr>
<td> Enter UserID </td>
<td><input type="text" name="userid" required autocomplete="off"></td>
</tr>
<tr>
<td>Select Status</td>
<td>
<select name="act" >
  <option value="active">Active</option>
  <option value="deactive">Deactivate</option>
</select>
</td>
</tr>

<tr>
<td><input type="submit" value="Activate/Deactivate"></td>
</tr>
 
</table>
</form>

<hr>

<h3>Change Password of any user</h3>
<br>
<form name="frm" method="post" action="ChangePasswordAdmin.jsp">
<table>

<tr>
<td> Enter UserID </td>
<td><input type="text" name="userid" required autocomplete="off"></td>
</tr>
<tr>
<td>Password:</td>
<td>
<input type="password" name="pswd" required autocomplete="off">
</td>
</tr>

<tr>
<td><input type="submit" value="Change"></td>
</tr>
 
</table>
</form>





<a href="Logout.jsp">Logout</a>
<%}
else
{
	response.sendRedirect("Failureadmin.jsp?status=sessionexpired");
}%>
</body>
</html>