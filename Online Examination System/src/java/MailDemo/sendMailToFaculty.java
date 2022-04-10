package MailDemo;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SIVASANKAR
 */
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
  

import javax.mail.PasswordAuthentication;



public class sendMailToFaculty extends HttpServlet 
{  
    public static void send(String to,String subject,String msg)
    {  

        //final String user="sivasankarmutte@gmail.com";//change accordingly  
        //final String pass="K@lmno@123";  

        //1st step) Get the session object    
        Properties props = new Properties();  
        props.put("mail.smtp.host", "smtp.gmail.com");//change accordingly  
        props.put("mail.smtp.auth", "true");  
        props.put("mail.smtp.starttls.enable",true);

        Session session = Session.getInstance(props,new javax.mail.Authenticator() 
        {  
            @Override
            protected PasswordAuthentication getPasswordAuthentication() 
            {  
                return new PasswordAuthentication("onlineexam.bec@gmail.com","project@123");  
            }  
        });  
    //2nd step)compose message  
        try 
        {  
            MimeMessage message = new MimeMessage(session);  
            message.setFrom(new InternetAddress("onlineexam.bec@gmail.com"));  
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
            message.setSubject(subject);  
            message.setContent(msg,"text/html");

            //3rd step)send message  
            Transport.send(message);  

            //System.out.println("Done");  

        } 
        catch (MessagingException e) 
        {  
            throw new RuntimeException(e);  
        }  
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    public static void send(String to,String subject,String msg)
//    {  
//  //
//        //final String user="sivasankarmutte@gmail.com";//change accordingly  
//        //final String pass="K@lmno@123";  
//
//        //1st step) Get the session object    
//        Properties props = new Properties();
//        
//        //for startttls command fisrt
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
//        
//        
//        
//        
//        
////        
////        props.put("mail.smtp.auth", true);
////        props.put("mail.smtp.starttls.enable", "true");
////        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
////
////        
////        props.setProperty("mail.smtp.host", "34.203.225.61");
////        props.setProperty("mail.smtp.port", "8080");
////        
////        props.put("mail.smtp.host", "smtp.gmail.com");//change accordingly  
////        props.put("mail.smtp.auth", "true");  
////        props.put("mail.smtp.port","587");
////        props.put("mail.smtp.starttls.enable",true);
////        
////        props.put("mail.smtp.socketFactory.port", "587");
////
////        props.put("mail.smtp.socketFactory.fallback", "false");
////        
////        
////        props.setProperty("mail.smtp.ssl.enable", "true");
//        
//// set any other needed mail.smtp.* properties here
//        
//    
//        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication()
//            {
//                return new PasswordAuthentication("onlineexam.bec@gmail.com","project@123");
//            }
//        });
//    //2nd step)compose message  
//        try 
//        {  
//            MimeMessage message = new MimeMessage(session);  
//            message.setFrom(new InternetAddress("onlineexam.bec@gmail.com"));  
//            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
//            message.setSubject(subject);  
//            message.setContent(msg,"text/html");
//            //3rd step)send message  
//            Transport.send(message);  
//
//            //System.out.println("Done");  
//
//        } 
//        catch (MessagingException e) 
//        {  
//            System.out.println(e);
//            throw new RuntimeException(e);  
//        }  
//    }
//}



//???????????????????

////////////////
//String  d_email = "address@gmail.com",
//            d_uname = "Name",
//            d_password = "urpassword",
//            d_host = "smtp.gmail.com",
//            d_port  = "465",
//            m_to = "toAddress@gmail.com",
//            m_subject = "Indoors Readable File: " + params[0].getName(),
//            m_text = "This message is from Indoor Positioning App. Required file(s) are attached.";
//    Properties props = new Properties();
//    props.put("mail.smtp.user", d_email);
//    props.put("mail.smtp.host", d_host);
//    props.put("mail.smtp.port", d_port);
//    props.put("mail.smtp.starttls.enable","true");
//    props.put("mail.smtp.debug", "true");
//    props.put("mail.smtp.auth", "true");
//    props.put("mail.smtp.socketFactory.port", d_port);
//    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//    props.put("mail.smtp.socketFactory.fallback", "false");
//
//    SMTPAuthenticator auth = new SMTPAuthenticator();
//    Session session = Session.getInstance(props, auth);
//    session.setDebug(true);
//
//    MimeMessage msg = new MimeMessage(session);
//    try {
//        msg.setSubject(m_subject);
//        msg.setFrom(new InternetAddress(d_email));
//        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(m_to));
//
//Transport transport = session.getTransport("smtps");
//            transport.connect(d_host, Integer.valueOf(d_port), d_uname, d_password);
//            transport.sendMessage(msg, msg.getAllRecipients());
//            transport.close();
//
//        } catch (AddressException e) {
//            e.printStackTrace();
//            return false;
//        } catch (MessagingException e) {
//            e.printStackTrace();
//            return false;
//        }
