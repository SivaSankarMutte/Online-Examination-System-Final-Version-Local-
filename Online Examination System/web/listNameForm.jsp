<%-- 
    Document   : listNameForm
    Created on : 2 Dec, 2021, 6:01:44 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giving List Name</title>
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
                <FORM ACTION="uploadStudentsFile.jsp" METHOD="post">
                    <fieldset>
                        <legend class="bg-dark text-light"><h2>Section Name:</h2></legend>
                        <INPUT TYPE="text" placeholder="Provide a Name for this List" class="form-control my-1" name="formListName" required>

                        <div class="row">
                            <div class="col">
                                <a href="facultyHome.jsp" class="btn btn-primary form-control my-2">Back</a>
                            </div>
                            <div class="col">
                               <input type="submit" value="Next" class="form-control my-2 btn btn-success"/>
                            </div>
                        </div>
                    </fieldset>
                </FORM>
            </div>
        </div>
    </body>
</html>
