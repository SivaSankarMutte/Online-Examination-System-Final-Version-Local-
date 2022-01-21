<%-- 
    Document   : updateQuestionToDB
    Created on : 3 Dec, 2021, 8:37:39 PM
    Author     : SIVASANKAR
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Updating Question</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        <c:choose>
            <c:when test='${param.formAns!="1" && param.formAns!="2" && param.formAns!="3" && param.formAns!="4"}'>
                <c:redirect url="questionFailedToUpdate.jsp"/>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test='${param.formOpt3=="" || param.formOpt4==""}'>
                        <c:choose>
                            <c:when test='${param.formAns=="1" || param.formAns=="2"}'>
                                <sql:update dataSource="${db}" var="add">
                                    update questions set questionName=?,opt1=?,opt2=?,opt3=?,opt4=?,ans=?,questionMarks=? where questionId=?

                                        <sql:param value="${param.formQuestionName}"/>
                                        <sql:param value="${param.formOpt1}"/>
                                        <sql:param value="${param.formOpt2}"/>
                                        <sql:param value="${param.formOpt3}"/>
                                        <sql:param value="${param.formOpt4}"/>
                                        <sql:param value="${param.formAns}"/>
                                        <sql:param value="${param.formQuestionMarks}"/>
                                        <sql:param value="${sessionScope.sessionQuestionId}"/>
                                </sql:update>  
                                <c:choose>
                                    <c:when test='${add>=1}'>
                                        <% session.removeAttribute("sessionQuestionId"); %>
                                        <c:redirect url="addQuestionForm.jsp"/>
                                    </c:when>

                                    <c:otherwise>
                                        <c:redirect url="questionFailedToUpdate.jsp"/>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                                    
                            <c:otherwise>
                                <c:redirect url="questionFailedToUpdate.jsp"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                        
                            
                    <c:when test='${param.opt4==""}'>
                        <c:choose>
                            <c:when test='${param.formAns=="1" || param.formAns=="2" || param.formAns=="3"}'>
                                <sql:update dataSource="${db}" var="add">
                                    update questions set questionName=?,opt1=?,opt2=?,opt3=?,opt4=?,ans=?,questionMarks=? where questionId=?

                                        <sql:param value="${param.formQuestionName}"/>
                                        <sql:param value="${param.formOpt1}"/>
                                        <sql:param value="${param.formOpt2}"/>
                                        <sql:param value="${param.formOpt3}"/>
                                        <sql:param value="${param.formOpt4}"/>
                                        <sql:param value="${param.formAns}"/>
                                        <sql:param value="${param.formQuestionMarks}"/>
                                        <sql:param value="${sessionScope.sessionQuestionId}"/>
                                </sql:update>  
                                <c:choose>
                                    <c:when test='${add>=1}'>
                                        <% session.removeAttribute("sessionQuestionId"); %>
                                        <c:redirect url="addQuestionForm.jsp"/>
                                    </c:when>

                                    <c:otherwise>
                                        <c:redirect url="questionFailedToUpdate.jsp"/>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                                    
                            <c:otherwise>
                                <c:redirect url="questionFailedToUpdate.jsp"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    
                    <c:when test='${param.opt3==""}'>
                        <c:redirect url="questionFailedToUpdate.jsp"/>
                    </c:when>
                                    
                    <c:otherwise>
                        <sql:update dataSource="${db}" var="add">
                            update questions set questionName=?,opt1=?,opt2=?,opt3=?,opt4=?,ans=?,questionMarks=? where questionId=?
                            <sql:param value="${param.formQuestionName}"/>
                            <sql:param value="${param.formOpt1}"/>
                            <sql:param value="${param.formOpt2}"/>
                            <sql:param value="${param.formOpt3}"/>
                            <sql:param value="${param.formOpt4}"/>
                            <sql:param value="${param.formAns}"/>
                            <sql:param value="${param.formQuestionMarks}"/>
                            <sql:param value="${sessionScope.sessionQuestionId}"/>
                        </sql:update> 
                        <c:choose>
                            <c:when test='${add>=1}'>
                                <% session.removeAttribute("sessionQuestionId"); %>
                                <c:redirect url="addQuestionForm.jsp"/>
                            </c:when>

                            <c:otherwise>
                                <c:redirect url="questionFailedToUpdate.jsp"/>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>     
            </c:otherwise>
        </c:choose>
       
    </body>
</html>
