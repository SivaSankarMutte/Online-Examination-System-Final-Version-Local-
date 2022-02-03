<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Students</title>
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
        <%
            HttpSession ses1=request.getSession();
            ses1.setAttribute("studentsTableName", "students"+session.getAttribute("fid").toString());
        %>
        <jsp:include page="base.jsp"/>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result">
            select * from ${sessionScope.studentsTableName} order by listName,regdNo;
        </sql:query>
            <table border="1" width="100%" class="table table-borderless table-hover bg-dark text-light">
                <tr style="background-color:darkgreen;">
                    <th>List Name</th>
                    <th>Student Name</th>
                    <th>Regd No</th>
                    <th>Email</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.listName}"/></td>
                        <td><c:out value="${row.studentName}"/></td>
                        <td><c:out value="${row.regdNo}"/></td>
                        <td><c:out value="${row.studentEmail}"/></td>
                        
                        <td>
                            <form method="post" action="updateStudent.jsp">
                                <input type="hidden" name="studentId" value="${row.studentId}"/>
                                <input type="submit" class="btn btn-outline-warning" value="UPDATE">
                            </form>
                        </td>

                        <td>
                            <form method="post" action="deleteStudentYesNo.jsp">
                                <input type="hidden" name="studentId" value="${row.studentId}"/>
                                <input type="submit" class="btn btn-outline-danger" value="DELETE">
                            </form>
                        </td>
                        
                    </tr>
                </c:forEach>
            </table>
            <div class="row">
                <div class="col">
                    <a href="facultyHome.jsp" class="btn btn-info form-control my-2">Back</a>
                </div>
            </div>
    </body>
</html>


