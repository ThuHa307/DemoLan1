/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import model.Customer;


/**
 *
 * @author Admin
 */
//@WebFilter(filterName = "FirstFilter", urlPatterns = {"/*"})
public class FirstFilter implements Filter {
    private static final String US="User";
    private static final String AD="Admin";
    private static final String LOGIN_PAGE="signUpAndIn.jsp";
    private static final List<String> ADMIN_FUNC = new ArrayList<>();
    private static final List<String> USER_FUNC = new ArrayList<>();
    private static final List<String> NONLOGIN_FUNC = new ArrayList<>();
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public FirstFilter() {
        //Các trang Admin vào được bỏ ở đây
        ADMIN_FUNC.add("listCustomer");
        ADMIN_FUNC.add("listCustomer.jsp");
        ADMIN_FUNC.add("adminControlList.jsp");
        ADMIN_FUNC.add("searchUser.jsp");
        ADMIN_FUNC.add("searchCustomer");
        //Hương
        ADMIN_FUNC.add("adminorder.jsp");
        ADMIN_FUNC.add("deleteOrder.jsp");
        ADMIN_FUNC.add("updateOrder.jsp");
        ADMIN_FUNC.add("DeleteOrderServlet");
        ADMIN_FUNC.add("ManageOrderServlet");
        ADMIN_FUNC.add("UpdateServlet");
        //ha
        ADMIN_FUNC.add("updatestock");
        ADMIN_FUNC.add("updateproduct");
        ADMIN_FUNC.add("deleteproduct");
        //anh
        ADMIN_FUNC.add("vieworder");
        ADMIN_FUNC.add("viewOrder.jsp");
        
                    
        //Các trang User vào được bỏ ở đây
        USER_FUNC.add("cusInfo.jsp");
        USER_FUNC.add("voucherInfo.jsp");
        USER_FUNC.add("update.jsp");
        USER_FUNC.add("updateCustomer");
        USER_FUNC.add("delete.jsp");
        USER_FUNC.add("deleteCustomer");
        //Huong
        USER_FUNC.add("CustomerOrder.jsp");
        USER_FUNC.add("CreateOrderServlet");
        USER_FUNC.add("CustometOrderServlet");
        USER_FUNC.add("ThanhToanServlet");
        USER_FUNC.add("checkInfoToPay.jsp");
        //nhan
        USER_FUNC.add("VoucherServlet");
        USER_FUNC.add("VoucherInfo");
        //anh
        USER_FUNC.add("vieworder");
        USER_FUNC.add("viewOrder.jsp");
        //ha
        USER_FUNC.add("type");
        
        //ko cần đăng nhập
        NONLOGIN_FUNC.add("addCustomer");
        NONLOGIN_FUNC.add("login");
        NONLOGIN_FUNC.add("logout");
        NONLOGIN_FUNC.add("home.jsp");
        NONLOGIN_FUNC.add("category");
        NONLOGIN_FUNC.add(LOGIN_PAGE);
        //ha
        NONLOGIN_FUNC.add("product");
        NONLOGIN_FUNC.add("search");
        NONLOGIN_FUNC.add("type");
        NONLOGIN_FUNC.add("recommend");
        NONLOGIN_FUNC.add("viewdetail");
        NONLOGIN_FUNC.add("collection.jsp");
        NONLOGIN_FUNC.add("productdetails.jsp");
        //NONLOGIN_FUNC.add("updatestock");
        //anh
        NONLOGIN_FUNC.add("cart.jsp");
        NONLOGIN_FUNC.add("buy");
        NONLOGIN_FUNC.add("process");
        NONLOGIN_FUNC.add("updatecart");
        NONLOGIN_FUNC.add("updatecart1");
        NONLOGIN_FUNC.add("delecart");
        NONLOGIN_FUNC.add("login.jsp");
        NONLOGIN_FUNC.add("logingoogle");
//        NONLOGIN_FUNC.add("buy");
//        NONLOGIN_FUNC.add("buy");
//        NONLOGIN_FUNC.add("buy");
    //Nhan
        NONLOGIN_FUNC.add("voucherInfo.jsp");
        
        NONLOGIN_FUNC.add("contact.jsp");
        NONLOGIN_FUNC.add("orderProcessing.jsp");
    }    
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("FirstFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("FirstFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String uri = req.getRequestURI();
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            //Trang nào không cần login vẫn vào được thì bở ở đây, thêm ||
            if(NONLOGIN_FUNC.contains(resource)
                    //|| uri.contains("login") || uri.contains("logout")|| uri.contains("addCustomer") || uri.contains("home.jsp") || uri.contains("category")
                    ){
                chain.doFilter(request, response);
            }else{
//                int index = uri.lastIndexOf("/");
//                String resource = uri.substring(index + 1);
                HttpSession session = req.getSession();
                if(session==null || session.getAttribute("userLogin")==null){
                    res.sendRedirect(LOGIN_PAGE);
                }else{
                    Customer c = (Customer) session.getAttribute("userLogin");
                    String roleID = c.getRole();
                    if(US.equals(roleID) && USER_FUNC.contains(resource)){
                        chain.doFilter(request, response);
                    }else if(AD.equals(roleID) && ADMIN_FUNC.contains(resource)){
                        chain.doFilter(request, response);
                    }else{
//                        res.sendRedirect("signUpAndIn.jsp");
                        session.setAttribute("MSG", "Bạn không có quyền làm việc này. Xin đăng nhập với role khác");
                        request.getRequestDispatcher("invalid.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
//            HttpServletResponse res = (HttpServletResponse) response;
//            res.sendRedirect("testFilter.jsp");
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("FirstFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("FirstFilter()");
        }
        StringBuffer sb = new StringBuffer("FirstFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
