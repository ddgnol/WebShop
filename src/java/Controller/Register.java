
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


@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user= request.getParameter("user");
        String pass= request.getParameter("pass");
       String id= request.getParameter("code");
       String name= request.getParameter("name");
       String date= request.getParameter("date");
       String sdt= request.getParameter("phone");
       String gmail= request.getParameter("gmail");
       String address= request.getParameter("address");
       
       Customer cus = new Customer(id, name, sdt, gmail, date, address);
       CustomerDAO cusDAO = new CustomerDAO();
       Account acc = new Account(id, user, pass, 0);
       AccountDAO accDAO  = new AccountDAO();
        try {
           // System.out.println(cusDAO.hasIdCus(id));
            if( !cusDAO.hasIdCus(id)){
                cusDAO.addCus(cus);
                accDAO.addAcc(acc);
                
                RequestDispatcher rd = request.getRequestDispatcher("registerSuccess.jsp");
                rd.forward(request, response);
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("registerFail.jsp");
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
