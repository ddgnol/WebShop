
package Controller;

import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DeleteProduct", urlPatterns = {"/DeleteProduct"})
public class DeleteProduct extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String id = request.getParameter("id");
        try {
            
            ProductDAO proDAO = new ProductDAO();
            proDAO.deleteProduct(id);
            
            RequestDispatcher rd =request.getRequestDispatcher("AdminView");
            rd.forward(request, response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }



}
