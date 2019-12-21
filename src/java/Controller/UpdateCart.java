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
import java.util.ArrayList;
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
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("cus");
        List<ProCart> listPro = (ArrayList<ProCart>) session.getAttribute("prosInCart");
//            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//            rd.forward(request, response);
        System.out.println("Controller.UpdateCart.doPost()");
        String idPro = request.getParameter("id");
        int status = Integer.parseInt(request.getParameter("soLuong"));
        for (ProCart pro : listPro) {
            if (pro.getId().equals(idPro)) {
                System.out.println("tim pro de cap nhat");
                if (status == 0) {
                    boolean isRemoved = listPro.remove(pro);
                    System.out.println("remove pro: " + isRemoved);
                } else {
                    pro.setStatus(status);
                    System.out.println("status: " + pro.getStatus());
                }
                break;
            }
        }
        request.setAttribute("cartPro", listPro);
        if (cus != null) {
            try {
                if (status == 0) {
                    ProductDAO proDAO = new ProductDAO();
                    proDAO.deleteProInCart(cus.getId(), idPro);
                } else {
                    ProductDAO proDAO = new ProductDAO();
                    Product pro = proDAO.getProById(idPro);
                    proDAO.updateCart(idPro, status, cus.getId());
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UpdateCart.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(UpdateCart.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (listPro.size() == 0) {
            request.getRequestDispatcher("emptyCart.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
////        } else {
////            //  System.out.println(cus.getId());
////            try {
////
////                String idPro = request.getParameter("id");
////                int status;//số lượng
////                if (request.getParameter("soLuong").equals("0")) {
////                    ProductDAO proDAO = new ProductDAO();
////                    proDAO.deleteProInCart(cus.getId(), idPro);
////                    List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
////                    request.setAttribute("cartPro", list);
////                    if (list.size() == 0) {
////                        request.getRequestDispatcher("emptyCart.jsp").forward(request, response);
////                    } else {
////                        request.getRequestDispatcher("cart.jsp").forward(request, response);
////                    }
////                } else {
////                    status = Integer.parseInt(request.getParameter("soLuong"));
////                    ProductDAO proDAO = new ProductDAO();
////                    Product pro = proDAO.getProById(idPro);
////                    proDAO.updateCart(idPro, status, cus.getId());
////                    List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
////                    request.setAttribute("cartPro", list);
////                    request.getRequestDispatcher("cart.jsp").forward(request, response);
////                }
////            } catch (ClassNotFoundException ex) {
////                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
////            } catch (SQLException ex) {
////                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
////            }
//
//        }
    }

}
