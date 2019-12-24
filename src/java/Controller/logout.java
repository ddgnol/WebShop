/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ProCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "logout", urlPatterns = {"/logout"})
public class logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("prosInCart") != null) {
            List<ProCart> s = (List<ProCart>) session.getAttribute("prosInCart");
            s.clear();
            System.out.println("logout" + s.size());
            session.removeAttribute("prosInCart");
            session.setAttribute("prosInCart", s);
        }
        if (session != null) {
            session.invalidate();
        }
        RequestDispatcher view = request.getRequestDispatcher("login.jsp");
        view.forward(request, response);
    }

}
