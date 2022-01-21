

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SIVASANKAR
 */
package QuestionsPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class goToPrevQuestion extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        HttpSession session=request.getSession();
        //ArrayList<Questions> questionsRecords = (ArrayList<Questions>)session.getAttribute("questionsRecords");
        
        try
        {
            String rno=session.getAttribute("regdNo").toString();
            String eid=session.getAttribute("examId").toString();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
            Questions qobj=(Questions)session.getAttribute("qobj");
            int qid=(int)qobj.getQuestionId();
            if(request.getParameter("radioName")!=null)
            {
                int submittedAns=Integer.parseInt(request.getParameter("radioName"));
                int marksObtained;
                qobj.setProvidedAns(submittedAns);
//                qobj.providedAns=submittedAns;
                int realAns=qobj.getRealAns();
                
                int qmarks=(int)qobj.getQuestionMarks();
                
                if(submittedAns==realAns)
                {
                    marksObtained=qmarks;
                }
                else
                {
                    marksObtained=0;
                }

                
                String sqlUpdate="Update examSpecialTable"+eid+ " set marksObtained=? where qid=? and regdNo=?";
                PreparedStatement ps = con.prepareStatement(sqlUpdate);
                ps.setInt(1,marksObtained);
                ps.setInt(2,qid);
                ps.setString(3, rno);
                int status=ps.executeUpdate();

                if(status==0)
                {
                    Statement st=con.createStatement();
                    st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained)values('"+qid+"','"+rno+"','"+marksObtained+"')");                
                }
            }
            else
            {
                String sqlUpdate="Update examSpecialTable"+eid+ " set marksObtained=null where qid=? and regdNo=?";
                PreparedStatement ps = con.prepareStatement(sqlUpdate);
                ps.setInt(1,qid);
                ps.setString(2, rno);
                int status=ps.executeUpdate();

                if(status==0)
                {
                    Statement st=con.createStatement();
                    st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo)values('"+qid+"','"+rno+"')");   
                }
                
            }
            
            int num=(int) session.getAttribute("n");
            num-=1;
            session.setAttribute("n", num);   
            RequestDispatcher rd=request.getRequestDispatcher("accessTestNavigationBetweenQuestions.jsp");
            rd.forward(request,response);    
        }
        catch(IOException | ClassNotFoundException | NumberFormatException | SQLException | ServletException e)
        {
            pw.print(e);
        }
    }
}

