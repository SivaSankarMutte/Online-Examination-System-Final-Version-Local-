
import QuestionsPackage.Questions;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
public class allAnswersSubmission extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession session=request.getSession();
        PrintWriter pw=response.getWriter();
        ArrayList<Questions> questionsRecords = (ArrayList<Questions>)session.getAttribute("questionsRecords");
        
        String eid=(String) session.getAttribute("examId");
        String regdNo=(String) session.getAttribute("regdNo");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
            Statement st=con.createStatement();
            for(int i=0;i<questionsRecords.size();i++)
            {
                if(request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId()))!=null)
                {
                    if(Integer.parseInt(request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId())))==questionsRecords.get(i).getRealAns())
                    {
                        st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+questionsRecords.get(i).getQuestionMarks()+"')");      
                    }
                    else
                    {
                      st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+0+"')");      
                    }
                } 
                else
                {
                    st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"')");      
                }
            }
            
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
        catch(ClassNotFoundException | NumberFormatException | SQLException e)
        {
            pw.println(e);
        }
    }
    
}
