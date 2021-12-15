<%-- 
    Document   : deleteStudentYesNo
    Created on : 13 Dec, 2021, 2:02:13 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Deletion Confirmation</title>
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
        <jsp:include page="base.jsp"/>
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <h1>Do you want to delete Student</h1>
                <div class="row">
                    <div class="col">
                            <form method="post" action="deleteStudent.jsp">
                                <input type="hidden" name="studentId" value="${param.studentId}"/>
                                <input type="submit" class="btn btn-outline-danger form-control" value="Yes">
                            </form>
                    
                    </div>
                    <div class="col">
                        <a href="viewStudents.jsp" class="btn btn-outline-success form-control my-2">No</a>
                    </div>            
                </div>  
            </div>
        </div>
    </body>
</html>
