<%@ page import="java.util.*, beans.*, controllers.*, handlers.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
        <script type="text/Javascript">
             // validate form data
      function validateForm() {
        var valid = true;
           
        //ensuring fields aren't blank
          var pass1 = get('pass1').value;
          var pass2 = get('pass2').value;

          if(pass1.length < 6){
              alert("Password must be longer than six characters");
              valid = false;
          }
          if(pass1 != pass2){
              alert("Passwords must match");
              valid = false;
          }

      // shortcut for accessing DOM elements by id
      function get(id) { return document.getElementById(id) }
    </script>
        
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
	<div id="settings">
            <h3>Settings Page</h3>
<br /><br />
	<form name="settings" action="settings" method="post" onsubmit="return validateForm()">
                Type a new password: <br />
                <input type="password" id="pass1" name="pass1" size="30">
                                                           <br />
                                                            
		Re-type new password:  <br />
                <input type="password" id="pass2" name="pass2" size="30">
                                                           <br />
                Please select your preferred genre:
                <select name="genre" id="genre">
                    <option <%= bean.getSelected("Country") %>>Country</option>
                    <option <%= bean.getSelected("Electronic") %>>Electronic</option>
                    <option <%= bean.getSelected("Hip-Hop") %>>Hip-Hop</option>
                    <option <%= bean.getSelected("Pop") %>>Pop</option>
                    <option <%= bean.getSelected("Rock") %>>Rock</option>
                </select>
                <br/>
                                                        
                Do you prefer your songlist to shuffle? <label>
                    <input type="checkbox" id="shuffle" <%= bean.getChecked() %> 
                           name="shuffle"/>Yes, please shuffle.</label>                                       
		<br />
		<input type="submit" id="submit" name="submit" value="Save">
	</form>
        
        </div>
</div>
</body>
</html>