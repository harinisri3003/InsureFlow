
package com.policytrack.servlet;

import com.policytrack.dao.CustomerDAO;
import com.policytrack.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.List;

@WebServlet("/search-customers")
public class SearchCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Ensure the user is logged in
        if (session == null || session.getAttribute("agentId") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        // Retrieve customers from MySQL
        List<Customer> customers = customerDAO.findAll();

        //System.out.println("Customers retrieved: " + customers.size());

        // Make the list available to the JSP page
        request.setAttribute("customers", customers);

        // Display the existing Search Customers page
        request.getRequestDispatcher("/search-customer.jsp")
       .forward(request, response);
    }
}