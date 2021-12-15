<%-- 
    Document   : questions
    Created on : 3 Dec, 2021, 12:22:29 PM
    Author     : SIVASANKAR
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result">
            select * from questions where examId=?
            <sql:param value="${sessionScope.eid}"/>
            
        </sql:query>
            
            
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <c:forEach var="row" items="${result.rows}">
                    <div class="jumbotron bg-dark text-light">
                    <h4>
                        ${row.questionName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="updateQuestion.jsp?questionIdurl=${row.questionId}" class="btn btn-outline-warning my-2">Update</a>
                        <a href="removeQuestionYesNo.jsp?questionIdurl=${row.questionId}" class="btn btn-outline-danger my-2">Remove</a>
                    </h4>                            
                    
                    <c:choose>
                        <c:when test="${row.ans==1}">
                            Option1 :  ${row.opt1} <span class="badge badge-success">Correct</span> <br>
                            Option2 :  ${row.opt2} <br/>
                            Option3 :  ${row.opt3} <br/>
                            Option4 :  ${row.opt4} <br/>
                            
                        </c:when>
                        <c:when test="${row.ans==2}">
                            Option1 :  ${row.opt1} <br>
                            Option2 :  ${row.opt2} <span class="badge badge-success">Correct</span> <br/>
                            Option3 :  ${row.opt3} <br/>
                            Option4 :  ${row.opt4} <br/>
                            
                        </c:when>
                        <c:when test="${row.ans==3}">
                            Option1 :  ${row.opt1} <br>
                            Option2 :  ${row.opt2} <br/>
                            Option3 :  ${row.opt3} <span class="badge badge-success">Correct</span> <br/>
                            Option4 :  ${row.opt4} <br/>
                            
                        </c:when>
                            
                        <c:when test="${row.ans==4}">
                            Option1 :  ${row.opt1} <br>
                            Option2 :  ${row.opt2} <br/>
                            Option3 :  ${row.opt3} <br/>
                            Option4 :  ${row.opt4} <span class="badge badge-success">Correct</span> <br/>
                            
                        </c:when>
                            
                        <c:otherwise>
                            Option1 :  ${row.opt1} <br>
                            Option2 :  ${row.opt2} <br/>
                            Option3 :  ${row.opt3} <br/>
                            Option4 :  ${row.opt4} <br/>
                        </c:otherwise>
                        
                    </c:choose>
                    Mark(s) &nbsp;:  ${row.questionMarks} 
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
