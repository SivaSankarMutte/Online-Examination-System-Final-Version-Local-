<%-- 
    Document   : facultyHome
    Created on : 20 Nov, 2021, 10:55:13 AM
    Author     : SIVASANKAR
--%>


<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Home</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <% 
            if(session.getAttribute("fid")==null)
            {
                response.sendRedirect("facultyLogin.jsp");
            }
        %>
        
        <nav class="navbar navbar-expand bg-dark navbar-dark" id="navbar">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                      <a href="viewStudents.jsp" class="btn btn-outline-warning mx-2">Display Students</a>
                    </li>
                    <li class="nav-item">
                      <a href="listNameForm.jsp" class="btn btn-outline-info mx-2">Add Students CSV File</a>
                    </li>
                    <li class="nav-item">
                      <a href="addStudent.jsp" class="btn btn-outline-light mx-2">Add New Student</a>
                    </li>
                    <li class="nav-item">
                      <a href="deleteListForm.jsp" class="btn btn-outline-danger mx-2">Remove List</a>
                    </li>
                    <li class="nav-item">
                      <a href="examCreation.jsp" class="btn btn-outline-success mx-2">Create Exam</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link text-light" style="font-weight: 600" href="facultyLogout">FACULTY LOGOUT</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <jsp:include page="existingExams.jsp"/>      
        
    </body>
</html>


