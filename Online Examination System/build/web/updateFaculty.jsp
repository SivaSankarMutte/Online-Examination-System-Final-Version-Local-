<%-- 
    Document   : updateFaculty
    Created on : 1 Dec, 2021, 6:59:09 PM
    Author     : SIVASANKAR
--%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@page import="java.sql.*"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Updating Faculty</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
        
    <body>
        <% 
            if(session.getAttribute("aid")==null)
            {
                response.sendRedirect("adminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        
        <sql:query dataSource="${db}" var="rs">  
            SELECT * from faculty where facultyId=?
            <sql:param value="${param.facultyId}"/>
        </sql:query>  
            
        <%    
            session.setAttribute("sessionFacultyId",request.getParameter("facultyId"));
        %>
            
        <form action="updateFacultyToDB.jsp" method="post" class="form-control">
            <fieldset>
            <c:forEach items="${rs.rows}" var="row">
                <legend class="bg-dark text-light"> <h2>Updating <c:out value='${row.facultyName}'/> Faculty</h2></legend>
                
                <input type="text" placeholder="Enter Admin Name" class="form-control" name="formFacultyName" value="${row.facultyName}">
                <input type="email" placeholder="Enter Email" class="form-control" name="formFacultyEmail" value="${row.email}">
                <input type="text" placeholder="Enter Password" class="form-control" name="formFacultyPassword" value="${row.password}">
                
            </c:forEach>
 
            <div class="row">
                <div class="col">
                    <a href="viewFaculty.jsp" class="btn btn-info form-control my-2">Back</a>
                </div>
                <div class="col">
                    <input type="submit" value="Update" class="form-control my-2 btn btn-success"/>
                </div>
            </div> 
            </fieldset>
        </form>
    </body>
</html>

    

