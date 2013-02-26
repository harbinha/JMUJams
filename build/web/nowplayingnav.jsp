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
    <body>
        <FORM NAME="URLlist">
            <SELECT NAME="droplist">
            <OPTION SELECTED="SELECTED" VALUE=" ">Select Playlist:</OPTION>
                <OPTION VALUE="/JMUJams/nowplaying.jsp?playlistName=country">Country</OPTION>
                <OPTION VALUE="/JMUJams/nowplaying.jsp?playlistName=electronic">Electronic</OPTION>
                <OPTION VALUE="/JMUJams/nowplaying.jsp?playlistName=hip-hop">Hip-Hop</OPTION>
                <OPTION VALUE="/JMUJams/nowplaying.jsp?playlistName=pop">Pop</OPTION>
                <OPTION VALUE="/JMUJams/nowplaying.jsp?playlistName=rock">Rock</OPTION>
            </SELECT><INPUT TYPE="BUTTON" VALUE="Select." ONCLICK="GotoURL(this.form)">
            <SCRIPT LANGUAGE="JavaScript"> 
            <!--
            function GotoURL(dl) 
                { 
                    // FRAMES - To open a selection in a document that uses frames 
                    // change top.location.href to parent.putyourframenamehere.location.href
                    top.location.href = dl.droplist.options[dl.droplist.selectedIndex].value;
                } 
              // -->
            </SCRIPT>
        </FORM>
    </body>
</html>
