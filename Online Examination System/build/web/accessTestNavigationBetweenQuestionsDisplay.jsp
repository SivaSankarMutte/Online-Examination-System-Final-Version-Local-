<%-- 
    Document   : accessTestNavigationBetweenQuestionsDisplay
    Created on : 10 Feb, 2022, 12:44:39 PM
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
            
                <c:choose>
                    <c:when test='${Integer.parseInt(sessionScope.n)<questionsRecords.size()}'>
                        <form action="LiveResults" method="post" class="form-control">
                            <div class="container-fluid">
                                <div class="card">
                                    <div class="row">
                                    <div class="col-lg-10">
                            
                            <% int n2=Integer.parseInt(session.getAttribute("n").toString()); %>
                            <% Questions q=(Questions)questionsRecords.get(n2); %>
                            <% session.setAttribute("qobj", q); %>
                            
                            <% if(q.getIsBlankType()==1){ %>
                                
                                <div id="overlay">
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}
                                </div>
                                <h4 class="card-title" style="user-select: none;"><% out.println(n2+1+"."+q.getQuestionName()); %></h4>
                                <!-- Remove these 4 lines 
                                here 39 denotes index starts with data/imagePath
                                -->
                                
                                <h6 class="text-muted card-subtitle mb-2">Select from following options</h6>
                                
                                <% if(q.getProvidedAns()==null){ %>
                                    <input type="text" name="blankTypeName" class="form-control" placeholder="Enter your answer here">
                                <% } 
                                    else{ %>
                                        <input type="text" name="blankTypeName" class="form-control" value="<%= q.getProvidedAns() %>" placeholder="Enter your answer here">
                                   <% }
                            } else if(q.getHaveMultipleAns()==0) {  %>
                   
                                <div id="overlay">
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                    ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}
                                </div>
                                
                                
                                
                                <h4 class="card-title" style="user-select: none;"><% out.println(n2+1+"."+q.getQuestionName()); %></h4>
                                <h6 class="text-muted card-subtitle mb-2">Select from following options</h6>
                                
                                <% if(q.getProvidedAns()==null){ %>
                                
                                
                                <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="1" id="formCheck-1"><label class="form-check-label" for="formCheck-1"><% out.println(q.getOpt1()); %> </label></div>
                                <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="2" id="formCheck-2"><label class="form-check-label" for="formCheck-2"><% out.println(q.getOpt2()); %> </label></div>
                                
                                    
                                    <% if(q.getOpt3()!=null && !q.getOpt3().equals("")){ %>
                                        <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="3" id="formCheck-3"><label class="form-check-label" for="formCheck-3"><% out.println(q.getOpt3()); %> </label></div>
                                
                                    <% } %>
                                    <% if(q.getOpt4()!=null && !q.getOpt4().equals("") ){ %>
                                        <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="4" id="formCheck-4"><label class="form-check-label" for="formCheck-4"><% out.println(q.getOpt4()); %> </label></div>
                                
                                    <% } %>


                                    <% }
                                else {
                                    if(q.getProvidedAns().equals("1")){ %>
                                        <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="1" id="formCheck-1" checked><label class="form-check-label" for="formCheck-1"><% out.println(q.getOpt1()); %> </label></div>
                                
                                    <% }else { %>
                                        <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="1" id="formCheck-1"><label class="form-check-label" for="formCheck-1"><% out.println(q.getOpt1()); %> </label></div>
                                
                                    <% } %>     
                                    <% if(q.getProvidedAns().equals("2")){ %>
                                        <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="2" id="formCheck-2" checked><label class="form-check-label" for="formCheck-2"><% out.println(q.getOpt2()); %> </label></div>
                                
                                    <% }else { %>
                                        <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="2" id="formCheck-2"><label class="form-check-label" for="formCheck-2"><% out.println(q.getOpt2()); %> </label></div>
                                
                                    <% } %> 
                                    <% if(q.getOpt3()!=null && !q.getOpt3().equals("")){ %>
                                        <% if(q.getProvidedAns().equals("3")){ %>
                                        <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="3" id="formCheck-3" checked><label class="form-check-label" for="formCheck-3"><% out.println(q.getOpt3()); %> </label></div>
                                
                                        <% }else { %>
                                            <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="3" id="formCheck-3"><label class="form-check-label" for="formCheck-3"><% out.println(q.getOpt3()); %> </label></div>
                                
                                        <% } %> 
                                    <% } %>

                                    <% if(q.getOpt4()!=null && !q.getOpt4().equals("")){ %>
                                        <% if(q.getProvidedAns().equals("4")){ %>
                                        <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="4" id="formCheck-4" checked><label class="form-check-label" for="formCheck-4"><% out.println(q.getOpt4()); %> </label></div>
                                
                                        <% }else { %>
                                            <div class="form-check"><input class="form-check-input" type="radio" name="radioName" value="4" id="formCheck-4"><label class="form-check-label" for="formCheck-4"><% out.println(q.getOpt4()); %> </label></div>
                                
                                        <% } %> 
                                    <% }
                                }%>
                             
                        <%
                                }
                                else {  %>
                    
                                        <div id="overlay">
                                            ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                            ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                            ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                            ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                            ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}<br/>
                                            ${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}&nbsp;&nbsp;${sessionScope.regdNo}
                                        </div>

                                        <h4 class="card-title" style="user-select: none;"><% out.println(n2+1+"."+q.getQuestionName()); %></h4>
                                        <h6 class="text-muted card-subtitle mb-2">Select from following options</h6>
                                        <% if(q.getCheckboxOptionsGiven()[0]==null && q.getCheckboxOptionsGiven()[1]==null && q.getCheckboxOptionsGiven()[2]==null && q.getCheckboxOptionsGiven()[3]==null)
                                            { %>
                                                <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="1" id="formCheck-1"><label class="form-check-label" for="formCheck-1"><% out.println(q.getOpt1()); %> </label></div>
                                                <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="2" id="formCheck-2"><label class="form-check-label" for="formCheck-2"><% out.println(q.getOpt2()); %> </label></div>
                                

                                            <% if(q.getOpt3()!=null && !q.getOpt3().equals("")) { %>
                                                <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="3" id="formCheck-3"><label class="form-check-label" for="formCheck-3"><% out.println(q.getOpt3()); %> </label></div>
                                
                                            <% } %>

                                            <% if(q.getOpt4()!=null && !q.getOpt4().equals("")) { %>
                                                <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="4" id="formCheck-4"><label class="form-check-label" for="formCheck-4"><% out.println(q.getOpt4()); %> </label></div>
                                
                                            <% } %>

                                        <% } 
                                            else {
                                                if(Arrays.asList(q.getCheckboxOptionsGiven()).contains("1"))
                                                { %>
                                                <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="1" id="formCheck-1" checked><label class="form-check-label" for="formCheck-1"><% out.println(q.getOpt1()); %> </label></div>
                                                
                                                  <%
                                                }
                                                else{
                                                    %>
                                                        <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="1" id="formCheck-1"><label class="form-check-label" for="formCheck-1"><% out.println(q.getOpt1()); %> </label></div>
                                                
                                                    <%
                                                }
                                                if(Arrays.asList(q.getCheckboxOptionsGiven()).contains("2"))
                                                { %>
                                                <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="2" id="formCheck-2" checked><label class="form-check-label" for="formCheck-2"><% out.println(q.getOpt2()); %> </label></div>
                                
                                                  <%
                                                }
                                                else{
                                                    %>
                                                        <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="2" id="formCheck-2"><label class="form-check-label" for="formCheck-2"><% out.println(q.getOpt2()); %> </label></div>
                                
                                                    <%
                                                }
                                                if(q.getOpt3()!=null && !q.getOpt3().equals("")) {
                                                    if(Arrays.asList(q.getCheckboxOptionsGiven()).contains("3"))
                                                    { %>
                                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="3" id="formCheck-3" checked><label class="form-check-label" for="formCheck-3"><% out.println(q.getOpt3()); %> </label></div>
                                
                                                      <%
                                                    }
                                                    else{
                                                        %>
                                                            <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="3" id="formCheck-3"><label class="form-check-label" for="formCheck-3"><% out.println(q.getOpt3()); %> </label></div>
                                
                                                        <%
                                                    }
                                                }
                                                if(q.getOpt4()!=null && !q.getOpt4().equals("")) {
                                                    if(Arrays.asList(q.getCheckboxOptionsGiven()).contains("4"))
                                                    { %>
                                                    <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="4" id="formCheck-4" checked><label class="form-check-label" for="formCheck-4"><% out.println(q.getOpt4()); %> </label></div>
                                 
                                                      <%
                                                    }
                                                    else{
                                                        %>
                                                            <div class="form-check"><input class="form-check-input" type="checkbox" name="checkboxname" value="4" id="formCheck-4"><label class="form-check-label" for="formCheck-4"><% out.println(q.getOpt4()); %> </label></div>
                                
                                                        <%
                                                    }
                                                }

                                            }

                                        } %> 
                                  
                                <% 
                             if(n2!=0){ %>
                                <input type="submit" value="Prev" class="btn btn-success" formaction="goToPrevQuestion">
                            <% } %>
                            <% if(n2<(questionsRecords.size()-1)){ %>
                                <input type="submit" value="Next" class="btn btn-info" name="next">
                            <% } %>
                            <% if(n2==(questionsRecords.size()-1)){ %>
                                <input type="submit" value="Submit" class="btn btn-success" name="Submit" formaction="examNavigationSubmitButtonPressed">
                            <% } %>
                            </div>
                        
                            
                            <div class="col-lg-2">
                            <div class="jumbotron">
                                <c:forEach var="qno" begin="1" end="${questionsRecords.size()}">
                                    <c:choose>
                                        <c:when test='${Integer.parseInt(sessionScope.n)+1==qno}'>
                                            <input type="submit" value="${qno}" name="questionNumber" class="btn btn-info" formaction="GoToAskingQuestion"> 
                                        </c:when>
                                        
                                        <c:otherwise>
                                            <input type="submit" value="${qno}" name="questionNumber" class="btn btn-outline-dark" formaction="GoToAskingQuestion"> 
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <br/>
                                <input type="submit" value="Submit" class="btn btn-success" name="Submit" formaction="examNavigationSubmitButtonPressed">
                            </div>
                           </div>
                            </div>
                    </div>
                </div>
                        </form>
                    </c:when>
                </c:choose>
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







