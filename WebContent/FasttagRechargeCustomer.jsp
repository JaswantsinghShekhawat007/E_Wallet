<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script language="Javascript" type="text/javascript">
function checkbalance() {
	
	 var pw = parseFloat(document.frm.balance.value);
	 var cpw = parseFloat(document.frm.amount.value); 
	 if ((pw-cpw) < 0) {
		 
		 alert("Insufficient Balance!!! Please Check your Wallet Balance.");
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
	
%>
  <div class="container mt-5">
        <div class="transfermoney-container">
            <div class="  d-flex justify-content-center">
                <h3 class="heading">Fasttag Recharge</h3>
            </div>
            <hr>


            <form name="frm" method="post" action="FasttagRechargeStatusCustomer" onsubmit="return checkbalance()">
                <div class="row">
                    <div class="form-group ml-2 mr-2">
                        <div class="col col-sm">
                            <label>Choose Fasttag Company : </label>
                        </div>
                        <div class="col col-sm">
<%
String userid=String.valueOf(session.getAttribute("userid"));
Connection con;
PreparedStatement pst;
ResultSet rs,rs1;
try
{
	DBConnector dbc = new DBConnector();
	con=dbc.getDbconnection();
	pst=con.prepareStatement("select * from companydata where companytype='fasttag';");
	rs=pst.executeQuery();
	while(rs.next())
	{
	%>
	
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio"  name="company" value="<%=rs.getString("walletid") %>" required="required" id="inlineRadio1" >
                                <label class="form-check-label" for="inlineRadio1"><%=rs.getString("companyname")%></label>
                              </div>
	<%	
	}
	pst=con.prepareStatement("select * from usersdata where userid=?;");
	pst.setString(1,userid);
	rs1=pst.executeQuery();
	rs1.next();
	%><input type="hidden" name="balance" value=<%=rs1.getString("balance") %> /><%
	con.close();
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
%>  </div>

                      

                    </div>
                </div>




                <div class="form-group ml-2 mr-2">

                    <label for="WalletID">Enter Vehicle Number</label>
                    <input type="text" name="vehicleno" required class="form-control" id="WalletID" aria-describedby="fasttagHelp"
                        placeholder="Vehical number" autocomplete="off" >
                        <small id="fasttagHelp" class="form-text text-muted">*Format as MH12AC8889</small>

                </div>
                <div class="form-group ml-2 mr-2">
                    <label for="amount">Enter Amount</label>
                    <input type="number" name="amount" required class="form-control" id="amount" placeholder="Amount" autocomplete="off">
                </div>

                <button type="submit" class="btn btn-primary btn-md ml-2 mb-2 btn-custom mb-3 ">Recharge</button>
            </form>
        </div>
    </div>


<%}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>