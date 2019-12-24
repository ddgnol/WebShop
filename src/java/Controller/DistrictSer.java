/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AddressDAO;
import Model.district;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DistrictSer", urlPatterns = {"/DistrictSer"})
public class DistrictSer extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            /* response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            ObjectMapper mapper = new ObjectMapper();
            
            response.setContentType("application/json");
            AddressDAO addressDAO = new AddressDAO();
            district dis = new district();
            //  mapper.writeValue(response.getOutputStream(), dis);*/
            
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String proname = request.getParameter("proname");
            
            AddressDAO addressDAO = new AddressDAO();
            String id = addressDAO.getProvince_id(proname);
            List<district> list = addressDAO.getAllDistrict(id);
            System.out.println(proname);
            Map<Integer,String> listDis = new HashMap<Integer, String>();
            int i=1;
            for (district dis : list) {
                listDis.put(i, dis.getName());
                i++;
            }
            // listDis.put(1, "Huyen Hoang Sa");
            
            
            String json = null;
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            json = new Gson().toJson(listDis);
            
            response.getWriter().write(json);
            System.out.println("Controller.DistrictSer.doGet()");
            System.out.println(json);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DistrictSer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DistrictSer.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        
    }

