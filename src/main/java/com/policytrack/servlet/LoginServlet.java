package com.policytrack.servlet;

import com.policytrack.model.Agent;
import com.policytrack.service.AuthService;
import com.policytrack.service.AuthService.AuthResult;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Login Servlet - HTTP Controller
 * 
 * Responsibilities:
 * - Handle HTTP requests and responses
 * - Read form parameters
 * - Call AuthService for authentication
 * - Create/manage sessions
 * - Redirect to appropriate pages
 * 
 * Does NOT handle:
 * - Business logic (delegated to AuthService)
 * - Database queries (delegated to DAO via Service)
 * - Password hashing (delegated to PasswordUtil via Service)
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private AuthService authService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.authService = new AuthService();
    }

    /**
     * Handle GET requests - redirect to login page
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // If already logged in, redirect to dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("isLoggedIn") != null) {
            response.sendRedirect(request.getContextPath() + "/agent-dashboard.jsp");
            return;
        }
        
        // Otherwise show login page
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    /**
     * Handle POST requests - process login form
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Read form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Step 2: Call AuthService (business logic)
        AuthResult result = authService.authenticate(username, password);

        // Step 3: Handle result
        if (result.isSuccess()) {
            // Login successful - create session
            Agent agent = result.getAgent();
            
            HttpSession session = request.getSession(true);
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("agentId", agent.getAgentId());
            session.setAttribute("username", agent.getUsername());
            session.setAttribute("agentName", agent.getAgentName());
            session.setAttribute("email", agent.getEmail());
            
            // Set session timeout to 30 minutes
            session.setMaxInactiveInterval(30 * 60);

            // Redirect to dashboard
            response.sendRedirect(request.getContextPath() + "/agent-dashboard.jsp");
            
        } else {
            // Login failed - show error
            request.setAttribute("error", result.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
