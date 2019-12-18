/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL LATITUDE
 */
public class UpdateCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
                int status;//số lượng
                if (request.getParameter("soLuong").equals("0")) {
                    ProductDAO proDAO = new ProductDAO();
                    proDAO.deleteProInCart(cus.getId(), idPro);
                    List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
                    request.setAttribute("cartPro", list);
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                } else {
                    status = Integer.parseInt(request.getParameter("soLuong"));
                    ProductDAO proDAO = new ProductDAO();
                    Product pro = proDAO.getProById(idPro);
                    proDAO.updateCart(idPro, status, cus.getId());
                    List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
                    request.setAttribute("cartPro", list);
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
