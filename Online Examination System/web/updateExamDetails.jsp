<%-- 
    Document   : updateExamDetails
    Created on : 27 Jan, 2022, 10:14:56 AM
    Author     : SIVASANKAR
--%>

<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Exam Details</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body style="overflow-x:hidden">
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
            select * from exam where examId=?;
            <sql:param value="${sessionScope.eid}"/>
        </sql:query>
        <form action="updateExamToDB.jsp" method="post" class="form-control">
            <fieldset>
                <c:forEach items="${result.rows}" var="row">
                    <legend class="bg-dark text-light"> <h2>Updating <c:out value='${row.examName}'/> Exam</h2></legend>
                    
                    <input type="text" name="formExamName" placeholder="Enter Exam Name" class="form-control my-2" value="${row.examName}" required>
                    
                    <sql:query dataSource="${db}" var="result1">
                        select distinct listName from ${sessionScope.studentsTableName};
                    </sql:query>
                    
                    <select name="formListName" required class="form-control my-2">
                        <c:forEach var="rowallnames" items="${result1.rows}">
                            <c:choose>
                                <c:when test="${rowallnames.listName==row.listName}">
                                    <option value="${row.listName}" selected>${row.listName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${rowallnames.listName}">${rowallnames.listName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>  
                    </select>
                    <label for="formNoOfQuestions">Enter No. of Questions:(Not a required field):</label>
                    <input type="number" name="formNoOfQuestions" class="form-control my-2" id="formNoOfQuestions" value="${row.noOfQuestions}">
                    
                    <label for="formStartTime">Enter Start Time:</label>
                        <input type="datetime-local" class="form-control my-2" name="formStartTime" id="formStartTime" value="${row.startTime}" required>
                        <label for="formEndTime">Enter End Time:</label>
                        <input type="datetime-local" class="form-control my-2" name="formEndTime" id="formEndTime" value="${row.endTime}" required>
                        <label for="formTotalMarks">Total Marks:</label>
                        <input type="number" name="formTotalMarks" id="formTotalMarks" class="form-control my-2" value="${row.totalMarks}" required>
                        
                        <p>Randomize Questions</p>
                        <c:choose>
                            <c:when test="${row.randomizeQuestions==1}">
                                <input type="radio" name="formRandomizeQuestions" value="1" class="form-control-radio" checked required>Yes
                                <input type="radio" name="formRandomizeQuestions" value="0" class="form-control-radio">No     
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="formRandomizeQuestions" value="1" class="form-control-radio" required>Yes
                                <input type="radio" name="formRandomizeQuestions" value="0" class="form-control-radio" checked>No
                            </c:otherwise>
                        </c:choose>
                        <br/>
                        <p>Allow Navigation between Questions</p>
                        <c:choose>
                            <c:when test="${row.navigateBetweenQuestions==1}">
                                <input type="radio" name="formNavigateBetweenQuestions" value="1" class="form-control-radio" checked required>Yes
                                <input type="radio" name="formNavigateBetweenQuestions" value="0" class="form-control-radio">No     
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="formNavigateBetweenQuestions" value="1" class="form-control-radio" required>Yes
                                <input type="radio" name="formNavigateBetweenQuestions" value="0" class="form-control-radio" checked>No
                            </c:otherwise>
                        </c:choose>
                        <br/>
                        <p>Allow Students to see All Questions at a time</p>
                        <c:choose>
                            <c:when test="${row.allQuestionsAtATime==1}">
                                <input type="radio" name="formAllQuestionsAtATime" value="1" class="form-control-radio" checked required>Yes
                                <input type="radio" name="formAllQuestionsAtATime" value="0" class="form-control-radio">No     
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="formAllQuestionsAtATime" value="1" class="form-control-radio" required>Yes
                                <input type="radio" name="formAllQuestionsAtATime" value="0" class="form-control-radio" checked>No
                            </c:otherwise>
                        </c:choose>
                        <br/>
                        <p>Enable Feedback form for this Exam?</p>
                        <c:choose>
                            <c:when test="${row.enableFeedbackForm==1}">
                                <input type="radio" name="formEnableFeedbackForm" value="1" class="form-control-radio" checked required>Yes
                                <input type="radio" name="formEnableFeedbackForm" value="0" class="form-control-radio">No     
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="formEnableFeedbackForm" value="1" class="form-control-radio" required>Yes
                                <input type="radio" name="formEnableFeedbackForm" value="0" class="form-control-radio" checked>No
                            </c:otherwise>
                        </c:choose>
                    
                    
                </c:forEach>
                <div class="row">
                    <div class="col">
                        <a href="addQuestionForm.jsp" class="btn btn-info form-control my-2">Back</a>
                    </div>
                    <div class="col">
                        <input type="submit" value="Update" class="form-control my-2 btn btn-success"/>
                    </div>
                </div> 
            </fieldset>
        </form>
    </body>
</html>



