
import MailDemo.sendMailToFaculty;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
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
public class sendOTPToFacultyServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
    {  
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        
        HttpSession session=request.getSession();
        try
        {
            String numbers="0123456789";
            Random random=new Random();
            char[] psw=new char[6];
            for(int i=0;i<6;i++)
            {
                psw[i]=numbers.charAt(random.nextInt(10));  //10 is numbers.length()
            }
            String otp=new String(psw);
            sendMailToFaculty.send(request.getParameter("email"),"OTP to Reset your Password","Don't share it to anyone. Your OTP to reset your Password is : "+otp);
            session.setAttribute("otp", otp);
            session.setAttribute("email",request.getParameter("email"));
            response.sendRedirect("facultyResetPassword.jsp");
        }
        catch(Exception e)
        {
            System.out.println(e);
            response.sendRedirect("OTPFailedToSend.jsp");
        }
    }
}
