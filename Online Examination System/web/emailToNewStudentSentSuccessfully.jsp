<%-- 
    Document   : emailToNewStudentSentSuccessfully
    Created on : 26 Jan, 2022, 2:11:13 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Email Sent Successfully</title>
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
        <h1>Exam Link sent to Student successfully</h1>
        
        <a href="addQuestionForm.jsp" class="btn btn-info my-2">Go to Exam Page</a>
    </body>
</html>

