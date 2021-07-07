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
	
%>
<% String userid = request.getParameter("userid");%>
<h1><%=userid %></h1>
<% request.getSession().setAttribute("uid", userid);%>  
<form method="post" action="UploadRegiComp.jsp" enctype="multipart/form-data">
						<h5>Upload Your Logo</h5>
						<input type="file" id="myfile" name="myfile" required>
						<input type="hidden" name="userid" value="<%=userid %>">
				<input type="submit" value="Complete Your Profile">
				
			</form>
			<%}
else
{
	response.sendRedirect("Failureadmin.jsp?status=sessionexpired");
}%>
</body>
</html>