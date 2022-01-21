<%-- 
    Document   : accessTest
    Created on : 3 Dec, 2021, 3:58:48 PM
    Author     : SIVASANKAR
--%>



<%@page import="QuestionsPackage.Questions"%>
<%@page import="QuestionsPackage.LiveResults"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<% ArrayList<Questions> questionsRecords = (ArrayList<Questions>)session.getAttribute("questionsRecords"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Test</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        
        <c:choose>
            <c:when test='${Integer.parseInt(sessionScope.n)<questionsRecords.size()}'>
                <form action="LiveResults" method="post" class="form-control">
                    <% int n2=Integer.parseInt(session.getAttribute("n").toString()); %>
                    <% Questions q=(Questions)questionsRecords.get(n2); %>

                    <div class="form-group jumbotron ml-5 mr-5 mt-2">
                         <h2>
                             <% out.println(q.getQuestionName()); %>
                         </h2>

                         <% session.setAttribute("qobj", q); %>
                         
                         <input type="radio" name="radioName" value="1" class="form-control-radio">
                          <% out.println(q.getOpt1()); %> <br/>

                          <input type="radio" name="radioName" value="2" class="form-control-radio">
                          <% out.println(q.getOpt2()); %> <br/>
                          
                          <% if(!q.getOpt3().equals("")){ %>
                            <input type="radio" name="radioName" value="3" class="form-control-radio">
                            <% out.println(q.getOpt3()); %> <br/>
                          <% } %>
                          
                          <% if(!q.getOpt4().equals("")){ %>
                            <input type="radio" name="radioName" value="4" class="form-control-radio">
                            <% out.println(q.getOpt4()); %> <br/>
                          <% } %>
                          

                          <br/><br/>
                    </div>   
                    <input type="submit" value="Submit" class="btn btn-success form-control">

                </form>
            </c:when>
            <c:otherwise>
                <c:redirect url="calculateMarksForAStudent"/>
            </c:otherwise>
        </c:choose>
        
    </body>
</html>
