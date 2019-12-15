
package Controller;

import DAO.AccountDAO;
import Model.Account;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UpdateAccountServlet", urlPatterns = {"/updateaccount"})
public class UpdateAccountServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession(false);
            Customer customer = (Customer) session.getAttribute("cus");
            AccountDAO accDAO = new AccountDAO();
            Account acc = accDAO.getAccountById(customer.getId());
            request.setAttribute("acc", acc);
            request.getRequestDispatcher("updateAcc.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(UpdateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String error= null;
            String id = request.getParameter("id");
            String oldpass = request.getParameter("password");
            String newpass = request.getParameter("password1");
            AccountDAO accountDAO = new AccountDAO();
            Account acc = accountDAO.getAccountById(id);
            if(oldpass.equals(acc.getPassword())){
                acc.setPassword(newpass);
                accountDAO.updateAccount(acc);
                error = "Cập nhập mật khẩu thành công";
                request.setAttribute("error", error);
                request.getRequestDispatcher("updateAcc.jsp").forward(request, response);
            }else{
                error="Nhập sai mật khẩu , hãy nhập lại";
                request.setAttribute("error", error);
                request.getRequestDispatcher("updateAcc.jsp").forward(request, response);
            }           
        } catch (SQLException ex) {
            Logger.getLogger(UpdateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
}
