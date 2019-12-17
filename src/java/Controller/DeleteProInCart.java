
package Controller;

import DAO.ProductDAO;
import Model.Customer;
import Model.ProCart;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeleteProInCart", urlPatterns = {"/DeleteProInCart"})
public class DeleteProInCart extends HttpServlet {

 

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Customer cus =(Customer) session.getAttribute("cus");
        
        try {
            
            String idPro =  request.getParameter("id");
            ProductDAO proDAO = new ProductDAO();
           // System.out.println("idPro="+idPro);
          //  System.out.println("idCus="+cus.getId());
            proDAO.deleteProInCart(cus.getId(),idPro);
            
            List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
            request.setAttribute("cartPro", list);
            
            RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
            rd.forward(request, response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteProInCart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteProInCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
