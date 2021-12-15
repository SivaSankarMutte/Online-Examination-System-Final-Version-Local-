<%-- 
    Document   : questionFailedToUpdate
    Created on : 3 Dec, 2021, 10:36:27 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Failed to Update</title>
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
        <h1>Question Failed to Update!</h1>
        <a href="updateQuestion.jsp?questionIdurl=${sessionScope.sessionQuestionId}" class="btn btn-outline-warning my-2">Retry to Update Question</a>
        <% session.removeAttribute("sessionQuestionId"); %>
        <a href="addQuestionForm.jsp" class="btn btn-outline-warning my-2">Back To Exam</a>
    </body>
</html>
