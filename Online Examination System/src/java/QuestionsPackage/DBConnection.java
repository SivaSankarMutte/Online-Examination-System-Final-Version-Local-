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
import java.sql.Statement;
import java.util.Collections;
import java.util.Random;
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
    public ArrayList<Questions> getQuestionsSet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException
    {
        HttpSession session=request.getSession();
        ArrayList<Questions> questionsList = new ArrayList<>();
        PrintWriter pw = response.getWriter();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
            
            PreparedStatement ps=con.prepareStatement("select facultyId from exam where examId=?");
            
            String eid=(String) session.getAttribute("examId");
            String regdNo=(String) session.getAttribute("regdNo");
            
            ps.setString(1, eid);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                String fid=rs.getString("facultyId");
                PreparedStatement ps1=con.prepareStatement("select questionId,questionName,questionNameImg,opt1,opt1Img,opt2,opt2Img,opt3,opt3Img,opt4,opt4Img,ans,questionMarks,negativeMarks,questionType,questionTimeMinutes,questionTimeSeconds from questions"+fid+" where examId=?");
                ps1.setString(1, (String) session.getAttribute("examId"));
                ResultSet rs1=ps1.executeQuery();
                
                
                PreparedStatement ps3=con.prepareStatement("select randomizeOptions from exam where examId=?");

                ps3.setString(1, (String) session.getAttribute("examId"));
                ResultSet rs3=ps3.executeQuery();
                
                if(rs3.next())
                {
                    if(rs3.getInt(1)==1)
                    {
                        while(rs1.next())
                        {
                            pw.print(rs1.getInt(1));
                            Questions q=new Questions();
                            q.setQuestionId(rs1.getInt(1));
                            q.setQuestionName(rs1.getString(2));
                            q.setQuestionNameImg(rs1.getString(3));
                            q.setOpt1(rs1.getString(4));
                            q.setOpt1Img(rs1.getString(5));
                            q.setOpt2(rs1.getString(6));
                            q.setOpt2Img(rs1.getString(7));
                            q.setOpt3(rs1.getString(8));
                            q.setOpt3Img(rs1.getString(9));
                            q.setOpt4(rs1.getString(10));
                            q.setOpt4Img(rs1.getString(11));
                            
                            q.setRealAns(rs1.getString(12));
                            q.setQuestionMarks(rs1.getFloat(13));
                            q.setNegativeMarks(rs1.getFloat(14));
                            q.setQuestionType(rs1.getInt(15));
                            
                            q.setMinutesTimeLimit(rs1.getInt(16));
                            q.setSecondsTimeLimit(rs1.getInt(17));
                            
                            //To get student selected options after relogin
                            PreparedStatement ps10=con.prepareStatement("select selectedOptions from examSpecialTable"+eid+" where regdNo=? and qid=?");
                            ps10.setString(1, regdNo);
                            ps10.setInt(2, rs1.getInt(1));
                            ResultSet rs10=ps10.executeQuery();

                            if(rs10.next())
                            {
                                q.setProvidedAns(rs10.getString(1));
                                
                                
                                //NOT WORKING
                                if(rs1.getInt(15)==2 && rs10.getString(1)!=null)
                                {
                                    int optionsLength=rs10.getString(1).length()-1;
                                    int i=0;
                                    String arr[]=new String[4];
                                    while(optionsLength>=0)
                                    {
                                        arr[i]=Character.toString(rs10.getString(1).charAt(optionsLength));
                                        optionsLength-=2;
                                        i+=1;
                                    }
                                    q.setCheckboxOptionsGiven(arr);
                                }
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            ArrayList<String> o1 = new ArrayList<>();
                            o1.add(rs1.getString(4));
                            o1.add(rs1.getString(6));
                            o1.add(rs1.getString(8));
                            o1.add(rs1.getString(10));
                            
                            ArrayList<String> oi1 = new ArrayList<>();
                            oi1.add(rs1.getString(5));
                            oi1.add(rs1.getString(7));
                            oi1.add(rs1.getString(9));
                            oi1.add(rs1.getString(11));
                            
                            ArrayList<String> optIndexes = new ArrayList<>();
                            optIndexes.add("1");
                            optIndexes.add("2");
                            optIndexes.add("3");
                            optIndexes.add("4");
                            
                            q.setOptions(o1);
                            q.setOptionsImages(oi1);
                            q.setOptionNumbers(optIndexes);
                            q.randomizeOptions();
                            questionsList.add(q);
                        }
                    }
                    else
                    {
                        while(rs1.next())
                        {
                            Questions q=new Questions();
                            q.setQuestionId(rs1.getInt(1));
                            q.setQuestionName(rs1.getString(2));
                            q.setQuestionNameImg(rs1.getString(3));
                            q.setOpt1(rs1.getString(4));
                            q.setOpt1Img(rs1.getString(5));
                            q.setOpt2(rs1.getString(6));
                            q.setOpt2Img(rs1.getString(7));
                            q.setOpt3(rs1.getString(8));
                            q.setOpt3Img(rs1.getString(9));
                            q.setOpt4(rs1.getString(10));
                            q.setOpt4Img(rs1.getString(11));
                            
                            q.setRealAns(rs1.getString(12));
                            q.setQuestionMarks(rs1.getFloat(13));
                            q.setNegativeMarks(rs1.getFloat(14));
                            q.setQuestionType(rs1.getInt(15));
                            q.setMinutesTimeLimit(rs1.getInt(16));
                            q.setSecondsTimeLimit(rs1.getInt(17));
                            
                            //To get student selected options after relogin
                            PreparedStatement ps10=con.prepareStatement("select selectedOptions from examSpecialTable"+eid+" where regdNo=? and qid=?");
                            ps10.setString(1, regdNo);
                            ps10.setInt(2, rs1.getInt(1));
                            ResultSet rs10=ps10.executeQuery();

                            if(rs10.next())
                            {
                                q.setProvidedAns(rs10.getString(1));
                                
                                if(rs1.getInt(15)==2 && rs10.getString(1)!=null)
                                {
                                    int optionsLength=rs10.getString(1).length()-1;
                                    int i=0;
                                    String arr[]=new String[4];
                                    while(optionsLength>=0)
                                    {
                                        arr[i]=Character.toString(rs10.getString(1).charAt(optionsLength));
                                        optionsLength-=2;
                                        i+=1;
                                    }
                                    q.setCheckboxOptionsGiven(arr);
                                   
                                }
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            ArrayList<String> o1 = new ArrayList<>();
                            o1.add(rs1.getString(4));
                            o1.add(rs1.getString(6));
                            o1.add(rs1.getString(8));
                            o1.add(rs1.getString(10));
                            
                            ArrayList<String> oi1 = new ArrayList<>();
                            oi1.add(rs1.getString(5));
                            oi1.add(rs1.getString(7));
                            oi1.add(rs1.getString(9));
                            oi1.add(rs1.getString(11));
                            
                            ArrayList<String> optIndexes = new ArrayList<>();
                            optIndexes.add("1");
                            optIndexes.add("2");
                            optIndexes.add("3");
                            optIndexes.add("4");
                            
                            q.setOptions(o1);
                            q.setOptionsImages(oi1);
                            q.setOptionNumbers(optIndexes);
                            questionsList.add(q);
                        }
                    }
                }
                
                PreparedStatement ps2=con.prepareStatement("select randomizeQuestions from exam where examId=?");

                ps2.setString(1, (String) session.getAttribute("examId"));
                ResultSet rs2=ps2.executeQuery();
                if(rs2.next())
                {
                    int rq=rs2.getInt(1);
                    
                    if(rq==1)
                    {
                        long seed=System.nanoTime();
                        
                        
                        PreparedStatement ps5=con.prepareStatement("select status,seedTime from studentsAttempts"+eid+" where regdNo=?");

                        ps5.setString(1, (String) session.getAttribute("regdNo"));
                        ResultSet rs4=ps5.executeQuery();
                        if(rs4.next() && rs4.getInt(1)==1)
                        {
                            seed=rs4.getLong(2);
                            
                            PreparedStatement ps6=con.prepareStatement("select mode from exam where examId=?");

                            ps6.setString(1, eid);
                            ResultSet rs6=ps6.executeQuery();
                            
                            
                            if(rs6.next() && (rs6.getInt(1)==3 || rs6.getInt(1)==4))
                            {
                                PreparedStatement ps7=con.prepareStatement("select count(*) from examSpecialTable"+eid+" where regdNo=?");

                                ps7.setString(1, regdNo);
                                ResultSet rs7=ps7.executeQuery();
                                if(rs7.next())
                                {
                                    int n=rs7.getInt(1);
                                    
                                    session.setAttribute("n", n);
                                }
                            }
                            
                            
                            
                            
                        }
                        else
                        {
                            Statement st=con.createStatement();
                            st.executeUpdate("insert into studentsAttempts"+eid+" (regdNo,status,seedTime) values('"+regdNo+"','"+1+"','"+seed+"')");         
                        }
                        
                        Collections.shuffle(questionsList,new Random(seed));
                        
                        
                        String sqlUpdate="Update studentsAttempts"+eid+ " set seedTime=? where regdNo= ? and seedTime is null";
                        PreparedStatement ps4 = con.prepareStatement(sqlUpdate);
                        ps4.setLong(1,seed);
                        ps4.setString(2, (String)session.getAttribute("regdNo"));
                        ps4.executeUpdate();
                        
                        
                        
//                        try{
//                            Statement st=con.createStatement();
//                            st.executeUpdate("update studentsAttempts"+(String) session.getAttribute("examId")+" set seedTime="+seed+" where regdNo like "+(String) session.getAttribute("regdNo") +" ");      
//                        }
//                        catch(Exception e)
//                                {
//                                    System.out.print("YESSSSSSSSSSSSS");
//                                    System.out.println(e);
//                                }
                    }
                    
                    else
                    {
                        
                        PreparedStatement ps5=con.prepareStatement("select status,seedTime from studentsAttempts"+eid+" where regdNo=?");

                        ps5.setString(1, (String) session.getAttribute("regdNo"));
                        ResultSet rs4=ps5.executeQuery();
                        if(rs4.next() && rs4.getInt(1)==1)
                        {
                           
                            PreparedStatement ps6=con.prepareStatement("select mode from exam where examId=?");

                            ps6.setString(1, eid);
                            ResultSet rs6=ps6.executeQuery();
                            
                            
                            if(rs6.next() && (rs6.getInt(1)==3 || rs6.getInt(1)==4))
                            {
                                PreparedStatement ps7=con.prepareStatement("select count(*) from examSpecialTable"+eid+" where regdNo=?");

                                ps7.setString(1, regdNo);
                                ResultSet rs7=ps7.executeQuery();
                                if(rs7.next())
                                {
                                    int n=rs7.getInt(1);
                                    
                                    session.setAttribute("n", n);
                                }
                            }
                            
                            
                            
                            
                        }
                        else
                        {
                            Statement st=con.createStatement();
                            st.executeUpdate("insert into studentsAttempts"+eid+" (regdNo,status) values('"+regdNo+"','"+1+"')");         
                        }
                        
                        
                    }
                }
            }
        }
        catch(ClassNotFoundException | SQLException e)
        {
            RequestDispatcher rd=request.getRequestDispatcher("questionsAccessingError.jsp");
            rd.forward(request,response);
        }
        
        //pw.println(questionsList);
        return questionsList;
        
    }
    
}

//http://127.0.0.1:8080/Exa