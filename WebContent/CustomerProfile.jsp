<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
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
    <title>Profile</title>
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
String userid=String.valueOf(session.getAttribute("userid"));
CustomerDetails cd = new CustomerDetails();
cd.setUserid(userid);
String transdt=cd.getDt();
Date date1=new SimpleDateFormat("yyyy-mm-dd").parse(transdt); 
SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");  
    transdt = formatter.format(date1); 
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
                        <a class="nav-link" href="CustomerHome.jsp">Home</a>
                    </li>
                    <li class="nav-item navbar-text mt-2">
                        <a class="nav-link" href="customerprocess.jsp?type=addmoney">Add money</a>
                    </li>
                    <li class="nav-item navbar-text mt-2">
                        <div class="dropdown">
                            <a class="nav-link"  href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Pay
                            </a>
                          
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                              <a class="dropdown-item" href="customerprocess.jsp?type=transfermoney">Transfer Money</a>
                              <a class="dropdown-item" href="customerprocess.jsp?type=mobilerecharge">Mobile Recharge</a>
                              <a class="dropdown-item" href="customerprocess.jsp?type=fasttagrecharge">Fasttag Recharge</a>
                              <a class="dropdown-item" href="customerprocess.jsp?type=payelectricbill">Pay electric bills</a>
                            </div>
                          </div>
                    </li>
                    <li class="nav-item navbar-text">
                        <div class="dropdown show mr-md-3">
                            <a class="btn profile-link" href="#" role="button" id="dropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="container profiledetails">
                                    <div class="row profile-centered">
                                        <div class="col-sm-4 col-4">
                                            <img class="profilephoto rounded-circle" src="uploads/<%=cd.getWalletid() %>profile.png" />
                                        </div>
                                        <div class="col-sm-2 col-2 mt-2">
                                            <p class="dropdown-toggle"><%=userid %></p>
                                        </div>
                                    </div>
                                </div>
                               
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

                                <a class="dropdown-item text-dark" href="CustomerProfile.jsp"><i class="fas fa-user-alt"></i> Profile</a>
                                <a class="dropdown-item text-dark" href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>
                                    Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        </div>
        
         <main>
        <div class="container d-flex justify-content-center">
            <div class="profile-details mt-5">
                <div class="row">
                    <div class="col-md-3 col-6 ml-2 mt-2 col-1 ml-3 mt-4 mt-md-4 ml-md-5 ">
                        <img class="profile-details--profilepic " src="uploads/<%=cd.getWalletid() %>profile.png">
                    </div>
                    <div class="col-md mt-md-5 col-5 mt-3 ">
                        <div class="row">
                            <div class="">
                                <p>Name:</p>

                            </div>
                            <div class="ml-md-2 ml-sm-2">
                                <p><%=cd.getName() %></p>


                            </div>

                        </div>
                        <div class="row">
                            <div class="">
                                <p>wallet ID:</p>

                            </div>
                            <div class="ml-md-2 ml-sm-2">
                                <p><%=cd.getWalletid() %></p>


                            </div>

                        </div>


                    </div>

                </div>
                <hr>

                <div class="row">
                    <div class=" ml-3 col-sm-2 col">
                        <p>Userid:</p>
                    </div>
                    <div class="col">
                        <p><%=userid %> </p>
                    </div>

                </div>

                <div class="row">
                    <div class=" ml-3 col col-sm-2">
                        <p>Mobile No.:</p>
                    </div>
                    <div class="col">
                        <p><%=cd.getMobileno() %></p>
                    </div>

                </div>
                <div class="row">
                    <div class=" ml-3 col col-sm-2">
                        <p>Join Date:</p>
                    </div>
                    <div class="col">
                        <p><%=transdt %></p>
                    </div>

                </div>

                <div class="row">
                    <div class=" ml-3 col col-sm-3">
                        <p>Wallet Balance:</p>
                    </div>
                    <div class="col">
                        <p>Rs. <%=cd.getBalance() %></p>
                    </div>

                </div>

                <div class="row">
                    <div class=" ml-3 col-1 col-sm-1">
                        <p>Email:</p>
                    </div>
                    <div class="col ml-3">
                        <p><%=cd.getEmail() %></p>
                    </div>

                </div>

                



            </div>
        </div>
    </main>
        
        
        
        
        
<%
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>