/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "viewPhone", urlPatterns = {"/viewPhone"})
public class viewPhone extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                try {
            
           
            
         
            
            ProductDAO proDAO = new ProductDAO();
            List<Product> list = proDAO.getPhone();
            
           
            
            request.setAttribute("listPro", list);
         
            
         //   System.out.println("asdfasd"+list.get(0).getImg());
            request.setAttribute("noOfPages", 5);
            RequestDispatcher view = request.getRequestDispatcher("AllProducts.jsp");
            view.forward(request, response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductsServ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductsServ.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  


}
