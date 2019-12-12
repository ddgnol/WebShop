
package Model;


public class Account {
    String id;
    String username;
    String password;
    int isAdmin;
    
    public Account(){
        
    }
    public Account(String id, String username, String password, int role){
        this.id=id;
        this.username=username;
        this.password=password;
        this.isAdmin=role;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int role) {
        this.isAdmin = role;
    }
    
}
