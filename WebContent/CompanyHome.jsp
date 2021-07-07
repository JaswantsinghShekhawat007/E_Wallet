<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    
        <title>Company Dashboard</title>
</head>
<body>
<%
if(session.getAttribute("userid")!=null)
{
String userid=String.valueOf(session.getAttribute("userid"));
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from companydata where userid=?;");
	pst.setString(1, userid);
	rs=pst.executeQuery();
	if(rs.next())
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
                   
                  
                    <li class="nav-item navbar-text">
                        <div class="dropdown show mr-md-3">
                            <a class="btn profile-link" href="#" role="button" id="dropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="container profiledetails">
                                    <div class="row profile-centered">
                                        <div class="col-sm-4 col-4">
                                            <img class="profilephoto rounded-circle " src="uploads/<%=rs.getString("walletid") %>profile.png" />
                                        </div>
                                        <div class="col-sm-2 col-2 mt-2">
                                            <p class="dropdown-toggle"><%=userid %></p>
                                        </div>
                                    </div>
                                </div>
                               
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

                                <a class="dropdown-item text-dark" href="CompanyProfile.jsp"><i class="fas fa-user-alt"></i> Profile</a>
                                <a class="dropdown-item text-dark" href="Logout.jsp"><i class="fas fa-sign-out-alt"></i>
                                    Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        </div>
        <!--Content-->



        <div class="container">
            <div class="row">
                <div class="e-wallet-details col-12 col-sm-6  ">
                    <div class="row">
                        <div class="col-sm-7 col-7 col-sm-offset-2 mt-4">
                            <h5>Balance: Rs.<%=rs.getString("balance") %></h5>
                        </div>
                        <div class="col-sm-5 col-5 mt-4">
                            
                        </div>

                    </div>
                </div>
                <div class="e-wallet-details d-flex justify-content-center col-12  col-sm-5 offset-sm-1">
                    <div class="row">
                        <div class="col-sm-6 col-6  mt-4">
                            <h5>WalletID: </h5>
                        </div>
                        <div class="col-sm-3 col-3 col-sm-offset-3 mt-4">
                            <h5> <span id="WalletID"><%=rs.getString("walletid") %></span></h5>
                        </div>



                    </div>
                </div>

            </div>
        </div>
		
		
		
		<%
	}
	
	con.close();
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}


%>



       


      






        


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







<%
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}%>
</body>
</html>