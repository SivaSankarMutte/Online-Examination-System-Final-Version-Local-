<%-- 
    Document   : uploadStudentsFile
    Created on : 2 Dec, 2021, 3:02:32 PM
    Author     : SIVASANKAR
--%>

<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Upload File</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
        
    </head>
    <% session.setAttribute("formListName", request.getParameter("formListName"));  %>
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
            select count(*) as c from students where facultyId=? and listName=?;
            <sql:param value="${sessionScope.fid}"/>
            <sql:param value="${sessionScope.formListName}"/>
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <c:if test="${row.c!=0}">
                <c:out value="List Name already Taken"/>
                <% session.removeAttribute("formListName");  %>
                <jsp:include page="listNameForm.jsp"/>
            </c:if>
        </c:forEach>
            
        <c:forEach var="row" items="${result.rows}">
            <c:if test="${row.c==0}">
                <FORM ENCTYPE="multipart/form-data" ACTION="uploadStudents.jsp" METHOD="post">
                    <br><br><br>
                    <center>
                        <table border="2">
                            <tr>
                                <td colspan="2">
                                    <p align="center"><B>Upload Students CSV file</B>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Choose the file To Upload:</b>
                                </td>
                                <td>
                                    <INPUT NAME="file" TYPE="file" class="form-control" required>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <div align="right">
                                        <div class="row">
                                            <div class="col">
                                                <a href="listNameForm.jsp" class="btn btn-info form-control my-2">Back</a>
                                            </div>
                                            <div class="col">
                                                <input type="submit" value="Send File" class="form-control my-2 btn btn-success"/>
                                            </div>
                                        </div> 
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </center> 
                </FORM>
            </c:if>
        </c:forEach>
    </body>
</html>