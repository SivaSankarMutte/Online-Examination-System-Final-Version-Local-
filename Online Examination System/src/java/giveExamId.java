import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class giveExamId extends HttpServlet {

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
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo2?useSSL=false&allowPublicKeyRetrieval=true","siva","0000");
                        
            String eid=request.getParameter("eid");
            HttpSession session=request.getSession();
            session.setAttribute("eid",eid);
//            String query="create table if not exists ?("+"qid integer,"+"regdNo varchar(50),"+"marks integer)";
//            PreparedStatement ps=con.prepareStatement(query);
//            ps.setString(1, "examSpecialTable"+eid);
//            ps.execute();
            String sqlCreate = "CREATE TABLE IF NOT EXISTS " + "examSpecialTable"+eid
            + "  (qid int,"
            + "   regdNo varchar(20),"
            + "   marksObtained int,"
            + "   foreign key(qid) references questions(questionId) on delete cascade on update cascade)";

            Statement stmt = con.createStatement();
            stmt.execute(sqlCreate);
            RequestDispatcher rd=request.getRequestDispatcher("addQuestionForm.jsp");
            rd.forward(request,response);
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
}
