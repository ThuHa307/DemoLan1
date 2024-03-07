/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.Customer;


/**
 *
 * @author Admin
 */
@WebServlet(name = "addCustomerServlet", urlPatterns = {"/addCustomer"})
public class addCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet addCustomerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCustomerServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        
        try {
            Customer cus = new Customer();
            String username=request.getParameter("username");
//                    (Customer) request.getSession().getAttribute("cus");
            HttpSession session = request.getSession();
            if(CustomerDAO.containsSpecialCharacters(username)){               
                session.setAttribute("MSG", "Đăng kí thất bại vì tài khoản có chứa kí tự đặc biệt");
                request.getRequestDispatcher("invalid.jsp").forward(request, response);
            }else if(!CustomerDAO.checkUserName(username)){
                session.setAttribute("MSG", "Đăng kí thất bại vì tài khoản đã tồn tại");
                request.getRequestDispatcher("invalid.jsp").forward(request, response);
            }else{
                String phone =request.getParameter("sdt");
                if(!CustomerDAO.isNumeric(phone)){
                    session.setAttribute("MSG", "Đăng kí thất bại vì số điện thoại có chứa kí tự khác ngoài số");
                    request.getRequestDispatcher("invalid.jsp").forward(request, response);
                }else{
                    cus.setUserName(username);
                    cus.setPassword(request.getParameter("password"));
                    cus.setFullName(request.getParameter("name"));
                    cus.setGender(request.getParameter("gender"));
                    cus.setDOB(request.getParameter("dob"));
                    cus.setPhone(phone);
                    cus.setGmail(request.getParameter("gmail"));

                    cus.setGmailConfirm(false);
                    cus.setIsActive(true);

                    long millis = System.currentTimeMillis();
                    java.sql.Date sqlDate = new java.sql.Date(millis);
                    cus.setLastLogin(sqlDate);

                    cus.setRole("User");
                    int id=cus.addNew();
                    response.sendRedirect("home.jsp");
                }  
            }  
        } catch (Exception e) {
            response.sendRedirect("invalid.jsp");
        }
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
