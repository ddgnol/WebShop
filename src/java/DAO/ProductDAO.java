/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBConnection.DBConnection;
import Model.Product;
import Model.orderCart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {


    private Statement sm;
    private ResultSet rs;
    private int numberOfPro;

    public int getNumberOfPro() {
        return numberOfPro;
    }

    public ProductDAO() throws ClassNotFoundException, SQLException {
        // System.out.println(this.getAllProduct().size());
    }

    public List<Product> getAllProduct() throws ClassNotFoundException, SQLException {
        List<Product> list = new ArrayList<Product>();
        String query = "Select * from product";
        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);
        System.out.println("DAO.ProductDAO.getAllProduct()");
        while (rs.next()) {
            Product pro = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            list.add(pro);
        }

        return list;

    }

    public List<Product> getListPagePro(int offset, int recordsOfPage) throws ClassNotFoundException, SQLException {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from Product order by id offset " + offset + "  rows fetch next " + recordsOfPage + " rows only;";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);

        while (rs.next()) {
            Product pro = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            list.add(pro);
        }
        rs.close();
        rs = sm.executeQuery("SELECT count(*) from product");
        if (rs.next()) {
            this.numberOfPro = rs.getInt(1);
        }
        return list;
    }

    public List<Product> getListProductById(String id) throws ClassNotFoundException, SQLException {

        List<Product> list = new ArrayList<Product>();
        String query = "Select * from product where id='" + id + "'";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        sm.executeQuery(query);

        while (rs.next()) {
            Product pro = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            list.add(pro);
        }

        return list;
    }

    public List<Product> getCartByIdCus(String id) throws ClassNotFoundException, SQLException {

        List<Product> list = new ArrayList<Product>();
        String query = "Select id, name,category,product.price,describe,img From  product,orderCart where id=idPro and idCustomer='" + id + "'";
        //   System.out.println(query);
        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);
        //   System.out.println(query);
        while (rs.next()) {
            Product pro = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            list.add(pro);
        }
        //  System.out.println(list.size());
        //  System.out.println("okkkkk");
        return list;
    }

    public Product getProById(String id) throws ClassNotFoundException, SQLException {

        Product pro = new Product();
        String query = "select * from product where id='" + id + "'";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);

        while (rs.next()) {
            pro.setId(rs.getString(1));
            pro.setName(rs.getString(2));
            pro.setCategory(rs.getString(3));
            pro.setPrice(rs.getInt(4));
            pro.setDescribe(rs.getString(5));
            pro.setImg(rs.getString(6));
        }
        return pro;
    }

    public void addToCart(String idPro, String idCus, String name, int price) throws ClassNotFoundException, SQLException {

        String query = "INSERT INTO orderCart VALUES ('" + idCus + "','" + idPro + "',N'" + name + "'," + price + ",1)";

        //   System.out.println(query);
        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        sm.executeUpdate(query);
    }

    public void deleteProInCart(String idCus, String idPro) throws ClassNotFoundException, SQLException {
        String query = "DELETE FROM orderCart Where idCustomer='" + idCus + "' and idPro='" + idPro + "'";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        //  System.out.println(query);
        sm.executeUpdate(query);
    }

    public List<orderCart> getAllOrder() throws ClassNotFoundException, SQLException {
        List<orderCart> list = new ArrayList<orderCart>();
        String query = "Select * from orderCart order by idCustomer ASC";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);

        while (rs.next()) {
            orderCart pro = new orderCart();
            pro.setIdCustomer(rs.getString(1));
            pro.setIdPro(rs.getString(2));
            pro.setNamePro(rs.getString(3));
            pro.setPrice(rs.getInt(4));
            pro.setStatus(rs.getInt(5));
            list.add(pro);
        }

        return list;
    }

    public List<Product> getCamera() throws SQLException, ClassNotFoundException {

        List<Product> list = new ArrayList<>();
        String query = "Select * from  product where category=N'MÁY ẢNH'";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);

        while (rs.next()) {
            Product pro = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            list.add(pro);
        }

        return list;
    }

    public List<Product> getPhone() throws SQLException, ClassNotFoundException {

        List<Product> list = new ArrayList<>();
        String query = "Select * from  product where category=N'ĐIỆN THOẠI'";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);

        while (rs.next()) {
            Product pro = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            list.add(pro);
        }

        return list;
    }

    public List<Product> getLaptop() throws SQLException, ClassNotFoundException {

        List<Product> list = new ArrayList<>();
        String query = "Select * from  product where category=N'LAPTOP'";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);

        while (rs.next()) {
            Product pro = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            list.add(pro);
        }

        return list;
    }

    public void deleteProduct(String id) throws ClassNotFoundException, SQLException {

        String query = "delete from product where id='" + id + "'";

        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        sm.executeUpdate(query);

    }

    public void addProduct(Product product){
        try {
            String sql = "INSERT INTO product(id, name, category, price, describe, img) VALUES (?,?,?,?,?,?);";
            
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, product.getId());
            ps.setString(2, product.getName());
            ps.setString(3, product.getCategory());
            ps.setInt(4, product.getPrice());
            ps.setString(5, product.getDescribe());
            ps.setString(6, product.getImg());
            ps.executeUpdate();
            ps.close();
            System.out.println("DAO.ProductDAO.addProduct()");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       
    }
    
    public void editProduct(Product product){
        try {
            String sql = " update product set name= ?,category= ?,price=?,describe=?,img=? where id=? ; ";
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getCategory());
            ps.setInt(3, product.getPrice());
            ps.setString(4, product.getDescribe());
            ps.setString(5, product.getImg());
            ps.setString(6, product.getId());
            ps.executeUpdate();
            System.out.println("DAO.ProductDAO.editProduct()");
            ps.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Product> searchPro(int offset, int recordsOfPage, String name) throws ClassNotFoundException, SQLException {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from Product where name LIKE '%"+name+"%' order by id offset " + offset + "  rows fetch next " + recordsOfPage + " rows only;";
        Connection conn = DBConnection.getConnection();
        sm = conn.createStatement();
        rs = sm.executeQuery(query);

        while (rs.next()) {
            Product pro = new Product(rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6)
            );
            list.add(pro);
        }
        rs.close();
        rs = sm.executeQuery("SELECT count(*) from product where name ='%"+name+"'");
        if (rs.next()) {
            this.numberOfPro = rs.getInt(1);
        }
        return list;
    }


}
