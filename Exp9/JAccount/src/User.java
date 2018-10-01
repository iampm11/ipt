public class User {
    String username;
    String password;

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    User() {}
    
    User(String u, String p) {
        this.username = u;
        this.paswword = p;
    }
}
