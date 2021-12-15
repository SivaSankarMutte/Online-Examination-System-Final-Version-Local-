import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class examLinkValidation extends HttpServlet {

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
        String encrypted=request.getParameter("p");
        
        String decrypted="";
        for(int i=0;i<encrypted.length();i++)
        {
            int a=(int)encrypted.charAt(i);
            a=a-1;
            String x = Character.toString((char) a);
            decrypted=decrypted+x;  
        }
        String regdNo=decrypted.substring(0,9);
        String examId=decrypted.substring(9,decrypted.length());
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
            PreparedStatement ps=con.prepareStatement("select facultyId,listName from exam where examId=?");
            ps.setString(1, examId);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())  
            {
                HttpSession session=request.getSession();
                session.setAttribute("examId", examId);
                session.setAttribute("regdNo", regdNo);
                String fid = rs.getString(1);
                String listName=rs.getString(2);
                
                PreparedStatement ps2=con.prepareStatement("select * from students where facultyId=? and listName=? and regdno=?");
                ps2.setString(1, fid);
                ps2.setString(2, listName);
                ps2.setString(3, regdNo);
                ResultSet rs2=ps2.executeQuery();
                
                if(rs2.next())
                {
                    RequestDispatcher rd=request.getRequestDispatcher("accessTest.jsp");
                    rd.forward(request,response);
                }
            }
            RequestDispatcher rd=request.getRequestDispatcher("invalidAccessId.jsp");
            rd.forward(request,response);  

        }
        catch(Exception e)
        {
            pw.println(e);
        }
        
    }
}

//http://127.0.0.1:8080/Example/examLinkValidation?p=z29bdt6225   ACCESSID