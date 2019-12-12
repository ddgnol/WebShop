
package Controller;

import DAO.ProductDAO;
import Model.Product;
import Model.orderCart;
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


@WebServlet(name = "AdminView", urlPatterns = {"/AdminView"})
public class AdminView extends HttpServlet {



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
            List<Product> list = proDAO.getAllProduct();
            request.setAttribute("listPro", list);
            
            List<orderCart> listOrder = proDAO.getAllOrder();
            request.setAttribute("listOrder", listOrder);

            
            RequestDispatcher rd =request.getRequestDispatcher("admin.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminView.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminView.class.getName()).log(Level.SEVERE, null, ex);
        }
    }



}
