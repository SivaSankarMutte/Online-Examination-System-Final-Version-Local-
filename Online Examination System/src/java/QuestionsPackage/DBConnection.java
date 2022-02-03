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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;



public class DBConnection extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @return 
     * @throws ServletException
     * @throws IOException
     */
    
    int qi=0;   //qi is question index
    public ArrayList<Questions> getQuestionsSet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session=request.getSession();
        ArrayList<Questions> questionsList = new ArrayList<>();
        PrintWriter pw = response.getWriter();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
            
            PreparedStatement ps=con.prepareStatement("select facultyId from exam where examId=?");

            ps.setString(1, (String) session.getAttribute("examId"));
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                String fid=rs.getString("facultyId");
                PreparedStatement ps1=con.prepareStatement("select questionId,questionName,opt1,opt2,opt3,opt4,ans,questionMarks,negativeMarks,haveMultipleAns from questions"+fid+" where examId=?");
                ps1.setString(1, (String) session.getAttribute("examId"));
                ResultSet rs1=ps1.executeQuery();

                while(rs1.next())
                {
                    pw.print(rs1.getInt(1));
                    Questions q=new Questions();
                    q.setQuestionId(rs1.getInt(1));
                    q.setQuestionName(rs1.getString(2));
                    q.setOpt1(rs1.getString(3));
                    q.setOpt2(rs1.getString(4));
                    q.setOpt3(rs1.getString(5));
                    q.setOpt4(rs1.getString(6));
                    q.setRealAns(rs1.getString(7));
                    q.setQuestionMarks(rs1.getFloat(8));
                    q.setNegativeMarks(rs1.getFloat(9));
                    q.setHaveMultipleAns(rs1.getInt(10));
                    questionsList.add(q);
                }
                PreparedStatement ps2=con.prepareStatement("select randomizeQuestions from exam where examId=?");

                ps2.setString(1, (String) session.getAttribute("examId"));
                ResultSet rs2=ps2.executeQuery();
                if(rs2.next())
                {
                    int rq=rs2.getInt(1);
                    if(rq==1)
                    {
                        Collections.shuffle(questionsList);
                    }
                }
            }
        }
        catch(ClassNotFoundException | SQLException e)
        {
            RequestDispatcher rd=request.getRequestDispatcher("questionsAccessingError.jsp");
            rd.forward(request,response);
        }
        
        pw.println(questionsList);
        return questionsList;
        
    }
    
}

//http://127.0.0.1:8080/Exa