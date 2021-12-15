<%-- 
    Document   : updateQuestion
    Created on : 3 Dec, 2021, 8:16:35 PM
    Author     : SIVASANKAR
--%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@ page import="java.sql.*"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Updating Question</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
        
    <body>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        
        <sql:query dataSource="${db}" var="rs">  
            SELECT * from questions where questionId=?
            <sql:param value="${param.questionIdurl}"/>
        </sql:query>  
            
        <%    
            session.setAttribute("sessionQuestionId",request.getParameter("questionIdurl"));
        %>
            
        <form action="updateQuestionToDB.jsp" method="post" class="form-control">
            <fieldset>
                <c:forEach items="${rs.rows}" var="row">
                    <legend class="bg-dark text-light"> <h2>Updating <c:out value='${row.questionName}'/> Question</h2></legend>
                    


                    <input type="text" name="formQuestionName" placeholder="Enter Question" class="form-control my-2" value="${row.questionName}" required>
                    <input type="text" name="formOpt1" placeholder="Enter Option1" class="form-control my-2" value="${row.opt1}" required>
                    <input type="text" name="formOpt2" placeholder="Enter Option2" class="form-control my-2" value="${row.opt2}" required>
                    <input type="text" name="formOpt3" placeholder="Enter Option3" class="form-control my-2" value="${row.opt3}">
                    <input type="text" name="formOpt4" placeholder="Enter Option4" class="form-control my-2" value="${row.opt4}">
                    <input type="text" name="formAns" placeholder="Enter option number of answer" class="form-control my-2" value="${row.ans}" required>
                    <input type="text" name="formQuestionMarks" placeholder="Enter marks" class="form-control my-2"  value="${row.questionMarks}" required>

                </c:forEach>
                <div class="row">
                    <div class="col">
                        <a href="addQuestionForm.jsp" class="btn btn-info form-control my-2">Back</a>
                    </div>
                    <div class="col">
                        <input type="submit" value="Update" class="form-control my-2 btn btn-success"/>
                    </div>
                </div> 
            </fieldset>
        </form>
    </body>
</html>
    
    


