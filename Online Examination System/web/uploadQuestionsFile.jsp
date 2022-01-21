<%-- 
    Document   : uploadQuestionsFile
    Created on : 15 Jan, 2022, 1:37:54 PM
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
            if(session.getAttribute("fid")==null)
            {
                response.sendRedirect("facultyLogin.jsp");
            }
        %>
        <jsp:include page="base.jsp"/>
        
        <form enctype="multipart/form-data" action="uploadQuestions.jsp" method="post">
            <br><br><br>
            <center>
                <table border="2">
                    <tr>
                        <td colspan="2">
                            <p align="center"><B>Upload Questions CSV file</B>
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
                                        <a href="addQuestionForm.jsp" class="btn btn-info form-control my-2">Back</a>
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