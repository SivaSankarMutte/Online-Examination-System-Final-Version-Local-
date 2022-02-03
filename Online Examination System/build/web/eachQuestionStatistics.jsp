<%-- 
    Document   : eachQuestionStatistics
    Created on : 15 Jan, 2022, 1:23:47 PM
    Author     : SIVASANKAR
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Statistics</title>
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
            ses1.setAttribute("questionsTableName", "questions"+session.getAttribute("fid").toString());
        %>
        <jsp:include page="base.jsp"/>
        <nav class="navbar navbar-expand bg-dark navbar-dark" id="navbar">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav ml-auto">
                    
                    <li class="nav-item">
                        <form method="post" action="addQuestionForm.jsp">
                            <input type="submit" value="Back" class="btn btn-outline-info">
                        </form>
                    </li>
                </ul>
            </div>
        </nav>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <sql:query dataSource="${db}" var="result1">
            select count(studentId) studentsCount from ${sessionScope.studentsTableName} where listName=(select listName from exam where examId=?)
            <sql:param value="${sessionScope.eid}"/>
        </sql:query>
        
        <sql:query dataSource="${db}" var="result2">
            select questionId,questionName,opt1,opt2,opt3,opt4 from ${sessionScope.questionsTableName} where examId=?
            <sql:param value="${sessionScope.eid}"/>
        </sql:query>
        <div class="container mt-5">
            <div class="jumbotron bg-info">
                
                <c:forEach var="qdata" items="${result2.rows}">
                    <div class="jumbotron bg-success">
                        <h3 class="bg-dark text-light rounded">${qdata.questionName}</h3>
                        <form method="post" action="addMarkToAllStudents.jsp">
                            <input type="hidden" name="qid" value="${qdata.questionId}">
                            <input type="submit" value="Add Marks to all students" class="btn btn-secondary">                                
                        </form>
                        <sql:query dataSource="${db}" var="result3">
                            select count(regdNo) correct from ${sessionScope.examSpecialTableName} where marksObtained>0 and qid=?
                            
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                        <sql:query dataSource="${db}" var="result4">
                            select count(regdNo) bothcw from ${sessionScope.examSpecialTableName} where qid=? and marksObtained is not null;
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                            
                        <sql:query dataSource="${db}" var="result5">
                            select count(regdNo) skippersCount from ${sessionScope.examSpecialTableName} where qid=? and marksObtained is null;
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                         
         
                        <sql:query dataSource="${db}" var="result6">
                            select count(regdNo) opt1Count from ${sessionScope.examSpecialTableName} where qid=? and selectedOptions like '%1%';
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                        <sql:query dataSource="${db}" var="result7">
                            select count(regdNo) opt2Count from ${sessionScope.examSpecialTableName} where qid=? and selectedOptions like '%2%';
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                        <sql:query dataSource="${db}" var="result8">
                            select count(regdNo) opt3Count from ${sessionScope.examSpecialTableName} where qid=? and selectedOptions like '%3%';
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                        <sql:query dataSource="${db}" var="result9">
                            select count(regdNo) opt4Count from ${sessionScope.examSpecialTableName} where qid=? and selectedOptions like '%4%';
                            <sql:param value="${qdata.questionId}"/>
                        </sql:query>
                        
                          
                        <c:forEach var="r1data" items="${result1.rows}">
                            <c:forEach var="r3data" items="${result3.rows}">
                                <c:forEach var="r4data" items="${result4.rows}">
                                    <c:forEach var="r5data" items="${result5.rows}">
                                        <c:forEach var="r6data" items="${result6.rows}">
                                            <c:forEach var="r7data" items="${result7.rows}">
                                                <c:forEach var="r8data" items="${result8.rows}">
                                                    <c:forEach var="r94data" items="${result9.rows}">
                                                        
                                                        <span style="font-size: 25px;"><c:out value="${r4data.bothcw}"/></span>
                                                            <c:out value=" no. of students attempted this question"/><br/>
                                                        <span style="font-size: 25px;"><c:out value="${r3data.correct}"/></span>
                                                            <c:out value=" no. of students correctly answered this question"/><br/>    
                                                        <span style="font-size: 25px;"><c:out value="${r4data.bothcw-r3data.correct}"/></span>
                                                            <c:out value=" no. of students wrongly answered this question"/><br/>
                                                        <span style="font-size: 25px;"><c:out value="${r5data.skippersCount}"/></span>
                                                            <c:out value=" no. of students who skipped or unanswered this question"/><br/>
                                                        
                                                        <span style="font-size: 25px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${(r3data.correct*100)/r4data.bothcw}"/></span>
                                                        <span style="font-size: 25px;"><c:out value="%"/></span>
                                                            <c:out value=" of students answered correctly"/><br/>
                                                        <span style="font-size: 25px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${((r4data.bothcw-r3data.correct)*100)/r4data.bothcw}"/></span>
                                                        
                                                        <span style="font-size: 25px;"><c:out value="%"/></span>
                                                            <c:out value=" of students wrongly answered"/><br/>
                                                        <span style="font-size: 25px;"><c:out value="${r1data.studentsCount-r4data.bothcw-r5data.skippersCount}"/></span>
                                                            <c:out value=" students still need to answer this question"/><br/><br/>
                                                              
                                                        <c:out value="Percentage of students selected "/>
                                                        <span style="font-size: 25px;"><c:out value="${qdata.opt1}"/></span>
                                                        <c:out value="(option1) is: "/>
                                                        <span style="font-size: 25px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${((r6data.opt1Count)*100)/r4data.bothcw}"/></span>
                                                        
                                                        <span style="font-size: 25px;"><c:out value="%"/></span><br/>
                                                          
                                                        <c:out value="Percentage of students selected "/>
                                                        <span style="font-size: 25px;"><c:out value="${qdata.opt2}"/></span>
                                                        <c:out value="(option2) is: "/>
                                                        <span style="font-size: 25px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${((r7data.opt2Count)*100)/r4data.bothcw}"/></span>
                                                       
                                                        <span style="font-size: 25px;"><c:out value="%"/></span><br/>
                                                        
                                                        <c:if test='${qdata.opt3!="" && qdata.opt3!=null}'>
                                                            <c:out value="Percentage of students selected "/>
                                                            <span style="font-size: 25px;"><c:out value="${qdata.opt3}"/></span>
                                                            <c:out value="(option3) is: "/>
                                                            <span style="font-size: 25px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${((r8data.opt3Count)*100)/r4data.bothcw}"/></span>
                                                        
                                                            <span style="font-size: 25px;"><c:out value="%"/></span><br/>
                                                        </c:if>
                                                        <c:if test='${qdata.opt4!="" && qdata.opt4!=null}'>
                                                            <c:out value="Percentage of students selected "/>
                                                            <span style="font-size: 25px;"><c:out value="${qdata.opt4}"/></span>
                                                            <c:out value="(option4) is: "/>
                                                            <span style="font-size: 25px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${((r9data.opt4Count)*100)/r4data.bothcw}"/></span>
                                                        
                                                            <span style="font-size: 25px;"><c:out value="%"/></span><br/>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:forEach>
                                </c:forEach>
                            </c:forEach>
                        </c:forEach>                   
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
      