<%-- 
    Document   : errorStudentsUpload
    Created on : 2 Dec, 2021, 3:12:00 PM
    Author     : SIVASANKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Students File Uploading Error</title>
        <link rel="icon" type="text/css" href="images/test.png">
    </head>
    <body>
        <% 
            if(session.getAttribute("fid")==null)
            {
                response.sendRedirect("facultyLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <h1>File Uploading Failed</h1>
        <div>Given File may contains null values or regdNo's are not unique or Section name has already taken</div>
        
        <a href="uploadStudentsFile.jsp">Upload Again..!</a>
    </body>
</html>
