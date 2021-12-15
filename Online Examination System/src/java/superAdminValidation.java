import java.io.IOException;
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
        String superAdminName=request.getParameter("superAdminName");
        String password = request.getParameter("superAdminPassword");
        if(superAdminName.equals("superadmin") && password.equals("superadmin"))
        {
            HttpSession session=request.getSession();
            session.setAttribute("superAdminName",superAdminName);  
            response.sendRedirect("superAdminHome.jsp");
        }
        else
        {
            response.sendRedirect("superAdminLogin.jsp");
        }
    }
        
}
