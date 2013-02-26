<%-- 
    Document   : invalidlogin
    Created on : Dec 2, 2012, 1:11:27 PM
    Author     : Ryan Pitts, Hunter Harbin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="stderror.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style1.css">
        <title>Login Page</title>
    </head>
    <body>
        <div id="mainContainer">
    <!-- EDIT THIS -->
	<div id="index_content">
	  <div id="createAccount">
              <font size ="6" color="black" weight="strong"> <b>Login here:</b></font> <br />
              <br />
          <form action="login" method="post">
             <label>Username: <br />
                            <input type="text" size="25" name="username"/>
             </label><br />
             <label>Password: <br /> 
                            <input type="password" size="25" name="password" />
             </label><br>
            <font size ="4" color="red">You need to be logged in to access 
                                        this page. Please login.</font> <br/>       
            <input type="submit" value="Login" name="login" />
            <input type="button" value="Cancel" onClick="parent.location='index.jsp'"/>
            <input type="button" value="Forgot Password?" onClick="parent.location='recoverpassword.html'"/>
          </form>
            </div>
        </div>
    </body>
</html>
