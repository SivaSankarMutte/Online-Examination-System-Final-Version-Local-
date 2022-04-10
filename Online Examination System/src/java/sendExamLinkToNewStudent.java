
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SIVASANKAR
 */
public class sendExamLinkToNewStudent extends HttpServlet 
{  
//    public static void send(String to,String subject,String msg)
//    {  
//
//        final String user="onlineexam.bec@gmail.com"; 
//        final String pass="project@123";  
//
//        //1st step) Get the session object    
//        Properties props = new Properties();  
//        props.put("mail.smtp.user","username"); 
//        props.put("mail.smtp.host", "smtp.gmail.com"); 
//        props.put("mail.smtp.port", "25"); 
//        props.put("mail.debug", "true"); 
//        props.put("mail.smtp.auth", "true"); 
//        props.put("mail.smtp.starttls.enable","true"); 
//        props.put("mail.smtp.EnableSSL.enable","true");
//
//        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
//        props.setProperty("mail.smtp.socketFactory.fallback", "false");   
//        props.setProperty("mail.smtp.port", "465");   
//        props.setProperty("mail.smtp.socketFactory.port", "465"); 
//        
//
//        Session session = Session.getInstance(props,new javax.mail.Authenticator() 
//        {  
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() 
//            {  
//                return new PasswordAuthentication(user,pass);  
//            }  
//        });  
//    //2nd step)compose message  
//        try 
//        {  
//            MimeMessage message = new MimeMessage(session);  
//            message.setFrom(new InternetAddress(user));  
//            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
//            message.setSubject(subject);  
//            message.setContent(msg,"text/html");
//
//            //3rd step)send message  
//            Transport.send(message);  
//
//            System.out.println("Done");  
//
//        } 
//        catch (MessagingException e) 
//        {  
//            throw new RuntimeException(e);  
//        }  
//    }
    
    
    
    public static void send(String to,String subject,String msg)
    {  

        final String user="onlineexam.bec@gmail.com"; 
        final String pass="project@123";  

        //1st step) Get the session object    
        Properties props = new Properties();  
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.auth", "true");  
        props.put("mail.smtp.starttls.enable",true);

        Session session = Session.getInstance(props,new javax.mail.Authenticator() 
        {  
            protected PasswordAuthentication getPasswordAuthentication() 
            {  
                return new PasswordAuthentication(user,pass);  
            }  
        });  
    //2nd step)compose message  
        try 
        {  
            MimeMessage message = new MimeMessage(session);  
            message.setFrom(new InternetAddress(user));  
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
            message.setSubject(subject);  
            message.setContent(msg,"text/html"); 

            //3rd step)send message  
            Transport.send(message);  

            System.out.println("Done");  

        } 
        catch (MessagingException e) 
        {  
            throw new RuntimeException(e);  
        }  
    }
    
    
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
    {  
        response.setContentType("text/html");  
        HttpSession session=request.getSession();
        String eid=(String)session.getAttribute("eid");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
            String sqlCreate = "CREATE TABLE IF NOT EXISTS " + "results"+eid
            + "   (regdNo varchar(20),"
            + "   totalMarks varchar(5) default 'A')";
            Statement stmt = con.createStatement();
            stmt.execute(sqlCreate);
            PreparedStatement ps=con.prepareStatement("select facultyId,listName,examName,startTime,endTime,loginTime from exam where examId=?");
            ps.setString(1,eid);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())  
            {
                String examName=rs.getString(3);
                String startTime=rs.getString(4);
                String endTime=rs.getString(5);
                String loginWindowTime=rs.getString(6);
                
                String regdNo=session.getAttribute("regdNo").toString();
                String sqlUpdate="Update results"+eid+ " set totalMarks='A' where regdNo=?";
                PreparedStatement ps3 = con.prepareStatement(sqlUpdate);
                ps3.setString(1, regdNo);
                int status=ps3.executeUpdate();
                if(status==0)
                {
                    Statement st2=con.createStatement();
                    st2.executeUpdate("insert into results"+eid+" (regdNo) values('"+regdNo+"')");           
                }
                String sEmail=session.getAttribute("sEmail").toString();
                String pin=regdNo+"-"+eid;
                String encrypted=cipher.AES.encrypt(pin);
//                String encrypted="";
//                for(int i=0;i<pin.length();i++)
//                {
//                    int a=(int)pin.charAt(i);
//                    a=a+1;
//                    String x = Character.toString((char) a);
//                    encrypted=encrypted+x;  
//                }
//                send(sEmail, regdNo+" - "+examName+" - Exam from Online Examination System", "Start Time: "+startTime+"  End Time: "+endTime+"   Exam Link :  http://becbapatla.ac.in:8080/Online%20Examination%20System/examLinkValidation1?p="+encrypted);
                

                String msg= "<!DOCTYPE html>\n" +
"<html>\n" +
"<head>\n" +
"	<style>\n" +
"		.button\n" +
"		{\n" +
"			position: absolute;\n" +
"			border-radius: 5px;\n" +
"			background-color: #1cc88a;\n" +
"			border: none;\n" +
"			padding: 10px;\n" +                            
                            
"\n" +
"		}\n" +
"		.button:hover\n" +
"		{\n" +
"			padding: 12px;\n" +                             
"			transition: 2s;\n" +
"		}\n" +
"	</style>\n" +
"</head>"+
"<body>\n" +
"	<h1 style='color:#20f756;'>Online Examination System</h1>\n" +
"	<p> Your Exam on "+examName+" is scheduled by your faculty. The Exam Timings are mentioned below. Click on the below button to access the Exam.</p>\n" +
"	<p><b>Note: The test window closes after "+loginWindowTime+" minutes of Start Time of the Exam.</b>\n" +
"	<p><b>Exam Timings: </b></p>\n" +
"	<table><tr>\n" +
"	<td><p>Start Time: </p></td><td><p><b>"+startTime+"</b></p></td></tr>\n" +
"	<tr><td><p>End Time: </p></td><td><p><b>"+endTime+"</b></p></td></tr>\n" +
"	<tr align='center'><td colspan=\"2\"><a href=' http://127.0.0.1:8080/Online%20Examination%20System/examLinkValidation1?p="+encrypted+"'>\n" +
"		<button type=\"button\" class=\"button\"><b>Start Exam</b></button>\n" +
"	</a></td></tr>\n" +
"</table>\n" +
"	<P>All the best!</P>\n" +
"	<p>Team Online Examination System</p>\n" +
"\n" +
"</body>\n" +
"</html>";

                send(sEmail, regdNo+" - "+examName+" - Exam from Online Examination System", msg);
                
                
                RequestDispatcher rd=request.getRequestDispatcher("emailToNewStudentSentSuccessfully.jsp");
                rd.forward(request,response);
            }
        }
        catch(Exception e)
        {
            PrintWriter out = response.getWriter();  
            out.print(e);
            out.close();
        } 
    }  
}  
