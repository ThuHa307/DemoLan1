/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private static final String ERROR = "invalid.jsp";
    private static final String SUCCESS = "home.jsp";

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        String userName = (String) request.getAttribute("username");
        String passWord = (String) request.getAttribute("password");
        System.out.println(userName);
        System.out.println(passWord);
        if (userName != null || passWord != null) {
            doPost(request, response);
            return;
        }
        Cookie[] arr = request.getCookies();
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("userC")) {
                    request.setAttribute("userR", c.getValue());
                }
                if (c.getName().equals("passC")) {
                    request.setAttribute("passR", c.getValue());
                }

            }
        }
        request.getRequestDispatcher("signUpAndIn.jsp").forward(request, response);
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
        String url = ERROR;
        Customer cus = null;
        try {
            String userName, passWord;
            userName = request.getParameter("username");
            passWord = request.getParameter("password");
            System.out.println(userName);
            System.out.println(passWord);
            if (userName == null || userName.equals("") && passWord == null || passWord.equals("")) {
                userName = (String) request.getAttribute("username");
                passWord = (String) request.getAttribute("password");
            }
            System.out.println(userName);
            System.out.println(passWord);
            String rem = request.getParameter("remember");
            CustomerDAO cusdao = new CustomerDAO();
            cus = cusdao.checkLogin(userName, passWord);
            if (cus != null) {
                cusdao.newLastLogin(cus.getCustomerID());
                HttpSession session = request.getSession();
                session.setAttribute("userLogin", cus);
                Cookie userCookie = new Cookie("userC", userName);
                Cookie passCookie = new Cookie("passC", passWord);
                userCookie.setMaxAge(30);
                if (rem != null) {
                    passCookie.setMaxAge(30);
                } else {
                    passCookie.setMaxAge(0);
                }
                url = SUCCESS;
                response.addCookie(userCookie);
                response.addCookie(passCookie);
            } else {
                String error = "invalid username or password";
                request.setAttribute("Error", error);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
