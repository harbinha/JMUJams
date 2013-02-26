<%-- 
    Document   : stderror
    Created on : Nov 30, 2012, 12:15:55 PM
    Author     : Student_User
--%>

<%@ page isErrorPage="true" import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style1.css"/>
	<title>JMUJams</title>
    </head>
    <body>
    <div id="mainContainer">
        <div id="oops">
		<h3>Oops!</h3></ br>
          <div>
              <p>Something went wrong, please try again later.<br />
              Please go back to the <a href="index.jsp">home page.</a></p>
        <font color="gray">
        <pre>
        <%
            if (exception != null) {
                exception.printStackTrace(new PrintWriter(out));
            }
        %>
        </pre>
        </font>
          </div>
       </div>
    </div>
    </body>
</html>
