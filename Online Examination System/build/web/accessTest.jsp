<%-- 
    Document   : accessTest
    Created on : 3 Dec, 2021, 3:58:48 PM
    Author     : SIVASANKAR
--%>

<%@page import="java.util.Arrays"%>
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
        <script>
            function fun1()
            {
                var x=document.getElementById("frame");
                x.style.display="block";
                var y=document.getElementById("go-button");
                y.style.display="none";
            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
body {
	margin: 0;
}

#go-button {
	width: 200px;
	display: block;
	margin: 50px auto 0 auto;
}

/* webkit requires explicit width, height = 100% of sceeen */
/* webkit also takes margin into account in full screen also - so margin should be removed (otherwise black areas will be seen) */


</style>
    </head>
    
    <body id="element" style="margin:0;">
        <div style="background-color:white; margin:0; width:100%;height:100%;">
            <button id="go-button" onclick="fun1()">Start Exam</button>
            <iframe id="frame" style="height: 800px; width: 1550px;display: none;" src="accessTestDisplay.jsp" title="Questions"></iframe>
        </div>
    </body>
    <script type="text/javascript" src="assets\js\myscript.js"></script>
</html>
	
    