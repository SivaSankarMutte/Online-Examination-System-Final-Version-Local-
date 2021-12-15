<%-- 
    Document   : removeQuestionYesNo
    Created on : 3 Dec, 2021, 8:04:52 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Deletion Confirmation</title>
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
                <h1>Do you want to delete Question</h1>
                <div class="row">
                    <div class="col">
                        <a href="removeQuestion.jsp?questionIdurl=${param.questionIdurl}" class="btn btn-warning form-control my-2">Yes</a>
                    </div>
                    <div class="col">
                        <a href="addQuestionForm.jsp" class="btn btn-success form-control my-2">No</a>
                    </div>            
                </div>  
            </div>
        </div>
    </body>
</html>
