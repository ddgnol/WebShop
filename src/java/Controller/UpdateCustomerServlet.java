
package Controller;

import DAO.CustomerDAO;
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


@WebServlet(name = "UpdateCustomerServlet", urlPatterns = {"/updatecustomer"})
public class UpdateCustomerServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            HttpSession session = request.getSession(false);
            Customer customer = (Customer) session.getAttribute("cus");
            CustomerDAO customerDAO = new CustomerDAO();
            request.setAttribute("customer",customerDAO.getCustomerById(customer.getId()) );
            request.getRequestDispatcher("updateCustomer.jsp").forward(request, response);
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String error = null ;
        try {
            
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            Customer customer = new Customer();
            customer.setId(request.getParameter("id"));
            customer.setName(request.getParameter("name"));
            customer.setDateOfBirth(request.getParameter("date"));
            customer.setEmail(request.getParameter("email"));
            customer.setPhoneNum(request.getParameter("phone"));
            customer.setAddress(request.getParameter("address"));
            CustomerDAO customerDAO = new CustomerDAO();
            customerDAO.updateCustomer(customer);
                        
        } catch (SQLException | ClassNotFoundException ex) {
            error="đã có lỗi ,thực hiện lại";
            request.setAttribute("error", error);
            request.getRequestDispatcher("updateCustomer.jsp").forward(request, response);
            Logger.getLogger(UpdateCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(error==null){
            try {
                error ="Cập nhập thành công";
                request.setAttribute("error", error);
                CustomerDAO customerDAO = new CustomerDAO();
                request.setAttribute("customer",customerDAO.getCustomerById(request.getParameter("id")) );
                request.getRequestDispatcher("updateCustomer.jsp").forward(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UpdateCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(UpdateCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    

}
