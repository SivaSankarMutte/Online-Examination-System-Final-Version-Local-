<%-- 
    Document   : questionAddedToExam
    Created on : 3 Dec, 2021, 12:35:42 PM
    Author     : SIVASANKAR
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <body>
        <% 
            if(session.getAttribute("fid")==null)
            {
                response.sendRedirect("facultyLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
        
        <c:choose>
            <c:when test='${param.formAns!="1" && param.formAns!="2" && param.formAns!="3" && param.formAns!="4"}'>
                <c:set var="message" value="fail" scope="session"/>
                <c:redirect url="addQuestionForm.jsp"/>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test='${param.formOpt3=="" && param.formOpt4==""}'>
                        <c:choose>
                            <c:when test='${param.formAns=="1" || param.formAns=="2"}'>
                                <sql:update dataSource="${db}" var="add">
                                    insert into questions(examId,questionName,opt1,opt2,ans,questionMarks) values(?,?,?,?,?,?)
                                        <sql:param value="${sessionScope.eid}"/>
                                        <sql:param value="${param.formQuestionName}"/>
                                        <sql:param value="${param.formOpt1}"/>
                                        <sql:param value="${param.formOpt2}"/>

                                        <sql:param value="${param.formAns}"/>
                                        <sql:param value="${param.formQuestionMarks}"/>
                                </sql:update>
                                <c:choose>
                                    <c:when test='${add>=1}'>
                                        <c:set var="message" value="success" scope="session"/>
                                        <c:redirect url="addQuestionForm.jsp"/>
                                    </c:when>

                                    <c:otherwise>
                                        <c:set var="message" value="fail" scope="session"/>
                                        <c:redirect url="addQuestionForm.jsp"/>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                                    
                            <c:otherwise>
                                <c:set var="message" value="fail" scope="session"/>
                                <c:redirect url="addQuestionForm.jsp"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                        
                            
                    <c:when test='${param.opt4==""}'>
                        <c:choose>
                            <c:when test='${param.formAns=="1" || param.formAns=="2" || param.formAns=="3"}'>
                                <sql:update dataSource="${db}" var="add">
                                    insert into questions(examId,questionName,opt1,opt2,opt3,ans,questionMarks) values(?,?,?,?,?,?,?)
                                        <sql:param value="${sessionScope.eid}"/>
                                        <sql:param value="${param.formQuestionName}"/>
                                        <sql:param value="${param.formOpt1}"/>
                                        <sql:param value="${param.formOpt2}"/>
                                        <sql:param value="${param.formOpt3}"/>

                                        <sql:param value="${param.formAns}"/>
                                        <sql:param value="${param.formQuestionMarks}"/>
                                </sql:update>   
                                <c:choose>
                                    <c:when test='${add>=1}'>
                                        <c:set var="message" value="success" scope="session"/>
                                        <c:redirect url="addQuestionForm.jsp"/>
                                    </c:when>

                                    <c:otherwise>
                                        <c:set var="message" value="fail" scope="session"/>
                                        <c:redirect url="addQuestionForm.jsp"/>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                                    
                            <c:otherwise>
                                <c:set var="message" value="fail" scope="session"/>
                                <c:redirect url="addQuestionForm.jsp"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    
                    <c:when test='${param.opt3==""}'>
                        <c:set var="message" value="fail" scope="session"/>
                        <c:redirect url="addQuestionForm.jsp"/>
                    </c:when>
                                    
                    <c:otherwise>
                        <sql:update dataSource="${db}" var="add">
                            insert into questions(examId,questionName,opt1,opt2,opt3,opt4,ans,questionMarks) values(?,?,?,?,?,?,?,?)
                                <sql:param value="${sessionScope.eid}"/>
                                <sql:param value="${param.formQuestionName}"/>
                                <sql:param value="${param.formOpt1}"/>
                                <sql:param value="${param.formOpt2}"/>
                                <sql:param value="${param.formOpt3}"/>
                                <sql:param value="${param.formOpt4}"/>
                                <sql:param value="${param.formAns}"/>
                                <sql:param value="${param.formQuestionMarks}"/>
                        </sql:update>   
                        <c:choose>
                            <c:when test='${add>=1}'>
                                <c:set var="message" value="success" scope="session"/>
                                <c:redirect url="addQuestionForm.jsp"/>
                            </c:when>

                            <c:otherwise>
                                <c:set var="message" value="fail" scope="session"/>
                                <c:redirect url="addQuestionForm.jsp"/>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>     
            </c:otherwise>
        </c:choose>       
        
    </body>
</html>
