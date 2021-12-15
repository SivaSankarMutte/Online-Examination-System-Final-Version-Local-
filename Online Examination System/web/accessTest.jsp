<%-- 
    Document   : accessTest
    Created on : 3 Dec, 2021, 3:58:48 PM
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
        <title>Online Test</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result">
            select * from questions where examId=?
            <sql:param value='${sessionScope.examId}'/>
            
        </sql:query>
            
            
        <div class="container bg-info mt-5 rounded mb-5">
            <br/>
            <c:forEach var="row" items="${result.rows}">

                    <div class="jumbotron bg-success">
                        <h1>${row.questionName}</h1>
                        <p>
                            1.${row.opt1}
                        </p>
                        <p>
                            2.${row.opt2}
                        </p>
                        <c:if test="${row.opt3!=''}">
                            <p>3.${row.opt3}</p>
                        </c:if>
                        <c:if test="${row.opt4!=''}">
                            <p>4.${row.opt4}</p>
                        </c:if>
                    </div>
                <br/>
            </c:forEach>
        </div>
        
        
    </body>
</html>
