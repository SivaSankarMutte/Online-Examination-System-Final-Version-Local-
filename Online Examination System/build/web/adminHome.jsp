<%-- 
    Document   : validateAdmin
    Created on : 17 Oct, 2021, 4:01:27 PM
    Author     : SIVASANKAR
--%>

<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <% 
            if(session.getAttribute("aid")==null)
            {
                response.sendRedirect("adminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <div class="container bg-info mt-5 rounded mb-5">
            <br/>
            <div class="jumbotron">
                <a href="viewFaculty.jsp" class="btn btn-outline-success">List all Faculty</a>
            </div>
            <div class="jumbotron">
                <a href="addFaculty.jsp" class="btn btn-outline-warning">Add a new Faculty</a>
            </div>
            <div class="jumbotron">
                <a href="uploadFacultyFile.jsp" class="btn btn-outline-primary">Upload Faculty CSV File</a>
            </div>
            <div class="jumbotron">
                <a href="updateAdminProfile.jsp" class="btn btn-outline-danger">Profile Settings</a>
            </div>
            <div class="jumbotron">
                <a href="updateAdminPasswordForm.jsp" class="btn btn-outline-dark">Change Password</a>
            </div>
           <br/>
        </div>
    </body>
</html> 






