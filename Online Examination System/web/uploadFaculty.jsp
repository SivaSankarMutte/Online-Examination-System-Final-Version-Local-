<%@page import="java.util.Random"%>
<%@page import="MailDemo.sendMailToFaculty"%>
<%@page import="java.io.*,java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
    if(session.getAttribute("aid")==null)
    {
        response.sendRedirect("adminLogin.jsp");
    }
%>
<jsp:include page="base.jsp"/>

<html>
<%
    String contentType = request.getContentType();
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
    {
        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();
        byte dataBytes[] = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;

        while (totalBytesRead < formDataLength) 
        {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
        }
        
        String file = new String(dataBytes);
        
        String saveFile = file.substring(file.indexOf("filename=\"") + 10);
        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
        saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1,contentType.length());
        
        int pos;
        pos = file.indexOf("filename=\"");
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

        FileOutputStream fileOut = new FileOutputStream(saveFile);
        fileOut.write(dataBytes, startPos, (endPos - startPos));

        String line = null;
        try
        {
            String adminEmail=(String)session.getAttribute("adminEmail");
            String adminEmailPassword=(String)session.getAttribute("adminEmailPassword");
            BufferedReader input = new BufferedReader(new FileReader(saveFile));

            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true";
            String username="siva";
            String password="0000";
            Connection con=DriverManager.getConnection(url,username,password); 
            PreparedStatement pstatement=null;
            
            //Random Password
            String allSymbols="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890~!@#$%^&*";
            Random random=new Random();
            
            
            //Mail sending to Faculty
            
            while(( line = input.readLine()) != null)
            {
                String t=line.toString();
                String words[]=t.split(",");
                String adminIdf=(String)session.getAttribute("aid");
                String queryString="insert into faculty(adminId,facultyName,email,password) values(?,?,?,?)";
                pstatement = con.prepareStatement(queryString);
                pstatement.setString(1, adminIdf);
                pstatement.setString(2, words[0]);
                pstatement.setString(3, words[1]);
                //String psw=words[0].substring(0,4)+words[1].substring(0,4);
                
                
                char[] psw=new char[8];
                
                for(int i=0;i<8;i++)
                {
                    psw[i]=allSymbols.charAt(random.nextInt(71));  //71 is allSymbols.length()
                }
                String p=new String(psw);
                pstatement.setString(4,p);
                pstatement.executeUpdate();
                
                try
                {
                    String to=words[1];
                    String sub="Online Examination System - Password";
                    String msg="Welcome to Online Examination System -  Your Password is: "+p;
                    sendMailToFaculty.send(adminEmail,adminEmailPassword,to,sub,msg);
                }
                catch(Exception e)
                {
                    out.println("Error while sending passwords to Faculty Emails");
                    out.println(e);  
                    
                    String queryString2="delete from faculty where email=?";
                    PreparedStatement pstatement2 = con.prepareStatement(queryString2);
                    pstatement2.setString(1,words[1]);
                    pstatement2.executeUpdate();
                    %>
                    <c:redirect url="adminEmailPasswordWrong.jsp"/>
                    <%
                }
            }
            %> <c:redirect url="viewFaculty.jsp"/>  <%
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        %>  <c:redirect url="errorFacultyUpload.jsp"/>   <%
    }
%>
</html>