<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.*"%>
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
    <title>Transfer Money</title>
<script language="Javascript" type="text/javascript">
function checkbalance() {
	
	 var pw = parseFloat(document.frm.balance.value);
	 var cpw = parseFloat(document.frm.amount.value); 
	 if ((pw-cpw) < 0) {
		 
		 alert("Insufficient Balance!!! Please Check your Wallet Balance.");
			return false;
	}
	 else{
		 var rs=document.frm.result.value;
		 if(rs == 'true')
			 {
			 return true;			 
			 }
		 else
			 {
			 return false;
			 }
		 
	}
}

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
	destwalletid=document.frm.destwalletid.value;
    http.open('get', 'CheckWalletIDTransfer.jsp?destwalletid='+destwalletid);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('checkwalletid').innerHTML = response;
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
	
%>
  <div class="container mt-5">
        <div class="transfermoney-container">
            <div class="  d-flex justify-content-center">
                <h3 class="heading">Transfer Money</h3>
            </div>
            <hr>


            <form name="frm" method="post" action="TransferMoneyStatusCustomer" onsubmit="return checkbalance()">
                
                <div class="form-group ml-2 mr-2">

                    <label for="WalletID">Enter WalletID</label>
                    <input type="text" class="form-control" id="WalletID" aria-describedby="emailHelp" placeholder="Enter recipient WalletID"  name="destwalletid" onblur="makeGetRequest()" required autocomplete="off">
                        <input type="hidden" name="balance" value=<%=rs.getString("balance") %> />
<input type="hidden" name="srcwalletid" value=<%=rs.getString("walletid") %> />
<input type="hidden" name="srcname" value=<%=rs.getString("name") %> />
<input type="hidden" name="email" value=<%=rs.getString("email") %> />
                    <!--small block ajax madhun send karjo--> <small class="form-text text-muted" id="checkwalletid"> </small>
                </div>
                <div class="form-group ml-2 mr-2">
                    <label for="amount">Amount</label>
                    <input type="number" class="form-control" id="amount" placeholder="Enter amount" name="amount" autocomplete="off" required>
                </div>

                <button type="submit" class="btn btn-primary btn-md ml-2 mb-2 btn-custom ">Pay</button>
            </form>
        </div>
    </div>
<%	}
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