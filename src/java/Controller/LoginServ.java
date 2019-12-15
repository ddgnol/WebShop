
package Controller;

import DAO.AccountDAO;
import DAO.CustomerDAO;
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


@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginServ extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("user");
        String pass= request.getParameter("pass");
        
        
        try {
            AccountDAO dao = new AccountDAO();
            Account acc = dao.getAccount(user, pass);
            System.out.println(acc.getUsername());
            System.out.println(acc.getPassword());
            if (acc.getUsername().equals(user)  &&  acc.getPassword().equals(pass)){
                
                HttpSession session = request.getSession();
               // session.setAttribute("idAcc", acc.getId());
               
                
                CustomerDAO  cusDao = new CustomerDAO();
                Customer cus= cusDao.getCustomerById(acc.getId());
                session.setAttribute("cus", cus);
                
                if(acc.getIsAdmin()==1){
                    RequestDispatcher view = request.getRequestDispatcher("AdminView");
                    view.forward(request, response);
                }
                else{
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);}
            } else{
                RequestDispatcher view = request.getRequestDispatcher("loginFail.jsp");
                view.forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServ.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doGet(request, response);
    }

   
   

}
