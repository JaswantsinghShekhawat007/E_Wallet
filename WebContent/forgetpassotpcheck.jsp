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
 <title>New Password</title>
<script language="Javascript" type="text/javascript">
function verifypassword() {
	 pw = document.frm.pswd.value;
	 cpw = document.frm.cnfpswd.value; 
	 if (pw != cpw) {
		 
		 alert("Password doesn't match..");
			return false;
	}
	 else{
		 return true;
	}
}

</script>
</head>
<body>
 <div class="container-fluid navbar-padding-remove">
        <!-- Nav Bar -->

        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand ml-md-5" href="">Crown</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse show" id="navbarTogglerDemo02">
                <ul class="navbar-nav ml-auto mr-md-3">
                    <li class="nav-item navbar-text mt-2">
                        <a class="nav-link" href="Regiform.jsp">Register</a>
                    </li>
                    <li class="nav-item navbar-text mt-2">
                        <a class="nav-link" href="index.jsp">Login</a>
                    </li>
           
                </ul>
            </div>
        </nav>
    </div>
        
<%
String oriotp=request.getParameter("oriotp");
String otp=request.getParameter("otp");
String userid=request.getParameter("userid");
if(oriotp.equals(otp))
{
	%>
	<div class="container mt-5">
        <div class="transfermoney-container">
            <div class="  d-flex justify-content-center">
                <h3 class="heading">Reset Password</h3>
            </div>
            <hr>


            <form name="frm" method="post" action="ForgetPasswordStatus.jsp" onsubmit="return verifypassword()">
                
                <div class="form-group ml-2 mr-2">
                    <label for="exampleFormControlFile1"> New Password</label>
                    <input  type="password" name="pswd" required autocomplete="off" class="form-control" id="exampleFormControlFile1" >
                    <input type="hidden" name="userid" value=<%=userid %> />
                  </div>
                  <div class="form-group ml-2 mr-2">
                    <label for="exampleFormControlFile1"> Confirm Password</label>
                    <input class="form-control" id="exampleFormControlFile1" type="password" name="cnfpswd" required autocomplete="off" >
                  </div>
                  
                <button type="submit" class="btn btn-primary btn-md ml-2 mb-2 btn-custom ">Submit</button>
            </form>
        </div>
    </div>
	<%
	
}
else
{
	response.sendRedirect("Failure.jsp?status=regotpwrong");
}
%>
</body>
</html>