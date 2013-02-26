<%-- 
    Document   : validpasswordrecover
    Created on : Dec 5, 2012, 12:14:13 PM
    Author     : Ryan Pitts
--%>
<%@ page import="java.util.*, beans.*, controllers.*, handlers.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" type="text/css" href="style1.css">
	
            <style type="text/css">
            .errmsg { color: red; }
              </style>
       
         <title>JMUJams</title>
         <% 
            Integer userid = (Integer)session.getAttribute("userid");
            ProfileHandler ph = new ProfileHandler(userid);
            UserBean bean = ph.getUser();
         %>
</head>
<body>
<div id="mainContainer">
    <!-- EDIT THIS -->
	<div id="index_content">
	   <div id="createAccount">
		<h3>Recovered Password:</h3>
                <br /><br />

		<form name="passwordrecover">
                    <input type="text" name="password" size="25" value="<%= bean.getPassword() %>"/>
		</form>
                
                
                <label>Return to the 
                    <a href="login.jsp">Login Page.</a>
                </label>
               
                
            </div>
        </div>
</div>
</body>
</html>
