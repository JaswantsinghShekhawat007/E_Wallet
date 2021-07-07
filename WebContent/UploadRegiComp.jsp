<%@page import="mybeans.DBConnector"%>
<%@page import="java.sql.*"%>
<%@page import="mybeans.WalletID_genrator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="java.io.File"%>
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
<%
String userid = request.getParameter("userid");
String walletid = WalletID_genrator.generateWalletID();
String user= request.getSession().getAttribute("uid").toString();
%>
<h3><%=user %></h3>

<% 
String status="no";
File file ;
int maxFileSize = 15000 * 1024;
int maxMemSize = 15000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = "F:/Java EE 2020/eclipse-jee-2019-12-R-win32-x86_64/JavaEEProjects/EWallet/WebContent/uploads/";

// Verify the content type
String contentType = request.getContentType();

if ((contentType.indexOf("multipart/form-data") >= 0)) {
   DiskFileItemFactory factory = new DiskFileItemFactory();
   // maximum size that will be stored in memory
   factory.setSizeThreshold(maxMemSize);
   
   // Location to save data that is larger than maxMemSize.
   factory.setRepository(new File(""));

   // Create a new file upload handler
   ServletFileUpload upload = new ServletFileUpload(factory);
   
   // maximum file size to be uploaded.
   upload.setSizeMax( maxFileSize );
   
   try { 
      // Parse the request to get file items.
      List fileItems = upload.parseRequest(request);

      // Process the uploaded file items
      Iterator i = fileItems.iterator();
      int j=0;
      while ( i.hasNext () ) {
         FileItem fi = (FileItem)i.next();
         String fileName="wrong.jpg";
         if ( !fi.isFormField () ) {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            if(j==0)
            {
              fileName = walletid.concat("profile.png");
            }
            else 
            {
         	   fileName = walletid.concat("aadhar.png");
            }
            j++;
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
         
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ) {
               file = new File( filePath + 
               fileName.substring( fileName.lastIndexOf("\\"))) ;
            } else {
               file = new File( filePath + 
               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
           status="yes";
         }
      }

   } catch(Exception ex) {
      System.out.println(ex);
   }
   
   
   if(status.equals("yes"))
   {
	   Connection con;
	   PreparedStatement pst;
	   try
	   {
		   
	   	DBConnector dbc = new DBConnector();
	   	con=dbc.getDbconnection();
	   	pst=con.prepareStatement("update userlogin set profilestatus='completed' where userid=?;");
	   	pst.setString(1,user);
	   	pst.executeUpdate();
	   	pst=con.prepareStatement("update companydata set walletid=? where userid=?;");
	   	pst.setString(1,walletid);
	   	pst.setString(2,user);
	   	pst.executeUpdate();
	   	response.sendRedirect("AdminHome.jsp");
	   	con.close();
	   }
	   catch(Exception e)
	   {
	   out.println(e);
	   }

   }
   
} 
else 
{
  status="no";
}
%>
<%}
else
{
	response.sendRedirect("Failureadmin.jsp?status=sessionexpired");
}%>
</body>
</html>