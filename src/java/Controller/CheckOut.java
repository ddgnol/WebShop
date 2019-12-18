/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import Model.Bill;
import Model.BillDetail;
import Model.Customer;
import Model.ProCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL LATITUDE
 */
public class CheckOut extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("cus");

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String payment = request.getParameter("payment");
        String status = "dang cho";
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("cus");
        Bill bill = new Bill();
        try {
            ProductDAO proDAO = new ProductDAO();
            List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
            int price= 0;
            for(ProCart pro: list){
                price+=pro.getPrice()*pro.getStatus();
            }
            bill.setPrice(price);
            bill.setId_cus(cus.getId());
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setPhone(phone);
            bill.setStatus(status);
            proDAO.insertBill(bill);
            Bill b = proDAO.getLastestBill();
            for(ProCart pro: list){
                BillDetail billDetail = new BillDetail();
                billDetail.setId(b.getId());
                billDetail.setId_pro(pro.getId());
                billDetail.setNumber(pro.getStatus());
                proDAO.insertDetailBill(billDetail);
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckOut.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CheckOut.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
