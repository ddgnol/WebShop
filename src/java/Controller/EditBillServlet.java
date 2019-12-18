
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


@WebServlet(name = "EditBillServlet", urlPatterns = {"/EditBill"})
public class EditBillServlet extends HttpServlet {

    
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
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            ProductDAO productDAO = new ProductDAO();
            productDAO.updateBill(id, status);
            request.setAttribute("error", "Cập nhập trạng thái đơn thành công");
            List<Bill> list = productDAO.getAllBill();
            request.setAttribute("listbill", list);
            request.getRequestDispatcher("allBill.jsp").forward(request, response);
            //response.sendRedirect(request.getContextPath() + "/AdminBillServlet");
            //request.getRequestDispatcher("AdminBillServlet").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditBillServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditBillServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
}
