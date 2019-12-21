package Controller;

import DAO.ProductDAO;
import Model.Customer;
import Model.ProCart;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
        Customer cus = (Customer) session.getAttribute("cus");
        List<ProCart> listPro = (ArrayList<ProCart>) session.getAttribute("prosInCart");
        try {
            String idPro = request.getParameter("id");
            for (ProCart p : listPro) {
                if (p.getId().equals(idPro)) {
                    listPro.remove(p);
                    break;
                }
            }
            if (cus != null) {
                ProductDAO proDAO = new ProductDAO();
                // System.out.println("idPro="+idPro);
                //  System.out.println("idCus="+cus.getId());
                proDAO.deleteProInCart(cus.getId(), idPro);
                List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
                if (list.size() == 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("emptyCart.jsp");
                    rd.forward(request, response);
                }
            }
            session.removeAttribute("prosInCart");
            session.setAttribute("prosInCart", listPro);
            response.sendRedirect(request.getContextPath() + "/Cart");

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
