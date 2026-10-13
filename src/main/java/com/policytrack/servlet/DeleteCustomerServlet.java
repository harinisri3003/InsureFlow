
package com.policytrack.servlet;

import com.policytrack.dao.CustomerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete-customer")
public class DeleteCustomerServlet extends HttpServlet {

    private final CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("agentId") == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        String agentId = String.valueOf(session.getAttribute("agentId"));
        String customerId = request.getParameter("customerId");

        if (customerId == null || customerId.trim().isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/search-customers"
            );
            return;
        }

        boolean deleted = customerDAO.deleteById(
            customerId.trim(), agentId
        );

        if (deleted) {
            response.sendRedirect(
                request.getContextPath() + "/search-customers"
            );
        } else {
            response.sendError(
                HttpServletResponse.SC_NOT_FOUND,
                "Customer could not be deleted."
            );
        }
    }
}