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

@WebServlet(name = "CartServlet", urlPatterns = {"/Cart"})
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idCus = "";
            HttpSession session = request.getSession();
            Customer cus = (Customer) session.getAttribute("cus");
            List<ProCart> listPro = (ArrayList<ProCart>) session.getAttribute("prosInCart");
            ProductDAO proDAO = new ProductDAO();
            if (cus == null) {
//                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//                rd.forward(request, response);
                if (listPro == null || listPro.size() == 0) {
                    System.out.println("empty cart");
                    String mess = "Giỏ hàng trống";
                    request.setAttribute("mess", mess);
                    RequestDispatcher rd = request.getRequestDispatcher("emptyCart.jsp");
                    rd.forward(request, response);
                }

                System.out.println("list size = " + listPro.size());
                request.setAttribute("cartPro", listPro);
                RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
                rd.forward(request, response);
            } else {
                List<ProCart> cusCart = proDAO.getProCartByIdCus(cus.getId());
                //System.out.println(cus.getId());
                if (listPro == null || listPro.size() == 0) {
                    List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
                    if (list.size() == 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("emptyCart.jsp");
                        rd.forward(request, response);
                    }
//                    for (ProCart pro : list) {
//                        
//                        listPro.add(pro);
//                    }
                    session.removeAttribute("prosInCart");
                    session.setAttribute("prosInCart", list);
                    request.setAttribute("cartPro", list);
                    request.setAttribute("idCus", cus.getId());
                    RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
                    rd.forward(request, response);
                } else {
                    System.out.println("list size = " + listPro.size());
                    //Xóa sản phẩm còn trong giỏ khách hàng từ lần trước.
                    proDAO.deleteCusCart(cus.getId());
                    //thêm sản phẩm đang có trong giỏ hàng vào giỏ của khách
                    for (ProCart pro : listPro) {
                        proDAO.addToCart(pro.getId(), cus.getId(), pro.getName(), pro.getPrice(), pro.getStatus());
                    }
                    request.setAttribute("cartPro", listPro);
                    RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
                    rd.forward(request, response);
                }

            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
