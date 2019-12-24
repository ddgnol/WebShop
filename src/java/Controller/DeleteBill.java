
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteBill", urlPatterns = {"/DeleteBill"})
public class DeleteBill extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String id = request.getQueryString();
            System.out.println(id);
            ProductDAO productDAO =  new ProductDAO();
            productDAO.deleteBillDetail(id);
            productDAO.deleteBill(id);
            RequestDispatcher rd =request.getRequestDispatcher("CustomerCart");
            rd.forward(request, response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteBill.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteBill.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
