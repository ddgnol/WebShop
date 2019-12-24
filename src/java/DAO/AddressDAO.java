/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBConnection.DBConnection;
import Model.district;
import Model.province;
import Model.ward;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class AddressDAO {
    
    //lấy tên thành phố/tỉnh
    public List<province> getAllProvince() throws ClassNotFoundException, SQLException{
        
            List<province> listP = new ArrayList<province>();
            String sql = "select * from province order by name" ;
            Connection conn = DBConnection.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                province pro = new province();
                pro.setId(rs.getString(1));
                pro.setName(rs.getString(2));
                pro.setType(rs.getString(3));
                listP.add(pro);
            }
            return listP;
        
    }
    
    //lấy quận/huyện theo mã tỉnh
    public List<district> getAllDistrict(String province_id) throws ClassNotFoundException, SQLException{
        
            List<district> listD = new ArrayList<district>();
            String sql = "select * from district where province_id='"+province_id+"' order by name;" ;
            Connection conn = DBConnection.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                district dis = new district();
                dis.setId(rs.getString(1));
                dis.setName(rs.getString(2));
                dis.setType(rs.getString(3));
                dis.setProvince_id(rs.getString(4));
                listD.add(dis);
            }
            return listD;
        
    }
        
    //lấy xã/quận theo mã huyện
    public List<ward> getAllWard(String district_name) throws ClassNotFoundException, SQLException{
        
            List<ward> listW = new ArrayList<ward>();
    String sql = "select ward.* from ward , province, district where ward.district_id = district.id and district.province_id = province.id and district.name like N'"+district_name+"' ;" ;
            Connection conn = DBConnection.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                ward w = new ward();
                w.setId(rs.getString(1));
                w.setName(rs.getString(2));
                w.setType(rs.getString(3));
                w.setDistrict_id(rs.getString(4));
                listW.add(w);
            }
            return listW;
    }
    
    public String getProvince_id(String province_name) throws ClassNotFoundException, SQLException {
        String sql = "select id from province where name=N'" + province_name + "' ;";
        Connection conn = DBConnection.getConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        String id = null;
        while (rs.next()) {            
            id = rs.getString(1);
            
        }
        return id;
        
    }
    
}
