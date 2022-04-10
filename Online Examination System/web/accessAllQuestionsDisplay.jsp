<%-- 
    Document   : accessAllQuestionsDisplay
    Created on : 10 Feb, 2022, 2:30:13 PM
    Author     : SIVASANKAR
--%>


<%@page import="QuestionsPackage.Questions"%>
<%@page import="QuestionsPackage.LiveResults"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Online Exam - BEC</title>
        <meta name="description" content="BEC Exam Portal">
        <link rel="stylesheet" href="assets\bootstrap\css\bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="assets\fonts\fontawesome-all.min.css">
        <link rel="stylesheet" href="assets\fonts\font-awesome.min.css">
        <link rel="stylesheet" href="assets\fonts\ionicons.min.css">
        <link rel="stylesheet" href="assets\fonts\typicons.min.css">
        <link rel="stylesheet" href="assets\fonts\fontawesome5-overrides.min.css">
        <link rel="stylesheet" href="assets\css\styles.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link rel="icon" type="text/css" href="images/test.png">
        <style>
            #overlay{
                position: absolute;
                opacity: 0.3;
                transform:rotate(-45deg);
                overflow-y: hidden;
                overflow-x: hidden;
                overflow-wrap: break-word;
                margin-left: 200px;
                
            }
            .noselect {
                user-select: none; /* Non-prefixed version, currently
                                                supported by Chrome, Edge, Opera and Firefox */
            }
        </style>
        
    </head>
    <body id="page-top" style="padding: 5;">
    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content" style="border-color: var(--bs-success);">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top" style="background: var(--bs-success);color: var(--bs-success);">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button" style="background: var(--bs-success);"><i class="fas fa-bars"></i></button>
                        <h1>Online Exam Portal</h1><a class="btn btn-success btn-icon-split" role="button"><span class="text-white-50 icon"><i class="typcn typcn-chevron-right"></i></span><span class="text-white text">Submit</span></a>
                    </div>
                </nav>

        <% 
            if(session.getAttribute("examId")!=null && session.getAttribute("regdNo")!=null)
            {  %>
                <form action="allAnswersSubmission" method="post" class="form-control">
                    <c:forEach var="q" items="${sessionScope.questionsRecords}" varStatus="loop">

                        <c:choose>
                            <c:when test='${q.isBlankType==1}'>
                                
                                    <div id="overlay">
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}
                                    </div>

                                    
                                    <h4 class="card-title" style="user-select:none;">
                                        <c:out value="${loop.count}"/>
                                        <c:out value="."/>
                                        <c:out value="${q.questionName}"/>
                                    </h4>
                                    
                                    <input type="text" name="${q.questionId}" placeholder="Enter your answer here" class="form-control">
                                
                            </c:when>
                            <c:when test='${q.haveMultipleAns==0}'>
                               
                                    <div id="overlay">
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}
                                    </div>

                                    <h4 class="card-title" style="user-select:none;">
                                        <c:out value="${loop.count}"/>
                                        <c:out value="."/>
                                        <c:out value="${q.questionName}"/>
                                    </h4>
                                    <h6 class="text-muted card-subtitle mb-2">Select from following options</h6>
                                        <label>
                                            <input type="radio" name="${q.questionId}" value="1" class="form-control-radio"><c:out value="${q.opt1}"/>
                                        </label>
                                        <br/>
                                        <label>
                                            <input type="radio" name="${q.questionId}" value="2" class="form-control-radio"><c:out value="${q.opt2}"/>
                                        </label>
                                        <br/>

                                        <c:if test='${q.opt3!=""}'>
                                            <label>
                                                <input type="radio" name="${q.questionId}" value="3" class="form-control-radio"><c:out value="${q.opt3}"/>
                                            </label><br/>
                                        </c:if>

                                        <c:if test='${q.opt4!=""}'>
                                            <label>
                                                <input type="radio" name="${q.questionId}" value="4" class="form-control-radio"><c:out value="${q.opt4}"/>
                                            </label>
                                        </c:if>
                                
                            </c:when>

                            <c:otherwise>
                               
                                    <div id="overlay">
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}
                                    </div>

                                    <h4 class="card-title" style="user-select:none;">
                                        <c:out value="${loop.count}"/>
                                        <c:out value="."/>
                                        <c:out value="${q.questionName}"/>
                                    </h4>
                                    <h6 class="text-muted card-subtitle mb-2">Select from following options</h6>
                                            <input type="checkbox" name="${q.questionId}" value="1" id="${q.questionId}1">
                                            <label for="${q.questionId}1">${q.opt1}</label>
                                        <br/>
                                        <input type="checkbox" name="${q.questionId}" value="2" id="${q.questionId}2">
                                            <label for="${q.questionId}2">${q.opt2}</label>
                                        <br/>

                                        <c:if test='${q.opt3!=""}'>
                                            <input type="checkbox" name="${q.questionId}" value="3" id="${q.questionId}3">
                                            <label for="${q.questionId}3">${q.opt3}</label><br/>
                                        </c:if>

                                        <c:if test='${q.opt4!=""}'>
                                            <input type="checkbox" name="${q.questionId}" value="4" id="${q.questionId}4">
                                            <label for="${q.questionId}4">${q.opt4}</label>
                                        </c:if>
      
                            </c:otherwise>
                        </c:choose>
                        <br/><br/><br/><br/>
                    </c:forEach>
                    <input type="submit" value="Submit" class="btn btn-success form-control">

                </form>    
               <%
            }
        %>
        
       </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © BEC 2021</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
        <script src="assets\bootstrap\js\bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script src="assets\js\script.min.js"></script>
    <script type="text/javascript" src="assets\js\noBack.js"></script>
    </body>
</html>
