<%-- 
    Document   : accessTestNavigationBetweenQuestions
    Created on : 14 Jan, 2022, 7:30:47 PM
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
    </head>
    
    
        <script>
            function prev()
            {
                <% 
                    session.setAttribute("prevClicked", 1);
                %>
            }
            function next()
            {
                <% 
                    session.setAttribute("nextClicked", 1);
                %>
            }
        </script>
        
    <body>
        <%
            if(session.getAttribute("examId")!=null && session.getAttribute("regdNo")!=null)
            {  %>
                <c:choose>
                    <c:when test='${Integer.parseInt(sessionScope.n)<questionsRecords.size()}'>
                        <form action="LiveResults" method="post" class="form-control">
                            <% int n2=Integer.parseInt(session.getAttribute("n").toString()); %>
                            <% Questions q=(Questions)questionsRecords.get(n2); %>
                            <% session.setAttribute("qobj", q); %>
                            <% if(q.getHaveMultipleAns()==0) {  %>
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
                                    <% out.println(q.getQuestionName()); %>
                                </h2>
                                <% if(q.getProvidedAns()==null){ %>
                                    <label>
                                        <input type="radio" name="radioName" value="1" class="form-control-radio">
                                        <% out.println(q.getOpt1()); %> 
                                    </label> <br/>
                                    <label>
                                        <input type="radio" name="radioName" value="2" class="form-control-radio">
                                        <% out.println(q.getOpt2()); %> 
                                    </label> <br/>
                                    <% if(!q.getOpt3().equals("")){ %>
                                        <label>
                                            <input type="radio" name="radioName" value="3" class="form-control-radio">
                                            <% out.println(q.getOpt3()); %> 
                                        </label> <br/>
                                    <% } %>
                                    <% if(!q.getOpt4().equals("")){ %>
                                        <label>
                                            <input type="radio" name="radioName" value="4" class="form-control-radio">
                                            <% out.println(q.getOpt4()); %> 
                                        </label> <br/>
                                    <% } %>


                                    <% }
                                else {
                                    if(q.getProvidedAns().equals("1")){ %>
                                        <label>
                                            <input type="radio" name="radioName" value="1" class="form-control-radio" checked>
                                            <% out.println(q.getOpt1()); %> 
                                        </label> <br/>
                                    <% }else { %>
                                        <label>
                                            <input type="radio" name="radioName" value="1" class="form-control-radio">
                                            <% out.println(q.getOpt1()); %> 
                                        </label> <br/>
                                    <% } %>     
                                    <% if(q.getProvidedAns().equals("2")){ %>
                                        <label>
                                            <input type="radio" name="radioName" value="2" class="form-control-radio" checked>
                                            <% out.println(q.getOpt2()); %> 
                                        </label> <br/>
                                    <% }else { %>
                                        <label>
                                            <input type="radio" name="radioName" value="2" class="form-control-radio">
                                            <% out.println(q.getOpt2()); %> 
                                       </label> <br/>
                                    <% } %> 
                                    <% if(!q.getOpt3().equals("")){ %>
                                        <% if(q.getProvidedAns().equals("3")){ %>
                                            <label>
                                                <input type="radio" name="radioName" value="3" class="form-control-radio" checked>
                                                <% out.println(q.getOpt3()); %> 
                                            </label> <br/>
                                        <% }else { %>
                                            <label>
                                                <input type="radio" name="radioName" value="3" class="form-control-radio">
                                                <% out.println(q.getOpt3()); %> 
                                            </label> <br/>
                                        <% } %> 
                                    <% } %>

                                    <% if(!q.getOpt4().equals("")){ %>
                                        <% if(q.getProvidedAns().equals("4")){ %>
                                            <label>
                                                <input type="radio" name="radioName" value="4" class="form-control-radio" checked>
                                                <% out.println(q.getOpt4()); %> 
                                            </label> 
                                        <% }else { %>
                                            <label>
                                                <input type="radio" name="radioName" value="4" class="form-control-radio">
                                                <% out.println(q.getOpt4()); %> 
                                            </label> 
                                        <% } %> 
                                    <% }
                                }%>
                            </div>   
                        <%
                                }
                                else {  %>
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
                                            <% out.println(q.getQuestionName()); %>
                                        </h2>
                                        <% if(q.getCheckboxOptionsGiven()[0]==null && q.getCheckboxOptionsGiven()[1]==null && q.getCheckboxOptionsGiven()[2]==null && q.getCheckboxOptionsGiven()[3]==null)
                                            { %>
                                                <input type="checkbox" name="checkboxname" value="1" id="1">
                                                <label for="1"><% out.println(q.getOpt1()); %> </label>
                                            <br/>
                                            <input type="checkbox" name="checkboxname" value="2" id="2">
                                                <label for="2"><% out.println(q.getOpt2()); %> </label>
                                            <br/>

                                            <% if(!q.getOpt3().equals("")) { %>
                                                <input type="checkbox" name="checkboxname" value="3" id="3">
                                                <label for="3"><% out.println(q.getOpt3()); %> </label><br/>
                                            <% } %>

                                            <% if(!q.getOpt4().equals("")) { %>
                                                <input type="checkbox" name="checkboxname" value="4" id="4">
                                                <label for="4"><% out.println(q.getOpt4()); %> </label>
                                            <% } %>

                                        <% } 
                                            else {
                                                if(Arrays.asList(q.getCheckboxOptionsGiven()).contains("1"))
                                                { %>
                                                    <input type="checkbox" name="checkboxname" value="1" id="1" checked>
                                                    <label for="1"><% out.println(q.getOpt1()); %> </label> 
                                                    <br/>
                                                  <%
                                                }
                                                else{
                                                    %>
                                                        <input type="checkbox" name="checkboxname" value="1" id="1">
                                                        <label for="1"><% out.println(q.getOpt1()); %> </label>
                                                        <br/>
                                                    <%
                                                }
                                                if(Arrays.asList(q.getCheckboxOptionsGiven()).contains("2"))
                                                { %>
                                                    <input type="checkbox" name="checkboxname" value="2" id="2" checked>
                                                    <label for="2"><% out.println(q.getOpt2()); %> </label>
                                                    <br/>
                                                  <%
                                                }
                                                else{
                                                    %>
                                                        <input type="checkbox" name="checkboxname" value="2" id="2">
                                                        <label for="2"><% out.println(q.getOpt2()); %> </label>
                                                        <br/>
                                                    <%
                                                }
                                                if(!q.getOpt3().equals("")) {
                                                    if(Arrays.asList(q.getCheckboxOptionsGiven()).contains("3"))
                                                    { %>
                                                        <input type="checkbox" name="checkboxname" value="3" id="3" checked>
                                                        <label for="3"><% out.println(q.getOpt3()); %> </label> 
                                                        <br/>
                                                      <%
                                                    }
                                                    else{
                                                        %>
                                                            <input type="checkbox" name="checkboxname" value="3" id="3">
                                                            <label for="3"><% out.println(q.getOpt3()); %> </label>
                                                            <br/>
                                                        <%
                                                    }
                                                }
                                                if(!q.getOpt4().equals("")) {
                                                    if(Arrays.asList(q.getCheckboxOptionsGiven()).contains("4"))
                                                    { %>
                                                        <input type="checkbox" name="checkboxname" value="4" id="4" checked>
                                                        <label for="4"><% out.println(q.getOpt4()); %> </label> 
                                                      <%
                                                    }
                                                    else{
                                                        %>
                                                            <input type="checkbox" name="checkboxname" value="4" id="4">
                                                            <label for="4"><% out.println(q.getOpt4()); %> </label>
                                                        <%
                                                    }
                                                }

                                            }

                                        } %> 
                                    </div>
                                <% 
                             if(n2!=0){ %>
                                <input type="submit" value="Prev" class="btn btn-success" formaction="goToPrevQuestion">
                            <% } %>
                            <% if(n2<(questionsRecords.size()-1)){ %>
                                <input type="submit" value="Next" class="btn btn-info" name="next">
                            <% } %>
                            <% if(n2==(questionsRecords.size()-1)){ %>
                                <input type="submit" value="Submit" class="btn btn-success" name="Submit">
                            <% } %>

                        </form>
                    </c:when>
                </c:choose>
            <%
                }
            %>
    </body>            
</html>

