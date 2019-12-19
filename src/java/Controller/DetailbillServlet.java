package Controller;

import DAO.ProductDAO;
import Model.BillDetail;
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

@WebServlet(name = "DetailbillServlet", urlPatterns = {"/DetailbillServlet"})
public class DetailbillServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String id = request.getParameter("id");
            ProductDAO productDAO = new ProductDAO();
            List<BillDetail> list = productDAO.getCusBillDetail(Integer.parseInt(id));
            request.setAttribute("id", id);
            request.setAttribute("list", list);
            request.getRequestDispatcher("adminBillDetail.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DetailbillServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DetailbillServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String id = request.getParameter("id");
            ProductDAO productDAO = new ProductDAO();
            List<BillDetail> list = productDAO.getCusBillDetail(Integer.parseInt(id));
            request.setAttribute("id", id);
            request.setAttribute("list", list);
            request.getRequestDispatcher("billDetail.jsp").forward(request, response);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DetailbillServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DetailbillServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
