package beans;

/**
 *
 * @author Ryan Pitts
 */
public class UserBean {
    
    boolean shuffle;
    int userId;
    int playlistId;
    String username;
    String password;
    String email;
    String prefName;
    String prefGenre;
        
    public UserBean(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPlaylistId() {
        return playlistId;
    }

    public void setPlaylistId(int playlistId) {
        this.playlistId = playlistId;
    }

    public String getPrefGenre() {
        return prefGenre;
    }

    public void setPrefGenre(String prefGenre) {
        this.prefGenre = prefGenre;
    }

    public String getPrefName() {
        return prefName;
    }

    public void setPrefName(String prefName) {
        this.prefName = prefName;
    }

    public boolean isShuffle() {
        return shuffle;
    }

    public void setShuffle(boolean shuffle) {
        this.shuffle = shuffle;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUserId() {
        return userId;
    }
    
    public String getChecked() {
        if(isShuffle())
            return "checked='checked'";
        else
            return "";
    }
    
    public String getSelected(String genre) {
        String selected = "";
        if(prefGenre.equals(genre))
            selected = "selected='selected'";
                
        return selected;
    }
    
}
