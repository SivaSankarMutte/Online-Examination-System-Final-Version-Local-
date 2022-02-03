<%-- 
    Document   : addQuestionForm
    Created on : 3 Dec, 2021, 12:05:23 PM
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
        <title>Add Question</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <% 
            if(session.getAttribute("fid")==null)
            {
                response.sendRedirect("facultyLogin.jsp");
            }
        %>
        <% 
            if(session.getAttribute("eid")==null || session.getAttribute("listName")==null || session.getAttribute("totalMarks")==null)
            {
                response.sendRedirect("facultyHome.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <nav class="navbar navbar-expand bg-dark navbar-dark" id="navbar">
            <% 
                HttpSession ses3=request.getSession();
                String questionsTableName = "questions"+ses3.getAttribute("fid").toString(); 
                ses3.setAttribute("questionsTableName", questionsTableName);
            %>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav ml-auto">
                    
                    <li class="nav-item">
                        <form method="post" action="updateExamDetails.jsp">
                            <input type="submit" value="Update Exam" class="btn btn-outline-warning">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item">
                        <form method="post" action="viewFeedbacks.jsp">
                            <input type="submit" value="View Feedbacks" class="btn btn-outline-info">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item">
                        <form method="post" action="viewStudentsOfGivenList.jsp">
                            <input type="submit" value="Students List" class="btn btn-outline-light">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item">
                        <form method="post" action="deleteExam.jsp">
                            <input type="submit" value="Delete Exam" class="btn btn-outline-danger">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item">
                        <form method="post" action="addStudentAndSendExamLink.jsp">
                            <input type="submit" value="Send ExamLink to new Student" class="btn btn-outline-success">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item">
                        <form method="post" action="uploadQuestionsFile.jsp">
                            <input type="submit" value="Upload Questions CSV" class="btn btn-outline-primary">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    <li class="nav-item">
                        <form method="post" action="sendMailToStudent">
                            <input type="submit" value="Send Exam Link to Students" class="btn btn-outline-info">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>    
                            
                    <sql:query dataSource="${db}" var="actresult">
                        select activation from exam where examId=?
                        <sql:param value="${sessionScope.eid}"/>
                    </sql:query>
                    <c:forEach var="row" items="${actresult.rows}">
                        <c:choose>
                            <c:when test="${row.activation!=1}">
                                <li class="nav-item">
                                    <form method="post" action="examResults.jsp">
                                        <% 
                                            HttpSession ses=request.getSession();
                                            String resultsTableName = "results"+ses.getAttribute("eid").toString(); 
                                            ses.setAttribute("resultsTableName", resultsTableName);
                                        %>
                                        <input type="submit" value="Results" class="btn btn-outline-warning">
                                    </form>
                                </li> &nbsp;&nbsp;&nbsp;
                                <li class="nav-item">
                                    <form method="post" action="activateTest.jsp">
                                        <input type="submit" value="Activate Test" class="btn btn-outline-success">
                                    </form>
                                </li> &nbsp;&nbsp;&nbsp;
                            </c:when> 
                            
                            <c:otherwise>
                                <sql:query dataSource="${db}" var="aqatresult">
                                    select allQuestionsAtATime from exam where examId=?
                                    <sql:param value="${sessionScope.eid}"/>
                                </sql:query>
                                <c:forEach var="row2" items="${aqatresult.rows}">
                                    <c:if test="${row2.allQuestionsAtATime==0}">
                                        <li class="nav-item">
                                            <form method="post" action="eachQuestionStatistics.jsp">
                                                <% 
                                                    HttpSession ses2=request.getSession();
                                                    String examSpecialTableNameForStatistics = "examSpecialTable"+ses2.getAttribute("eid").toString(); 
                                                    ses2.setAttribute("examSpecialTableName", examSpecialTableNameForStatistics);
                                                %>
                                                <input type="submit" value="Live Results" class="btn btn-outline-warning">
                                            </form>
                                        </li> &nbsp;&nbsp;&nbsp;
                                    </c:if>
                                </c:forEach>
                                <li class="nav-item">
                                    <form method="post" action="endTest.jsp">
                                        <input type="submit" value="End Test" class="btn btn-outline-danger">
                                    </form>
                                </li> &nbsp;&nbsp;&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                   
                </ul>
            </div>
        </nav>
        
        
        <div class="container mt-5">
            <c:choose>
                <c:when test="${sessionScope.message==null}">
                    
                </c:when>
                
                <c:when test="${sessionScope.message=='success'}">
                    <div class="alert alert-dismissible bg-success fade show" id="dismiss">
                        <div><strong>Success! </strong>Question added Successfully</div>
                        <a href="#" class="close" data-dismiss="alert" id="x" aria-label="close">&times;</a>
                    </div>
                    <c:remove var="message" scope="session"/>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-dismissible bg-danger fade show" id="dismiss">
                        <div><strong>Failed! </strong>Question failed to add</div>
                        <a href="#" class="close" data-dismiss="alert" id="x" aria-label="close">&times;</a>
                    </div>
                    <c:remove var="message" scope="session"/>
                </c:otherwise>
                 
            </c:choose>
            
            <div class="container rounded bg-success">
                <sql:query dataSource="${db}" var="totalMarksResult">
                    select count(questionName) qcount,sum(questionMarks) marksAssignedTillNow from ${sessionScope.questionsTableName} where examId=?
                        <sql:param value="${sessionScope.eid}"/>
                    </sql:query>
                    <c:forEach var="row" items="${totalMarksResult.rows}">
                        <c:out value="No. of Questions added till now: "/>
                        <span style="font-size: 25px;"><c:out value="${row.qcount}"/></span><br/>
                        <c:choose>
                            <c:when test="${Integer.parseInt(sessionScope.totalMarks)-row.marksAssignedTillNow>0}">
                                <c:out value="Still need to assign "/>
                                <span style="font-size: 25px;"><c:out value="${Integer.parseInt(sessionScope.totalMarks)-row.marksAssignedTillNow}"/></span>
                                <c:out value=" more marks"/>
                            </c:when>
                            <c:when test="${Integer.parseInt(sessionScope.totalMarks)-row.marksAssignedTillNow<0}">
                                <c:out value="You have given some "/>
                                <span style="font-size: 25px;"><c:out value="${row.marksAssignedTillNow-Integer.parseInt(sessionScope.totalMarks)}"/></span>
                                <c:out value=" more marks than you think"/><br/>
                            </c:when>
                            <c:otherwise>
                                <c:out value="Marks are perfectly equal to total marks"/>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>              
            </div>
            
            <div class="jumbotron bg-info">
                <form method="post" action="questionAddedToExam.jsp">
                    <fieldset>
                        <legend class="bg-dark text-light"> <h2>Add a Question</h2></legend>
                        <p>Is this question have multiple answers?</p>
                        <label><input type="radio" name="formHaveMultipleAns" value="1" class="form-control-radio" required>Yes</label>
                        <label><input type="radio" name="formHaveMultipleAns" value="0" class="form-control-radio" checked="checked">No</label>
                        <br/><br/>
                        <input type="text" name="formQuestionName" placeholder="Enter Question" class="form-control my-2" required>
                        <input type="text" name="formOpt1" placeholder="Enter Option1" class="form-control my-2" required>
                        <input type="text" name="formOpt2" placeholder="Enter Option2" class="form-control my-2" required>
                        <input type="text" name="formOpt3" placeholder="Enter Option3" class="form-control my-2">
                        <input type="text" name="formOpt4" placeholder="Enter Option4" class="form-control my-2">
                        <input type="text" name="formAns" placeholder="Enter option number of answer" class="form-control my-2" required>
                        <input type="any" name="formQuestionMarks" placeholder="Enter marks" value="1" class="form-control my-2" required>
                        <input type="any" name="formNegativeMarks" placeholder="Enter negative marks (defaults to 0)" value="0" class="form-control my-2" required>
                        
                        <div class="row">
                            <div class="col">
                                <a href="facultyHome.jsp" class="btn btn-primary form-control my-2">Back</a>
                            </div>
                            <div class="col">
                                <input type="submit" value="ADD" class="form-control my-2 btn btn-success"/>
                            </div>
                        </div> 
                    </fieldset>
                </form>
            </div>
        </div>
        <jsp:include page="questions.jsp"/>
    </body>
</html>
