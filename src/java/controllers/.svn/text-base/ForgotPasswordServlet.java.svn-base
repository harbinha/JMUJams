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
 * Handles the Forgot Password request.
 * 
 * @author Ryan Pitts, Hunter Harbin
 */
public class ForgotPasswordServlet extends HttpServlet {
    
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
        String username = request.getParameter("userName");
        String email = request.getParameter("email");
        
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
        String select = "SELECT user_id, password FROM user WHERE username = '" +
                username + "' AND email_ad = '" + email + "'";
        int userid;
        String password;
                
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(select);
            
            if(result.next()) {
               result.first();
               
               userid = result.getInt(1);
               password = result.getString("password");
               
               HttpSession session = request.getSession(true);
               session.setAttribute("userid", userid);
               closeResources(result, stmt, conn);
               response.sendRedirect("validpasswordrecover.jsp");
            } else {
                closeResources(result, stmt, conn);
                response.sendRedirect("invalidpasswordrecover.html");
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
