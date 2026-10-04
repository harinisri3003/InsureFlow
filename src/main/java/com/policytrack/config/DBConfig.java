package com.policytrack.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Database Configuration using HikariCP Connection Pool
 * 
 * This class manages the database connection pool.
 * Credentials are loaded from environment variables for security.
 */
public class DBConfig {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL =  System.getenv("DB_URL");
    private static final String USERNAME = System.getenv("DB_USER");
    private static final String PASSWORD = System.getenv("DB_PASSWORD");

    private static HikariDataSource dataSource;

    // Static block to initialize connection pool when class loads
    static {
        try {
            Class.forName(DRIVER);
            
            HikariConfig config = new HikariConfig();
            config.setJdbcUrl(URL);
            config.setUsername(USERNAME);
            config.setPassword(PASSWORD);
            
            // Connection pool settings
            config.setMaximumPoolSize(10);
            config.setMinimumIdle(2);
            config.setIdleTimeout(30000);        // 30 seconds
            config.setConnectionTimeout(20000);   // 20 seconds
            config.setMaxLifetime(1800000);       // 30 minutes
            
            // MySQL specific optimizations
            config.addDataSourceProperty("cachePrepStmts", "true");
            config.addDataSourceProperty("prepStmtCacheSize", "250");
            config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
            config.addDataSourceProperty("useServerPrepStmts", "true");
            
            dataSource = new HikariDataSource(config);
            
            System.out.println("✅ HikariCP Connection Pool initialized successfully!");
            
        } catch (ClassNotFoundException e) {
            System.err.println("❌ MySQL Driver not found: " + e.getMessage());
            throw new RuntimeException("Failed to load MySQL driver", e);
        } catch (Exception e) {
            System.err.println("❌ Failed to initialize connection pool: " + e.getMessage());
            throw new RuntimeException("Failed to initialize HikariCP", e);
        }
    }

    /**
     * Get a connection from the pool
     * 
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        if (dataSource == null) {
            throw new SQLException("DataSource is not initialized");
        }
        return dataSource.getConnection();
    }

    /**
     * Close the connection pool (call on application shutdown)
     */
    public static void closePool() {
        if (dataSource != null && !dataSource.isClosed()) {
            dataSource.close();
            System.out.println("✅ HikariCP Connection Pool closed.");
        }
    }

    /**
     * Check if pool is active
     * 
     * @return true if pool is running
     */
    public static boolean isPoolActive() {
        return dataSource != null && !dataSource.isClosed();
    }
}
