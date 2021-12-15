<%-- 
    Document   : deleteFacultyYesNo
    Created on : 3 Dec, 2021, 4:38:40 PM
    Author     : SIVASANKAR
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Deletion Confirmation</title>
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
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <h1>Do you want to delete Faculty</h1>
                <div class="row">
                    <div class="col">
                        <br/>
                            <form method="post" action="deleteFaculty.jsp">
                                <input type="hidden" name="facultyId" value="${param.facultyId}"/>
                                <input type="submit" class="btn btn-outline-danger form-control" value="Yes">
                            </form>
                    
                    </div>
                    <div class="col">
                        <a href="viewFaculty.jsp" class="btn btn-outline-success form-control my-2">No</a>
                    </div>            
                </div>  
            </div>
        </div>
    </body>
</html>
