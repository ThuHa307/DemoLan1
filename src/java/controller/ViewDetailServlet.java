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
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author PC
 */
@WebServlet(name="ViewDetailServlet", urlPatterns={"/viewdetail"})
public class ViewDetailServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ViewDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewDetailServlet at " + request.getContextPath () + "</h1>");
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
        ProductDAO prDao = new ProductDAO();
        String productId = request.getParameter("productId");
        System.out.println(productId);
        if(productId == null || productId.equals("")) {
            productId = Integer.toString(ProductDAO.maxId()) ;
        }
        Product x = prDao.findById(productId);
        String color = x.getColor();
        String name = x.getName();
        ArrayList<Product> products = (ArrayList<Product>)prDao.findByName(x.getName());
        ArrayList<Product> productSize = (ArrayList<Product>)prDao.findBySizes(name, color);
        ArrayList<String> sizes = Product.getSizes(productSize);
        
//        System.out.println(request.getAttribute("height"));
//        System.out.println(request.getAttribute("weight"));
//        System.out.println(request.getAttribute("skinColor"));
//        System.out.println(request.getAttribute("size"));
//        System.out.println(request.getAttribute("colors"));
//        System.out.println(request.getAttribute("open"));
        
        
        request.setAttribute("product", x);
        request.setAttribute("similiar", getSimiliar(x));
        request.setAttribute("familiar", Product.removeDuplicateProducts(products));
        request.setAttribute("sizes", productSize);
        request.getRequestDispatcher("productdetails.jsp").forward(request, response);
    } 
    
    private ArrayList<Product> getSimiliar(Product x) {
        ProductDAO prDao = new ProductDAO();
        ArrayList<Product> results2 = new ArrayList<>();
        ArrayList<Product> results = (ArrayList<Product>)prDao.readProductsByType(x.getType());
        int n = results.size() > 6 ? 6 : results.size();
        for (int i = 0; i < n; i++) {
            results2.add(results.get(i));
        }
        return results2;
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
        doGet(request, response);
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
