/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import Model.Account;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class Check extends HttpServlet {

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
        if (cus == null) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {

//            try {
//                AccountDAO dao = new AccountDAO();
//                Account acc = dao.getAccountById(cus.getId());
//                int isAdmin = 0;
//                if(acc.getIsAdmin()==1){
//                    isAdmin = 1;
//                }
//                request.setAttribute("isAdmin", isAdmin);
//                
//            } catch (SQLException ex) {
//                Logger.getLogger(Check.class.getName()).log(Level.SEVERE, null, ex);
//            } catch (ClassNotFoundException ex) {
//                Logger.getLogger(Check.class.getName()).log(Level.SEVERE, null, ex);
//            }
            RequestDispatcher rd = request.getRequestDispatcher("CheckOut.jsp");
            rd.forward(request, response);
        }
    }
}
