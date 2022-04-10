/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DATA_DIRECTORY = "data";
    
//    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
//    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
    
    private static final int MAX_MEMORY_SIZE = 2048 * 2048 * 5;
    private static final int MAX_REQUEST_SIZE = 2048 * 2048 * 5;
 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //List  items = upload.parseRequest(request);
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        
        
    //            List<FileItem> multiparts;
    //            DiskFileItemFactory factory = new DiskFileItemFactory();
    //            multiparts = new ServletFileUpload(factory).parseRequest(request);
    //            for(FileItem item : multiparts){
    //                if(item.isFormField() && item.getFieldName().equals("qname")){
    //                    String qname=item.getString();
    //                    out.println(qname);
    //                }
    //            }
    // Check that we have a file upload request
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (!isMultipart) {
        return;
    }
    DiskFileItemFactory factory = new DiskFileItemFactory();
    // Create a factory for disk-based file items
    // Sets the size threshold beyond which files are written directly to
    // disk.
    factory.setSizeThreshold(MAX_MEMORY_SIZE);
    // Sets the directory used to temporarily store files that are larger
    // than the configured size threshold. We use temporary directory for
    // java
    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
    // constructs the folder where uploaded file will be stored
    String uploadFolder = getServletContext().getRealPath("")
            + File.separator + DATA_DIRECTORY;
    // Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);
    // Set overall request size constraint
    upload.setSizeMax(MAX_REQUEST_SIZE);
    
    
    
    String questionType=null;
    
    String questionNameImg="";
    String questionName=null;
    String opt1=null;
    String opt1Img="";
    String opt2=null;
    String opt2Img="";
    String opt3=null;
    String opt3Img="";
    String opt4=null;
    String opt4Img="";
    
    String ans=null;
    String questionMarks=null;
    String negativeMarks=null;
    
    String timeLimitMinutes=null;
    String timeLimitSeconds=null;
    
    
    try {
        // Parse the request
        List items = upload.parseRequest(request);
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            
            
            if(item.isFormField() && item.getFieldName().equals("formQuestionType")){
                questionType=item.getString();
                out.println(questionType);
                
            }
           
            
            else if (!item.isFormField() && item.getFieldName().equals("formQuestionNameImg")) {
                if(item.getSize()!=0)
                {
                    Date date = Calendar.getInstance().getTime();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd-hh-mm-ss-SSSSSSS");
                    String fileName = dateFormat.format(date)+"-"+session.getAttribute("fid")+"-questionName";

                    out.println(fileName);
                    questionNameImg = uploadFolder + File.separator + fileName+".jpg";
                    File uploadedFile = new File(questionNameImg);
                    
                    questionNameImg=questionNameImg.substring(questionNameImg.indexOf("data"),questionNameImg.length());
                        
                    out.println(questionNameImg);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }
            }
            else if(item.isFormField() && item.getFieldName().equals("formQuestionName")){
                questionName=item.getString();
                out.println(questionName);
                if(questionName.equals(""))
                {
                    out.println("YEssss");
                }
            }
            
            
            
            else if(item.isFormField() && item.getFieldName().equals("formOpt1")){
                opt1=item.getString();
                out.println(opt1);
               
            }
            else if (!item.isFormField() && item.getFieldName().equals("formOpt1Img")) {
                if(item.getSize()!=0)
                {
                    Date date = Calendar.getInstance().getTime();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd-hh-mm-ss-SSSSSSS");
                    String fileName = dateFormat.format(date)+"-"+session.getAttribute("fid")+"-opt1";

                    out.println(fileName);
                    opt1Img = uploadFolder + File.separator + fileName+".jpg";
                    File uploadedFile = new File(opt1Img);
                    
                    opt1Img=opt1Img.substring(opt1Img.indexOf("data"),opt1Img.length());
                    
                    out.println(opt1Img);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }
            }
            
            
            else if(item.isFormField() && item.getFieldName().equals("formOpt2")){
                opt2=item.getString();
                out.println(opt2);
               
            }
            else if (!item.isFormField() && item.getFieldName().equals("formOpt2Img")) {
                if(item.getSize()!=0)
                {
                    Date date = Calendar.getInstance().getTime();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd-hh-mm-ss-SSSSSSS");
                    String fileName = dateFormat.format(date)+"-"+session.getAttribute("fid")+"-opt2";

                    out.println(fileName);
                    opt2Img = uploadFolder + File.separator + fileName+".jpg";
                    File uploadedFile = new File(opt2Img);
                    
                    opt2Img=opt2Img.substring(opt2Img.indexOf("data"),opt2Img.length());
                    out.println(opt2Img);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }
            }
            
            else if(item.isFormField() && item.getFieldName().equals("formOpt3")){
                opt3=item.getString();
                out.println(opt3);
                
            }
            else if (!item.isFormField() && item.getFieldName().equals("formOpt3Img")) {
                if(item.getSize()!=0)
                {
                    Date date = Calendar.getInstance().getTime();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd-hh-mm-ss-SSSSSSS");
                    String fileName = dateFormat.format(date)+"-"+session.getAttribute("fid")+"-opt3";

                    out.println(fileName);
                    opt3Img = uploadFolder + File.separator + fileName+".jpg";
                    File uploadedFile = new File(opt3Img);
                    
                    opt3Img=opt3Img.substring(opt3Img.indexOf("data"),opt3Img.length());
                    out.println(opt3Img);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }
            }
            
            else if(item.isFormField() && item.getFieldName().equals("formOpt4")){
                opt4=item.getString();
                out.println(opt4);
                
            }
            else if (!item.isFormField() && item.getFieldName().equals("formOpt4Img")) {
                if(item.getSize()!=0)
                {
                    Date date = Calendar.getInstance().getTime();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd-hh-mm-ss-SSSSSSS");
                    String fileName = dateFormat.format(date)+"-"+session.getAttribute("fid")+"-opt4";

                    out.println(fileName);
                    opt4Img = uploadFolder + File.separator + fileName+".jpg";
                    File uploadedFile = new File(opt4Img);

                    opt4Img=opt4Img.substring(opt4Img.indexOf("data"),opt4Img.length());
                    out.println(opt4Img);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }
            }
            
            
            
            else if(item.isFormField() && item.getFieldName().equals("formAns")){
                ans=item.getString();
                out.println(ans);
            }
            else if(item.isFormField() && item.getFieldName().equals("formQuestionMarks")){
                questionMarks=item.getString();
                out.println(questionMarks);
            }
            else if(item.isFormField() && item.getFieldName().equals("formNegativeMarks")){
                negativeMarks=item.getString();
                out.println(negativeMarks);
            }
            
            else if(item.isFormField() && item.getFieldName().equals("formQuestionTimeLimitMinutes")){
                timeLimitMinutes=item.getString();
                out.println(timeLimitMinutes);
            }
            else if(item.isFormField() && item.getFieldName().equals("formQuestionTimeLimitSeconds")){
                timeLimitSeconds=item.getString();
                out.println(timeLimitSeconds);
            }
            
            
            
        }
        
        
        
       
        //Database Code
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
        
        if((!questionName.equals("") || !questionNameImg.equals("")) )
        {
            if(questionType.equals("1"))
            {
                String queryString="insert into questions"+session.getAttribute("fid")+"(examId,questionName,questionNameImg,ans,questionMarks,negativeMarks,questionType,questionTimeMinutes,questionTimeSeconds) values(?,?,?,?,?,?,?,?,?)";
                PreparedStatement pstatement = con.prepareStatement(queryString);
                pstatement.setString(1,session.getAttribute("eid").toString());
                pstatement.setString(2, questionName);
                pstatement.setString(3, questionNameImg);
                pstatement.setString(4, ans);
                pstatement.setString(5, questionMarks);
                pstatement.setString(6, negativeMarks);
                pstatement.setString(7, questionType);
                pstatement.setString(8, timeLimitMinutes);
                pstatement.setString(9, timeLimitSeconds);

                int status=pstatement.executeUpdate();
                
                if(status==1)
                {
                    session.setAttribute("message", "success");
                    getServletContext().getRequestDispatcher("/addQuestionForm.jsp").forward(request, response);
                }
                else
                {
                    session.setAttribute("message", "failed");
                    getServletContext().getRequestDispatcher("/addQuestionForm.jsp").forward(request, response);
                }
            }
            else if(questionType.equals("0") && !ans.equals("1") && !ans.equals("2") && !ans.equals("3") && !ans.equals("4"))
            {
                out.print("yeah1");
            }
            else if(questionType.equals("0") && (!opt1.equals("") || !opt1Img.equals("")) &&  (!opt2.equals("") || !opt2Img.equals("")))
            {
                if(opt3.equals("") && opt3Img.equals("") && opt4.equals("") && opt4Img.equals(""))
                {
                    if(ans.equals("1") || ans.equals("2"))
                    {
                        String queryString="insert into questions"+session.getAttribute("fid")+"(examId,questionName,questionNameImg,opt1,opt1Img,opt2,opt2Img,ans,questionMarks,negativeMarks,questionType,questionTimeMinutes,questionTimeSeconds) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        PreparedStatement pstatement = con.prepareStatement(queryString);
                        pstatement.setString(1,session.getAttribute("eid").toString());
                        pstatement.setString(2, questionName);
                        pstatement.setString(3, questionNameImg);
                        pstatement.setString(4, opt1);
                        pstatement.setString(5, opt1Img);
                        pstatement.setString(6, opt2);
                        pstatement.setString(7, opt2Img);
                        
                        pstatement.setString(8, ans);
                        pstatement.setString(9, questionMarks);
                        pstatement.setString(10, negativeMarks);
                        pstatement.setString(11, questionType);
                        pstatement.setString(12, timeLimitMinutes);
                        pstatement.setString(13, timeLimitSeconds);

                        int status=pstatement.executeUpdate();

                        if(status==1)
                        {
                            session.setAttribute("message", "success");
                            getServletContext().getRequestDispatcher("/addQuestionForm.jsp").forward(request, response);
                        }
                        else
                        {
                            out.print("yeah2");
                        }
                    }
                    else
                        {
                            out.print("yeah3");
                        }
                }
                else if(opt4.equals("") && opt4Img.equals(""))
                {
                    if(ans.equals("1") || ans.equals("2") || ans.equals("3"))
                    {
                        String queryString="insert into questions"+session.getAttribute("fid")+"(examId,questionName,questionNameImg,opt1,opt1Img,opt2,opt2Img,opt3,opt3Img,ans,questionMarks,negativeMarks,questionType,questionTimeMinutes,questionTimeSeconds) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        PreparedStatement pstatement = con.prepareStatement(queryString);
                        pstatement.setString(1,session.getAttribute("eid").toString());
                        pstatement.setString(2, questionName);
                        pstatement.setString(3, questionNameImg);
                        pstatement.setString(4, opt1);
                        pstatement.setString(5, opt1Img);
                        pstatement.setString(6, opt2);
                        pstatement.setString(7, opt2Img);
                        pstatement.setString(8, opt3);
                        pstatement.setString(9, opt3Img);
                        
                        pstatement.setString(10, ans);
                        pstatement.setString(11, questionMarks);
                        pstatement.setString(12, negativeMarks);
                        pstatement.setString(13, questionType);
                        pstatement.setString(14, timeLimitMinutes);
                        pstatement.setString(15, timeLimitSeconds);

                        int status=pstatement.executeUpdate();

                        if(status==1)
                        {
                            session.setAttribute("message", "success");
                            getServletContext().getRequestDispatcher("/addQuestionForm.jsp").forward(request, response);
                        }
                        else
                        {
                            out.print("yeah4");
                        }
                    }
                    else
                        {
                            out.print("yeah5");
                        }
                }
                else if(opt3.equals("") && opt3Img.equals("") && (!opt4.equals("") || !opt4Img.equals("")))
                {
                    out.print("yeah6");
                }
                else
                {
                    String queryString="insert into questions"+session.getAttribute("fid")+"(examId,questionName,questionNameImg,opt1,opt1Img,opt2,opt2Img,opt3,opt3Img,opt4,opt4Img,ans,questionMarks,negativeMarks,questionType,questionTimeMinutes,questionTimeSeconds) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        PreparedStatement pstatement = con.prepareStatement(queryString);
                        pstatement.setString(1,session.getAttribute("eid").toString());
                        pstatement.setString(2, questionName);
                        pstatement.setString(3, questionNameImg);
                        pstatement.setString(4, opt1);
                        pstatement.setString(5, opt1Img);
                        pstatement.setString(6, opt2);
                        pstatement.setString(7, opt2Img);
                        pstatement.setString(8, opt3);
                        pstatement.setString(9, opt3Img);
                        pstatement.setString(10, opt4);
                        pstatement.setString(11, opt4Img);
                        
                        pstatement.setString(12, ans);
                        pstatement.setString(13, questionMarks);
                        pstatement.setString(14, negativeMarks);
                        pstatement.setString(15, questionType);
                        pstatement.setString(16, timeLimitMinutes);
                        pstatement.setString(17, timeLimitSeconds);

                        int status=pstatement.executeUpdate();

                        if(status==1)
                        {
                            session.setAttribute("message", "success");
                            getServletContext().getRequestDispatcher("/addQuestionForm.jsp").forward(request, response);
                        }
                        else
                        {
                            out.print("yeah7");
                        }
                }
            }
            
            else
            {
                String opts[]=ans.split("&");
                int isValidOpts=1;
                for(int i=0;i<opts.length;i++)
                {                       
                    if(!((opts[i].equals("1") && (!opt1.equals("") || !opt1Img.equals(""))) || (opts[i].equals("2") 
                        && (!opt2.equals("") || !opt2Img.equals(""))) || (opts[i].equals("3") && 
                            (!opt3.equals("") || !opt3Img.equals("")))
                        || (opts[i].equals("4") && (!opt4.equals("") || !opt4Img.equals(""))) ))
                    {
                        isValidOpts=0;
                        break;
                    }
                }
                if(isValidOpts==1){
                    String queryString="insert into questions"+session.getAttribute("fid")+"(examId,questionName,questionNameImg,opt1,opt1Img,opt2,opt2Img,opt3,opt3Img,opt4,opt4Img,ans,questionMarks,negativeMarks,questionType,questionTimeMinutes,questionTimeSeconds) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        PreparedStatement pstatement = con.prepareStatement(queryString);
                        pstatement.setString(1,session.getAttribute("eid").toString());
                        pstatement.setString(2, questionName);
                        pstatement.setString(3, questionNameImg);
                        pstatement.setString(4, opt1);
                        pstatement.setString(5, opt1Img);
                        pstatement.setString(6, opt2);
                        pstatement.setString(7, opt2Img);
                        pstatement.setString(8, opt3);
                        pstatement.setString(9, opt3Img);
                        pstatement.setString(10, opt4);
                        pstatement.setString(11, opt4Img);
                        
                        pstatement.setString(12, ans);
                        pstatement.setString(13, questionMarks);
                        pstatement.setString(14, negativeMarks);
                        pstatement.setString(15, questionType);
                        pstatement.setString(16, timeLimitMinutes);
                        pstatement.setString(17, timeLimitSeconds);
                        
                        int status=pstatement.executeUpdate();

                        if(status==1)
                        {
                            session.setAttribute("message", "success");
                            getServletContext().getRequestDispatcher("/addQuestionForm.jsp").forward(request, response);
                        }
                        else
                        {
                            out.print("yeah8");
                        }
                }
                else
                {
                    out.print("yeah9");
                }
            }
            
            
        }
        else
        {
            out.print("yeah10");
        }
        
        
//        
//        String queryString="insert into faculty(adminId,facultyName,email,password) values(?,?,?,?)";
//        PreparedStatement pstatement = con.prepareStatement(queryString);
//        pstatement.setString(1,adminIdf);
//        pstatement.setString(2, facultyName);
//        pstatement.setString(3, facultyEmail);
//        pstatement.setString(4, facultyPassword);
//        pstatement.executeUpdate();
        
        
        // displays done.jsp page after upload finished
        //getServletContext().getRequestDispatcher("/done.jsp").forward(request, response);

    } catch (FileUploadException ex) {
        throw new ServletException(ex);
    } catch (Exception ex) {
        throw new ServletException(ex);
    }
    }
}


//Yeahs need to be replaced with failed messages