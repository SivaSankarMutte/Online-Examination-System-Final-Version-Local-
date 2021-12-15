<%-- 
    Document   : adminlogin
    Created on : 20 Nov, 2021, 10:40:13 AM
    Author     : SIVASANKAR
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <jsp:include page="base.jsp"/>
        <div class="container mt-5">
            <div class="jumbotron bg-info">
		
		<form action="adminValidation" method="post" class="form-control">
                        <input type="text" name="adminEmail" class="form-control my-2" placeholder="Enter Admin Email">
                        <input type="password" name="adminpsw" class="form-control my-2" placeholder="Enter Password">
                        <input type="submit" class="btn btn-success form-control my-2" value="Submit">
		</form>
            </div>
        </div>
    </body>
</html>

