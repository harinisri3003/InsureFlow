package com.policytrack.util;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Password Utility using BCrypt
 * 
 * This is a reusable helper for password operations.
 * - Hash passwords for storage
 * - Verify passwords during login
 * 
 * NO business logic, NO database access here.
 */
public class PasswordUtil {

    // BCrypt work factor (higher = more secure but slower)
    // 12 is a good balance for most applications
    private static final int BCRYPT_ROUNDS = 12;

    /**
     * Hash a plain text password using BCrypt
     * 
     * @param plainPassword the plain text password
     * @return the hashed password
     */
    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(BCRYPT_ROUNDS));
    }

    /**
     * Verify a plain text password against a stored hash
     * 
     * @param plainPassword the plain text password to verify
     * @param hashedPassword the stored hash to compare against
     * @return true if password matches, false otherwise
     */
    public static boolean verifyPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || plainPassword.isEmpty()) {
            return false;
        }
        if (hashedPassword == null || hashedPassword.isEmpty()) {
            return false;
        }
        
        try {
            return BCrypt.checkpw(plainPassword, hashedPassword);
        } catch (IllegalArgumentException e) {
            // Invalid hash format
            System.err.println("❌ Invalid password hash format: " + e.getMessage());
            return false;
        }
    }
}
