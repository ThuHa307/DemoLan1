/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.Customer;


/**
 *
 * @author Admin
 */
@WebServlet(name = "listCustomerServlet", urlPatterns = {"/listCustomer"})
public class listCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet listCustomerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listCustomerServlet at " + request.getContextPath() + "</h1>");
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
        Customer cus = new Customer();
        List<Customer> ls = new ArrayList<>();
        List<Customer> listCus;
        int listChoice;
        try {
            String choice = request.getParameter("listChoice");
            if(choice.contains("1")){
                ls = cus.listAdmin();
                listChoice=1;
            }else if(choice.contains("2")){
                listCus = cus.listCus();
                for(Customer c: listCus){
                    if(!c.isIsActive())
                        ls.add(c);
                }
                listChoice=2;
            }else{
                listCus = cus.listCus();
                for(Customer c: listCus){
                    if(c.isIsActive())
                        ls.add(c);
                }
                listChoice=3;
            }
            HttpSession session = request.getSession();
            session.setAttribute("customers", ls);  

            int pageSize = 10;
            int pageCount = (int) Math.ceil((double) ls.size() / pageSize);

            String pageParam = request.getParameter("page");
            int currentPage = 1;
            if (pageParam != null) {
                currentPage = Integer.parseInt(pageParam);
            }
            int startIndex = (currentPage - 1) * pageSize;
            int endIndex = Math.min(startIndex + pageSize, ls.size());
            List<Customer> pageStudents = ls.subList(startIndex, endIndex);
            session.setAttribute("data", pageStudents);
            session.setAttribute("pageCount", pageCount);
            session.setAttribute("currentPage", currentPage);
            session.setAttribute("choice", listChoice);
            request.getRequestDispatcher("listCustomer.jsp").forward(request, response);
            
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
