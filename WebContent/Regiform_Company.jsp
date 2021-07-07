<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
            
            
            
            
 			var http1 = createRequestObject();
            
            function makeGetRequest1() {
                userid=document.frm.userid.value;
                http1.open('get', 'companycheck.jsp?userid=' + userid);
                http1.onreadystatechange = processResponse1;
                http1.send(null);
            }
            
            function processResponse1() {
                if(http1.readyState == 4){
                    var response1 = http1.responseText;
                    document.getElementById('usidstat').innerHTML = response1;
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
<% 
if(session.getAttribute("userid")!=null)
{
	
%>
<h2>Add Company...</h2>
<form name="frm" method="post" action="Regcompany" onsubmit="return verifypassword()">
	User ID: <input type="text" name="userid" onblur="makeGetRequest1()" required><div id="usidstat"></div>
	<br>
	Company Name: <input type="text" name="name" autocomplete="off" required>
	<br>
	
	
	
	
	
	Company Type:
	<br>
<input type="radio" id="electric" name="cmptype" value="electric" required="required">
<label for="electric">Electric</label><br>
<input type="radio" id="mobile" name="cmptype" value="mobile" required="required">
<label for="female">Mobile</label><br>
<input type="radio" id="fasttag" name="cmptype" value="fasttag" required="required">
<label for="other">Fasttag</label>
<br> 
	Password: <input type="password" name="pswd" autocomplete="off" required>
	<br>
	Confirm Password: <input type="password" name="cnfpswd" autocomplete="off" required>
	<br>
	<input type="submit" value="Submit" >
</form>
<%}
else
{
	response.sendRedirect("Failureadmin.jsp?status=sessionexpired");
}%>
</body>
</html>