<%@page import="mybeans.sendemail"%>
<%@page import="mybeans.OtpGenerate"%>
<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
        integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
        crossorigin="anonymous" />
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
<title>OTP Verification</title>
</head>
<body>
<%if(session.getAttribute("userid")!=null)
{
String bnm = request.getParameter("bnm");
String accno = request.getParameter("accno");
String accnm = request.getParameter("accnm");
String userid=String.valueOf(session.getAttribute("userid"));
String email;
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from usersdata where userid=?;");
	pst.setString(1,userid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		email=rs.getString("email");
		pst=con.prepareStatement("select * from bankaccount where accountno=? and bankname=? and name=? and email=?;");
		pst.setString(1, accno);
		pst.setString(2, bnm);
		pst.setString(3, accnm);
		pst.setString(4,email);
		rs=pst.executeQuery();
		if(rs.next())
		{
			char[] s= OtpGenerate.generateOTP(6);
			String otp=String.valueOf(s);
			sendemail eml= new sendemail("Crown Digital Wallet","Verify Email","OTP is "+otp,email);
			%>
			
			<h2>Verification form</h2>
 <div class="container">
        <form name="frm" method="post" action="Checkotpbankcust.jsp">
            <div class="form-group mt-5">
                
              <label for="OTPid">Enter OTP</label>
              <input type="text" class="form-control" id="OTPid" name="otp" aria-describedby="OTPhelp" autocomplete="off" required>
              <input type="hidden" name="email" value="<%=email%>">
<input type="hidden" name="accno" value="<%=accno%>">
<input type="hidden" name="oriotp" value="<%=otp%>">
              <small id="OTPhelp" class="form-text text-muted">Enter OTP sended on registered email.</small>
            </div>
            
                <button type="submit" class="btn btn-primary">Submit</button>

            
            
          </form>


      </div>
			
			<%
		}
		else
		{
		%>
		Their is no such account link with <%=email %> and Given Details...
		<%	
		}
		
	}
	else
	{
		%>Their is Something Wrong....<%
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