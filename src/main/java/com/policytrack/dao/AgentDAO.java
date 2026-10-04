package com.policytrack.dao;

import com.policytrack.config.DBConfig;
import com.policytrack.model.Agent;

import java.sql.*;

/**
 * Agent Data Access Object
 * 
 * ONLY responsibility: Talk to the database
 * - Execute SQL queries
 * - Map ResultSet to Agent objects
 * - NO business logic here
 */
public class AgentDAO {

    /**
     * Find agent by username
     * 
     * @param username the username to search
     * @return Agent object if found, null otherwise
     */
    public Agent findByUsername(String username) {
        String sql = "SELECT agent_id, username, password_hash, agent_name, " +
                     "email, mobile, is_active, created_at, last_login " +
                     "FROM agents WHERE username = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToAgent(rs);
                }
            }

        } catch (SQLException e) {
            System.err.println("❌ Error finding agent by username: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Find agent by agent ID
     * 
     * @param agentId the agent ID to search
     * @return Agent object if found, null otherwise
     */
    public Agent findById(String agentId) {
        String sql = "SELECT agent_id, username, password_hash, agent_name, " +
                     "email, mobile, is_active, created_at, last_login " +
                     "FROM agents WHERE agent_id = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, agentId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToAgent(rs);
                }
            }

        } catch (SQLException e) {
            System.err.println("❌ Error finding agent by ID: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Update last login timestamp
     * 
     * @param agentId the agent ID
     * @return true if updated successfully
     */
    public boolean updateLastLogin(String agentId) {
        String sql = "UPDATE agents SET last_login = CURRENT_TIMESTAMP WHERE agent_id = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, agentId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("❌ Error updating last login: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Save a new agent to database
     * 
     * @param agent the Agent object to save
     * @return true if saved successfully
     */
    public boolean save(Agent agent) {
        String sql = "INSERT INTO agents (agent_id, username, password_hash, agent_name, " +
                     "email, mobile, is_active) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, agent.getAgentId());
            pstmt.setString(2, agent.getUsername());
            pstmt.setString(3, agent.getPasswordHash());
            pstmt.setString(4, agent.getAgentName());
            pstmt.setString(5, agent.getEmail());
            pstmt.setString(6, agent.getMobile());
            pstmt.setBoolean(7, agent.isActive());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("❌ Error saving agent: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Check if username already exists
     * 
     * @param username the username to check
     * @return true if exists
     */
    public boolean usernameExists(String username) {
        String sql = "SELECT 1 FROM agents WHERE username = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }

        } catch (SQLException e) {
            System.err.println("❌ Error checking username: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Helper method to map ResultSet to Agent object
     */
    private Agent mapResultSetToAgent(ResultSet rs) throws SQLException {
        Agent agent = new Agent();
        agent.setAgentId(rs.getString("agent_id"));
        agent.setUsername(rs.getString("username"));
        agent.setPasswordHash(rs.getString("password_hash"));
        agent.setAgentName(rs.getString("agent_name"));
        agent.setEmail(rs.getString("email"));
        agent.setMobile(rs.getString("mobile"));
        agent.setActive(rs.getBoolean("is_active"));
        agent.setCreatedAt(rs.getTimestamp("created_at"));
        agent.setLastLogin(rs.getTimestamp("last_login"));
        return agent;
    }
}
