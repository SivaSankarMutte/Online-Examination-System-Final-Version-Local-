<%-- 
    Document   : deleteStudentOfGivenList
    Created on : 5 Apr, 2022, 3:15:19 PM
    Author     : SIVASANKAR
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Deleting Student</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        
        <sql:update dataSource="${db}" var="count">  
            DELETE from ${sessionScope.studentsTableName} where studentId=?
            <sql:param value="${param.studentId}"/>
        </sql:update>
        <c:if test="${count>=1}">
            <c:redirect url="viewStudentsOfGivenList.jsp"/>
        </c:if>
           <script type="text/javascript" src="assets\js\noBack.js"></script>
    </body>
</html>

