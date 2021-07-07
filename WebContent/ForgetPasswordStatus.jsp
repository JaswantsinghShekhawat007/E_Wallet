<%@page import="mybeans.sendemail"%>
<%@page import="mybeans.CustomerDetails"%>
<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
    integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
    crossorigin="anonymous" />
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <title>Status</title>
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
String userid=request.getParameter("userid");
String pswd=request.getParameter("pswd");
Connection con;
PreparedStatement pst;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("update userlogin set pswd=? where userid=?;");
	pst.setString(1,pswd);
	pst.setString(2,userid);
	int i=pst.executeUpdate();
	if(i>0)
	{
		CustomerDetails cd = new CustomerDetails();
		cd.setUserid(userid);
		sendemail eml= new sendemail("Crown Digital Wallet","Reset Password","New Password Set Successfully...",cd.getEmail());
		%> 
		  <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-check-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center">Password Reset successfully </h3>                </div>
            </div>
          </div>

		<%
	}
	else
	{
		%>Their is something wrong..<%
	}
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
%>
</body>
</html>