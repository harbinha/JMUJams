<%-- 
    Document   : logout
    Created on : Dec 2, 2012, 3:40:24 PM
    Author     : Hunter Harbin
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
		 <font size ="6" color="black" weight="strong"> <b>Logout</b></font> <br />
                 <br />
	<form action="logout" method="get">
                   
            <input type="submit" value="Logout" name="logout" />
             <input type="button" value="Cancel" onClick="parent.location='index.jsp'"/>
            </div>
        </div>
        </form>
    </body>
</html>