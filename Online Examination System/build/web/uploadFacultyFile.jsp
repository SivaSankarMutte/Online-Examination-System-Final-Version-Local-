<%-- 
    Document   : uploadFacultyFile
    Created on : 3 Dec, 2021, 2:26:10 PM
    Author     : SIVASANKAR
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Upload File</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="icon" type="text/css" href="images/test.png">
        
    </head>
  
    <body>
        <% 
            if(session.getAttribute("aid")==null)
            {
                response.sendRedirect("adminLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        <% 
            session.setAttribute("adminEmail",request.getParameter("adminEmail")); 
            session.setAttribute("adminEmailPassword",request.getParameter("adminEmailPassword")); 
        %>
        <form enctype="multipart/form-data" action="uploadFaculty.jsp" method="post">
            <br><br><br>
            <center>
                <table border="2">
                    <tr>
                        <td colspan="2">
                            <p align="center"><B>Upload Faculty CSV file</B>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Choose the file To Upload:</b>
                        </td>
                        <td>
                            <INPUT NAME="file" TYPE="file" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div align="right">
                                <div class="row">
                                    <div class="col">
                                        <a href="adminHome.jsp" class="btn btn-info form-control my-2">Back</a>
                                    </div>
                                    <div class="col">
                                        <input type="submit" value="Send File" class="form-control my-2 btn btn-success"/>
                                    </div>
                                </div> 
                            </div>
                        </td>
                    </tr>
                </table>
            </center> 
        </form>
    </body>
</html>