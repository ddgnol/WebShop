package Controller;

import DAO.ProductDAO;
import Model.*;
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

@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    public static List<ProCart> list = new ArrayList<ProCart>();

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
            try {
                //            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//            rd.forward(request, response);
                String idPro = request.getParameter("id");
                int status;//số lượng
                if (request.getParameter("soLuong").equals("")) {
                    status = 1;
                } else {
                    status = Integer.parseInt(request.getParameter("soLuong"));
                }
                ProductDAO proDAO = new ProductDAO();
                Product pro = proDAO.getProById(idPro);
                ProCart pc = new ProCart();
                pc.setId(idPro);
                pc.setName(pro.getName());
                pc.setStatus(status);
                pc.setPrice(pro.getPrice());
                pc.setImg(pro.getImg());
                pc.setCategory(pro.getCategory());
                list.add(pc);
                session.setAttribute("prosInCart", list);
                request.setAttribute("pro", pro);
                request.setAttribute("error", "Thành công . Sản phẩm đã được thêm vào giỏ hàng");
                request.getRequestDispatcher("detailPro.jsp").forward(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //  System.out.println(cus.getId());
            try {

                String idPro = request.getParameter("id");
                int status;//số lượng
                if (request.getParameter("soLuong").equals("")) {
                    status = 1;
                } else {
                    status = Integer.parseInt(request.getParameter("soLuong"));
                }
                ProductDAO proDAO = new ProductDAO();
                Product pro = proDAO.getProById(idPro);
                proDAO.addToCart(idPro, cus.getId(), pro.getName(), pro.getPrice(), status);
                ProCart pc = new ProCart();
                pc.setId(idPro);
                pc.setName(pro.getName());
                pc.setStatus(status);
                pc.setPrice(pro.getPrice());
                pc.setImg(pro.getImg());
                pc.setCategory(pro.getCategory());
                list.add(pc);
                session.setAttribute("prosInCart", list);
                request.setAttribute("pro", pro);
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
