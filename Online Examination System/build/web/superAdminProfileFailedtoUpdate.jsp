<%-- 
    Document   : superAdminProfileFailedtoUpdate
    Created on : 22 Jan, 2022, 10:47:38 AM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Failed to Change</title>
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <% 
            if(session.getAttribute("sid")==null)
            {
                response.sendRedirect("superAdminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <h1>Profile Failed to Update</h1>
        <a href="superAdminHome.jsp">Home</a>
    </body>
</html>
