
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


@WebServlet(name = "products", urlPatterns = {"/products"})
public class ProductsServ extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            int page =1;
            int recordsPerPage =9;
            
            if(request.getParameter("page")!= null)
            page = Integer.parseInt(request.getParameter("page"));
            
            ProductDAO proDAO = new ProductDAO();
            List<Product> list = proDAO.getListPagePro((page-1)*recordsPerPage,recordsPerPage);
            
            int noOfRecords = proDAO.getNumberOfPro();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            
            request.setAttribute("listPro", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            
         //   System.out.println("asdfasd"+list.get(0).getImg());
            
            RequestDispatcher view = request.getRequestDispatcher("AllProducts.jsp");
            view.forward(request, response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductsServ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductsServ.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

   
   

}
