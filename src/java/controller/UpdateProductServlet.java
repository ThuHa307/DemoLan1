/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author PC
 */
@WebServlet(name="UpdateProductServlet", urlPatterns={"/updateproduct"})
public class UpdateProductServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductDAO prdao = new ProductDAO();
        CategoryDAO catDao = new CategoryDAO();
        request.setAttribute("categories", catDao.readProducts()); 
        String id = request.getParameter("productId");
        Product product = prdao.findById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String idStr = request.getParameter("productId");
        String name = request.getParameter("name");
        String oriPriceStr = request.getParameter("oriprice");
        String priceStr = request.getParameter("price");
        String size = request.getParameter("size");
        String quantityStr = request.getParameter("quantity");
        String type = request.getParameter("type");
        String categoryName = request.getParameter("categoryName");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        String color = request.getParameter("color");
        String colorImage = request.getParameter(color);
        try {
            CategoryDAO catDao = new CategoryDAO();
            int id = Integer.parseInt(idStr);
            int oriPrice = Integer.parseInt(oriPriceStr);
            int price = Integer.parseInt(priceStr);
            int quantity = Integer.parseInt(quantityStr);
            Product x = new Product(id ,name, description, price, oriPrice, type, color, size, quantity, image, catDao.findId(categoryName), colorImage);
            
            boolean result = ProductDAO.updateProduct(x);
            if (result) {
                request.getRequestDispatcher("viewdetail").forward(request, response);
            }
                
        } catch (Exception e) {
            response.sendRedirect("home.jsp");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
