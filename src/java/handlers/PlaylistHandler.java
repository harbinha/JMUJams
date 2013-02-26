package handlers;

import beans.Playlist;
import beans.SongBean;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Ryan Pitts
 */
public class PlaylistHandler {
    
    private Playlist playlist;
    private ArrayList<SongBean> masterList;
        
    public PlaylistHandler(int playlistId) {
        playlist = new Playlist(playlistId);
        masterList = new ArrayList<SongBean>();
    }
    
    public Playlist getPlaylist() {
        return playlist;
    }
    
    public void addSong(int songId) {
        String add = "INSERT INTO user_content (playlist_id, playlist_name, song_id) VALUES(" +
                Integer.toString(playlist.getPlaylistId()) +
                playlist.getPlaylistName() + Integer.toString(songId);
        updateDb(add);
    }
    
    public void removeSong(int songId) {
        String remove = "DELETE FROM user_content WHERE song_id=" +
                Integer.toString(songId);
        updateDb(remove);        
    }
    
    public void updateDb(String update) {
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
            stmt.executeUpdate(update);
            
            //close resources
            stmt.close();
            conn.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
    
    public ArrayList<SongBean> getMasterList() {
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
        
        String select = "SELECT * FROM master_songlist";
        
        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(select);
            
            SongBean bean;
            String artist;
            String title;
            String album;
            String genre;
            String pathname;
            
            while (result.next()) {
                bean = new SongBean(result.getInt("song_id"));

                artist = result.getString("artist");
                title = result.getString("title");
                album = result.getString("album");
                genre = result.getString("genre");
                pathname = result.getString("pathname");

                //store in bean
                bean.setArtist(artist);
                bean.setTitle(title);
                bean.setAlbum(album);
                bean.setGenre(genre);
                bean.setPath(pathname);
                
                masterList.add(bean);
            }
            //close resources
            result.close();
            stmt.close();
            conn.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        
        return masterList;
    }
}
