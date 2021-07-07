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
    <title>Profile Completion</title>
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
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
%>	

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
                        <a class="nav-link" href="Logout.jsp">Logout</a>
                    </li>
           
                </ul>
            </div>
        </nav>
    </div>
        


    <div class="container mt-5">
        <div class="transfermoney-container">
            <div class="  d-flex justify-content-center">
                <h3 class="heading">Complete Your KYC</h3>
            </div>
            <hr>


            <form method="post" action="UploadRegiCust.jsp" enctype="multipart/form-data">
                
                <div class="form-group ml-2 mr-2">
                    <label for="exampleFormControlFile1">Upload Your Profile photo</label>
                    <input type="file" id="myfile" name="myfile" required class="form-control-file" id="exampleFormControlFile1" >
                  </div>
                  <div class="form-group ml-2 mr-2">
                    <label for="exampleFormControlFile1">Upload Your Aadhaar Card</label>
                    <input  type="file" id="myfile" name="myfile1" required class="form-control-file" id="exampleFormControlFile1">
                  </div>
                <button type="submit" class="btn btn-primary btn-md ml-2 mb-2 btn-custom ">Submit</button>
            </form>
        </div>
    </div>
           
<%
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>