<%@page import="mybeans.BankDetails"%>
<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.*"%>
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
       
<title>Insert title here</title>

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
            
                http.open('get', 'AddBankCustomer.jsp');
                http.onreadystatechange = processResponse;
                http.send(null);
            }
            
            function processResponse() {
                if(http.readyState == 4){
                    var response = http.responseText;
                    document.getElementById('showaddbankform').innerHTML = response;
                }
            }
            
            function checkbalance() {
				
            	 var pw = parseFloat(document.frm.balance.value);
            	 var cpw = parseFloat(document.frm.amount.value); 
            	 if ((pw-cpw) < 0) {
            		 
            		 alert("Insufficient Balance Please Check your Bank Balance.");
      				return false;
				}
            	 else{
            		 return true;
            	}
            }
            
  </script>

</head>
<body>
<%
if(session.getAttribute("userid")!=null)
{
	
String userid=String.valueOf(session.getAttribute("userid"));
Connection con;
PreparedStatement pst;
ResultSet rs,rs1;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from usersdata where userid=?;");
	pst.setString(1,userid);
	rs=pst.executeQuery();
	if(rs.next())
	{
		if(rs.getString("bankaccount") == null)
		{
			%>
			<div id="showaddbankform">
			<div class="jumbotron jumbotron-fluid  ">
            <div class="container ">
                <div class="d-flex justify-content-center align-items-center">
                    <button class="btn btn-primary btn-lg" onclick="makeGetRequest()">Add Bank</button>
                </div>
                <div class="d-flex justify-content-center align-items-center mt-2 ">
                    <p class="lead">Add bank details to start using wallet.</p>
                </div>
              
             
            </div>
          </div>
			</div>
			<%
		}
		else
		{
			
			BankDetails bd = new BankDetails();
			bd.setUserid(String.valueOf(session.getAttribute("userid")));
			
			%>
			 <div class="container mt-5 bank-details">
            <div class=" d-flex justify-content-center mt-2" > <h1>Bank Details</h1> </div>
            <hr class="mb-3">
            <div class="row">
                
                <div class="col-6 col-sm-4 col-md-4 offset-md-2">
                    <h5>Account Number:</h5>
                </div>
                <div class="col-6 col-sm-4 col-md-4">
                    <h5><%=bd.getAccno() %></h5>
                </div>
                
            </div>
            <div class="row">
                <div class="col-6 col-sm-4 col-md-4 offset-md-2">
                    <h5>Name:</h5>
                </div>
                <div class="col-6 col-sm-6 col-md-4">
                    <h5><%=bd.getName() %></h5>
                </div>
               
            </div>
            <div class="row">
                <div class="col-6 col-sm-4 col-md-4 offset-md-2">
                    <h5>Balance:</h5>
                </div>
                <div class="col-6 col-sm-6 col-md-4">
                    <h5><%=bd.getBalance() %></h5>
                </div>
               
            </div>
        </div>
			
			
			
			<div class="container bank-details mt-5">

            <div class=" d-flex justify-content-center mt-2" > <h3>Add money to wallet</h3> </div>
            <hr class="mb-3">
            <div class="mb-3">
                <form name="frm" method="post" action="AddMoneyStatusCustomer.jsp" onsubmit="return checkbalance()">
                    <div class="row">
                      <div class="col-6 offset-2">
                        <input type="text" class="form-control" name="amount" placeholder="Enter Amount" autocomplete="off" required="required">
                        <input type="hidden" name="balance" value=<%=bd.getBalance() %> />
			<input type="hidden" name="walletid" value=<%=rs.getString("walletid") %> />
			<input type="hidden" name="email" value=<%=rs.getString("email") %> />
			<input type="hidden" name="accno" value=<%=bd.getAccno() %> />
                      </div>
                      <div class="col">
                       <button class="btn btn-primary" type="submit">Add Money</button>
                      </div>
                    </div>
                  </form>
    
            </div>
    
        </div>
			
			<%
		}
	}
	else
	{
		%>Their is Something Wrong....<%
	}
	con.close();
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>