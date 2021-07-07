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
    <title>CrownPay</title>
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



    <header>
        <div class="container-fluid">
            <div class="heading">
                <div class="row ">
                    <div class="col-12 col-sm-6 mt-5  heading-primary ">
                        <h1 class="sizered">Recharge,pay bills,transfer money from safety of home!</h1>
                    </div>
                    <div class="header--image col-12 col-sm-6 removepadding ">
                        <img class="img-fluid" src="images/10107.jpg">

                    </div>
                </div>




            </div>
        </div>

    </header>

    <main>
        <div class="services">
            <div class="container">
                <div class="d-flex justify-content-center ">
                    <h3 class="services--title mt-5 mb-5">Services we offer</h3>
                </div>
                <div class="mt-md-5">
                    <div class="row d-flex justify-content-center">
                        <div class="card mr-md-5 col-10 col-md-3 mb-3">
                            <div class="card-img d-flex justify-content-center mb-4 mt-5 ">
                                <img class="cardimg text-center" src="images/bill.png">
    
                            </div>
                            <div class="card-head d-flex justify-content-center mt-2">
                                <p>Electric bill payment</p>
    
                            </div>
    
                        </div>
                        <div class="card mr-md-5 col-10 col-md-3 mb-3">
                            <div class="card-img d-flex justify-content-center mb-4 mt-5 ">
                                <img class="cardimg text-center" src="images/money-transaction.png">
    
                            </div>
                            <div class="card-head d-flex justify-content-center mt-2">
                                <p>Transfer Money</p>
    
                            </div>
    
                        </div>
                       
                        <div class="card  col-10 col-md-3">
                            <div class="card-img d-flex justify-content-center mb-4 mt-5 ">
                                <img class="cardimg text-center" src="images/bill.png">
    
                            </div>
                            <div class="card-head d-flex justify-content-center mt-2">
                                <p>Recharge</p>
                                
                            </div>
                            <div class="card-head d-flex justify-content-center" >
                                <ul >
                                    <li>Mobile recharge</li>
                                    <li>Fasttag recharge</li>
                                </ul>

                            </div>
                           

    
                        </div>
                    </div>

                   
                </div>

                </div>
                

        </div>
        
    </main>
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
                      <input type="text" name="userid" class="form-control" id="uid" aria-describedby="emailHelp" placeholder="User ID" required="required" autocomplete="off">
                      
                    </div>
                    <div class="form-group">
                      <label for="psw">Password</label>
                      <input type="password" name="pswd" class="form-control" id="psw" placeholder="Password" required="required" autocomplete="off">
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
    <footer class="bg-dark text-center text-white mt-5">
        <!-- Grid container -->
        <div class="container p-4 pb-0">
          <!-- Section: Social media -->
          <section class="mb-4">
            <!-- Facebook -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
              ><i class="fab fa-facebook-f"></i
            ></a>
      
            <!-- Twitter -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
              ><i class="fab fa-twitter"></i
            ></a>
      
            <!-- Google -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
              ><i class="fab fa-google"></i
            ></a>
      
            <!-- Instagram -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
              ><i class="fab fa-instagram"></i
            ></a>
      
            <!-- Linkedin -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
              ><i class="fab fa-linkedin-in"></i
            ></a>
      
            <!-- Github -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
              ><i class="fab fa-github"></i
            ></a>
          </section>
          <!-- Section: Social media -->
        </div>
        <!-- Grid container -->
      
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
          © 2021 Copyright:
          <a class="text-white" href="#">Crownpay.com</a>
        </div>
        <!-- Copyright -->
      </footer>
</body>
</html>