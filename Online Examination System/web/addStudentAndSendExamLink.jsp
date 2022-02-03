<%-- 
    Document   : addStudentAndSendExamLink
    Created on : 26 Jan, 2022, 1:26:58 PM
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
        <title>New Student Details to send Exam Link</title>
    </head>
    <body>
        <% 
            if(session.getAttribute("fid")==null)
            {
                response.sendRedirect("facultyLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <form method="post" action="studentAddedToListAndExamLinkSend.jsp">
                    <fieldset>
                        <legend class="bg-dark text-light"> <h2>Select a List</h2></legend>
                        <input type="text" name="formStudentName" placeholder="Enter Student Name (Optional)" class="form-control my-2">
                        <input type="text" name="formStudentRegdno" placeholder="Enter Student Rollno" class="form-control my-2" required>
                        <input type="text" name="formStudentEmail" placeholder="Enter Student Email" class="form-control my-2" required>
                        
                        <div class="row">
                            <div class="col">
                                <a href="addQuestionForm.jsp" class="btn btn-primary form-control my-2">Back</a>
                            </div>
                            <div class="col">
                                <input type="submit" value="Add and Sent" class="form-control my-2 btn btn-success"/>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>
