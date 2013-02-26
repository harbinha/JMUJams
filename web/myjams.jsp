<%-- 
    Document   : myjams
    Created on : Nov 30, 2012, 12:00:04 PM
    Author     : Michael Saintcross
--%>
        
<%@ page import="java.util.*, beans.*, controllers.*, handlers.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style1.css" />
        <script type="text/javascript">
            
            function getData(n)
            {
                
                var row = document.getElementById("sr"+n);
                var cells = row.getElementsByTagName("td");
                var song = new Array();
                
                song[0] = cells[0].innerText;
                song[1] = cells[1].innerText;
                song[2] = cells[2].innerText;
                song[3] = cells[3].innerText;
                             
                addData(song,n);
            }
            function addData(arrSong,idN)
            {
                var rows = checkSongs();
                   
                if (rows == 5)
                {
                    alert("Maximum of 5 songs in a playlist!\nRemove a song to add another!")
                    return;
                }
                document.getElementById('submitBtn').disabled = false;
                
                var tab = document.getElementById("dynTab");
                
                var row = document.createElement("tr");
                    row.setAttribute("id","r" + idN);
                    row.setAttribute("width","45%");
                    row.setAttribute("height","10%");
                    row.setAttribute("bgcolor","grey");
                    row.setAttribute("style","cursor: pointer;");
                    
                var rowButton = document.createElement("BUTTON");
                    var btnTx = document.createTextNode("Remove");
                    rowButton.setAttribute("id","b"+ idN);
                    rowButton.setAttribute("width","45%");
                    rowButton.setAttribute("height","10%");
                    rowButton.setAttribute("onclick","removeData(" + idN + ")");
                    rowButton.appendChild(btnTx);
                
                   for(var i = 0; i < arrSong.length; i++)
                   {
                        var cell = document.createElement("td");
                        cell.setAttribute("width", "45%");
                        cell.setAttribute("height","10%");
                        var text = document.createTextNode(arrSong[i] + " ");
                        cell.appendChild(text);
                        row.appendChild(cell);
                        row.appendChild(rowButton);
                        tab.appendChild(row);
                   } 
            }
            function removeData(n)
            {
               
               var oldRow = document.getElementById("r" + n);
               oldRow.parentNode.removeChild(oldRow);
               
            }
            function checkSongs()
            {
               var rows = document.getElementById('dynTab').getElementsByTagName('tr').length; 
               return rows;
            }
            function buildtbl() 
            {
                document.getElementsByName("btable")[0].disabled = true;
                
                var divE = document.getElementById("mainContainer");
                var tbl  = document.createElement("table");
                
                var thead1 = document.createElement("th");
                thead1.setAttribute("width","45%");
                thead1.setAttribute("height","10%");
                var text1 = document.createTextNode("Artist");
                thead1.appendChild(text1);
                
                var thead2 = document.createElement("th");
                thead2.setAttribute("width","45%");
                thead2.setAttribute("height","10%");
                var text2 = document.createTextNode("Title");
                thead2.appendChild(text2);
                
                var thead3 = document.createElement("th");
                thead3.setAttribute("width","45%");
                thead3.setAttribute("height","10%");
                var text3 = document.createTextNode("Album");
                thead3.appendChild(text3);
                
                var thead4 = document.createElement("th");
                thead4.setAttribute("width","45%");
                thead4.setAttribute("height","10%");
                var text4 = document.createTextNode("Genre");
                thead4.appendChild(text4);
                
                var thead5 = document.createElement("th");
                thead5.setAttribute("width","45%");
                thead5.setAttribute("height","10%");
                var text5 = document.createTextNode("Control");
                thead5.appendChild(text5);   
                
                tbl.appendChild(thead1);
                tbl.appendChild(thead2);
                tbl.appendChild(thead3);
                tbl.appendChild(thead4);
                tbl.appendChild(thead5);
                
                tbl.setAttribute("width","45%")
                tbl.setAttribute("align","right")
                tbl.setAttribute("border","1");
                tbl.setAttribute("cellspacing","0");
                tbl.setAttribute("cellpadding","0");
                tbl.setAttribute("id","dynTab");
                divE.appendChild(tbl);
            }
            function getSong()
            {
               return songArr;
            }
            function getPlayName()
            {
                return playlistName;
            }
            function deletePlay()
            {
                for (var x = 1, y = 6, i = 0; x < y; x++,i+=4)
                {
                        document.getElementById("artist" + x).value = "delete";
                }
                for (var x = 1, y = 6, i = 1; x < y; x++,i+=4)
                {
                        document.getElementById("title" + x).value = "delete";
                }
                for (var x = 1, y = 6, i = 2; x < y; x++,i+=4)
                {
                        document.getElementById("album" + x).value = "delete";
                }       
                for (var x = 1, y = 6, i = 3; x < y; x++,i+=4)
                {
                        document.getElementById("genre" + x).value = "delete";
                }
                for (var x = 1, y = 6, i = 0; x < y; x++,i+=4)
                {
                        document.getElementById("pName" + x).value = "delete";
                }
                document.getElementById("typeAD1").value = "delete";
            }
            function playlist()
            {
                    var name = prompt("Enter a playlist name:","namehere");
                    
                    if (name!=null)
                    {
                        //Submitting playlist
                        var table = document.getElementById('dynTab'); 
                        var song = new Array();
                        for (var r = 0, n = table.rows.length; r < n; r++) 
                        {
                            for (var c = 0, m = table.rows[r].cells.length; c < m; c++) 
                            {
                                 song.push(table.rows[r].cells[c].innerHTML);
                            }
                        }
                        for (var x = 1, y = 6, i = 0; x < y; x++,i+=4)
                        {
                             document.getElementById("artist" + x).value = song[i];
                        }
                        for (var x = 1, y = 6, i = 1; x < y; x++,i+=4)
                        {
                             document.getElementById("title" + x).value = song[i];
                        }
                        for (var x = 1, y = 6, i = 2; x < y; x++,i+=4)
                        {
                             document.getElementById("album" + x).value = song[i];
                        }       
                        for (var x = 1, y = 6, i = 3; x < y; x++,i+=4)
                        {
                             document.getElementById("genre" + x).value = song[i];
                        }
                        for (var x = 1, y = 6, i = 0; x < y; x++,i+=4)
                        {
                             document.getElementById("pName" + x).value = name;
                        }
                             //type add/delete;
                             document.getElementById("typeAD1").value = "add";
                             
                    }
             }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Jams</title>
    </head>
    <body>
<div id="mainContainer" style="float:none; height:1200px; width:85%;">
    <div id="header">
    <img src="http://216.224.164.78/images/logo.png" alt="JMUJams" />
    </div>
    <div id="logoutbutton">
    <form action="logout" method="get">
    <input type="submit" value="Logout" name="logout" />
    </form>
    <br>
    </div>
    <div id="nav"  style="margin-left:auto; margin-right:auto; width:80%;">
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
    <br>
    <div>
          <form id="submitPlaylist" action="myjams" method="post">
              
              <body onload="document.getElementById('submitBtn').disabled=true;">
               
              <input type="hidden" name="artist" id="artist1"/>
              <input type="hidden" name="artist" id="artist2"/>
              <input type="hidden" name="artist" id="artist3"/>
              <input type="hidden" name="artist" id="artist4"/>
              <input type="hidden" name="artist" id="artist5"/>
              
              <input type="hidden" name="title" id="title1"/>
              <input type="hidden" name="title" id="title2"/>
              <input type="hidden" name="title" id="title3"/>
              <input type="hidden" name="title" id="title4"/>
              <input type="hidden" name="title" id="title5"/>
              
              <input type="hidden" name="album" id="album1"/>
              <input type="hidden" name="album" id="album2"/>
              <input type="hidden" name="album" id="album3"/>
              <input type="hidden" name="album" id="album4"/>
              <input type="hidden" name="album" id="album5"/>
              
              <input type="hidden" name="genre" id="genre1"/>
              <input type="hidden" name="genre" id="genre2"/>
              <input type="hidden" name="genre" id="genre3"/>
              <input type="hidden" name="genre" id="genre4"/>
              <input type="hidden" name="genre" id="genre5"/>
                            
              <input type="hidden" name="pName" id="pName1"/>
              <input type="hidden" name="pName" id="pName2"/>
              <input type="hidden" name="pName" id="pName3"/>
              <input type="hidden" name="pName" id="pName4"/>
              <input type="hidden" name="pName" id="pName5"/>      
              
              <input type="hidden" name="typeAD" id="typeAD1"/>
            <div>
                <input id="submitBtn" type="submit" value="Submit Playlist" onclick="playlist()" style="float:right;"/>  
            </div>
            <div>
                <input id="deleteBtn" type="submit" value="Delete Playlist" onclick="deletePlay()" style="float:right;"/>
            </div>
            <div>
                <button name="btable" onclick="buildtbl()" align="top" style="float:right;">Build Playlist</button>
            </div>
          </form>
        </div>
       <table width="45%" border="1" align="left" cellpadding="0" cellspacing="0" id="link-table">
        <div>
                <button name="btable" onclick="window.location.reload()" align="top" style="float:left;">Reset</button>
                <br>
                <br>
        </div>
        <tr>
            <th width="45%" height="10%">Artist</th>
            <th width="45%" height='10%'>Title</th>
            <th width="45%" height="10%">Album</th>
            <th width="45%" height="10%">Genre</th>
            <th width="45%" height="10%">Control</th>
        </tr>
        <tr>
           <%
                int count = 0;
                int cnt = 0;
                
                ArrayList<SongBean> arraySB;
                count++;
                
                PlaylistHandler handler = new PlaylistHandler(count);              
                arraySB = handler.getMasterList();
                
                for(SongBean sb : arraySB)
                {
                   cnt++;
                   out.print("<tr id=sr" + cnt + " bgcolor='white' >");
                   
                   out.print("<td id=tar" + cnt + " class='artist' width='45%' height='10%'>");
                   out.println(sb.getArtist());
                   out.print("</td>");
                   
                   out.print("<td id=tti" + cnt + " class='title' width='45%' height='10%'>");
                   out.println(sb.getTitle());
                   out.print("</td>");
                   
                   out.print("<td id=tal" + cnt + " class='album' width='45%' height='10%'>");
                   out.println(sb.getAlbum());
                   out.print("</td>");
                   
                   out.print("<td id=tge" + cnt + " class='genre' width='45%' height='10%'>");
                   out.println(sb.getGenre());
                   out.print("</td>");
                   
                   out.print("<td id=btn" + cnt + " class='bt'>");
                   out.print("<button id=sb" + cnt + " onclick='getData(" + cnt + ")' style='cursor: pointer;' >");
                   out.print("Add</button>");
                   out.print("</td>");
                           
                   out.print("</tr>");
                }
               
             %>
        </tr>
       </table>
    </div>
</body>
    
</html>
