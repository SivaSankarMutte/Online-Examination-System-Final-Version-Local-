<%-- 
    Document   : addAdmin
    Created on : 11 Dec, 2021, 8:29:35 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Adding an Admin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <fieldset>
                    <legend class="bg-dark text-light"><h2>Adding a new Admin</h2></legend>
                    <form method="post" action="adminAddedToDB.jsp" class="form-control">
                        <input type="text" placeholder="Enter Admin Name" class="form-control" name="adminName">
                        <input type="email" placeholder="Enter Email" class="form-control" name="adminEmail">

                        Select Department:<br/>
                        <select name="adminDept">
                            <option value="CSE">CSE</option>
                            <option value="ECE">ECE</option>
                            <option value="EEE">EEE</option>
                            <option value="MECH">MECH</option>
                            <option value="CIVIL">CIVIL</option>
                            <option value="E&I">E&I</option>

                        </select>
                        <br/>
                        <input type="text" placeholder="Enter a Password for this Admin" class="form-control" name="adminPassword">
                        <div class="row">
                            <div class="col">
                                <a href="superAdminHome.jsp" class="btn btn-info form-control my-2">Back</a>
                            </div>
                            <div class="col">
                                <input type="submit" value="ADD" class="form-control my-2 btn btn-success"/>
                            </div>
                        </div> 
                    </form>
                </fieldset>
            </div>
        </div>
    </body>
</html>
