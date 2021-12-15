<%-- 
    Document   : addStudent
    Created on : 13 Dec, 2021, 12:16:28 PM
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
        <title>New Student Details</title>
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
            select distinct listName from students where facultyId=?
            <sql:param value="${sessionScope.fid}"/>
        </sql:query>
        
            
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <form method="post" action="studentAddedToDB.jsp">
                    <fieldset>
                        <legend class="bg-dark text-light"> <h2>Select a List</h2></legend>
                        <input type="text" name="formStudentRegdno" placeholder="Enter Student Name" class="form-control my-2" required>
                        <input type="text" name="formStudentEmail" placeholder="Enter Student Email" class="form-control my-2" required>
                        <select name="formListName" required class="form-control my-2">
                            <c:forEach var="row" items="${result.rows}">
                                <option value="${row.listName}">${row.listName}</option>
                            </c:forEach>
                        </select>
                        <div class="row">
                            <div class="col">
                                <a href="facultyHome.jsp" class="btn btn-primary form-control my-2">Back</a>
                            </div>
                            <div class="col">
                                <input type="submit" value="Add" class="form-control my-2 btn btn-success"/>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>
