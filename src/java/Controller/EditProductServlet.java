
package Controller;

import DAO.ProductDAO;
import Model.Product;
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

@WebServlet(name = "EditProduct" ,urlPatterns = "/EditProduct")
public class EditProductServlet extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getQueryString();
        request.setAttribute("id", id);
        try {
            Product pro = new ProductDAO().getProById(id);
            request.setAttribute("pro", pro);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        RequestDispatcher rd =request.getRequestDispatcher("editProduct.jsp");
        rd.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            int price = Integer.parseInt(request.getParameter("price"));
            String describe = request.getParameter("describe");
            String img = request.getParameter("image");
            System.out.println(id+name+category+price+describe+img);
            Product pro = new Product(id,name,category,price,describe,img);
            System.out.println(pro);
            ProductDAO productDAO = new ProductDAO();
            productDAO.editProduct(pro);
            
            response.sendRedirect(request.getContextPath() + "/AdminView");
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    
}
