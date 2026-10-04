package com.policytrack.util;

import org.mindrot.jbcrypt.BCrypt;
import java.util.Scanner;

/**
 * Password Hash Generator - Testing Utility
 * 
 * Run this class directly to generate BCrypt password hashes.
 * Use the generated hashes for inserting test agents into the database.
 * 
 * Usage: Run main method, enter password, get hash
 */
public class PasswordHashGenerator {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("╔════════════════════════════════════════════╗");
        System.out.println("║     BCrypt Password Hash Generator         ║");
        System.out.println("╚════════════════════════════════════════════╝");
        System.out.println();
        
        // If password provided as argument
        if (args.length > 0) {
            String password = args[0];
            String hash = PasswordUtil.hashPassword(password);
            System.out.println("Password: " + password);
            System.out.println("Hash:     " + hash);
            System.out.println();
            printInsertStatement(hash);
            return;
        }
        
        // Interactive mode
        while (true) {
            System.out.print("Enter password to hash (or 'exit' to quit): ");
            String input = scanner.nextLine().trim();
            
            if (input.equalsIgnoreCase("exit")) {
                System.out.println("Goodbye!");
                break;
            }
            
            if (input.isEmpty()) {
                System.out.println("❌ Password cannot be empty. Try again.\n");
                continue;
            }
            
            try {
                String hash = PasswordUtil.hashPassword(input);
                System.out.println();
                System.out.println("✅ Password hashed successfully!");
                System.out.println("─────────────────────────────────────────────");
                System.out.println("Password: " + input);
                System.out.println("Hash:     " + hash);
                System.out.println("─────────────────────────────────────────────");
                System.out.println();
                printInsertStatement(hash);
                System.out.println();
            } catch (Exception e) {
                System.out.println("❌ Error: " + e.getMessage());
            }
        }
        
        scanner.close();
    }
    
    /**
     * Print a ready-to-use SQL INSERT statement
     */
    private static void printInsertStatement(String hash) {
        System.out.println("📋 Sample SQL INSERT statement:");
        System.out.println("─────────────────────────────────────────────");
        System.out.println("INSERT INTO agents (agent_id, username, password_hash, agent_name, email, is_active)");
        System.out.println("VALUES ('AGT-001', 'admin', '" + hash + "', 'Admin Agent', 'admin@example.com', TRUE);");
        System.out.println("─────────────────────────────────────────────");
    }
}
