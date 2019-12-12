package Controller;

import DAO.ProductDAO;
import Model.Product;
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

@WebServlet(name = "AddProduct", urlPatterns = {"/AddProduct"})
public class AddProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            System.out.println("Controller.AddProduct.doPost()");
            String name = request.getParameter("name");
            String id = request.getParameter("id");
            System.out.println(name + "-" + id);
            String category = request.getParameter("category");
            int price = Integer.parseInt(request.getParameter("price"));
            String decribe = request.getParameter("describe");
            String image = "image/" + request.getParameter("image");
            Product product = new Product(id, name, category, price, decribe, image);
            ProductDAO productDAO;

            productDAO = new ProductDAO();
            productDAO.addProduct(product);

            response.sendRedirect(request.getContextPath() + "/AdminView");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
