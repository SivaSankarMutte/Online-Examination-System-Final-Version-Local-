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
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
  
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
            message.setText(msg);  

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