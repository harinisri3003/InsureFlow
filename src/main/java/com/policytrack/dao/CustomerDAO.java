package com.policytrack.dao;

import com.policytrack.config.DBConfig;
import com.policytrack.model.Customer;

import java.sql.*;

/**
 * Customer Data Access Object
 *
 * ONLY responsibility: Talk to the database
 * - Execute SQL queries
 * - Map ResultSet to Customer objects
 * - NO business logic here
 */
public class CustomerDAO {

    /**
     * Save a new customer to the database
     *
     * @param customer the Customer object to save
     * @return true if saved successfully
     */
    public boolean save(Customer customer) {

        String sql = "INSERT INTO customers (" +
                     "customer_id, full_name, gender, date_of_birth, mobile, email, " +
                     "address_line1, address_line2, city, state, pincode, " +
                     "id_proof_type, id_proof_number, id_proof_doc_path, " +
                     "occupation, income_range, notes, agent_id, is_active" +
                     ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, customer.getCustomerId());
            pstmt.setString(2, customer.getFullName());
            pstmt.setString(3, customer.getGender());
            pstmt.setDate(4, customer.getDateOfBirth());
            pstmt.setString(5, customer.getMobile());
            pstmt.setString(6, customer.getEmail());
            pstmt.setString(7, customer.getAddressLine1());
            pstmt.setString(8, customer.getAddressLine2());
            pstmt.setString(9, customer.getCity());
            pstmt.setString(10, customer.getState());
            pstmt.setString(11, customer.getPincode());
            pstmt.setString(12, customer.getIdProofType());
            pstmt.setString(13, customer.getIdProofNumber());
            pstmt.setString(14, customer.getIdProofDocPath());
            pstmt.setString(15, customer.getOccupation());
            pstmt.setString(16, customer.getIncomeRange());
            pstmt.setString(17, customer.getNotes());
            pstmt.setString(18, customer.getAgentId());
            pstmt.setBoolean(19, customer.isActive());

            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("❌ Error saving customer: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Find customer by customer ID
     *
     * @param customerId the customer ID to search
     * @return Customer object if found, null otherwise
     */
    public Customer findById(String customerId) {

        String sql = "SELECT customer_id, full_name, gender, date_of_birth, " +
                     "mobile, email, address_line1, address_line2, city, state, " +
                     "pincode, id_proof_type, id_proof_number, id_proof_doc_path, " +
                     "occupation, income_range, notes, agent_id, created_at, " +
                     "updated_at, is_active " +
                     "FROM customers WHERE customer_id = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, customerId);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    return mapResultSetToCustomer(rs);
                }
            }

        } catch (SQLException e) {
            System.err.println("❌ Error finding customer by ID: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Helper method to map ResultSet to Customer object
     */
    private Customer mapResultSetToCustomer(ResultSet rs) throws SQLException {

        Customer customer = new Customer();

        customer.setCustomerId(rs.getString("customer_id"));
        customer.setFullName(rs.getString("full_name"));
        customer.setGender(rs.getString("gender"));
        customer.setDateOfBirth(rs.getDate("date_of_birth"));
        customer.setMobile(rs.getString("mobile"));
        customer.setEmail(rs.getString("email"));
        customer.setAddressLine1(rs.getString("address_line1"));
        customer.setAddressLine2(rs.getString("address_line2"));
        customer.setCity(rs.getString("city"));
        customer.setState(rs.getString("state"));
        customer.setPincode(rs.getString("pincode"));
        customer.setIdProofType(rs.getString("id_proof_type"));
        customer.setIdProofNumber(rs.getString("id_proof_number"));
        customer.setIdProofDocPath(rs.getString("id_proof_doc_path"));
        customer.setOccupation(rs.getString("occupation"));
        customer.setIncomeRange(rs.getString("income_range"));
        customer.setNotes(rs.getString("notes"));
        customer.setAgentId(rs.getString("agent_id"));
        customer.setCreatedAt(rs.getTimestamp("created_at"));
        customer.setUpdatedAt(rs.getTimestamp("updated_at"));
        customer.setActive(rs.getBoolean("is_active"));

        return customer;
    }
}