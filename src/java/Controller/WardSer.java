/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AddressDAO;
import Model.district;
import Model.ward;
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
@WebServlet(name = "WardSer", urlPatterns = {"/WardSer"})
public class WardSer extends HttpServlet {

    
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
            String disname = request.getParameter("disname");
            
            AddressDAO addressDAO = new AddressDAO();
            List<ward> list = addressDAO.getAllWard(disname);
            System.out.println(disname);
            Map<Integer, String> listWar = new HashMap<Integer, String>();
            int i=1;
            for (ward war : list) {
                listWar.put(i, war.getName());
                i++;
            }
            // listDis.put(1, "Huyen Hoang Sa");
            
            
            String json = null;
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            json = new Gson().toJson(listWar);
            
            response.getWriter().write(json);
            System.out.println("Controller.WardSer.doGet()");
            System.out.println(json);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DistrictSer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DistrictSer.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        
    }

