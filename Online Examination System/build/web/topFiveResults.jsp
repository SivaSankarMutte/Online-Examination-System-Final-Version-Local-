<%-- 
    Document   : topFiveResults
    Created on : 27 Jan, 2022, 5:23:14 PM
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
        <title>Top 5</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <% 
            if(session.getAttribute("fid")==null)
            {
                response.sendRedirect("facultyLogin.jsp");
            }
            HttpSession ses2=request.getSession(); 
            ses2.setAttribute("examSpecialTableName", "examSpecialTable"+ses2.getAttribute("eid").toString());
        %>
        
        <jsp:include page="base.jsp"/>
        
        <nav class="navbar navbar-expand bg-dark navbar-dark" id="navbar">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav ml-auto">
                    
                    <li class="nav-item">
                        <form method="post" action="examResults.jsp">
                            <input type="submit" value="Back" class="btn btn-outline-info">
                        </form>
                    </li>
                    
                </ul>
            </div>
        </nav>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result">
            select regdNo,totalMarks from ${sessionScope.resultsTableName} order by totalMarks desc LIMIT 5;
        </sql:query>
            
            
        <table border="1" width="100%" class="table table-borderless table-hover bg-dark text-light">
            <tr style="background-color:darkgreen;">
                <th>Regd No</th>
                <th>Marks</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.regdNo}"/></td>
                    <td><c:out value="${row.totalMarks}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
      