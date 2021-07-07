<%@page import="mybeans.CustomerDetails"%>
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
<title>Customer</title>
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
	String userid=String.valueOf(session.getAttribute("userid"));
	CustomerDetails cd = new CustomerDetails();
	cd.setUserid(userid);
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
                 
                   
                    <li class="nav-item navbar-text">
                        <div class="dropdown show mr-md-3">
                            <a class="btn profile-link" href="#" role="button" id="dropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="container profiledetails">
                                    <div class="row profile-centered">
                                        <div class="col-sm-4 col-4">
                                            <img class="profilephoto rounded-circle " src="uploads/<%=cd.getWalletid() %>profile.png" />
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

<%
String type=request.getParameter("type");

if(type.equals("addmoney"))
{
	%>
	<jsp:include page="AddMoneyCustomer.jsp" />
	<%
}
else if(type.equals("transfermoney"))
{
	%>
	<jsp:include page="TransferMoneyCustomer.jsp" />
	<%
} 
else if(type.equals("payelectricbill"))
{
	%>
	<jsp:include page="PayElectrricBillCustomer.jsp" />
	<%
} 
else if(type.equals("mobilerecharge"))
{
	%>
	<jsp:include page="MobileRechargeCustomer.jsp" />
	<%
} 
else if(type.equals("fasttagrecharge"))
{
	%>
	<jsp:include page="FasttagRechargeCustomer.jsp" />
	<%
} 
else if(type.equals("transreport"))
{
	%>
	<jsp:include page="TransReportCustomer.jsp" />
	<%
} 
else if(type.equals("searchtransbydate"))
{
	%>
	<jsp:include page="SearchtransByDateCustomer.jsp" />
	<%
} 
else if(type.equals("searchtransbyid"))
{
	%>
	<jsp:include page="SearchtransByIDCustomer.jsp" />
	<%
} 
else if(type.equals("addmoneystatus"))
{
	String status=request.getParameter("status");
	%>
	 <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-check-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3>Money added!</h3>                </div>
            </div>
          </div>
	<%
} 
else if(type.equals("transfermoneystatus"))
{
	String status=request.getParameter("status");
	%>
	<div class="jumbotron jumbotron-fluid">
        <div class="container">
            <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-check-circle" aria-hidden="true"></i>
            </h1></div>
        
            <div class="d-flex justify-content-center mt-1"><h3><%=status %></h3></div>
        </div>
      </div>
	<%
} 
else if(type.equals("payelectricbillstatus"))
{
	String status=request.getParameter("status");
	%>
	 <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-check-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center"><%=status %></h3>                </div>
            </div>
          </div>
	<%
}
else if(type.equals("mobilerechargestatus"))
{
	String status=request.getParameter("status");
	%>
	  <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-check-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center"><%=status %></h3>                </div>
            </div>
          </div>
	<%
}
else if(type.equals("fasttagrechargestatus"))
{
	String status=request.getParameter("status");
	%>
	 <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <div class="d-flex justify-content-center">  <h1 class="display-4"><i class="fa fa-check-circle" aria-hidden="true"></i>
                </h1></div>
            
                <div class="d-flex justify-content-center mt-1"><h3 class="text-center"><%=status %></h3>                </div>
            </div>
          </div>
	<%
}







else
{
	%>
	Logout then again login.... 
	<%
}
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}%>
</body>
</html>