package com.policytrack.model;

import java.sql.Timestamp;
import java.sql.Date;

/**
 * Customer Model - POJO representing one row from customers table.
 *
 * This is a plain data container with no business logic.
 */
public class Customer {

    private String customerId;
    private String fullName;
    private String gender;
    private Date dateOfBirth;
    private String mobile;
    private String email;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String pincode;
    private String idProofType;
    private String idProofNumber;
    private String idProofDocPath;
    private String occupation;
    private String incomeRange;
    private String notes;
    private String agentId;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private boolean isActive;

    // Default constructor
    public Customer() {
    }

    // Constructor with essential fields
    public Customer(String customerId, String fullName, String gender,
                    Date dateOfBirth, String mobile, String email,
                    String agentId) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.mobile = mobile;
        this.email = email;
        this.agentId = agentId;
        this.isActive = true;
    }

    // GETTERS

    public String getCustomerId() {
        return customerId;
    }

    public String getFullName() {
        return fullName;
    }

    public String getGender() {
        return gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public String getMobile() {
        return mobile;
    }

    public String getEmail() {
        return email;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getPincode() {
        return pincode;
    }

    public String getIdProofType() {
        return idProofType;
    }

    public String getIdProofNumber() {
        return idProofNumber;
    }

    public String getIdProofDocPath() {
        return idProofDocPath;
    }

    public String getOccupation() {
        return occupation;
    }

    public String getIncomeRange() {
        return incomeRange;
    }

    public String getNotes() {
        return notes;
    }

    public String getAgentId() {
        return agentId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public boolean isActive() {
        return isActive;
    }

    // SETTERS

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public void setIdProofType(String idProofType) {
        this.idProofType = idProofType;
    }

    public void setIdProofNumber(String idProofNumber) {
        this.idProofNumber = idProofNumber;
    }

    public void setIdProofDocPath(String idProofDocPath) {
        this.idProofDocPath = idProofDocPath;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public void setIncomeRange(String incomeRange) {
        this.incomeRange = incomeRange;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public void setAgentId(String agentId) {
        this.agentId = agentId;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerId='" + customerId + '\'' +
                ", fullName='" + fullName + '\'' +
                ", gender='" + gender + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", isActive=" + isActive +
                '}';
    }
}