<%@page import="mybeans.FindCompanybyWalletid"%>
<%@page import="mybeans.FindCustomerbyWalletid"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="mybeans.TransactionsOperations"%>
<%@page import="myentities.Transactions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.BankDetails"%>
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
                http.open('get', 'ShowWalletBalance.jsp');
                http.onreadystatechange = processResponse;
                http.send(null);
            }
            
            function processResponse() {
                if(http.readyState == 4){
                    var response = http.responseText;
                    document.getElementById('balance').innerHTML = response;
                    document.getElementById('cbal').innerHTML = 'Refresh';
                    
                }
            }
            
 var http1 = createRequestObject();
            
            function makeGetRequest1() {
                http1.open('get', 'ShowBankBalance.jsp');
                http1.onreadystatechange = processResponse1;
                http1.send(null);
            }
            
            function processResponse1() {
                if(http1.readyState == 4){
                    var response1 = http1.responseText;
                    document.getElementById('bbalance').innerHTML = response1;
                    document.getElementById('bbal').innerHTML = 'Refresh';
                    
                }
            }
            
            
            </script>
    <title>Customer Dashboard</title>
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
String userid=String.valueOf(session.getAttribute("userid"));
CustomerDetails cd = new CustomerDetails();
cd.setUserid(userid);
String walletid;
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
        <!--Content-->



        <div class="container">
            <div class="row">
                <div class="e-wallet-details col-12 col-sm-6  ">
                    <div class="row">
                        <div class="col-sm-7 col-7 col-sm-offset-2 mt-4">
                            <h5>Balance: <span id="balance"></span></h5>
                        </div>
                        <div class="col-sm-5 col-5 mt-4">
                            <button class="btn btn-sm btn-primary btn-custom" id="cbal" onclick="makeGetRequest()">Check Balance</button>
                        </div>

                    </div>
                </div>
                <div class="e-wallet-details d-flex justify-content-center col-12  col-sm-5 offset-sm-1">
                    <div class="row">
                        <div class="col-sm-6 col-6  mt-4">
                            <h5>WalletID: </h5>
                        </div>
                        <div class="col-sm-3 col-3 col-sm-offset-3 mt-4">
                            <h5> <span id="WalletID"><%=cd.getWalletid() %></span></h5>
                        </div>



                    </div>
                </div>

            </div>
        </div>


        <div class="container">
            <div class="row">
          
                <div class="bank-details-brief col-sm-5   ">
                    <h3 class="mt-3">Bank Details</h3>
                    <hr>
                      <%
            if(cd.getBankaccount() != null)
            {
            	BankDetails bd = new BankDetails();
            	bd.setUserid(userid);
            %>
                    <div class="row">
                        <div class="bank-details-brief--name col-md-4 col-6 mt-4 ml-5">
                            <h5>Account holder name:</h5>

                        </div>
                        <div class="bank-details-brief__namedisplay col-md-6 col-3 mt-5">
                            <h5><%=bd.getName() %></h5>

                        </div>
                    </div>
                    <div class="row">
                        <div class="bank-details-brief--name col-md-4 col-6 mt-5 ml-5">
                            <h5>Bank name:</h5>

                        </div>
                        <div class="bank-details-brief__namedisplay col-md-6 col-3 mt-5">
                            <h5><%=bd.getBankname() %></h5>

                        </div>




                    </div>
                    <div class="row">
                        <div class="bank-details-brief--name col-md-4 col-6 mt-5 ml-5">
                            <h5>Balance:</h5>

                        </div>
                        <div class="bank-details-brief__namedisplay col-md-6 col-3 mt-5">
                            <h5><span id="bbalance"></span><button class="btn btn-sm btn-primary btn-custom" id="bbal" onclick="makeGetRequest1()">Check Balance</button></h5>
                           


                        </div>




                    </div>
<%}
            else
            {
            	%>
            	Please Link Your Bank Account With Wallet Through Add Money button.. 
            	<%
            }
                 
                      %>

                </div>
                
                
                <div class="transactionrecent mt-3 col-sm-5 col-12 offset-sm-1">
                    <div class="row">
                        <div class="transactionrecent--heading ml-4 mt-3 col-7 col-sm-8">
                            Transactions
                        </div>
                        <div class="transactionrecent--heading--button col-4 mt-3 col-sm-3  ">
                            <a href="#" data-toggle="modal" data-target="#exampleModal">See all</a>
                        </div>
                    </div>
                    <hr>

                    <div class="transactionrecent--recent">

                        <div class="person">
                            <ul class="removedeco">
                            <%
                            ArrayList<Transactions> lst = new ArrayList<Transactions>();
                            TransactionsOperations to = new TransactionsOperations();
                            walletid=cd.getWalletid();
                            to.setWalletid(walletid);
                            String type;
                            String transdt;
                            lst=to.transactionreport();
                            if(lst.size()>0)
                            {
                            	int val;
                            	if(lst.size()>4)
                            	{
                            		val=4;
                            	}
                            	else
                            	{
                            		val=lst.size();
                            	}
                            for(int i=0;i<val;i++)
                            {
                            	transdt=lst.get(i).getTransdt();
                            	Date date1=new SimpleDateFormat("yyyy-mm-dd").parse(transdt); 
                            	SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");  
                            	    transdt = formatter.format(date1); 
                            
                            %>
                                <li>
                                
                              <%
	type=lst.get(i).getTransactiontype();
	if(type.equals("self"))
	{
		%>
	
                                    <div class="row">
                                        <div class="icon col-2 col-sm-2 ml-1 mt-2">
                                            <img src="uploads/<%=walletid %>profile.png" class="profile-his">
                                        </div>
                                        <div class="title col-6 col-sm-4 mt-2 ">
                                            <h6><%=cd.getName() %></h6>
                                            <p><%=transdt %></p>
                                        </div>
                                        <div class="amount col-2 mt-2 col-sm-2 offset-sm-3">
                                            <h6>Rs.<%=lst.get(i).getAmount() %></h6>
                                            <p>Added to Wallet</p>
                                        </div>

                                    </div>
                                    	<%
	}
	else if(type.equals("person"))
	{
		if(walletid.equals(lst.get(i).getSrcwalletid()))
		{
	%>

	 									<div class="row">
                                        <div class="icon col-2 col-sm-2 ml-1 mt-2">
                                            <img src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" class="profile-his">
                                        </div>
                                        <div class="title col-6 col-sm-4 mt-2 ">
                                            <h6><%=lst.get(i).getName() %></h6>
                                            <p><%=transdt %></p>
                                        </div>
                                        <div class="amount col-2 mt-2 col-sm-2 offset-sm-3">
                                            <h6>Rs.<%=lst.get(i).getAmount() %></h6>
                                            <p>Send</p>
                                        </div>

                                    </div>
                                    
      <%
         }
		else if(walletid.equals(lst.get(i).getDestwalletid()))
		{
			FindCustomerbyWalletid fcw = new FindCustomerbyWalletid();
			fcw.setWalletid(lst.get(i).getSrcwalletid());
                                    
       %>
      
			
								<div class="row">
                                        <div class="icon col-2 col-sm-2 ml-1 mt-2">
                                            <img src="uploads/<%=lst.get(i).getSrcwalletid() %>profile.png" class="profile-his">
                                        </div>
                                        <div class="title col-6 col-sm-4 mt-2 ">
                                            <h6><%=fcw.getName() %></h6>
                                            <p><%=transdt %></p>
                                        </div>
                                        <div class="amount col-2 mt-2 col-sm-2 offset-sm-3">
                                            <h6>Rs.<%=lst.get(i).getAmount() %></h6>
                                            <p>Recieved</p>
                                        </div>

                                    </div>
								
			<%
			
			}
	}
	
	else if(type.equals("cashback"))
	{
		if(lst.get(i).getName() == null)
		{
			FindCompanybyWalletid fcompw = new FindCompanybyWalletid();
			fcompw.setWalletid(lst.get(i).getDestwalletid());
			
			%>
		
			
									<div class="row">
                                        <div class="icon col-2 col-sm-2 ml-1 mt-2">
                                            <img src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" class="profile-his">
                                        </div>
                                        <div class="title col-6 col-sm-4 mt-2 ">
                                            <h6><%=fcompw.getName() %></h6>
                                            <p><%=transdt %></p>
                                        </div>
                                        <div class="amount col-2 mt-2 col-sm-2 offset-sm-3">
                                            <h6>Rs.<%=lst.get(i).getAmount() %></h6>
                                            <p>Cashback</p>
                                        </div>

                                    </div>
			<%
		}
		else if(walletid.equals(lst.get(i).getSrcwalletid()))
		{
			%>	
				
			
									<div class="row">
                                        <div class="icon col-2 col-sm-2 ml-1 mt-2">
                                            <img src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" class="profile-his">
                                        </div>
                                        <div class="title col-6 col-sm-4 mt-2 ">
                                            <h6><%=lst.get(i).getName() %></h6>
                                            <p><%=transdt %></p>
                                        </div>
                                        <div class="amount col-2 mt-2 col-sm-2 offset-sm-3">
                                            <h6>Rs.<%=lst.get(i).getAmount() %></h6>
                                            <p>Cashback</p>
                                        </div>

                                    </div>		
			<%
		}
	}
	else if(type.equals("fasttag"))
	{
		FindCompanybyWalletid fcompw1 = new FindCompanybyWalletid();
		fcompw1.setWalletid(lst.get(i).getDestwalletid());
			%>	
	
		
									<div class="row">
                                        <div class="icon col-2 col-sm-2 ml-1 mt-2">
                                            <img src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" class="profile-his">
                                        </div>
                                        <div class="title col-6 col-sm-4 mt-2 ">
                                            <h6><%=fcompw1.getName() %></h6>
                                            <p><%=transdt %></p>
                                        </div>
                                        <div class="amount col-2 mt-2 col-sm-2 offset-sm-3">
                                            <h6>Rs.<%=lst.get(i).getAmount() %></h6>
                                            <p>Fasttag Recharge</p>
                                        </div>

                                    </div>		
		<%
	}
	else if(type.equals("mobile"))
	{
		FindCompanybyWalletid fcompw2 = new FindCompanybyWalletid();
		fcompw2.setWalletid(lst.get(i).getDestwalletid());
		%>	
		
	
										<div class="row">
                                        <div class="icon col-2 col-sm-2 ml-1 mt-2">
                                            <img src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" class="profile-his">
                                        </div>
                                        <div class="title col-6 col-sm-4 mt-2 ">
                                            <h6><%=fcompw2.getName() %></h6>
                                            <p><%=transdt %></p>
                                        </div>
                                        <div class="amount col-2 mt-2 col-sm-2 offset-sm-3">
                                            <h6>Rs.<%=lst.get(i).getAmount() %></h6>
                                            <p>Mobile Recharge</p>
                                        </div>

                                    </div>
		<%
		}
	else if(type.equals("electric"))
	{
		FindCompanybyWalletid fcompw3 = new FindCompanybyWalletid();
		fcompw3.setWalletid(lst.get(i).getDestwalletid());
		%>
		
								<div class="row">
                                        <div class="icon col-2 col-sm-2 ml-1 mt-2">
                                            <img src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" class="profile-his">
                                        </div>
                                        <div class="title col-6 col-sm-4 mt-2 ">
                                            <h6><%=fcompw3.getName() %></h6>
                                            <p><%=transdt %></p>
                                        </div>
                                        <div class="amount col-2 mt-2 col-sm-2 offset-sm-3">
                                            <h6>Rs.<%=lst.get(i).getAmount() %></h6>
                                            <p>Electric Bill</p>
                                        </div>

                                    </div>
                                    
                                    
					
                                </li>
                               
                   
<%
	}
                            }
                            
                            }
                            else
                            {
                            	%>No Tranction Performed Yet<%
                            }
%>


                            </ul>

                        </div>


                    </div>

                </div>


            </div>





        </div>


        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Transactions</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                        <div class="col-3 mb-1 col-md-2"><a href="customerprocess.jsp?type=transreport" class="btn btn-primary">See all</a></div>
                        <div class="col-5 col-md-5"><a href="customerprocess.jsp?type=searchtransbydate" class="btn btn-primary">See between dates</a></div>
                        <div class="col-6 col-md-1"><a href="customerprocess.jsp?type=searchtransbyid" class="btn btn-primary mt-xs-1">See by WalletID</a></div>
                    </div>
                       
                        
                        
                        


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
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







<%
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}%>
</body>
</html>