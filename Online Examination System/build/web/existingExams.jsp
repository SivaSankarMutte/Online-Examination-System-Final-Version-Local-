<%-- 
    Document   : existingExams
    Created on : 2 Dec, 2021, 9:21:45 PM
    Author     : SIVASANKAR
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <body>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result">
            select * from exam where facultyId=?
            <sql:param value="${sessionScope.fid}"/>
            
        </sql:query>
            
            
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                
                <p class="text-center rounded" style="color: black; background-color: darkslateblue; padding: 15px; font-weight:700; font-size: 43px;" >Existing Exams</p>
                <c:forEach var="row" items="${result.rows}">
                    <form method="post" action="giveExamId">
                        <input type="hidden" name="eid" value="${row.examId}"/>
                        <button type="submit" class="card shadow-lg text-center bg-success my-2 mx-2" style="padding: 20px;">
                            <h1>${row.examName}</h1> 
                            No of Questions : ${row.noOfQuestions} <br/>
                            Start Time : ${row.startTime}  <br/>
                            End Time : ${row.endTime}    <br/>
                            Total Marks : ${row.totalMarks}  <br/>
                        </button>

                    </form>

                </c:forEach>
            </div>
        </div>
        
            
    </body>
</html>
