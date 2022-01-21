
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class calculateMarksForAStudent extends HttpServlet{

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        HttpSession session=request.getSession();
        String eid=(String) session.getAttribute("examId");
        String regdNo=(String) session.getAttribute("regdNo");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
   
            String sqlUpdate="update results"+eid+ " set totalMarks=(select sum(marksObtained) from examSpecialTable"+eid+" where regdNo=?) where regdNo=?";
            PreparedStatement ps = con.prepareStatement(sqlUpdate);
            ps.setString(1,regdNo);
            ps.setString(2,regdNo);
            int status=ps.executeUpdate();
            
            if(status==0)
            {
                response.sendRedirect("examSubmissionFailure.jsp");
            }
            response.sendRedirect("examSubmisssionSuccess.jsp");
            
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
}

