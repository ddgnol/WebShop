package Controller;

import DAO.AccountDAO;
import DAO.ProductDAO;
import Model.Account;
import Model.Bill;
import Model.BillDetail;
import Model.Customer;
import Model.ProCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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

        String sonha = request.getParameter("so nha");
        String phuong = request.getParameter("phuong");
        String quan = request.getParameter("quan");
        String tp = request.getParameter("thanh pho");
        String address = sonha + "," + phuong + "," + quan + "," + tp;
        String phone = request.getParameter("phone");
        String payment = request.getParameter("payment");
        String status = "Đang chờ";
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("cus");
        List<ProCart> proCart =(ArrayList<ProCart>) session.getAttribute("prosInCart");
        Bill bill = new Bill();
        try {
            ProductDAO proDAO = new ProductDAO();
            List<ProCart> list = proDAO.getProCartByIdCus(cus.getId());
            int price = 0;
            for (ProCart pro : list) {
                price += pro.getPrice() * pro.getStatus();
            }
            bill.setPrice(price);
            AccountDAO dao = new AccountDAO();
            Account acc = dao.getAccountById(cus.getId());
            if (acc.getIsAdmin() == 1) {
                String customer = request.getParameter("cus");
                String[] s = customer.split("-");
                System.out.println("cus id = " + s[1]);
                bill.setId_cus(s[1]);
            } else {
                bill.setId_cus(cus.getId());
            }
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
            proCart.clear();
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
