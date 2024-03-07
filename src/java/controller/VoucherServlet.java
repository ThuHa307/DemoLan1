/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static com.microsoft.sqlserver.jdbc.StringUtils.isNumeric;
import dao.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import model.Voucher;

/**
 *
 * @author truon
 */
@WebServlet(name = "VoucherServlet", urlPatterns = {"/VoucherServlet"})
public class VoucherServlet extends HttpServlet {

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
            out.println("<title>Servlet VoucherServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoucherServlet at " + request.getContextPath() + "</h1>");
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
        System.out.println("aaaaaaaaaaaaaaa");
        response.setContentType("text/html");
        
    try {
        // Convert voucherID to integer
        String VoucherName =request.getParameter("VoucherName");
        // Get database connection
        Connection con = DBConnection.getConnection();
        if (con != null) {
            try {
                // Prepare SQL statement to retrieve voucher details
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Voucher WHERE VoucherName=?");
                ps.setString(1, VoucherName);

                // Execute query
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // Voucher exists
                    Date startDate = rs.getDate("StartDate");
                    Date endDate = rs.getDate("EndDate");
                    int limitedQuantity = rs.getInt("LimitedQuantity");
                    // Check if voucher is valid (within start and end dates) and quantity is available
                    Date currentDate = new Date();
                    if (currentDate.after(startDate) && currentDate.before(endDate) && limitedQuantity > 0) {
                        // Valid voucher, decrement quantity
                        limitedQuantity--;

                        // Update quantity in database
                        PreparedStatement updateStatement = con.prepareStatement("UPDATE Voucher SET LimitedQuantity=? WHERE VoucherName=?");
                        updateStatement.setInt(1, limitedQuantity);
                        updateStatement.setString(2, VoucherName);
                        updateStatement.executeUpdate();

                        // Retrieve voucher discounts from the database based on voucherID
                        PreparedStatement discountStatement = con.prepareStatement("SELECT FixedDiscount, Percentage, Description  FROM Voucher WHERE VoucherName=?");
                        discountStatement.setString(1, VoucherName);
                        ResultSet discountResultSet = discountStatement.executeQuery();
                        double voucherFixedDiscount = 0; // Default value if not found
                        double voucherPercentage = 0; // Default value if not found
                        String voucherDescription=null;
                        if (discountResultSet.next()) {
                            voucherFixedDiscount = discountResultSet.getDouble("FixedDiscount");
                            voucherPercentage = discountResultSet.getDouble("Percentage");
                            voucherDescription=discountResultSet.getString("Description");
                        }
                        int check=checkDes(voucherDescription);
                        System.out.println(check);                                

                        System.out.println("Voucher validated successfully! Quantity updated");
                        System.out.println("Voucher fixed discount: " + voucherFixedDiscount);
                        System.out.println("Voucher percentage: " + voucherPercentage);
                        HttpSession session = request.getSession(false); // Lấy phiên hiện tại nếu tồn tại
                        if (session != null) {
                            Double previousTotalPrice = (Double) session.getAttribute("previousTotalPrice");
                            if (previousTotalPrice == null) {
                                Double totalPrice = (Double) session.getAttribute("totalprice"); // Lấy totalPrice từ session
                                session.setAttribute("previousTotalPrice", totalPrice); // Lưu giá trị tổng giá trị trước khi áp mã giảm giá vào session
                            }
                        }
                        if (session != null) {
                            Double totalPrice = (Double) session.getAttribute("totalprice"); // Lấy totalPrice từ session
                            System.out.println(totalPrice);
                            Double lastprice=0.0;
                            if (totalPrice != null ) {
                                Double previousTotalPrice = (Double) session.getAttribute("previousTotalPrice");
                                previousTotalPrice = (Double) session.getAttribute("previousTotalPrice");
                                Double calcPrice;
                                if(voucherFixedDiscount != 0){
                                    calcPrice= previousTotalPrice -voucherFixedDiscount;
                                }else{
                                    calcPrice= previousTotalPrice - (totalPrice *voucherPercentage/100);
                                } 
                                switch (VoucherName) {
                                    case "VOUCHER7PT":
                                        if(totalPrice>check)
                                           totalPrice= calcPrice;
                                        else totalPrice=previousTotalPrice;
                                        break;
                                    case "VOUCHER200":
                                        if(totalPrice>check)
                                           totalPrice= calcPrice;
                                        else totalPrice=previousTotalPrice;
                                        break;
                                    case "VOUCHER5PT":
                                        if(totalPrice>check )
                                           totalPrice= calcPrice;
                                        else totalPrice=previousTotalPrice;
                                        break;
                                    case "VOUCHER50":
                                        if(totalPrice>check )
                                           totalPrice= calcPrice;
                                        else totalPrice=previousTotalPrice;
                                        break;
                                    case "FREESHIP":
                                        if(totalPrice>30000)
                                           totalPrice= calcPrice;
                                        else totalPrice=previousTotalPrice;
                                        break;
                                    default:totalPrice=previousTotalPrice;
                                }         
                                System.out.println(check);                                

                                session.setAttribute("totalprice", totalPrice);
                                System.out.println(totalPrice);                                
                            } 
                        }
                    } else {
                        System.out.println("Voucher is invalid or not available.");
                    }
                } else {
                    HttpSession session = request.getSession(false);
                    Double previousTotalPrice = (Double) session.getAttribute("previousTotalPrice");
                    if (previousTotalPrice == null) {
                        Double totalPrice = (Double) session.getAttribute("totalprice"); // Lấy totalPrice từ session
                        session.setAttribute("totalprice", totalPrice);
                    } else {
                        session.setAttribute("totalprice", previousTotalPrice);
                    }
                    System.out.println("Voucher not found.");
                }
                request.getRequestDispatcher("checkInfoToPay.jsp").forward(request, response);
                con.close();
            } catch (SQLException e) {
                 System.out.println("Error: " + e.getMessage());
            }
        } else {
            System.out.println("Database connection failed.");
        }
        
    } catch (NumberFormatException e) {
         System.out.println("Invalid voucher ID.");
    }
    
    }
    public static int checkDes(String input) {
        // Loại bỏ các khoảng trắng ở đầu và cuối chuỗi
        input = input.trim();

        // Tìm vị trí của khoảng trắng cuối cùng trong chuỗi
        int lastIndex = input.lastIndexOf(" ");

        // Nếu không tìm thấy khoảng trắng, trả về chuỗi đầu vào
        if (lastIndex == -1) {
            return 0;
        }

        // Cắt chuỗi từ vị trí sau khoảng trắng cuối cùng đến hết chuỗi
        String lastWord = input.substring(lastIndex + 1);
        if (!isNumeric(lastWord)) {
            return 0;
        }
        return Integer.parseInt(lastWord);
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
