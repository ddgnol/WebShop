
package DAO;

import DBConnection.DBConnection;
import Model.Account;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class AccountDAO {
    Connection conn ;
    Statement sm ;
    ResultSet rs;
    
    public List<Account> getAllAccount() throws ClassNotFoundException, SQLException{
        
        String query="Select * from account"; //where username='"+user+"' and password='"+pass+"'";
        List<Account> list = new ArrayList<Account>();
        
        conn= DBConnection.getConnection();
        sm=conn.createStatement();
        rs=sm.executeQuery(query);
       // System.out.println(query);
       // System.out.println("okkkkkkkkkkkk");
        while(rs.next()){
            Account acc = new Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4));
            list.add(acc);
        }
        return list;
        
    }
    
    public Account getAccount(String user, String pass) throws ClassNotFoundException, SQLException{
        
        List<Account> list = this.getAllAccount();
        Account acc= new Account("","","",0);
        
        for(int i=0; i<list.size();i++)
            if(list.get(i).getUsername().equals(user)&&list.get(i).getPassword().equals(pass)){
                acc.setId(list.get(i).getId());
                acc.setUsername(list.get(i).getUsername());
                acc.setPassword(list.get(i).getPassword());
                acc.setIsAdmin(list.get(i).getIsAdmin());
            }
        
        return acc;
    }
    
    public void addAcc(Account acc) throws ClassNotFoundException, SQLException{
        
        String query = "insert into account values ('"+acc.getId()+"','"+acc.getUsername()+"','"+acc.getPassword()+"',"+acc.getIsAdmin()+")";
        System.out.println(query);
        conn= DBConnection.getConnection();
        sm=conn.createStatement();
        sm.executeUpdate(query);
    }
    
//    public boolean checkAccount(String user, String pass) throws ClassNotFoundException, SQLException{
//        
//        List<Account> list = this.getAllAccount();
//        for(int i=0; i<list.size();i++)
//            if(list.get(i).getUsername().equals(user)&&list.get(i).getPassword().equals(pass))
//                return true;
//        return false;
//    }
}
