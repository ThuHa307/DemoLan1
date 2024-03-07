/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Voucher;
/**
 *
 * @author truon
 */
@WebServlet(name = "VoucherInfo", urlPatterns = {"/VoucherInfo"})
public class VoucherInfo extends HttpServlet {

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
            out.println("<title>Servlet VoucherInfo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoucherInfo at " + request.getContextPath() + "</h1>");
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
        System.out.println("Hello");
        ArrayList<Voucher> vouchers = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM Voucher";
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
                    Voucher voucher = new Voucher();
                    voucher.setVoucherID(rs.getInt("VoucherID"));
                    voucher.setStartDate(rs.getDate("StartDate"));
                    voucher.setEndDate(rs.getDate("EndDate"));
                    voucher.setFixedDiscount(rs.getInt("FixedDiscount"));
                    voucher.setLimitedQuantity(rs.getInt("LimitedQuantity"));
                    voucher.setDescription(rs.getString("Description"));
                    voucher.setStatus(rs.getString("Status"));
                    voucher.setPercentage(rs.getInt("Percentage"));
                    voucher.setVoucherName(rs.getString("VoucherName"));
                    vouchers.add(voucher);
                }
                
                con.close();
            }
            for (Voucher voucher : vouchers) {           
            System.out.println(voucher.getVoucherID());
            System.out.println(voucher.getStartDate());
            System.out.println(voucher.getEndDate());
            System.out.println(voucher.getFixedDiscount());
            System.out.println(voucher.getLimitedQuantity());
            System.out.println(voucher.getDescription());
            System.out.println(voucher.getStatus());
        }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        request.setAttribute("vouchers", vouchers);
        request.getRequestDispatcher("voucherInfo.jsp").forward(request, response);
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
