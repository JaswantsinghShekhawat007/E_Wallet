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
<%if(session.getAttribute("userid")!=null)
{ %>
  <div class="container mt-5">
        <form name="frm" method="post" action="AddBankOTPCust.jsp">
            <div class="form-group">
              <label for="bank-name">Bank name</label>
              <select class="form-control" id="bank-name" name="bnm" required>
<%

Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select bankname from bankaccount;");
	rs=pst.executeQuery();
	while(rs.next())
	{
		%><option value="<%=rs.getString("bankname")%>"><%=rs.getString("bankname")%></option><%
	}
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}

%>
 </select>
            </div>
            <div class="form-group">
              <label for="acno">Account Number</label>
              <input type="text" class="form-control" id="acno" name="accno" placeholder="Account number" autocomplete="off" required>
            </div>
            <div class="form-group">
                <label for="accnm">Account holder name</label>
                <input type="text" class="form-control" name="accnm" id="accnm" aria-describedby="accHelp" placeholder="Name" autocomplete="off" required>
                <small id="accHelp" class="form-text text-muted">State name same as on bank passbook.</small>
              </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
       </div>
<%
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}%>
</body>
</html>