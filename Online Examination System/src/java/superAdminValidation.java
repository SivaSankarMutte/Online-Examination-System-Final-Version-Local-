import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class superAdminValidation extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String email=request.getParameter("superAdminEmail");
        String psw = request.getParameter("superAdminPassword");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
            PreparedStatement ps=con.prepareStatement("select * from superAdmin where email=? and password=?");
            ps.setString(1,email);
            ps.setString(2,psw);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())  
            {
                HttpSession session=request.getSession();
                String sid = rs.getString(1);
                session.setAttribute("sid",sid);  
                response.sendRedirect("superAdminHome.jsp");
            }
            response.sendRedirect("superAdminLoginInvalid.jsp");   
        }
        catch(Exception e)
        {
            pw.print(e);
        }
    }
}

