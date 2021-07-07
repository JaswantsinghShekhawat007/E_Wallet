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
            
            
            var http = createRequestObject();
            
            function makeGetRequest() {
                walletid=document.frm.walletid.value;
                http.open('get', 'SearchtransByIDStatusCustomer.jsp?walletid='+walletid);
                http.onreadystatechange = processResponse;
                http.send(null);
            }
            
            function processResponse() {
                if(http.readyState == 4){
                    var response = http.responseText;
                    document.getElementById('repo').innerHTML = response;
                }
            }
            
            </script>
</head>
<body>
<% 
if(session.getAttribute("userid")!=null)
{
	
%>

 <div>
        <div class="row "><h2 class="d-flex justify-content-center mt-5 col-12 text-center">Search Transaction by Wallet-ID</h2></div>
        
    </div>
<div class="container mt-3">
        <div class="transfermoney-container">
            
            <form name="frm">
                <div class="form-row">
                  <div class="form-group mt-3 ml-md-3 ml-2 ">
                    <label for="inputEmail4">Enter Wallet-ID :</label>
                    <input type="text" name="walletid" required class="form-control-lg" id="inputEmail4" autocomplete="off">
                    <button type="button" class="btn btn-primary  " onclick="makeGetRequest()">Search</button>
                  </div>
                  
                </div>
               
                
              </form>
              

<div id="repo"></div>
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