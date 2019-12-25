
package Controller;

import DAO.ProductDAO;
import Model.Bill;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AdminBillCus", urlPatterns = {"/AdminBillCus"})
public class AdminBillCus extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
            String id_cus = request.getParameter("id");
            String name_cus = request.getParameter("name");
            ProductDAO productDAO = new ProductDAO();
            List<Bill> listbill = productDAO.getHistoryCusBill(id_cus);
            request.setAttribute("name_cus", name_cus);
            request.setAttribute("listBill", listbill);
            
            request.getRequestDispatcher("historyBillAdmin.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminBillCus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminBillCus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
}
