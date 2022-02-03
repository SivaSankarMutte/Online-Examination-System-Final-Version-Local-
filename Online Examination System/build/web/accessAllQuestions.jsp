<%-- 
    Document   : accessAllQuestions
    Created on : 15 Jan, 2022, 11:34:38 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Test</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
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
        <script type="text/javascript">
            window.onload = maxWindow;

            function maxWindow() {
                window.moveTo(0, 0);

                if (document.all) {
                    top.window.resizeTo(screen.availWidth, screen.availHeight);
                }

                else if (document.layers || document.getElementById) {
                    if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth) {
                        top.window.outerHeight = screen.availHeight;
                        top.window.outerWidth = screen.availWidth;
                    }
                }
            }
        </script> 
    </head>
    <body>
        <% 
            if(session.getAttribute("examId")!=null && session.getAttribute("regdNo")!=null)
            {  %>
                <form action="allAnswersSubmission" method="post" class="form-control">
                    <c:forEach var="q" items="${sessionScope.questionsRecords}">

                        <c:choose>
                            <c:when test='${q.haveMultipleAns==0}'>
                                <div class="form-group jumbotron ml-5 mr-5 mt-2">
                                    <div id="overlay" class="noselect">
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}
                                    </div>

                                    <h2 class="noselect">
                                        <c:out value="${q.questionName}"/>
                                    </h2>
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
                                </div>
                            </c:when>

                            <c:otherwise>
                                <div class="form-group jumbotron ml-5 mr-5 mt-2">
                                    <div id="overlay" class="noselect">
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                        ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}
                                    </div>

                                    <h2 class="noselect">
                                        <c:out value="${q.questionName}"/>
                                    </h2>

                                            <input type="checkbox" name="${q.questionId}" value="1" id="1">
                                            <label for="1">${q.opt1}</label>
                                        <br/>
                                        <input type="checkbox" name="${q.questionId}" value="2" id="2">
                                            <label for="2">${q.opt2}</label>
                                        <br/>

                                        <c:if test='${q.opt3!=""}'>
                                            <input type="checkbox" name="${q.questionId}" value="3" id="3">
                                            <label for="3">${q.opt3}</label><br/>
                                        </c:if>

                                        <c:if test='${q.opt4!=""}'>
                                            <input type="checkbox" name="${q.questionId}" value="4" id="4">
                                            <label for="4">${q.opt4}</label>
                                        </c:if>

                                </div>       
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                    <input type="submit" value="Submit" class="btn btn-success form-control">

                </form>    
               <%
            }
        %>
        
        
      
    </body>
</html>
