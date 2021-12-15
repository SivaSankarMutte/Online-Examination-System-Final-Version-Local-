<%-- 
    Document   : updateAdminProfile
    Created on : 3 Dec, 2021, 1:11:04 PM
    Author     : SIVASANKAR
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Updating Admin Profile</title>
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
            SELECT * from admin where adminId=?
            <sql:param value="${sessionScope.aid}"/>
        </sql:query>  
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <form action="updateAdminProfileToDB.jsp" method="post" class="form-control">
                    <fieldset>
                        <legend class="bg-dark text-light"> <h2>Changing Admin Profile</h2></legend>
                        <c:forEach items="${rs.rows}" var="row">
                            <input type="text" placeholder="Enter Admin Name" class="form-control my-2" name="formAdminName" value="${row.adminName}">
                            <input type="email" placeholder="Enter Email" class="form-control my-2" name="formAdminEmail" value="${row.email}">
                        </c:forEach>

                        <div class="row">
                            <div class="col">
                                <a href="adminHome.jsp" class="btn btn-info form-control my-2">Back</a>
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


