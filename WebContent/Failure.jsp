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

    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
    integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
    crossorigin="anonymous" />
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<title>Failure</title>
<style>
        .fa-times-circle{
            color: red;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <a class="navbar-brand ml-md-5" href="#">Crown</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Regiform.jsp">Register</a>
                </li>
                <div class="signin">
                    <li class="nav-item ">
                        <a class="nav-link " data-toggle="modal" data-target="#exampleModal" href="#">Login</a>
                    </li>

                </div>


            </ul>
        </div>
    </nav>
     <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-times-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center">
<%
String status = request.getParameter("status");
if(status.equals("accdoesntexist"))
{
	%>
	UserID or password is Wrong...
	<%
}
else if(status.equals("sessionexpired"))
{
	%>
	Session is expired Please Login.....
	<%
}
else if(status.equals("regotpwrong"))
{
	%>
	Your OTP is Wrong...
	<%
}
else if(status.equals("forgetpassinvalid"))
{
	%>
	Invalid Details Please Check!!!
	<%
}
else if(status.equals("logininactive"))
{
	%>
	Please Contact Hepl Center Your Account is Deactivated!!!!
	<%
}
%>
</h3>                </div>
            </div>
          </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Login</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <form name="frm" method="post" action="logincheck.jsp">
                    <div class="form-group">
                      <label for="uid">User ID</label>
                      <input type="text" name="userid" class="form-control" id="uid" aria-describedby="emailHelp" placeholder="User ID" autocomplete="off" required="required">
                      
                    </div>
                    <div class="form-group">
                      <label for="psw">Password</label>
                      <input type="password" name="pswd" class="form-control" id="psw" placeholder="Password" autocomplete="off" required="required">
                    </div>
                    <div class="form-group">
                        <a href="ForgetPassword.jsp">Forgot Password</a>
                      </div>
                    
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              
            </div>
          </div>
        </div>
      </div>
</body>
</html>