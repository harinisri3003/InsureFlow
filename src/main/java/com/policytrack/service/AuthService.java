package com.policytrack.service;

import com.policytrack.dao.AgentDAO;
import com.policytrack.model.Agent;
import com.policytrack.util.PasswordUtil;

/**
 * Authentication Service - Business Logic Layer
 * 
 * This is the "brain" for authentication.
 * It applies business rules and coordinates between DAO and Util.
 * 
 * Responsibilities:
 * - Validate login credentials
 * - Check if agent is active
 * - Update last login time
 * 
 * Does NOT handle:
 * - HTTP requests/responses
 * - Sessions
 * - SQL queries (delegated to DAO)
 */
public class AuthService {

    private final AgentDAO agentDAO;

    // Constructor
    public AuthService() {
        this.agentDAO = new AgentDAO();
    }

    /**
     * Authenticate an agent
     * 
     * Business rules applied:
     * 1. Check if username exists
     * 2. Check if agent is active
     * 3. Verify password
     * 4. Update last login on success
     * 
     * @param username the username
     * @param password the plain text password
     * @return AuthResult containing success/failure and agent details
     */
    public AuthResult authenticate(String username, String password) {
        
        // Rule 1: Validate input
        if (username == null || username.trim().isEmpty()) {
            return new AuthResult(false, "Username is required", null);
        }
        if (password == null || password.trim().isEmpty()) {
            return new AuthResult(false, "Password is required", null);
        }

        // Trim whitespace
        username = username.trim();
        password = password.trim();

        // Rule 2: Find agent by username
        Agent agent = agentDAO.findByUsername(username);
        
        if (agent == null) {
            // Don't reveal that username doesn't exist (security)
            return new AuthResult(false, "Invalid username or password", null);
        }

        // Rule 3: Check if agent account is active
        if (!agent.isActive()) {
            return new AuthResult(false, "Your account is deactivated. Please contact admin.", null);
        }

        // Rule 4: Verify password using BCrypt
        boolean passwordValid = PasswordUtil.verifyPassword(password, agent.getPasswordHash());
        
        if (!passwordValid) {
            return new AuthResult(false, "Invalid username or password", null);
        }

        // Rule 5: Update last login timestamp
        agentDAO.updateLastLogin(agent.getAgentId());

        // Success!
        return new AuthResult(true, "Login successful", agent);
    }

    /**
     * Inner class to hold authentication result
     */
    public static class AuthResult {
        private final boolean success;
        private final String message;
        private final Agent agent;

        public AuthResult(boolean success, String message, Agent agent) {
            this.success = success;
            this.message = message;
            this.agent = agent;
        }

        public boolean isSuccess() {
            return success;
        }

        public String getMessage() {
            return message;
        }

        public Agent getAgent() {
            return agent;
        }
    }
}
