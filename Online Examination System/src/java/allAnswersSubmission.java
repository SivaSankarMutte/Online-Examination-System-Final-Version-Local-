
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
import java.util.Arrays;
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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
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
            
            String sqlDelete="delete from examSpecialTable"+eid+ " where regdNo=?";
            PreparedStatement ps2 = con.prepareStatement(sqlDelete);
            ps2.setString(1,regdNo);
            ps2.executeUpdate();
            
            for(int i=0;i<questionsRecords.size();i++)
            {
                if(questionsRecords.get(i).getQuestionType()==1)
                {
                    if(request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId()))!=null && !request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId())).equals(""))
                    {
                        if(request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId())).equalsIgnoreCase(questionsRecords.get(i).getRealAns()))
                        {
                            st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained,selectedOptions)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+questionsRecords.get(i).getQuestionMarks()+"','"+request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId()))+"')");      
                        }
                        else
                        {
                          st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained,selectedOptions)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+questionsRecords.get(i).getNegativeMarks()*(-1)+"','"+request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId()))+"')");      
                        }
                    }
                    else
                    {
                        st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+0+"')");      
                    }
                }
                else if(questionsRecords.get(i).getQuestionType()==0)
                {
                    if(request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId()))!=null)
                    {
                        if(request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId())).equals(questionsRecords.get(i).getRealAns()))
                        {
                            st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained,selectedOptions)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+questionsRecords.get(i).getQuestionMarks()+"','"+request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId()))+"')");      
                        }
                        else
                        {
                          st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained,selectedOptions)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+questionsRecords.get(i).getNegativeMarks()*(-1)+"','"+request.getParameter(Integer.toString(questionsRecords.get(i).getQuestionId()))+"')");      
                        }
                    }
                    else
                    {
                        st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+0+"')");      
                    }
                }
                else
                {
                    if(request.getParameterValues(Integer.toString(questionsRecords.get(i).getQuestionId()))!=null)
                    {
                        String[] studentAnswer=request.getParameterValues(Integer.toString(questionsRecords.get(i).getQuestionId()));
                        String[] realAnswer=questionsRecords.get(i).getRealAns().split("&");
                        Arrays.sort(studentAnswer);
                        Arrays.sort(realAnswer);
                        String ans="";
                        for(int j = 0; j < studentAnswer.length; j++) {
                           ans=ans+studentAnswer[j]+"&";
                        }
                        if(Arrays.equals(studentAnswer,realAnswer))
                        {
                            st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained,selectedOptions)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+questionsRecords.get(i).getQuestionMarks()+"','"+questionsRecords.get(i).getRealAns()+"')");      
                        }
                        else
                        {
                            st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained,selectedOptions)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+questionsRecords.get(i).getNegativeMarks()*(-1)+"','"+ans.substring(0,ans.length()-1)+"')");      
                        }
                    }
                    else
                    {
                        st.executeUpdate("insert into examSpecialTable"+eid+" (qid,regdNo,marksObtained)values('"+questionsRecords.get(i).getQuestionId()+"','"+regdNo+"','"+0+"')");      
                    }
                    
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
            
            String sqlUpdate2="update studentsAttempts"+eid+ " set status=2 where regdNo=?";
            PreparedStatement ps3 = con.prepareStatement(sqlUpdate2);
            ps3.setString(1,regdNo);
            ps3.executeUpdate();
            
            
            response.sendRedirect("examSubmisssionSuccess.jsp");
            
        }
        catch(ClassNotFoundException | NumberFormatException | SQLException e)
        {
            pw.println(e);
        }
    }
    
}
