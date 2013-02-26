<%-- 
    Document   : userprofile
    Created on : Nov 29, 2012, 4:22:41 PM
    Author     : Hunter Harbin, Ryan Carlson, Ryan Pitts
--%>

<%@ page import="java.util.*, beans.*, controllers.*, handlers.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style1.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        
                <% 
                 Integer userid = (Integer)session.getAttribute("userid");
                 ProfileHandler ph = new ProfileHandler(userid);
                 UserBean bean = ph.getUser();
                %>
        
         <script type="text/javascript">
           function deleteAccount(){
                    var r = confirm("Are you sure you want to delete this account?");
//                  
                    return r;
               }
         </script>  
           <script type="text/javascript">
               
               //Edit functionality
               function enable() {
                   var tf1=get('prefName');
                   tf1.readOnly=false;
                   
                   var tf2=get('userName');
                   tf2.readOnly=false;
                   
                   var tf3=get('email');
                   tf3.readOnly=false;
                   
                   document.getElementsByName("update")[0].disabled = false;
               }
               
               //Validating new profile information
               function validateForm() {
                   
                  // this.ph = ph;
                     var valid = true;                     
                     
                     var prefName = get('prefName').value;
                     var userName = get('userName').value;
                     var email  = get('email').value;
                     
                           
                    
                    //making sure all forms entries are filled
                     if(userName == null || userName ==""){
                         alert("User Name name must be provided");
                        valid = false;
                         }
                    if(prefName == null || prefName ==""){
                        alert("Preferred name must be provided");
                           valid = false;
                     }
                     if(email == null || email ==""){
                        alert("Email must be provided");
                           valid = false;
                     }
                 
       
                 //SQL Injection Prevention
                    if(! /^[\-a-zA-Z0-9]*$/.test(userName)){
                          alert("Username name can only contain a-z, A-Z, 0-9, and hyphen");
                         valid = false;
                        }
                    if(! /^[\-a-zA-Z0-9]*$/.test(prefName)){
                        alert("Preferred name can only contain a-z, A-Z, 0-9, and hyphen");
                          valid = false;
                    }
                    if(! /^[\-a-zA-Z0-9@.]*$/.test(email)){
                          alert("Invalid Email");
                       valid = false;
                    }
                    //Update the database with new user profile information
                    
                    
                    alert("User profile sucessfully updated.");           
                    return valid;
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
		<h3>User Profile</h3>
<br /><br />
         <form name="entryform" action="userprofile" method="post">
                                                         
                Preferred name: <br /><input id="prefName" name="prefName" readonly="readOnly" value="<%= bean.getPrefName() %>" type="text" size="30">
                                <br />
                                                                                        
                User name: <br /> <input id="userName" name="username" readonly="readOnly" value="<%= bean.getUsername() %>" type="text" size="30">
                                        <br />                                          
                                                                                                                        
		E-mail: <br /> <input  id="email" name="email" readonly="readOnly" value="<%= bean.getEmail() %>" type="text" size="30">
                                     <br />
                                                           
                Preferred genre: <br/> <input name="genre" readonly="readOnly" value="<%= bean.getPrefGenre()  %>" type="text" size="30">
                                                            
                <br />
		<input type="button" value="Edit" onclick="enable()" />
                <input type="submit" value ="Update" onclick="return validateForm()" disabled="disabled" name="update"/>    
          </form>
          <form name="delete" action="delete" method="post">
            <input type="submit" value="Delete Account" onclick="return deleteAccount()" name="delete"/>
          </form>
       </div>
</div>
    </body>
</html>
