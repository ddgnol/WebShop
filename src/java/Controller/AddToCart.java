package Controller;

import DAO.ProductDAO;
import Model.Customer;
import Model.Product;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("cus");

        if (cus == null) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {
            //  System.out.println(cus.getId());
            try {

                String idPro = request.getParameter("id");               
                int status ;//số lượng
                if(request.getParameter("soLuong").equals(""))
                    status=1;
                else
                    status = Integer.parseInt(request.getParameter("soLuong"));
                ProductDAO proDAO = new ProductDAO();
                Product pro = proDAO.getProById(idPro);
                proDAO.addToCart(idPro, cus.getId(), pro.getName(), pro.getPrice(),status);
               request.setAttribute("pro",pro);
                 request.setAttribute("error", "Thành công . Sản phẩm đã được thêm vào giỏ hàng");
               request.getRequestDispatcher("detailPro.jsp").forward(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
