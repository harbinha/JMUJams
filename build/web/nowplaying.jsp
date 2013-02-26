<!DOCTYPE html 
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page import="java.util.*, beans.*, controllers.*, handlers.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="style1.css" />
    <link href="http://www.jplayer.org/js/prettify/prettify-jPlayer.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="http://www.jplayer.org/latest/skin/pink.flag/jplayer.pink.flag.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
    <script type="text/javascript" src="http://www.jplayer.org/latest/js/jquery.jplayer.min.js"></script>
    <script type="text/javascript" src="http://www.jplayer.org/latest/js/jplayer.playlist.min.js"></script>
    <script type="text/javascript" src="http://www.jplayer.org/latest/js/jquery.jplayer.inspector.js"></script>
    <script type="text/javascript" src="http://www.jplayer.org/js/themeswitcher.js"></script>
    <script type="text/javascript">
        function buildItem()
        {
            for (var i = 0; i < 25; i++)
            {
                if(i != 25)
                {
                 document.write("[{title:getTitle("+ i +"), artist:getArtist("+ i +"), mp3:getURL("+ i +")},");
                }
                            
                if(i == 25)
                {
                 document.write("{title:getTitle("+ i +"), artist:getArtist("+ i +"), mp3:getURL("+ i +")}]");
                }
            }
        }
        function getTitle(n)
        {
            var title = document.getElementById("songlist1");
            var indTtl = title.getElementsByTagName("input");
            var ttlArr = new Array();
            
            for(var i = 0; i < 25; i++)
            {
                ttlArr[i] = indTtl[i].innerText;
            }
            
            return ttlArr[n];
        }
        function getArtist(n)
        {
            var artist = document.getElementById("songlist2");
            var indArt = artist.getElementsByTagName("input");
            var artArr = new Array();
            
            for(var i = 0; i < 25; i++)
            {
                artArr[i] = indArt[i].innerText;
            }
            
            return artArr[n];
        }
        function getURL(n)
        {
            var url = document.getElementById("songlist3");
            var indUrl = url.getElementsByTagName("input");
            var urlArr = new Array();
            
            for(var i = 0; i < 25; i++)
            {
                urlArr[i] = indUrl[i].innerText;
            }
            
            return urlArr[n];
        }
    </script>
    <script type="text/javascript"> 
        //<![CDATA[
        $(document).ready(function(){
                new jPlayerPlaylist({
                        jPlayer: "#jquery_jplayer_1",
                        cssSelectorAncestor: "#jp_container_1"
                }, [
                    {
                        title:"Tornado",
                        artist:"Little Big Town",
                        mp3:"https://www.dropbox.com/sh/b6co6kql0zn36mh/3e02anOKsF/tornado.mp3?dl=1"
                    },
                    {
                        title:"Genesis",
                        artist:"Grimes",
                        mp3:"http://cdn02.cdn.gorillavsbear.net/wp-content/uploads/2012/01/Genesis.mp3"
                    },
                    {
                        title:"Diamonds",
                        artist:"Rihanna",
                        mp3:"https://www.dropbox.com/sh/b6co6kql0zn36mh/NRUVLoj8Y6/diamonds.mp3?dl=1"
                    },
                    {
                        title:"One More Night",
                        artist:"Maroon 5",
                        mp3:"https://www.dropbox.com/sh/b6co6kql0zn36mh/9wwbtz8hVf/one_more_night.mp3?dl=1"
                    },
                    {
                        title:"Gone, Gone, Gone",
                        artist:"Phillip Phillips",
                        mp3:"https://www.dropbox.com/sh/b6co6kql0zn36mh/Qp4KaPkvaH/gone_gone_gone.mp3?dl=1"
                    }  
                ], {
                        swfPath: "../js",
                        supplied: "oga, mp3",
                        wmode: "window"
                });

                $("#jplayer_inspector_1").jPlayerInspector({jPlayer:$("#jquery_jplayer_1")});
        });
        //]]> 
    </script>
    <title>JMUJams</title>
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
	   <div id="nowPlaying">
		<h3>Now Playing</h3>
                    <br /><br />
                    <body>
                        <div id="jquery_jplayer_1" class="jp-jplayer"></div>
                        <div id="jp_container_1" class="jp-audio">
                            <div class="jp-type-playlist">
                                <div class="jp-gui jp-interface">
                                    <ul class="jp-controls">
                                        <li><a href="javascript:;" class="jp-previous" tabindex="1">previous</a></li>
                                        <li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
                                        <li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
                                        <li><a href="javascript:;" class="jp-next" tabindex="1">next</a></li>
                                        <li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li>
                                        <li><a href="javascript:;" class="jp-mute" tabindex="1" title="mute">mute</a></li>
                                        <li><a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute">unmute</a></li>
                                        <li><a href="javascript:;" class="jp-volume-max" tabindex="1" title="max volume">max volume</a></li>
                                    </ul>
                                    <div class="jp-progress">
                                        <div class="jp-seek-bar">
                                            <div class="jp-play-bar"></div>
                                                            
                                        </div>
                                    </div>
                                    <div class="jp-volume-bar">
                                        <div class="jp-volume-bar-value"></div>
                                    </div>
                                    <div class="jp-current-time"></div>
                                    <div class="jp-duration"></div>
                                    <ul class="jp-toggles">
                                        <li><a href="javascript:;" class="jp-shuffle" tabindex="1" title="shuffle">shuffle</a></li>
                                        <li><a href="javascript:;" class="jp-shuffle-off" tabindex="1" title="shuffle off">shuffle off</a></li>
                                        <li><a href="javascript:;" class="jp-repeat" tabindex="1" title="repeat">repeat</a></li>
                                        <li><a href="javascript:;" class="jp-repeat-off" tabindex="1" title="repeat off">repeat off</a></li>
                                    </ul>
                                </div>
                                <div class="jp-playlist">
                                    <ul>
                                        <li></li>
                                    </ul>
                                </div>
                                <div class="jp-no-solution">
                                    <span>Update Required</span>
                                    To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                                </div>
                            </div>
                        </div>
                        <div id="jplayer_inspector_1"></div> 
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
                                out.println("<div id=songlist1>");
                                out.print("<input type='hidden' id='artist" + cnt + "' value='" + sb.getArtist() + "' />");
                                out.println("</div>");
                                
                                out.println("<div id=songlist2>");
                                out.print("<input type='hidden' id='title" + cnt + "' value='" + sb.getTitle() + "' />");
                                out.println("</div>");
                                
                                out.println("<div id=songlist3>");
                                out.print("<input type='hidden' id='url" + cnt + "' value='" + sb.getPath() + "' />");                    
                                out.println("</div>");
                            }
                        %>     
                    </body>   
              </div>
        </div>      
</div>
</body>
</html>