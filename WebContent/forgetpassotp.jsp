<%@page import="mybeans.sendemail"%>
<%@page import="mybeans.OtpGenerate"%>
<%@page import="com.sun.mail.iap.Response"%>
<%@page import="mybeans.CustomerDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Verify OTP</title>
</head>
<body>
<%
String userid=request.getParameter("userid");
String ques=request.getParameter("question");
String ans=request.getParameter("answer");
CustomerDetails cd = new CustomerDetails();
cd.setUserid(userid);
if(cd.getSecques().equals(ques) && cd.getSecans().equals(ans))
{
	char[] s= OtpGenerate.generateOTP(6);
	String otp=String.valueOf(s);
	sendemail eml= new sendemail("Crown Digital Wallet","Reset Password","OTP is "+otp,cd.getEmail());
	%>
	 <div class="container mt-5" >
        <form  name="frm" method="post" action="forgetpassotpcheck.jsp">
            <div class="form-group ">
              <input type="hidden" name="oriotp" value=<%=otp %> />
              <input type="hidden" name="userid" value=<%=userid %> />
              <label for="OTPid">Enter OTP</label>
              <input type="text" name="otp" class="form-control" id="OTPid" aria-describedby="OTPhelp" required>
              <small id="OTPhelp" class="form-text text-muted">Enter OTP sended on registered email.</small>
            </div>
            
                <button type="submit" class="btn btn-primary">Submit</button>

            
            
          </form>


      </div>
	
	<%
	
	
}
else
{
	response.sendRedirect("Failure.jsp?status=forgetpassinvalid");
}
%>
</body>
</html>