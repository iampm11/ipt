public class User {
    private String username;
    private String password;

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
    
    public User() {}
    
    public User(String u, String p) {
        this.username = u;
        this.password = p;
    }
    
    public void print() {
        System.out.println("User Loged In..");
        System.out.println("Username = " + username);
        System.out.println("Password = " + password);
    }
    
}
