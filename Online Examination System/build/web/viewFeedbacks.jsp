<%-- 
    Document   : viewFeedbacks
    Created on : 27 Jan, 2022, 9:12:47 AM
    Author     : SIVASANKAR
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Feedbacks</title>
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
        <sql:query dataSource="${db}" var="result">
            select studentRegdNo,feedbackMessage from feedback where examId=?;
            <sql:param value="${sessionScope.eid}"/>
        </sql:query>
            <table border="1" width="100%" class="table table-borderless table-hover bg-dark text-light">
                <tr class="bg-success">
                    <th>RegdNo</th>
                    <th>Feedback</th>
                    
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.studentRegdNo}"/></td>
                        <td><c:out value="${row.feedbackMessage}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <div class="row">
                <div class="col">
                    <a href="addQuestionForm.jsp" class="btn btn-info form-control my-2">Back</a>
                </div>
            </div>
    </body>
</html>
                        