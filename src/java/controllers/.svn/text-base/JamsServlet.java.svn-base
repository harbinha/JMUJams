/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.sql.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Handles the information from myjams.jsp, and checks/inserts to db
 * 
 * @author Michael Saintcross
 */
public class JamsServlet extends HttpServlet
{
        HttpSession session;
        HttpServletResponse globalres;
   
        public void addPlaylist(String ar, String ti, String al, String pName) throws IOException
        {
          
           PrintWriter out1 = globalres.getWriter();
           String add = "INSERT INTO user_content (playlist_id, playlist_name, song_id) VALUES(" + getPlaylistID() +
                        ", '" + pName + "', (SELECT song_id from master_songlist WHERE artist='" + ar + "' AND title='" + ti +"' AND album='" + al + "'))";
           updateDb(add);
           out1.print("<script type='text/javascript'>alert('Playlist added.')</script>");
        }
        public void deletePlaylist() throws IOException
        {
           PrintWriter out12 = globalres.getWriter();
           String del = "DELETE FROM user_content WHERE playlist_id=" + getPlaylistID();   
           updateDb(del);
           out12.println("<script type='text/javascript'>alert('Playlist deleted.')</script>");
        }
        public final void checkExisting(String ar, String ti, String al, String pName, String typeAD) throws IOException
        {
           String check = null;
           int chkName = 0;
           
           check = "SELECT COUNT(*) FROM user_content WHERE playlist_id='" + getPlaylistID() + "'";
           chkName = checkDb(check,1);
           
           if (typeAD.equals("add"))
           {
                if (chkName != 0)
                {
                    if(chkName >= 5)
                    {
                        PrintWriter out3 = globalres.getWriter();
                        out3.print("<script type='text/javascript'>alert('Maximum of 1 playlist already exists.\nDelete to add another.')</script>");
                    }
                    else
                        addPlaylist(ar, ti, al, pName);
                }
                else
                {
                    addPlaylist(ar, ti, al, pName);
                }
           } 
           if (typeAD.equals("delete"))
           {                        
                if (chkName != 0)
                {
                    if(chkName >= 5)
                    {
                       deletePlaylist();
                    }
                    else
                    {
                        PrintWriter out4 = globalres.getWriter();
                        out4.print("<script type='text/javascript'>alert('No playlist to delete. It is safe to add one.')</script>");
                    }
                }
                else
                {
                    PrintWriter out4 = globalres.getWriter();
                    out4.print("<script type='text/javascript'>alert('No playlist to delete. It is safe to add one.')</script>");
                }
           }
           
        }
        
        public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
        {
                
                PrintWriter out1 = res.getWriter();
                String[] artists = req.getParameterValues("artist");
                String[] titles = req.getParameterValues("title");
                String[] albums = req.getParameterValues("album");
                String[] genres = req.getParameterValues("genre");
                String[] pNames = req.getParameterValues("pName");
                String   typeAD = req.getParameter("typeAD");
                
                setSession(req.getSession(), res);
                
                for(int i = 0; i < 5; i++)
                {
                    checkExisting(artists[i].trim(), titles[i].trim(), albums[i].trim(), pNames[i].trim(), typeAD);
                }
                doGet(req, res);
        }
        public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException 
        {
                res.sendRedirect("myjams.jsp");
        } 
        public int getPlaylistID() throws IOException
        {
          
            int retID = 0;
            
            String getPlay = "SELECT playlist_id FROM user WHERE user_id ="+ (Integer)session.getAttribute("userid") + "";
            
            retID = checkDb(getPlay,0);
            
            return retID;
        }
        public void setSession(HttpSession sesh, HttpServletResponse res)
        {
              session = sesh;
              globalres = res;
        }
        public void updateDb(String update) 
        {
        
            //Load Driver
            
            String driverClassName = "com.mysql.jdbc.Driver";
        
            try {
                
                    Class.forName(driverClassName);
                
                } catch(ClassNotFoundException cnfe) 
                {
                    cnfe.printStackTrace();
                }
            
            //Open Connection
            String url = "jdbc:mysql://cs347.cs.jmu.edu/team05_db";
            String user = "team05";
            String pass = "fox7trot";
        
            try {
                    Connection conn = DriverManager.getConnection(url, user, pass);
                    Statement stmt = conn.createStatement();
                    stmt.executeUpdate(update);

                    //close resources
                    stmt.close();
                    conn.close();
                } catch (SQLException sqle) 
                {
                    sqle.printStackTrace();
                }
        }
        
        public int checkDb(String check, int type) throws IOException
        {
                    //Load Driver
            
            String driverClassName = "com.mysql.jdbc.Driver";
            int reT = 0;
            
            try {
                
                Class.forName(driverClassName);
                
                } catch(ClassNotFoundException cnfe) 
                {
                    cnfe.printStackTrace();
                }
            
            //Open Connection
            String url = "jdbc:mysql://cs347.cs.jmu.edu/team05_db";
            String user = "team05";
            String pass = "fox7trot";
        
            try {
                    Connection conn = DriverManager.getConnection(url, user, pass); 
                    Statement stmt = conn.createStatement();
                    ResultSet result = stmt.executeQuery(check);
                    result.next();
                    
                    if(type == 1)
                    {
                        reT = result.getInt(1);
                    }
                    if(type == 0)
                    {
                        reT = result.getInt("playlist_id");
                    }
                    
                    //close resources
                    stmt.close();
                    conn.close();
                } catch (SQLException sqle) 
                {
                    sqle.printStackTrace();
                }
            
             return reT;
        }
    
}
