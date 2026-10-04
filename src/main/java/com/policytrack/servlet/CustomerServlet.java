package com.policytrack.servlet;

import com.policytrack.dao.CustomerDAO;
import com.policytrack.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ==========================================
        // 1. Get customer details from the form
        // ==========================================

        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");

        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");

        String idProofType = request.getParameter("idProofType");
        String idProofNumber = request.getParameter("idProofNumber");

        String occupation = request.getParameter("occupation");
        String incomeRange = request.getParameter("incomeRange");
        String notes = request.getParameter("notes");


        // ==========================================
        // 2. Create Customer object
        // ==========================================

        Customer customer = new Customer();

        customer.setFullName(fullName);
        customer.setGender(gender);
        customer.setMobile(mobile);
        customer.setEmail(email);

        customer.setAddressLine1(address1);
        customer.setAddressLine2(address2);
        customer.setCity(city);
        customer.setState(state);
        customer.setPincode(pincode);

        customer.setIdProofType(idProofType);
        customer.setIdProofNumber(idProofNumber);

        customer.setOccupation(occupation);
        customer.setIncomeRange(incomeRange);
        customer.setNotes(notes);


        // ==========================================
        // 3. Generate Customer ID
        // ==========================================

        String customerId = "CUS-" + System.currentTimeMillis();

        customer.setCustomerId(customerId);


        // ==========================================
        // 4. Convert DOB from String to SQL Date
        // ==========================================

        if (dob != null && !dob.isEmpty()) {
            customer.setDateOfBirth(Date.valueOf(dob));
        }


        // ==========================================
        // 5. Get logged-in agent from session
        // ==========================================

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("agentId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/index.jsp"
            );

            return;
        }

        String agentId = (String) session.getAttribute("agentId");

        customer.setAgentId(agentId);


        // ==========================================
        // 6. Set customer as active
        // ==========================================

        customer.setActive(true);


        // ==========================================
        // 7. Save customer to database
        // ==========================================

        boolean saved = customerDAO.save(customer);


        // ==========================================
        // 8. Handle result
        // ==========================================

        if (saved) {

            System.out.println("✅ Customer saved successfully!");
            System.out.println("Customer ID: " + customer.getCustomerId());

            response.sendRedirect(
                    request.getContextPath()
                    + "/add-customer.jsp?success=true&customerId="
                    + customer.getCustomerId()
            );

        } else {

            System.out.println("❌ Failed to save customer.");

            response.sendRedirect(
                    request.getContextPath()
                    + "/add-customer.jsp?error=true"
            );
        }
    }
}