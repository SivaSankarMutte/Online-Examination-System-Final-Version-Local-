<%-- 
    Document   : emailsSentSuccessfully
    Created on : 3 Dec, 2021, 4:00:00 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emails Sent Successfully</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <h1>Exam Links sent to Students successfully</h1>
        <form method="post" action="giveExamId">
            <input type="hidden" name="eid" value="${sessionScope.eid}"/>
            <input type="submit" value="Add Questions" class="btn btn-success my-2">
        </form>
        <a href="facultyHome.jsp" class="btn btn-info my-2">Go to Home</a>
    </body>
</html>

