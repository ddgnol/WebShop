package Controller;

import DAO.ProductDAO;
import Model.Product;
import Model.orderCart;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.Clock;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
        * 100)
@WebServlet(name = "AddProduct", urlPatterns = {"/AddProduct"})
public class AddProduct extends HttpServlet {

    private static final String UPLOAD_DIR = "image";

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

            String category = request.getParameter("category");
            int price = Integer.parseInt(request.getParameter("price"));
            System.out.println(name + "-" + id);
            String decribe = request.getParameter("describe");
            //String image = "image/" + request.getParameter("image");
            String image = UPLOAD_DIR +"/" + uploadFile(request, "anh3");
            System.out.println("image "+image);
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Product product = new Product(id, name, category, price, decribe, image, quantity);
            ProductDAO productDAO;

            productDAO = new ProductDAO();
            productDAO.addProduct(product);

            List<Product> list = productDAO.getAllProduct();
            request.setAttribute("listPro", list);
            request.setAttribute("error", "Thêm sản phẩm thành công");
            RequestDispatcher rd =request.getRequestDispatcher("admin.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String uploadFile(HttpServletRequest request, String anh) throws IOException, ServletException {
        String fileName = "";
        try {

            DiskFileItemFactory factory = new DiskFileItemFactory();

            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            Part filePart = request.getPart(anh);
        System.out.println("filePart "+filePart.toString());
            fileName = (String) getFileName(filePart);
            System.out.println("file_name"+fileName);

            String applicationPath = getServletContext().getRealPath("");

            // File.separator: \
            String basePath = applicationPath +  UPLOAD_DIR + File.separator;
            System.out.println(basePath);
            File uploadDir = new File(basePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath, fileName);
                System.out.println("outputFilePath "+outputFilePath);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                System.out.println("ghi file thanh cong");
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }
        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :" + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
