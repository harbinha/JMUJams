package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Handles Account Creation
 * 
 * @author Hunter Harbin
 */
public class CreateAccountServlet extends HttpServlet {
    //counter is User ID
    /**
     * Respond to a POST request by checking the database.
     * 
     * @param request The servlet request we are processing
     * @param response The servlet response we are producing
     * 
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        
        String prefname = request.getParameter("prefName");
        String username = request.getParameter("userName");
        String password = request.getParameter("pass1");
        String email    = request.getParameter("email");
        String genre    = request.getParameter("genre");
        boolean s  = request.getParameter("shuffle") != null;
        
        String shuffle = "on";
        if(s == false){
            shuffle = "off";
        }
        else    shuffle = "on";
        
        PrintWriter out = response.getWriter();
        out.print(shuffle);
        
        
        
        String addAccount = "INSERT INTO user "
                + "VALUES ((SELECT counter FROM counter),'" + username + "','" + password + "','"
                + email + "','" + prefname + "','" + genre + "', (SELECT counter FROM counter), '" + shuffle + "')";
        String id = "SELECT user_id FROM user WHERE username='" + username + "'";
        
        //Load Driver
        String driverClassName = "com.mysql.jdbc.Driver";
        try {
            Class.forName(driverClassName);
        } catch(ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
        //Open Connection
        String url = "jdbc:mysql://cs347.cs.jmu.edu/team05_db";
        String user = "team05";
        String pass = "fox7trot";
        out.print(addAccount);
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(addAccount);
            stmt.executeUpdate("UPDATE counter SET counter = counter+1");
            ResultSet result = stmt.executeQuery(id);
            result.next();
            int userid = result.getInt(1);
            
            
            HttpSession session = request.getSession(true);
            session.setAttribute("userid", userid);
            
            //close resources
            stmt.close();
            conn.close();
            response.sendRedirect("nowplaying.jsp");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } 
    }
}
