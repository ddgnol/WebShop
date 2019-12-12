
package DAO;

import Model.Customer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class CustomerDAO {
    
    Connection conn ;
    Statement sm ;
    ResultSet rs;
    
    public Customer getCustomerById(String id) throws ClassNotFoundException, SQLException{
                    
        String query="select * from customer where id='"+id+"'";
        
        conn= DBConnection.DBConnection.getConnection();
        sm=conn.createStatement();
        rs=sm.executeQuery(query);
        
        Customer cus = null ;
        while(rs.next()){
             cus = new Customer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
            
        }
        
        return cus;
    }
    
    public boolean hasIdCus(String id) throws ClassNotFoundException, SQLException{
        String query="select count(*) from customer where id='"+id+"'";
        
     //   System.out.println(query);
        conn= DBConnection.DBConnection.getConnection();
        sm=conn.createStatement();
        rs=sm.executeQuery(query);
        while(rs.next()){
        
        if(rs.getInt(1) == 0) return false;
    }
        return true;
    }

    public void addCus(Customer cus) throws SQLException, ClassNotFoundException {
       String query="Insert into  customer values('"+cus.getId()+"',N'"+cus.getName()+"','"+cus.getPhoneNum()+"','"+cus.getEmail()+"','"+cus.getDateOfBirth()+"','"+cus.getAddress()+"')";
        System.out.println(query);
        conn= DBConnection.DBConnection.getConnection();
        sm=conn.createStatement();

        sm.executeUpdate(query); 
    }

    
}
