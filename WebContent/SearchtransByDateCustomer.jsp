<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
                dtfrm=document.frm.dtfrm.value;
                dtto=document.frm.dtto.value;
                http.open('get', 'SearchtransByDateStatusCustomer.jsp?dtfrm=' + dtfrm+'&dtto='+dtto);
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
        <div class="row "><h2 class="d-flex justify-content-center mt-5 col-12 text-center">Search Transaction by date</h2></div>
        
    </div>
 <div class="container mt-3" style="">
        <div class="transfermoney-container">
            
            <form name="frm">
                <div class="form-row">
                  <div class="form-group mt-3 ml-md-3 ml-2 col-md-6">
                    <label for="inputEmail4">Enter Start date</label>
                    <input type="date" class="form-control" name="dtfrm" required id="inputEmail4" >
                  </div>
                  <div class="form-group col-md mt-3 ml-2 mr-1">
                    <label for="enddate">Enter End date</label>
                    <input type="date" class="form-control"  name="dtto" required id="enddate" >
                  </div>
                </div>
               
                <button type="button" onclick="makeGetRequest()" class="btn btn-primary ml-3 mb-3">Search</button>
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