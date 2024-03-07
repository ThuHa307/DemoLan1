/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Product;

/**
 *
 * @author PC
 */
@WebServlet(name = "GetProductServlet", urlPatterns = {"/product"})
public class GetProductServlet extends HttpServlet {

    private final int PAGE_SIZE = 12;
    private ProductDAO prDao = new ProductDAO();
    private String color = "";
    private String size = "";
    private String price = "";
    private String type = "";
    private List<Product> products;

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
            out.println("<title>Servlet GetProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetProductServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        List<Product> searchData = (List<Product>) request.getAttribute("searchData");
        if (searchData != null) {
            request.setAttribute("flag", "false");
            products = Product.removeDuplicateProducts((ArrayList<Product>) searchData);
        }
        else request.setAttribute("flag", "true");

        if (request.getParameter("type") != null) {
            type = request.getParameter("type");
        }
        if (type != null && request.getParameter("type") != null) {
            color="";
            size="";
            price="";
            products = prDao.readProductsByType(type);
        }
        try {
            String page = request.getParameter("page");
            int pageCount = (int) Math.ceil((double) products.size() / PAGE_SIZE);
            int currentPage = 1;
            if (page != null) {
                currentPage = Integer.parseInt(page);
            }
            int startIndex = (currentPage - 1) * PAGE_SIZE;
            int endIndex = Math.min(startIndex + PAGE_SIZE, products.size());
            List<Product> pageStudents = products.subList(startIndex, endIndex);
            request.setAttribute("data", pageStudents);
            request.setAttribute("page", currentPage);
            request.setAttribute("pageCount", pageCount);
            session.setAttribute("type", request.getParameter("type") == null ? "Kết quả tìm được (" + products.size() + ")" : type);
            request.getRequestDispatcher("collection.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
        String option = request.getParameter("price");
        color = request.getParameter("filter2") != null ? request.getParameter("filter2") : color;
        size = request.getParameter("filter4") != null ? request.getParameter("filter4") : size;
        price = request.getParameter("filter-price") != null ? request.getParameter("filter-price") : price;
        if (!"".equals(color) || !"".equals(size) || !"".equals(price)) {
            products = prDao.filter(color, size, price, type);
        }
        if (products != null && option != null) {
            sort(products, option);
        }
        request.setAttribute("color", color);
        request.setAttribute("size", size);
        request.setAttribute("price", price);
        request.setAttribute("selectedValue", option);
        doGet(request, response);
    }

    private void sort(List<Product> products, String option) {
        switch (option) {
            case "price-asc" ->
                Collections.sort(products, Comparator.comparingInt(Product::getPrice));
            case "price-desc" ->
                Collections.sort(products, Comparator.comparingInt(Product::getPrice).reversed());
            case "name-asc" ->
                Collections.sort(products, Comparator.comparing(Product::getName));
            case "name-desc" ->
                Collections.sort(products, Comparator.comparing(Product::getName).reversed());
            default -> {
                return;
            }
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
