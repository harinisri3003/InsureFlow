package com.policytrack.model;

import java.sql.Timestamp;

/**
 * Agent Model - POJO representing one row from agents table
 * 
 * This is a plain data container with no business logic.
 */
public class Agent {

    private String agentId;
    private String username;
    private String passwordHash;
    private String agentName;
    private String email;
    private String mobile;
    private boolean isActive;
    private Timestamp createdAt;
    private Timestamp lastLogin;

    // Default constructor
    public Agent() {
    }

    // Constructor with essential fields
    public Agent(String agentId, String username, String passwordHash, String agentName) {
        this.agentId = agentId;
        this.username = username;
        this.passwordHash = passwordHash;
        this.agentName = agentName;
        this.isActive = true;
    }

    // Full constructor
    public Agent(String agentId, String username, String passwordHash, String agentName,
                 String email, String mobile, boolean isActive, Timestamp createdAt, Timestamp lastLogin) {
        this.agentId = agentId;
        this.username = username;
        this.passwordHash = passwordHash;
        this.agentName = agentName;
        this.email = email;
        this.mobile = mobile;
        this.isActive = isActive;
        this.createdAt = createdAt;
        this.lastLogin = lastLogin;
    }

    // ==================== GETTERS ====================

    public String getAgentId() {
        return agentId;
    }

    public String getUsername() {
        return username;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public String getAgentName() {
        return agentName;
    }

    public String getEmail() {
        return email;
    }

    public String getMobile() {
        return mobile;
    }

    public boolean isActive() {
        return isActive;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public Timestamp getLastLogin() {
        return lastLogin;
    }

    // ==================== SETTERS ====================

    public void setAgentId(String agentId) {
        this.agentId = agentId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }

    // ==================== UTILITY ====================

    @Override
    public String toString() {
        return "Agent{" +
                "agentId='" + agentId + '\'' +
                ", username='" + username + '\'' +
                ", agentName='" + agentName + '\'' +
                ", email='" + email + '\'' +
                ", isActive=" + isActive +
                '}';
    }
}
