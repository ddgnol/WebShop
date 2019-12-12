
package Controller;

import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ProDetail", urlPatterns = {"/ProDetail"})
public class ProDetail extends HttpServlet {

   
  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = (String) request.getParameter("id");
        
        try {
            ProductDAO proDAO = new ProductDAO();
            Product pro = proDAO.getProById(id);
            
            request.setAttribute("pro", pro);
            
            RequestDispatcher rd = request.getRequestDispatcher("detailPro.jsp");
            rd.forward(request, response);
            //System.out.println("   Okkkk  "+id);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProDetail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

   
}
