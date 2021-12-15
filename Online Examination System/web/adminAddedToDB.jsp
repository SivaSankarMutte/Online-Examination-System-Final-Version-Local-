<%-- 
    Document   : adminAddedToDB
    Created on : 27 Nov, 2021, 12:59:22 PM
    Author     : SIVASANKAR
--%>


<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Adding to DB</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <% 
            if(session.getAttribute("superAdminName")==null)
            {
                response.sendRedirect("superAdminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <%
            String adminName=request.getParameter("adminName");
            String adminEmail=request.getParameter("adminEmail");
            String adminDept=request.getParameter("adminDept");
            String adminPassword=request.getParameter("adminPassword");
            
           
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true";
                String username="siva";
                String password="0000";
                Connection con=DriverManager.getConnection(url,username,password); 
               
                String queryString="insert into admin(adminName,email,password,department) values(?,?,?,?)";
                PreparedStatement pstatement = con.prepareStatement(queryString);
                pstatement.setString(1, adminName);
                pstatement.setString(2, adminEmail);
                pstatement.setString(3, adminPassword);
                pstatement.setString(4, adminDept);
                
                pstatement.executeUpdate();
                %>
                <div class="alert alert-dismissible bg-success fade show" id="dismiss">
                    <div><strong>Success! </strong>Admin added Successfully</div>
                    <a href="#" class="close" data-dismiss="alert" id="x" aria-label="close">&times;</a>
                </div>  
                <a href="viewAdmins.jsp">List all Admins</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="superAdminHome.jsp">Home</a>
            <%
            }
            catch(Exception e)
            {
                %>
                <div class="alert alert-dismissible bg-danger fade show" id="dismiss">
                    <div><strong>Failed! </strong>Admin failed to add</div>
                    <a href="#" class="close" data-dismiss="alert" id="x" aria-label="close">&times;</a>
                </div>  
                <a href="addAdmin.jsp">Retry to add Admin</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="superAdminHome.jsp">Home</a>
            <%
            }
        %>
    </body>
</html>



