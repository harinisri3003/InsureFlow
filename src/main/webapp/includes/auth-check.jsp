<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    auth-check.jsp - Session validation include
    
    Include this at the top of ALL protected JSP pages.
    If user is not logged in, redirects to login page.
    
    Usage: <jsp:include page="includes/auth-check.jsp" />
--%>
<%
    // Check if user is logged in
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    
    if (isLoggedIn == null || !isLoggedIn) {
        // Not logged in - redirect to login page
        response.sendRedirect(request.getContextPath() + "/index.jsp?error=Session+expired.+Please+login+again.");
        return;
    }
    
    // Get agent details from session (available to all protected pages)
    String agentId = (String) session.getAttribute("agentId");
    String agentName = (String) session.getAttribute("agentName");
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");
    
    // If agent details are missing, session is invalid
    if (agentId == null || agentName == null) {
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/index.jsp?error=Invalid+session.+Please+login+again.");
        return;
    }
%>
