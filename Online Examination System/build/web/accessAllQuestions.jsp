<%-- 
    Document   : accessAllQuestions
    Created on : 15 Jan, 2022, 11:34:38 AM
    Author     : SIVASANKAR
--%>

<%@page import="QuestionsPackage.Questions"%>
<%@page import="QuestionsPackage.LiveResults"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Test</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        
        <form action="allAnswersSubmission" method="post" class="form-control">
            <c:forEach var="q" items="${sessionScope.questionsRecords}">
                <div class="form-group jumbotron ml-5 mr-5 mt-2">
                    <h2>
                        <c:out value="${q.questionName}"/>
                    </h2>
                    <input type="radio" name="${q.questionId}" value="1" class="form-control-radio"><c:out value="${q.opt1}"/><br/>
                    <input type="radio" name="${q.questionId}" value="2" class="form-control-radio"><c:out value="${q.opt2}"/><br/>
                    
                    <c:if test='${q.opt3!=""}'>
                        <input type="radio" name="${q.questionId}" value="3" class="form-control-radio"><c:out value="${q.opt3}"/><br/>
                    </c:if>
                    <c:if test='${q.opt4!=""}'>
                        <input type="radio" name="${q.questionId}" value="4" class="form-control-radio"><c:out value="${q.opt4}"/><br/>
                    </c:if>
                </div>
            </c:forEach>
            <input type="submit" value="Submit" class="btn btn-success form-control">
            
        </form>    
        
      
    </body>
</html>
