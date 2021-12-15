<%-- 
    Document   : facultyAddedToDB
    Created on : 20 Nov, 2021, 11:40:13 AM
    Author     : SIVASANKAR
--%>
<%@page import="java.util.Random"%>
<%@page import="MailDemo.sendMailToFaculty"%>
<%@page import="java.io.*,java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Adding to DB</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <% 
            if(session.getAttribute("aid")==null)
            {
                response.sendRedirect("adminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <%
            String facultyPassword=request.getParameter("facultyPassword");
            if(facultyPassword.equals(""))
            {
                String allSymbols="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890~!@#$%^&*";
                Random random=new Random();
                char[] psw=new char[8];

                for(int i=0;i<8;i++)
                {
                    psw[i]=allSymbols.charAt(random.nextInt(71));  //71 is allSymbols.length()
                }
                facultyPassword=new String(psw);;
            }
            
            
            String adminIdf=(String)session.getAttribute("aid");
            String facultyName=request.getParameter("facultyName");
            String facultyEmail=request.getParameter("facultyEmail");
            
            
            String adminEmail=request.getParameter("adminEmail");
            String adminEmailPassword=request.getParameter("adminEmailPassword");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true";
                String username="siva";
                String password="0000";
                Connection con=DriverManager.getConnection(url,username,password); 
               
                String queryString="insert into faculty(adminId,facultyName,email,password) values(?,?,?,?)";
                PreparedStatement pstatement = con.prepareStatement(queryString);
                pstatement.setString(1,adminIdf);
                pstatement.setString(2, facultyName);
                pstatement.setString(3, facultyEmail);
                pstatement.setString(4, facultyPassword);
                pstatement.executeUpdate(); 
            }
            catch(Exception e)
            {
                response.sendRedirect("facultyEmailAlreadyInserted.jsp");
            }
                try
                {   
                    //String to=facultyEmail;
                    String sub="Online Examination System - Password";
                    String msg="Welcome to Online Examination System -  Your Password is: "+facultyPassword;
                    sendMailToFaculty.send(adminEmail,adminEmailPassword,facultyEmail,sub,msg);
                }
                catch(Exception e)
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    String url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true";
                    String username="siva";
                    String password="0000";
                    Connection con=DriverManager.getConnection(url,username,password); 

                    String queryString="delete from faculty where email=?";
                    PreparedStatement pstatement = con.prepareStatement(queryString);
                    pstatement.setString(1,facultyEmail);
                    pstatement.executeUpdate();
                    %>
                    <c:redirect url="adminEmailPasswordWrong.jsp"/>
                    <%
                }
                %>
                <div class="alert alert-dismissible bg-success fade show" id="dismiss">
                    <div><strong>Success! </strong>Faculty added Successfully</div>
                    <a href="#" class="close" data-dismiss="alert" id="x" aria-label="close">&times;</a>
                </div>
                <a href="viewFaculty.jsp">List all Faculty</a>
    </body>
</html>



