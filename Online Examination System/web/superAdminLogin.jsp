<%-- 
    Document   : superAdminLogin
    Created on : 27 Nov, 2021, 10:43:32 AM
    Author     : SIVASANKAR
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SuperAdmin Login</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
        
    </head>
    <body>
        <jsp:include page="base.jsp"/>
        <div class="container mt-5">
            <div class="jumbotron bg-info">
		<form action="superAdminValidation" method="post" class="form-control">
                    <input type="text" placeholder="Enter Super Admin Name" name="superAdminName" class="form-control my-2">
                    <input type="password" placeholder="Enter Password" name="superAdminPassword" class="form-control my-2">
                    <input type="submit" class="btn btn-success form-control my-2">
		</form>
            </div>
        </div>
    </body>
</html>










