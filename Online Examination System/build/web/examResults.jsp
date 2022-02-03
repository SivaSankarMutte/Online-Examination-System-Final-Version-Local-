<%-- 
    Document   : examResults
    Created on : 16 Jan, 2022, 2:05:32 PM
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
        <title>Exam Results</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
        <style>
            .submitLink{
                background-color: transparent;
                text-decoration: none;
                border:none;
                color:white;
                cursor: pointer;
                
            }
            .submitLink:focus{
                outline: none;
            }
            .submitLink:hover{
                color: lawngreen;
            }
        </style>
    </head>
    <body>
        <% 
            if(session.getAttribute("fid")==null)
            {
                response.sendRedirect("facultyLogin.jsp");
            }
        %>
        
        <jsp:include page="base.jsp"/>
        <nav class="navbar navbar-expand bg-dark navbar-dark" id="navbar">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item text-light">
                        <c:out value="Presentees"/>
                        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
                        <sql:query dataSource="${db}" var="present">
                            select count(*) presentCount from ${sessionScope.resultsTableName} where totalMarks!='A';
                        </sql:query>
                        <c:forEach var="row" items="${present.rows}">
                            <span style="font-size: 25px;color: orchid"><c:out value="${row.presentCount}"/></span>
                        </c:forEach>
                    </li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item text-light">
                        <c:out value="Absentees"/>
                        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
                        <sql:query dataSource="${db}" var="absent">
                            select count(*) absentCount from ${sessionScope.resultsTableName} where totalMarks='A';
                        </sql:query>
                        <c:forEach var="row" items="${absent.rows}">
                            <span style="font-size: 25px;color: red"><c:out value="${row.absentCount}"/></span>
                        </c:forEach>
                    </li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item text-light">
                        <c:out value="Highest Marks"/>
                        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
                        <sql:query dataSource="${db}" var="hresult">
                            select max(totalMarks) maxi from ${sessionScope.resultsTableName};
                        </sql:query>
                        <c:forEach var="row" items="${hresult.rows}">
                            <span style="font-size: 25px;color: goldenrod"><c:out value="${row.maxi}"/></span>
                        </c:forEach>
                    </li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item text-light">
                        <c:out value="Average Marks"/>
                        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
                        <sql:query dataSource="${db}" var="aresult">
                            select avg(totalMarks) average from ${sessionScope.resultsTableName};
                        </sql:query>
                        <c:forEach var="row" items="${aresult.rows}">
                            <span style="font-size: 25px;color: lightcoral"><c:out value="${row.average}"/></span>
                        </c:forEach>
                    </li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item text-light">
                        <c:out value="Least Marks"/>
                        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true" user="siva" password="0000"/>
                        <sql:query dataSource="${db}" var="lresult">
                            select min(totalMarks) mini from ${sessionScope.resultsTableName};
                        </sql:query>
                        <c:forEach var="row" items="${lresult.rows}">
                            <span style="font-size: 25px;color: greenyellow"><c:out value="${row.mini}"/></span>
                        </c:forEach>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                   
                    
                    <li class="nav-item">
                        <form method="post" action="eachQuestionStatistics.jsp">
                            <% 
                                HttpSession ses2=request.getSession(); 
                                ses2.setAttribute("examSpecialTableName", "examSpecialTable"+ses2.getAttribute("eid").toString());
                            %>
                            <input type="submit" value="Exam statistics" class="btn btn-outline-warning">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item">
                        <form method="post" action="topFiveResults.jsp">
                            <input type="submit" value="Top 5" class="btn btn-outline-success">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    <li class="nav-item">
                        <form method="post" action="leastFiveResults.jsp">
                            <input type="submit" value="Least 5" class="btn btn-outline-danger">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item">
                        <form method="post" action="downloadResults.jsp">
                            <input type="submit" value="Download CSV" class="btn btn-outline-primary">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                    <li class="nav-item">
                        <form method="post" action="addQuestionForm.jsp">
                            <input type="submit" value="Back" class="btn btn-outline-info">
                        </form>
                    </li> &nbsp;&nbsp;&nbsp;
                    
                </ul>
            </div>
        </nav>
        <sql:query dataSource="${db}" var="result">
            select regdNo,totalMarks from ${sessionScope.resultsTableName} order by regdNo;
        </sql:query>
            
            
        <table border="1" width="100%" class="table table-borderless table-hover bg-dark text-light">
            <tr style="background-color:darkgreen;">
                <th>Regd No</th>
                <th>Marks</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td>
                        <form method="post" action="studentAnswers.jsp">
                            <input type="hidden" name="formRegdNo" value="${row.regdNo}">
                            <input type="submit" value="${row.regdNo}" class="submitLink">
                        </form>
                    </td>
                    <td><c:out value="${row.totalMarks}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
      