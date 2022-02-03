<%-- 
    Document   : examSubmisssionSuccess
    Created on : 11 Jan, 2022, 11:33:42 AM
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
        <title>Exam Submisssion Success</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <% 
            session.setAttribute("fexamId", session.getAttribute("examId").toString());
            session.setAttribute("fregdNo", session.getAttribute("regdNo").toString());
            session.removeAttribute("examId");
            session.removeAttribute("regdNo");
        
        %>
        <div class="container mt-5">
            <div class="jumbotron bg-success">
                <h1>Exam Submitted Successfully!</h1>
                <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
                <sql:query dataSource="${db}" var="result">
                    select facultyId,enableFeedbackForm from exam where examId=?
                    <sql:param value="${sessionScope.fexamId}"/>
                </sql:query>
                <c:forEach var="row" items="${result.rows}">
                    <c:choose>
                        <c:when test="${row.enableFeedbackForm==1}">                  
                            <form action="feedbackSubmission.jsp">
                                <c:set scope="session" var="facultyId" value="${row.facultyId}"/>
                                <textarea name="formFeedback" placeholder="Provide your Feedback here...">
                                </textarea>
                                <input type="submit" value="Submit">
                            </form>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
        
        
    </body>
</html>
