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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            HttpSession session = request.getSession(false);
            Customer customer = (Customer) session.getAttribute("cus");
            if (customer == null) {
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById(customer.getId());
                request.setAttribute("account", acc);
                request.setAttribute("customer", customer);

                RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException ex) {
            System.out.println("loi o day");
            Logger.getLogger(CustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("loi o day");
            Logger.getLogger(CustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
