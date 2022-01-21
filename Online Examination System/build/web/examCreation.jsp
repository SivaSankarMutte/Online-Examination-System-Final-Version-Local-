<%-- 
    Document   : examCreation
    Created on : 2 Dec, 2021, 3:22:13 PM
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
        <title>Exam Creation</title>
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
        <jsp:include page="base.jsp"/>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result">
            select distinct listName from students where facultyId=?
            <sql:param value="${sessionScope.fid}"/>
        </sql:query>
        
            
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                <form method="post" action="examAddedToDB.jsp">
                    <fieldset>
                        <legend class="bg-dark text-light"> <h2>Creating Exam</h2></legend>
                        <input type="text" name="formExamName" placeholder="Enter Exam Name" class="form-control my-2" required>
                        <select name="formListName" required class="form-control my-2">
                            <c:forEach var="row" items="${result.rows}">
                                <option value="${row.listName}">${row.listName}</option>
                            </c:forEach>
                        </select>
                        <label for="formNoOfQuestions">Enter No. of Questions:(Not a required field):</label>
                        <input type="number" name="formNoOfQuestions" class="form-control my-2" id="formNoOfQuestions">
                        <label for="formStartTime">Enter Start Time:</label>
                        <input type="datetime-local" class="form-control my-2" name="formStartTime" id="formStartTime" required>
                        <label for="formEndTime">Enter End Time:</label>
                        <input type="datetime-local" class="form-control my-2" name="formEndTime" id="formEndTime" required>
                        <label for="formTotalMarks">Total Marks:(Not a required field):</label>
                        <input type="number" name="formTotalMarks" id="formTotalMarks" class="form-control my-2">
                        
                        <p>Randomize Questions</p>
                        <input type="radio" name="formRandomizeQuestions" value="1" class="form-control-radio" required>Yes
                        <input type="radio" name="formRandomizeQuestions" value="0" class="form-control-radio">No
                        <br/><br/>
                        <p>Allow Navigation between Questions</p>
                        <input type="radio" name="formNavigateBetweenQuestions" value="1" class="form-control-radio" required>Yes
                        <input type="radio" name="formNavigateBetweenQuestions" value="0" class="form-control-radio">No
                        <br/><br/>
                        <p>Allow Students to see All Questions at a time</p>
                        <input type="radio" name="formAllQuestionsAtATime" value="1" class="form-control-radio" required>Yes
                        <input type="radio" name="formAllQuestionsAtATime" value="0" class="form-control-radio">No
                        
                        
                        <div class="row">
                            <div class="col">
                                <a href="facultyHome.jsp" class="btn btn-primary form-control my-2">Back</a>
                            </div>
                            <div class="col">
                                <input type="submit" value="Create" class="form-control my-2 btn btn-success"/>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>