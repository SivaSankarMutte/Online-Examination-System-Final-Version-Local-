<%-- 
    Document   : eachQuestionStatistics
    Created on : 15 Jan, 2022, 1:23:47 PM
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
        <title>Exam Statistics</title>
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
        <nav class="navbar navbar-expand bg-dark navbar-dark" id="navbar">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav ml-auto">
                    
                    <li class="nav-item">
                        <form method="post" action="addQuestionForm.jsp">
                            <input type="submit" value="Back" class="btn btn-outline-info">
                        </form>
                    </li>
                </ul>
            </div>
        </nav>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result1">
            select count(studentId) studentsCount from students where listName=(select listName from exam where examId=?)
            <sql:param value="${sessionScope.eid}"/>
        </sql:query>
            
        <sql:query dataSource="${db}" var="result2">
            select questionId,questionName from questions where examId=?
            <sql:param value="${sessionScope.eid}"/>
        </sql:query>
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                
                <c:forEach var="qdata" items="${result2.rows}">
                    <div class="jumbotron bg-success">
                        <h3 class="bg-dark text-light rounded">${qdata.questionName}</h3>
                        <form method="post" action="addMarkToAllStudents.jsp">
                            <input type="hidden" name="qid" value="${qdata.questionId}">
                            <input type="submit" value="Add Marks to all students" class="btn btn-secondary">                                
                        </form>
                        <sql:query dataSource="${db}" var="result3">
                            select count(regdNo) correct from ${sessionScope.examSpecialTableName} where marksObtained>0 and qid=?
                            
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                        <sql:query dataSource="${db}" var="result4">
                            select count(regdNo) bothcw from ${sessionScope.examSpecialTableName} where qid=? and marksObtained>=0
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                        <c:forEach var="r1data" items="${result1.rows}">
                            <c:forEach var="r3data" items="${result3.rows}">
                                <c:forEach var="r4data" items="${result4.rows}">
                                    <span style="font-size: 25px;"><c:out value="${(r3data.correct*100)/r4data.bothcw}"/></span>
                                        <c:out value=" percentage of students answered correctly"/><br/>
                                    <span style="font-size: 25px;"><c:out value="${((r4data.bothcw-r3data.correct)*100)/r4data.bothcw}"/></span>
                                        <c:out value=" percentage of students wrongly answered"/><br/>
                                    <span style="font-size: 25px;"><c:out value="${r1data.studentsCount-r4data.bothcw}"/></span>
                                        <c:out value=" students still need to answer this question"/>
                                </c:forEach>
                            </c:forEach>
                        </c:forEach>                   
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
      