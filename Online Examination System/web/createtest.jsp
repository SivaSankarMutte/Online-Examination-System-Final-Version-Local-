<%-- 
    Document   : createtest
    Created on : 21 Oct, 2021, 5:39:27 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Test</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <form method="post" action="insertintodb">
            <input type="text" name="fid" value="${param.fid}">
            <input type="text" name="examName" placeholder="Enter Exam name" class="form-control">
            <input type="text" name="noOfQuestions" placeholder="Enter number of Questions" class="form-control">
            <input type="submit" class="btn btn-outline-success">
        </form>
    </body>
</html>

