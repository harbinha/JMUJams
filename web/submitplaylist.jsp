<%@ page import="java.util.*, beans.*, controllers.*, handlers.*" %>

<!DOCTYPE html 
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="style1.css">
	<title>JMUJams</title>
        
        <%      
                Integer userid = (Integer)session.getAttribute("userid");
                RequestPlaylistIdHandler pid_handler = new RequestPlaylistIdHandler(userid);
        %>
        
</head>
<body>
<div id="mainContainer">
	<div id="header">
		<img src="http://216.224.164.78/images/logo.png" alt="JMUJams" />
	</div>
	<br /> 
	<div id="nav">
		<a href="nowplaying.jsp">Now Playing</a>&nbsp&nbsp&nbsp
		<a href="myjams.jsp">My Jams</a>&nbsp&nbsp&nbsp
		<a href="requestjam.html">Request Jam</a>&nbsp&nbsp&nbsp
		<a href="submitplaylist.jsp">Submit Playlist</a>&nbsp&nbsp&nbsp
		
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		
		<a href="userprofile.jsp">User Profile</a>&nbsp&nbsp&nbsp
		<a href="settings.jsp">Settings</a>&nbsp&nbsp&nbsp
		<a href="contactus.html">Contact Us</a>&nbsp&nbsp&nbsp
		<a href="aboutus.html">About Us</a>
	</div>
<div id="logoutbutton">
            <form action="logout" method="get">
            <input type="submit" value="Logout" name="logout" />
            </form>
        </div>
<!-- EDIT THIS -->
	<div id="content">
            <h3>Submit Playlist</h3>
            <br />
		<form method="post" action="mailto:jmujams@gmail.com">
                    
		Please select playlist to submit: 
                         <select name="playlist_id" id="playlist_id">
                            <option><%= pid_handler.getPlaylistName() %></option>
                         </select>
                
                
		<input type="submit" value="Submit"/>
		</form>
	</div>
</div>
</body>
</html>