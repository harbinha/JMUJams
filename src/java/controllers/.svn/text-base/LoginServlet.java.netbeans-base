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
 * Handles the Login request.
 * 
 * @author Ryan Pitts
 */
public class LoginServlet extends HttpServlet {
    
    /**
     * Respond to a POST request by checking the database.
     * 
     * @param request The servlet request we are processing
     * @param response The servlet response we are producing
     * 
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        PrintWriter out = response.getWriter();
        
        //Load Driver
        String driverClassName = "com.mysql.jdbc.Driver";
        try {
            Class.forName(driverClassName);
        } catch(ClassNotFoundException cnfe) {
            out.print(cnfe);
        }
        
        //Open Connection
        String url = "jdbc:mysql://cs347.cs.jmu.edu/team05_db";
        String user = "team05";
        String pass = "fox7trot";
        String selectId = "SELECT user_id FROM user WHERE username = '" +
                username + "'";
        int userid;
                
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(selectId);
            
            if(result.next()) {
                userid = result.getInt(1);
                String pword = "SELECT password FROM user WHERE user_id = " + Integer.toString(userid);
                result = stmt.executeQuery(pword);
                result.first();
                
                //if password is correct then forward to nowplaying page
                if(result.getString(1).equals(password)) {
                    HttpSession session = request.getSession(true);
                    closeResources(result, stmt, conn);
                    session.setAttribute("userid", userid);
                    response.sendRedirect("nowplaying.jsp");
                } else {
                    closeResources(result, stmt, conn);
                    request.setAttribute("error", "Incorrect Password, please try again");
                    response.sendRedirect("invalidlogin.jsp");
                }        
            } else {
                closeResources(result, stmt, conn);
                request.setAttribute("error", "Unknown user, please try again");
                response.sendRedirect("invalidlogin.jsp");
            }

        } catch (SQLException sqle) {
            out.print(sqle);
        } 
    }
    
    private void closeResources(ResultSet result, Statement stmt, Connection conn) {
        try {
            //close resources
            result.close();
            stmt.close();
            conn.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
