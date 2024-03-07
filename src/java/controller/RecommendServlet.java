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
import model.Product;
import model.Recommend;

/**
 *
 * @author PC
 */
@WebServlet(name="RecommendServlet", urlPatterns={"/recommend"})
public class RecommendServlet extends HttpServlet {
   
    private ArrayList<String> colorsRecommend;
    private String sizeRecommend;
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
            out.println("<title>Servlet RecommendServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RecommendServlet at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("product").forward(request, response);
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
        String sql;
        ArrayList<Product> products;
        if(colorsRecommend != null || sizeRecommend != null) {
            if(colorsRecommend == null) {
                sql="select * from Product where Size = '" + sizeRecommend +"'";
                products = (ArrayList<Product>)ProductDAO.recommend(sql);  
            } else if (sizeRecommend == null) {
                String colors = Recommend.formatArrayList(colorsRecommend);
                sql="select * from Product where Color in (" + colors + ")";
                products = (ArrayList<Product>)ProductDAO.recommend(sql);  
            }    
            else  {
                String colors = Recommend.formatArrayList(colorsRecommend);
                sql = "select * from Product where Size = '" + sizeRecommend + "' and Color in (" + colors + ")";
                products = (ArrayList<Product>)ProductDAO.recommend(sql);
            }
            colorsRecommend=null;
            sizeRecommend=null;
            request.setAttribute("searchData", products);
            doGet(request, response);
        }
        String heightStr = request.getParameter("height");
        String weightStr = request.getParameter("weight"); 
        String skinColor =  request.getParameter("color");
        String productId = request.getParameter("productId");
        
        try {
            int height = 0, weight = 0;
            String skin = "";
            if(!heightStr.equals("") && !weightStr.equals("")) {
                height = Integer.parseInt(heightStr);
                weight = Integer.parseInt(weightStr);
            }      
            if(skinColor != null) skin = skinColor;
            Recommend recommend = new Recommend(height, weight, skin);
            sizeRecommend = recommend.getSize();
            colorsRecommend = recommend.getColor();
            System.out.println(sizeRecommend);
            System.out.println(colorsRecommend);
            request.setAttribute("height", height);
            request.setAttribute("weight", weight);
            request.setAttribute("skinColor", skinColor);
            request.setAttribute("size", sizeRecommend);
            request.setAttribute("colors", colorsRecommend);
            request.setAttribute("open", "open");
            request.setAttribute("productId", productId);
            
//            System.out.println(request.getAttribute("colors"));
//            System.out.println(request.getAttribute("size"));
//            System.out.println(request.getAttribute("productId"));
            request.getRequestDispatcher("viewdetail").forward(request, response);
        } catch (Exception e) {
            System.out.println("loi");
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
