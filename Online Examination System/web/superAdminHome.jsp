<%-- 
    Document   : superAdminHome
    Created on : 27 Nov, 2021, 11:34:41 AM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Super Admin Home</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <% 
            if(session.getAttribute("superAdminName")==null)
            {
                response.sendRedirect("superAdminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <div class="container bg-info mt-5 rounded mb-5">
            <br/>
            <div class="jumbotron">
                <a href="viewAdmins.jsp" class="btn btn-outline-success">List all Admins</a>
            </div>
            <div class="jumbotron">
                <a href="addAdmin.jsp" class="btn btn-outline-info">Add a new Admin</a>
            </div>
            <div class="jumbotron">
                <a href="uploadAdminsFile.jsp" class="btn btn-outline-dark">Upload Admins CSV File</a>
            </div>
            <br/>
        </div>
    </body>
</html>

