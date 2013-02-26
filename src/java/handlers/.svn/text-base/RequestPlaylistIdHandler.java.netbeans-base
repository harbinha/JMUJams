package handlers;

import java.sql.*;

/**
 * This requests the playlist_id for the dropdown on submitplaylist.jsp
 * 
 * @author Ryan Carlson
 */
public class RequestPlaylistIdHandler {
    
    int user_id;
    
    String playlist_name;
    
    public RequestPlaylistIdHandler(int user_id) {
        
        this.user_id = user_id;
        queryBean();
    }
     
    private void queryBean() {
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
        
        String select = "SELECT playlist_name FROM user_content JOIN user "
                + "on user_content.playlist_id = user.playlist_id "
                + "WHERE user_id = " + Integer.toString(user_id);
              
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(select);
            
            result.next();
            playlist_name = result.getString("playlist_name");
                       
            //close resources
            result.close();
            stmt.close();
            conn.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        
    }
    
    public String getPlaylistName() {
        
        return playlist_name;
    }
    
}

