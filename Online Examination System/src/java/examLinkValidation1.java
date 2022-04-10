/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SIVASANKAR
 */
import QuestionsPackage.DBConnection;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
public class examLinkValidation1 extends HttpServlet {

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
        HttpSession session=request.getSession();
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String encrypted=request.getQueryString().substring(2);
        session.setAttribute("encrypted", encrypted);
        String decrypted=cipher.AES.decrypt(encrypted);
        
        String[] temp=decrypted.split("-");
        String regdNo=temp[0];
        String examId=temp[1];
       
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
            
            PreparedStatement psTime=con.prepareStatement("select startTime,loginTime,endTime,activation from exam where examId=?");
            psTime.setString(1, examId);
            ResultSet rsTime=psTime.executeQuery();
            if(rsTime.next())
            {
                Timestamp timestamp=rsTime.getTimestamp(1);
                Date startTime=new Date(timestamp.getTime());
                
                String data=startTime.toString();
                String month=data.substring(4, 7);
                String date=data.substring(8, 10);
                String year=data.substring(24, 28);
                String hh=data.substring(11,13);
                String mm=data.substring(14,16);
                String ss=data.substring(17,19);
                String formattedStartTime=month+" "+date+", "+year+" "+hh+":"+mm+":"+ss;
                session.setAttribute("startTime",formattedStartTime);
                
                
                
                int loginTime=rsTime.getInt(2);
                Calendar cal=Calendar.getInstance();
                cal.setTime(startTime);
		cal.add(Calendar.MINUTE, loginTime);
		Date loginWindowTime=cal.getTime();
                
                
                Timestamp timestamp2=rsTime.getTimestamp(3);
                Date endTime=new Date(timestamp2.getTime());
                //session.setAttribute("endTime", endTime);
                
                String data2=endTime.toString();
                String month2=data2.substring(4, 7);
                String date2=data2.substring(8, 10);
                String year2=data2.substring(24, 28);
                String hh2=data2.substring(11,13);
                String mm2=data2.substring(14,16);
                String ss2=data2.substring(17,19);
                String formattedEndTime=month2+" "+date2+", "+year2+" "+hh2+":"+mm2+":"+ss2;
                session.setAttribute("endTime",formattedEndTime);
                
                
                
                Date now=new Date();
                
                int activation=rsTime.getInt(4);
                
                if(now.compareTo(startTime)>=0 && now.compareTo(endTime)<=0 && activation==1)
                {
                    PreparedStatement ps=con.prepareStatement("select facultyId,listName from exam where examId=?");
                    ps.setString(1, examId);
                    ResultSet rs=ps.executeQuery();

                    while(rs.next())  
                    {
                        session.setAttribute("examId", examId);
                        session.setAttribute("regdNo", regdNo);

                        String fid = rs.getString(1);
                        String listName=rs.getString(2);

                        PreparedStatement ps2=con.prepareStatement("select studentId from students"+fid+" where listName=? and regdno=?");
                        ps2.setString(1, listName);
                        ps2.setString(2, regdNo);

                        ResultSet rs2=ps2.executeQuery();

                        if(rs2.next())
                        {
                            PreparedStatement ps5=con.prepareStatement("select status from studentsAttempts"+examId+" where regdNo=?");
                            ps5.setString(1,regdNo);
                            ResultSet rs5=ps5.executeQuery();
                            if(rs5.next())
                            {
                                if(rs5.getInt(1)==1)
                                {
                                    session.setAttribute("n", 0);         
                                    session.setAttribute("questionsRecords", new DBConnection().getQuestionsSet(request, response));

                                    //if student allows to see questions at a time
                                    PreparedStatement ps4=con.prepareStatement("select mode from exam where examId=?");

                                    ps4.setString(1,examId);
                                    ResultSet rs4=ps4.executeQuery();
                                    if(rs4.next())
                                    {
                                        int examMode=rs4.getInt(1);
                                        if(examMode==1)
                                        {
                                            session.setAttribute("accessAllQuestions", 1);
                                            response.sendRedirect("accessAllQuestions.jsp");
                                        }
                                        else if(examMode==2)
                                        {
                                            session.setAttribute("accessTestNavigationBetweenQuestions", 1);
                                            response.sendRedirect("accessTestNavigationBetweenQuestions.jsp");
                                        }
                                        else if(examMode==3)
                                        {
                                            session.setAttribute("accessTest", 1);
                                            response.sendRedirect("accessTest.jsp");
                                        }
                                        else
                                        {
                                            session.setAttribute("accessTestQuestionTimeLimit", 1); 
                                            session.setAttribute("timeLimit", 1);
                                            response.sendRedirect("accessTestQuestionTimeLimit.jsp");
                                        }
                                    }
                                }
                                else
                                {
                                    response.sendRedirect("alreadySubmitted.jsp");
                                }
                            }
                            else
                            {
                                //For to login with in Login window for first time
                                if(now.compareTo(startTime)>=0 && now.compareTo(loginWindowTime)<=0 && activation==1)
                                {
                                    session.setAttribute("questionsRecords", new DBConnection().getQuestionsSet(request, response));

                                    //if student allows to see questions at a time
                                    PreparedStatement ps4=con.prepareStatement("select mode from exam where examId=?");

                                    ps4.setString(1,examId);
                                    ResultSet rs4=ps4.executeQuery();
                                    if(rs4.next())
                                    {
                                        int examMode=rs4.getInt(1);
                                        if(examMode==1)
                                        {
                                            response.sendRedirect("accessAllQuestions.jsp");
                                        }
                                        else if(examMode==2)
                                        {                     
                                            session.setAttribute("n", 0);  
                                            response.sendRedirect("accessTestNavigationBetweenQuestions.jsp");
                                        }
                                        else if(examMode==3)
                                        {
                                            session.setAttribute("n", 0);  
                                            response.sendRedirect("accessTest.jsp");
                                        }
                                        else
                                        {
                                            session.setAttribute("n", 0);  
                                            session.setAttribute("timeLimit", 1);
                                            response.sendRedirect("accessTestQuestionTimeLimit.jsp");
                                        }
                                    }
                                }
                                else
                                {
                                    pw.print("Login window time is over..!");
                                    response.sendRedirect("loginWindowTimeOver.jsp");
                                }
                            }
                        }
                    }
                    response.sendRedirect("invalidAccessId.jsp");
                }
                else if(now.compareTo(startTime)>=0 && now.compareTo(endTime)<=0 && activation==0)
                {
                    pw.print("Faculty didn't activate the test");
                }
                else if((now.compareTo(startTime)>=0 && now.compareTo(endTime)>0))
                {
                    pw.print("Exam starts at "+startTime+" and ends at "+endTime);
                    pw.print("NOW TIME:"+now);
                    pw.print("Exam Time already over");
                }

                
                else if((now.compareTo(startTime)<0 || now.compareTo(endTime)>0))
                {
                    response.sendRedirect("examNotStarted1.jsp");
                }
                else
                {
                    response.sendRedirect("invalidAccessId.jsp");
                }
            }
            else
            {
                response.sendRedirect("invalidAccessId.jsp");
            }
        }
        catch(Exception e)
        {
            pw.println(e);
        }
        
    }
}
