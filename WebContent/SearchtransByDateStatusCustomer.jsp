<%@page import="java.util.Date"%>
<%@page import="mybeans.CustomerDetails"%>
<%@page import="mybeans.TransactionsOperations"%>
<%@page import="myentities.Transactions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mybeans.FindCustomerbyWalletid"%>
<%@page import="mybeans.FindCompanybyWalletid"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
String dtfrm=request.getParameter("dtfrm");
String dtto = request.getParameter("dtto");

ArrayList<Transactions> lst = new ArrayList<Transactions>();
TransactionsOperations to = new TransactionsOperations();
CustomerDetails cd = new CustomerDetails();
cd.setUserid(userid);
walletid=cd.getWalletid();
to.setWalletid(walletid);
to.setStartdt(dtfrm);
to.setEnddt(dtto);
lst=to.transactionreportbydate();
%>
<%if(lst.size()>0)
	{%>
<div class="table-responsive">
              
          <table class="table table-striped">
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
		<td><img class="img-fluid profilephoto rounded-circle" src="uploads/<%=walletid %>profile.png" width="10px" height="10px"></td>
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
	
	<%
}
%>



</tbody>
</table>
  </div> 


<%

	}
else
{
	%>Their is no such Transaction between given dates...<%
}
}
else
{
	response.sendRedirect("Failure.jsp?status=sessionexpired");
}
%>
</body>
</html>