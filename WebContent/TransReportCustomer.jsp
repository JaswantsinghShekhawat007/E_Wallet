<%@page import="mybeans.FindCompanybyWalletid"%>
<%@page import="mybeans.FindCustomerbyWalletid"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mybeans.CustomerDetails"%>
<%@page import="mybeans.TransactionsOperations"%>
<%@page import="myentities.Transactions"%>
<%@page import="java.util.ArrayList"%>
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
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
String userid=String.valueOf(session.getAttribute("userid"));
String walletid;
String type;
String transdt;

ArrayList<Transactions> lst = new ArrayList<Transactions>();
TransactionsOperations to = new TransactionsOperations();
CustomerDetails cd = new CustomerDetails();
cd.setUserid(userid);
walletid=cd.getWalletid();
to.setWalletid(walletid);
lst=to.transactionreport();
%>

    <div>
        <div class="row "><h2 class="d-flex justify-content-center mt-5 col-12 text-center">Transaction report </h2></div>
        
    </div>


    <div class="container mt-3">
        <div class="transfermoney-container">
            
            
            
                
         <div class="table-responsive ">
<%
if(lst.size()>0)
{
%>
 <table class="table table-striped mt">
            <thead>
              <tr>
                <th scope="col">Transaction number</th>
                <th scope="col">Profile-photo</th>
                <th scope="col">Name</th>
                <th scope="col">Wallet-ID</th>
                <th scope="col">Date</th>
                <th scope="col">Amount</th>
                <th scope="col">Type</th>
              </tr>
            </thead>
            <tbody>
<%
for(int i=0;i<lst.size();i++)
{
	transdt=lst.get(i).getTransdt();
	Date date1=new SimpleDateFormat("yyyy-mm-dd").parse(transdt); 
	SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");  
	    transdt = formatter.format(date1);  
	
	%>
	<tr>
	
	<%
	type=lst.get(i).getTransactiontype();
	if(type.equals("self"))
	{
		%>
		<th scope="row"><%=lst.get(i).getTransno() %></th>
		<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=walletid %>profile.png"></td>
		<td><%=cd.getName() %></td>
		<td><%=walletid %></td>
		<td><%=transdt %></td>
		<td><%=lst.get(i).getAmount() %></td>
		<td>Add to Wallet</td>
		<%
	}
	else if(type.equals("person"))
	{
		if(walletid.equals(lst.get(i).getSrcwalletid()))
		{
			%>
			<th scope="row"><%=lst.get(i).getTransno() %></th>
			<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" width="10px" height="10px"></td>
			<td><%=lst.get(i).getName() %></td>
			<td><%=lst.get(i).getDestwalletid() %></td>
			<td><%=transdt %></td>
			<td><%=lst.get(i).getAmount() %></td>
			<td>Send</td>
			<%
		}
		else if(walletid.equals(lst.get(i).getDestwalletid()))
		{
			FindCustomerbyWalletid fcw = new FindCustomerbyWalletid();
			fcw.setWalletid(lst.get(i).getSrcwalletid());
			
			%>
			<th scope="row"><%=lst.get(i).getTransno() %></th>
			<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=lst.get(i).getSrcwalletid() %>profile.png" width="10px" height="10px"></td>
			<td><%=fcw.getName() %></td>
			<td><%=lst.get(i).getSrcwalletid() %></td>
			<td><%=transdt %></td>
			<td><%=lst.get(i).getAmount() %></td>
			<td>Recieved</td>
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
			<th scope="row"><%=lst.get(i).getTransno() %></th>
			<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" width="10px" height="10px"></td>
			<td><%=fcompw.getName() %></td>
			<td><%=lst.get(i).getDestwalletid() %></td>
			<td><%=transdt %></td>
			<td><%=lst.get(i).getAmount() %></td>
			<td>Cashback</td>
			<%
		}
		else if(walletid.equals(lst.get(i).getSrcwalletid()))
		{
			%>
			<th scope="row"><%=lst.get(i).getTransno() %></th>
			<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" width="10px" height="10px"></td>
			<td><%=lst.get(i).getName() %></td>
			<td><%=lst.get(i).getDestwalletid() %></td>
			<td><%=transdt %></td>
			<td><%=lst.get(i).getAmount() %></td>
			<td>Cashback</td>
			<%
		}
	}
	else if(type.equals("fasttag"))
	{
		FindCompanybyWalletid fcompw1 = new FindCompanybyWalletid();
		fcompw1.setWalletid(lst.get(i).getDestwalletid());
		%>
		<th scope="row"><%=lst.get(i).getTransno() %></th>
		<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" width="10px" height="10px"></td>
		<td><%=fcompw1.getName() %></td>
		<td><%=lst.get(i).getDestwalletid() %></td>
		<td><%=transdt %></td>
		<td><%=lst.get(i).getAmount() %></td>
		<td>Fasttag Recharge</td>
		<%
	}
	else if(type.equals("mobile"))
	{
		FindCompanybyWalletid fcompw2 = new FindCompanybyWalletid();
		fcompw2.setWalletid(lst.get(i).getDestwalletid());
		%>
		<th scope="row"><%=lst.get(i).getTransno() %></th>
		<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" width="10px" height="10px"></td>
		<td><%=fcompw2.getName() %></td>
		<td><%=lst.get(i).getDestwalletid() %></td>
		<td><%=transdt %></td>
		<td><%=lst.get(i).getAmount() %></td>
		<td>Mobile Recharge</td>
		<%
	}
	
	else if(type.equals("electric"))
	{
		FindCompanybyWalletid fcompw3 = new FindCompanybyWalletid();
		fcompw3.setWalletid(lst.get(i).getDestwalletid());
		%>
		<th scope="row"><%=lst.get(i).getTransno() %></th>
		<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=lst.get(i).getDestwalletid() %>profile.png" width="10px" height="10px"></td>
		<td><%=fcompw3.getName() %></td>
		<td><%=lst.get(i).getDestwalletid() %></td>
		<td><%=transdt %></td>
		<td><%=lst.get(i).getAmount() %></td>
		<td>Electric Bill</td>
		<%
	}
	
	
	%>
	
	</tr>
	</tbody>
	<%
}
%>



</table>

</div>  
         
        </div>
    </div>
<%
}
else
{
	%>No Transaction Performed Yet<%
}
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>