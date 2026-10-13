
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

@WebServlet("/edit-customer")
public class EditCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final CustomerDAO customerDAO = new CustomerDAO();

    // Load the selected customer into the edit form
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("agentId") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String customerId = request.getParameter("id");

        if (customerId == null || customerId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/search-customers");
            return;
        }

        Customer customer = customerDAO.findById(customerId);
        
        if (customer == null) {
            response.sendRedirect(request.getContextPath() + "/search-customers");
            return;
        }

        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/edit-customer.jsp")
            .forward(request, response);
    }

    // Save the edited customer details
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("agentId") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String customerId = request.getParameter("customerId");

        if (customerId == null || customerId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/search-customers");
            return;
        }

        // Confirm the customer exists before updating
        Customer customer = customerDAO.findById(customerId);

        if (customer == null) {
            response.sendRedirect(request.getContextPath() + "/search-customers");
            return;
        }

        // Only allow the agent who owns the customer to edit it
        String agentId = (String) session.getAttribute("agentId");

        if (!agentId.equals(customer.getAgentId())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        
        customer.setFullName(request.getParameter("fullName"));

        String gender = request.getParameter("gender");

        if (gender != null && !gender.trim().isEmpty()) {
            customer.setGender(gender.trim().toLowerCase(java.util.Locale.ROOT));
        }
        
        String dob = request.getParameter("dateOfBirth");

        customer.setDateOfBirth(
            dob == null || dob.trim().isEmpty()
                ? null
                : java.sql.Date.valueOf(dob)
        );


        customer.setMobile(request.getParameter("mobile"));
        customer.setEmail(request.getParameter("email"));
        customer.setAddressLine1(request.getParameter("addressLine1"));
        customer.setAddressLine2(request.getParameter("addressLine2"));
        customer.setCity(request.getParameter("city"));
        customer.setState(request.getParameter("state"));
        customer.setPincode(request.getParameter("pincode"));
        customer.setIdProofType(request.getParameter("idProofType"));
        customer.setIdProofNumber(request.getParameter("idProofNumber"));
        customer.setOccupation(request.getParameter("occupation"));
        customer.setIncomeRange(request.getParameter("incomeRange"));
        customer.setNotes(request.getParameter("notes"));

        boolean updated = customerDAO.update(customer);

        if (updated) {
            response.sendRedirect(request.getContextPath() + "/search-customers");
        } else {
            response.sendError(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "Could not update customer."
            );
        }
    }
}