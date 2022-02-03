<%-- 
    Document   : uploadAdmins
    Created on : 1 Dec, 2021, 6:13:32 PM
    Author     : SIVASANKAR
--%>

<%@page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
    if(session.getAttribute("sid")==null)
    {
        response.sendRedirect("superAdminLogin.jsp");
    }
%>
<jsp:include page="base.jsp"/>
<html>
<%
    String contentType = request.getContentType();
//    out.println(contentType);
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
    {
//        out.println(request.getInputStream());
        DataInputStream in = new DataInputStream(request.getInputStream());
//        out.println(in);
        int formDataLength = request.getContentLength();
//        out.println(formDataLength);
        byte dataBytes[] = new byte[formDataLength];
//        for(int i=0;i<dataBytes.length;i++)
//        {
//            out.println(dataBytes[i]);
//        }
        int byteRead = 0;
        
        int totalBytesRead = 0;

        while (totalBytesRead < formDataLength) 
        {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
//            

            totalBytesRead += byteRead;
//            out.println(totalBytesRead);
        }
//        for(int i=0;i<dataBytes.length;i++)
//        {
//            out.println(dataBytes[i]);
//        }
        String file = new String(dataBytes);
//        out.println(file);
        String saveFile = file.substring(file.indexOf("filename=\"") + 10);
//        out.println(saveFile);
        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
//        out.println(saveFile);
        saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
//        out.println(saveFile);
//        out.println(contentType);
        int lastIndex = contentType.lastIndexOf("=");
//        out.println(lastIndex);
        
        String boundary = contentType.substring(lastIndex + 1,contentType.length());
//        out.println(boundary);
        int pos;
        pos = file.indexOf("filename=\"");
//        out.println(pos);
        
        pos = file.indexOf("\n", pos) + 1;
//        out.println(pos);
        pos = file.indexOf("\n", pos) + 1;
//        out.println(pos);
        pos = file.indexOf("\n", pos) + 1;
//        out.println(pos);
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
//        out.println(boundaryLocation);
        int startPos = ((file.substring(0, pos)).getBytes()).length;
//        out.println(startPos);
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
//        out.println(endPos);
        FileOutputStream fileOut = new FileOutputStream(saveFile);
//        out.println(fileOut);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
//        out.println(dataBytes);

        String line = null;
        try
        {
            BufferedReader input = new BufferedReader(new FileReader(saveFile));
//            out.println(input);
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true";
            String username="siva";
            String password="0000";
            Connection con=DriverManager.getConnection(url,username,password); 
            PreparedStatement pstatement=null;
            

            while(( line = input.readLine()) != null)
            {
//                out.println(line.getClass());
                String t=line.toString();
//                out.println(t.getClass());
                String words[]=t.split(",");
//                out.println(words);
//                for(int i=0;i<words.length;i++)
//                {
//                    out.println(words[i]);
//                }
                String queryString="insert into admin(adminName,email,password,department) values(?,?,?,?)";
                pstatement = con.prepareStatement(queryString);
                pstatement.setString(1, words[0]);
                pstatement.setString(2, words[1]);
                pstatement.setString(3, words[2]);
                pstatement.setString(4, words[3]);
                
                pstatement.executeUpdate();
                
            }
            %><c:redirect url="viewAdmins.jsp"/><%
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        %><c:redirect url="errorAdminsUpload.jsp"/><%
    }
%>
</html>
