<%@ page import="java.sql.*"%>  

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Updating Admin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
        
    <body>
        <% 
            if(session.getAttribute("superAdminName")==null)
            {
                response.sendRedirect("superAdminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        
        <sql:query dataSource="${db}" var="rs">  
            SELECT * from admin where adminId=?
            <sql:param value="${param.adminId}"/>
        </sql:query>  
            
        <%    
            session.setAttribute("sessionAdminId",request.getParameter("adminId"));
        %>
        
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <form action="updateAdminToDB.jsp" method="post" class="form-control">
                    <fieldset>
                        <c:forEach items="${rs.rows}" var="row">
                            <legend class="bg-dark text-light"> <h2>Updating <c:out value='${row.adminName}'/> Admin</h2></legend>
                            <input type="hidden" name="formAdminId" value="${row.adminId}" class="form-control my-2">
                            <input type="text" placeholder="Enter Admin Name" class="form-control my-2" name="formAdminName" value="${row.adminName}">
                            <input type="email" placeholder="Enter Email" class="form-control my-2" name="formAdminEmail" value="${row.email}" required>
                            <input type="text" placeholder="Enter Password" class="form-control my-2" name="formAdminPassword" value="${row.password}" required>
                            Select a Category:<br/>
                            <select name="formAdminDept" class="form-control my-2" required>
                                <c:if test='${row.department == "CSE"}'>
                                    <option value="CSE" selected>CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MECH">MECH</option>
                                    <option value="CIVIL">CIVIL</option>
                                    <option value="E&I">E&I</option>
                                </c:if>
                                <c:if test='${row.department == "ECE"}'>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE" selected>ECE</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MECH">MECH</option>
                                    <option value="CIVIL">CIVIL</option>
                                    <option value="E&I">E&I</option>
                                </c:if>
                                <c:if test='${row.department == "EEE"}'>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE" selected>EEE</option>
                                    <option value="MECH">MECH</option>
                                    <option value="CIVIL">CIVIL</option>
                                    <option value="E&I">E&I</option>
                                </c:if>
                                <c:if test='${row.department == "MECH"}'>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MECH" selected>MECH</option>
                                    <option value="CIVIL">CIVIL</option>
                                    <option value="E&I">E&I</option>
                                </c:if>
                                <c:if test='${row.department == "CIVIL"}'>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MECH">MECH</option>
                                    <option value="CIVIL" selected>CIVIL</option>
                                    <option value="E&I">E&I</option>
                                </c:if>
                                <c:if test='${row.department == "E&I"}'>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MECH">MECH</option>
                                    <option value="CIVIL">CIVIL</option>
                                    <option value="E&I" selected>E&I</option>
                                </c:if>
                                <c:if test='${row.department != "CSE" && row.department != "ECE" && row.department != "EEE" && row.department != "MECH" && row.department != "CIVIL" && row.department != "E&I"}'>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MECH">MECH</option>
                                    <option value="CIVIL">CIVIL</option>
                                    <option value="E&I">E&I</option>
                                </c:if>
                            </select>
                            <br/>


                        </c:forEach>
                            <div class="row">
                                <div class="col">
                                    <a href="viewAdmins.jsp" class="btn btn-info form-control my-2">Back</a>
                                </div>
                                <div class="col">
                                    <input type="submit" value="Update" class="form-control my-2 btn btn-success"/>
                                </div>
                            </div>  
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>

    

