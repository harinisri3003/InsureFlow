<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%-- Logout Page - logout.jsp Properly invalidates user session and redirects to login page. --%>
        <% // Invalidate the session to log out 
        if (session !=null) { session.invalidate(); } // Redirect to login page with success message 
            response.sendRedirect(request.getContextPath()
            + "/index.jsp?error=You+have+been+logged+out+successfully." ); %>