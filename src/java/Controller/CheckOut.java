package Controller;

import DAO.ProductDAO;
import Model.Bill;
import Model.BillDetail;
import Model.Customer;
import Model.ProCart;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL LATITUDE
 */
//@WebServlet(urlPatterns = "/CheckOut")
public class CheckOut extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String payment = request.getParameter("payment");
        String status = "Đang chờ";
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("cus");
        Bill bill = new Bill();
        try {
                ProductDAO proDAO = new ProductDAO();
                List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
                int price = 0;
                for (ProCart pro : list) {
                    price += pro.getPrice() * pro.getStatus();
                }
                bill.setPrice(price);
                bill.setId_cus(cus.getId());
                bill.setAddress(address);
                bill.setPayment(payment);
                bill.setPhone(phone);
                bill.setStatus(status);
                proDAO.insertBill(bill);
                Bill b = proDAO.getLastestBill();
                for (ProCart pro : list) {
                    BillDetail billDetail = new BillDetail();
                    billDetail.setId(b.getId());
                    billDetail.setId_pro(pro.getId());
                    billDetail.setNumber(pro.getStatus());
                    proDAO.insertDetailBill(billDetail);
                    proDAO.deleteProInCart(cus.getId(), pro.getId());
                }

                String error = "Thành công. Xin quý khách đợi vài ngày để nhận sản phẩm .";
                request.setAttribute("error", error);
                RequestDispatcher rd = request.getRequestDispatcher("CheckOut.jsp");
                rd.forward(request, response);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckOut.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CheckOut.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
