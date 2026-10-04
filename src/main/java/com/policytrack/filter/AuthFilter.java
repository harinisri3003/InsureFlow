package com.policytrack.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Authentication Filter - Protects all pages from unauthorized access
 * 
 * This filter intercepts ALL requests and checks if user is logged in.
 * If not logged in, redirects to login page.
 * 
 * Excluded paths (no login required):
 * - /index.jsp (login page)
 * - /login (login servlet)
 * - /css/, /js/, /images/ (static resources)
 */
@WebFilter("/*")
public class AuthFilter implements Filter {

    // Paths that don't require authentication
    private static final String[] EXCLUDED_PATHS = {
        "/index.jsp",
        "/login",
        "/css/",
        "/js/",
        "/images/",
        "/fonts/",
        "/favicon.ico"
    };

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("✅ AuthFilter initialized - Page protection active");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        
        // Get path relative to context
        String path = requestURI.substring(contextPath.length());

        // Check if path is excluded from authentication
        if (isExcludedPath(path)) {
            chain.doFilter(request, response);
            return;
        }

        // Check if user is logged in
        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("isLoggedIn") != null);

        if (isLoggedIn) {
            // User is authenticated - allow access
            chain.doFilter(request, response);
        } else {
            // User is NOT authenticated - redirect to login
            httpResponse.sendRedirect(contextPath + "/index.jsp?error=Please+login+to+continue");
        }
    }

    @Override
    public void destroy() {
        System.out.println("AuthFilter destroyed");
    }

    /**
     * Check if the requested path should be excluded from authentication
     */
    private boolean isExcludedPath(String path) {
        // Allow root path to go to login
        if (path.equals("/") || path.isEmpty()) {
            return true;
        }
        
        for (String excluded : EXCLUDED_PATHS) {
            if (path.equals(excluded) || path.startsWith(excluded)) {
                return true;
            }
        }
        return false;
    }
}
