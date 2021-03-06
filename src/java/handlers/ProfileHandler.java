package handlers;

import beans.UserBean;
import java.sql.*;

/**
 * Does the query and updates for the user profile page.
 * @author Hunter Harbin, Ryan Pitts
 */
public class ProfileHandler {
    
    private UserBean bean;
    
    public ProfileHandler(int userId) {
        bean = new UserBean(userId);
        queryBean();
    }
    
    public UserBean getUser() {
        return bean;
    }
    
    /**
     * Used to make queries to the database.
     */
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
        
        String username;
        String password;
        String email;
        String prefName;
        String genre;
        String shuffle;
                
        String select = "SELECT * FROM user WHERE user_id = '"
                + Integer.toString(bean.getUserId()) + "'";
        
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(select);
            
            result.next();
            username = result.getString("username");
            password = result.getString("password");
            email = result.getString("email_ad");
            prefName = result.getString("pref_name");
            genre = result.getString("pref_genre");
            shuffle = result.getString("shuffle");
      
            //store in bean
            bean.setUsername(username);
            bean.setPassword(password);
            bean.setEmail(email);
            bean.setPrefName(prefName);
            bean.setPrefGenre(genre);
            if(shuffle.equals("on"))
                bean.setShuffle(true);
            else
                bean.setShuffle(false);
            
            //close resources
            result.close();
            stmt.close();
            conn.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        
    }
    
    /**
     * Take the updated username and store it in the database.
     */
    public void updateUsername(String username) {
        updateDB("username='" + username + "'");
    }
    
    /**
     * Take the updated password and store it in the database.
     */
    public void updatePassword(String password) {
        updateDB("password='" + password + "'");
    }
    
    /**
     * Take the updated email and store it in the database.
     */
    public void updateEmail(String email) {
        updateDB("email_ad='" + email + "'");
    }
    
    /**
     * Take the updated preferred name and store it in the database.
     */
    public void updatePrefName(String prefName) {
        updateDB("pref_name='" + prefName + "'");
    }
    
    /**
     * Take the updated preferred genre and store it in the database.
     */
    public void updatePrefGenre(String genre) {
        updateDB("pref_genre='" + genre + "'");
    }
    
    /**
     * Take the updated shuffle and store it in the database.
     */
    public void updateShuffle(String shuffle) {
        updateDB("shuffle='" + shuffle + "'");
    }
    
    /**
     * Open one connection and update the database.
     * @param update 
     */
    private void updateDB(String update) {
        
        String command = "UPDATE user SET " + update + " WHERE user_id='" +
                Integer.toString(bean.getUserId()) + "'";
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
        
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(command);
            
            //close resources
            stmt.close();
            conn.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
