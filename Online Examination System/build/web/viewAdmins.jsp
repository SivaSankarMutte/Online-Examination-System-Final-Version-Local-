<%-- 
    Document   : viewAdmins
    Created on : 27 Nov, 2021, 11:58:41 AM
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
        <title>View Faculty</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body style="overflow-x:hidden">
        <% 
            if(session.getAttribute("sid")==null)
            {
                response.sendRedirect("superAdminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result">
            select * from admin;
        </sql:query>
            <table border="1" width="100%" class="table table-borderless table-hover bg-dark text-light">
                <tr class="bg-success">
                    <th>Admin Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.adminName}"/></td>
                        <td><c:out value="${row.email}"/></td>
                        <td><c:out value="${row.department}"/></td>
                        <td>
                            <form method="post" action="updateAdmin.jsp">
                                <input type="hidden" name="adminId" value="${row.adminId}"/>
                                <input type="submit" class="btn btn-outline-warning" value="UPDATE">
                            </form>
                        </td>

                        <td>
                            <form method="post" action="deleteAdminYesNo.jsp">
                                <input type="hidden" name="adminId" value="${row.adminId}"/>
                                <input type="submit" class="btn btn-outline-danger" value="DELETE">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="row">
                <div class="col">
                    <a href="superAdminHome.jsp" class="btn btn-info form-control my-2">Back</a>
                </div>
            </div>
    </body>
</html>





