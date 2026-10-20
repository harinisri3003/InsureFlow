CREATE DATABASE IF NOT EXISTS policytrack;
USE policytrack;

CREATE TABLE IF NOT EXISTS agents (
    agent_id VARCHAR(20) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    agent_name VARCHAR(150) NOT NULL,
    email VARCHAR(100) DEFAULT NULL,
    mobile VARCHAR(10) DEFAULT NULL,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (agent_id)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(20) NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    gender ENUM('male','female','other') NOT NULL,
    date_of_birth DATE NOT NULL,
    mobile VARCHAR(10) NOT NULL UNIQUE,
    email VARCHAR(100) DEFAULT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255) DEFAULT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    pincode VARCHAR(6) NOT NULL,
    id_proof_type ENUM('aadhaar','pan','passport','voter','driving') NOT NULL,
    id_proof_number VARCHAR(50) NOT NULL,
    id_proof_doc_path VARCHAR(500) DEFAULT NULL,
    occupation VARCHAR(50) DEFAULT NULL,
    income_range VARCHAR(20) DEFAULT NULL,
    notes TEXT,
    agent_id VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    is_active TINYINT(1) DEFAULT 1,
    PRIMARY KEY (customer_id),
    KEY idx_customer_email (email),
    KEY idx_customer_name (full_name),
    KEY idx_customer_agent (agent_id),
    CONSTRAINT fk_customer_agent
        FOREIGN KEY (agent_id)
        REFERENCES agents(agent_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;