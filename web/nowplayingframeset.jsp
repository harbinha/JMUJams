<%-- 
    Document   : nowplayingframeset
    Created on : Nov 29, 2012, 5:11:06 PM
    Author     : Student_User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style1.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <frameset cols="150,*">
            <frame name="contents" target="main" src="nowplayingnav.jsp">
            <frame name="main" src="nowplaying.jsp">
            <noframes>
            <body>

            <p>This page uses frames, but your browser doesn't support them.</p>

            </body>
            </noframes>
        </frameset>
    
    <body>
    </body>
</html>
