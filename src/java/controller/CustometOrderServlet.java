/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Customer;
import model.Order;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustometOrderServlet", urlPatterns = {"/CustometOrderServlet"})
public class CustometOrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustometOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustometOrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OderDAO s = new OderDAO();
        //   int num = 0;
        try {
            HttpSession session = request.getSession(true);
            Customer account = null;
            Object a = session.getAttribute("userLogin");//accountuserLogin
            if (a != null) {
                account = (Customer) a;
                System.out.println(account.getCustomerID());
            }
            List<Order> orderList = (List<Order>) s.getOneOrder(account.getCustomerID());
            for (Order order : orderList) {
                System.out.println("oder22:"+ order.toString());
            }
            request.setAttribute("orderList", orderList);
            
            int pageSize = 10;
            int pageCount = (int) Math.ceil((double) orderList.size() / pageSize);
            
            String pageParam = request.getParameter("page");
            int currentPage = 1;
            if (pageParam != null) {
                currentPage = Integer.parseInt(pageParam);
            }
            int startIndex = (currentPage - 1) * pageSize;
            int endIndex = Math.min(startIndex + pageSize, orderList.size());
            List<Order> pageStudents = orderList.subList(startIndex, endIndex);
            session.setAttribute("data", pageStudents);
            session.setAttribute("pageCount", pageCount);
            session.setAttribute("currentPage", currentPage);
            //    request.setAttribute("num", num); // Pass the "num" parameter to the JSP    
            request.getRequestDispatcher("CustomerOrder.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
