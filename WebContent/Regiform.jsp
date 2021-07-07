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
    <link rel="stylesheet" href="css/register.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
        integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
        crossorigin="anonymous" />
<title>CrownPay Register</title>
<script language="Javascript" type="text/javascript">
            
            
            function createRequestObject() {
                var tmpXmlHttpObject;
                if (window.XMLHttpRequest) {
                        tmpXmlHttpObject = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
                }
            
                return tmpXmlHttpObject;
            }
            
            
            var http = createRequestObject();
            
            function makeGetRequest() {
                email=document.frm.email.value;
                http.open('get', 'Regotpsend.jsp?email=' + email);
                http.onreadystatechange = processResponse;
                http.send(null);
            }
            
            function processResponse() {
                if(http.readyState == 4){
                    var response = http.responseText;
                    document.getElementById('genstat').innerHTML = response;
                }
            }
            
 			var http1 = createRequestObject();
            
            function makeGetRequest1() {
                userid=document.frm.userid.value;
                http1.open('get', 'usidemailcheck.jsp?userid=' + userid);
                http1.onreadystatechange = processResponse1;
                http1.send(null);
            }
            
            function processResponse1() {
                if(http1.readyState == 4){
                    var response1 = http1.responseText;
                    document.getElementById('usidstat').innerHTML = response1;
                }
            }
            
			var http2 = createRequestObject();
            
            function makeGetRequest2() {
                email=document.frm.email.value;
                http2.open('get', 'usidemailcheck.jsp?email='+email);
                http2.onreadystatechange = processResponse2;
                http2.send(null);
            }
            
            function processResponse2() {
                if(http2.readyState == 4){
                    var response2 = http2.responseText;
                    document.getElementById('emailstat').innerHTML = response2;
                }
            }
            
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
  <nav class="navbar navbar-expand-lg navbar-light  ">
        <a class="navbar-brand ml-md-5" href="#">Crown</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
               



            </ul>
        </div>
    </nav>



    <div class="container-fluid" style="margin-bottom: 3rem;">
        <div class="row">
            <div class="col-md-4 mt-sm-5 ml-md-5 order-2 order-sm-1">
                <form name="frm" method="post" action="RegOtpCheck" onsubmit="return verifypassword()">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="uid">Userid</label>
                            <input type="text" name="userid" onblur="makeGetRequest1()" required autocomplete="off" class="form-control" id="uid" placeholder="Userid">
                            <div id="usidstat"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="Email">Email</label>
                            <input type="email" name="email" onblur="makeGetRequest2()" required autocomplete="off" class="form-control" id="Email" placeholder="Email">
                            <div id="emailstat"></div>
                        </div>
                    </div>
                  
                    <div class="form-group">
                        <label for="Fname">Full Name</label>
                        <input type="text" name="name" required class="form-control" autocomplete="off" id="Fname" placeholder="Full name">
                    </div>
                    <div class="form-group">
                        <label for="mno">Mobile No.</label>
                        <input type="text" name="mobile" required autocomplete="off" class="form-control" id="mno" placeholder="Mobile No.">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Security Questions</label>
                        <select class="form-control" name="question"  required id="exampleFormControlSelect1">
                            <option value="Who is your Childhood Friend?">Who is your Childhood Friend?</option>
                            <option value="What primary school did you attend?">What primary school did you attend?</option>
                            <option value="What is your grandmother's (on your mother's side) name?">What is your grandmother's (on your mother's side) name?</option>
                            <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="secans">Answer</label>
                        <input type="text" name="answer" required autocomplete="off" class="form-control" id="secans" placeholder="Security Question Answer">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="psw">Password</label>
                            <input type="password" name="pswd" autocomplete="off" required class="form-control" id="psw">
                        </div>
                        <div class="form-group col-md">
                            <label for="psw">Confirm Password</label>
                            <input type="password" name="cnfpswd" autocomplete="off" required class="form-control" id="cpsw">
                        </div>
                        
                    </div>
                    <div class="form-row">
                        <div class="col"> <label for="secans">Enter OTP</label>
                            <input type="text" name="otp" required="required" autocomplete="off" class="form-control" id="secans" aria-describedby="OTPHelp" placeholder="OTP">
                            <small id="OTPHelp" class="form-text text-muted"><div id="genstat"></div></small></div>
                            
                       
                        
                    </div>
                    
                    <div class="row mb-2">
                        <div class="col col-sm-3">
                           <button type="submit" class="btn btn-primary mt-3">Register</button> 
   
                        </div>
                       </form>
                        <div class="col button-corrected " >
                           <button type="button" onclick="makeGetRequest()" class="btn btn-primary">Generate OTP</button>
                       </div>
   
                    </div>
            </div>
            <div class="col-md order-1 order-sm-2 ">
                <img class="img-fluid" src="images/10107.jpg">

            </div>


        </div>
    </div>







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
</body>
</html>