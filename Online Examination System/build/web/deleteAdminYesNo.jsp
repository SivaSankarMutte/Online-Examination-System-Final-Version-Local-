<%-- 
    Document   : deleteAdminYesNo
    Created on : 28 Nov, 2021, 5:58:27 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Deletion Confirmation</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <% 
            if(session.getAttribute("sid")==null)
            {
                response.sendRedirect("superAdminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <h1>Do you want to delete Admin</h1>
                <div class="row">
                    <div class="col">
                        <br/><br/>
                            <form method="post" action="deleteAdmin.jsp">
                                <input type="hidden" name="adminId" value="${param.adminId}"/>
                                <input type="submit" class="btn btn-outline-danger form-control" value="Yes">
                            </form>
                       
                    </div>
                    <div class="col">
                        <a href="viewAdmins.jsp" class="btn btn-outline-success form-control my-5">No</a>
                    </div>            
                </div>  
            </div>
        </div>
    </body>
</html>
