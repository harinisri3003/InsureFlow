-- =====================================================
-- PolicyTrack Database Schema - Customers Table
-- Database: Policy_Track
-- =====================================================

-- Customers Table
-- Stores all customer information collected from add-customer.jsp form
-- =====================================================

CREATE TABLE customers (
    -- Primary Key
    customer_id         VARCHAR(20) PRIMARY KEY,          -- e.g., CUST-0001
    
    -- Basic Details (Section 1 in form)
    full_name           VARCHAR(150) NOT NULL,            -- Full name as per ID
    gender              ENUM('male', 'female', 'other') NOT NULL,
    date_of_birth       DATE NOT NULL,
    mobile              VARCHAR(10) NOT NULL,             -- 10-digit mobile number
    email               VARCHAR(100),                     -- Optional email
    
    -- Address Details (Section 2 in form)
    address_line1       VARCHAR(255) NOT NULL,            -- House/Flat No., Building, Street
    address_line2       VARCHAR(255),                     -- Landmark, Area (optional)
    city                VARCHAR(100) NOT NULL,
    state               VARCHAR(50) NOT NULL,             -- State code or full name
    pincode             VARCHAR(6) NOT NULL,              -- 6-digit pincode
    
    -- KYC Details (Section 3 in form)
    id_proof_type       ENUM('aadhaar', 'pan', 'passport', 'voter', 'driving') NOT NULL,
    id_proof_number     VARCHAR(50) NOT NULL,
    id_proof_doc_path   VARCHAR(500),                     -- Path to uploaded document
    
    -- Additional Details (Section 4 in form - optional)
    occupation          VARCHAR(50),                      -- salaried, self-employed, etc.
    income_range        VARCHAR(20),                      -- below-3, 3-5, 5-10, etc.
    notes               TEXT,                             -- Agent remarks
    
    -- System Fields
    agent_id            VARCHAR(20) NOT NULL,             -- Agent who added this customer
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active           BOOLEAN DEFAULT TRUE,
    
    -- Foreign Key
    CONSTRAINT fk_customer_agent 
        FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    
    -- Indexes for faster search
    INDEX idx_customer_mobile (mobile),
    INDEX idx_customer_email (email),
    INDEX idx_customer_name (full_name),
    INDEX idx_customer_agent (agent_id),
    
    -- Unique constraint to prevent duplicate mobile numbers
    UNIQUE KEY uk_customer_mobile (mobile)
    
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci
  COMMENT='Customer information for policy management';


-- =====================================================
-- Sample INSERT for testing (optional)
-- =====================================================
/*
INSERT INTO customers (
    customer_id, full_name, gender, date_of_birth, mobile, email,
    address_line1, address_line2, city, state, pincode,
    id_proof_type, id_proof_number,
    occupation, income_range, notes, agent_id
) VALUES (
    'CUST-0001', 
    'Rahul Sharma', 
    'male', 
    '1990-05-15', 
    '9876543210', 
    'rahul.sharma@email.com',
    '123, Green Park Apartments', 
    'Near City Mall', 
    'Mumbai', 
    'Maharashtra', 
    '400001',
    'aadhaar', 
    '1234-5678-9012',
    'salaried', 
    '5-10', 
    'Regular customer, good payment history', 
    'AGT-001'
);
*/
