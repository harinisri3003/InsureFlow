<%@ page import="com.policytrack.model.Customer" %>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <% Customer customer=(Customer) request.getAttribute("customer"); if (customer==null) {
            response.sendRedirect(request.getContextPath() + "/search-customers" ); return; } String
            context=request.getContextPath(); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Edit Customer</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        max-width: 850px;
                        margin: 30px auto;
                        padding: 20px;
                        background: #f5f6fa;
                    }

                    form {
                        background: white;
                        padding: 24px;
                        border-radius: 10px;
                    }

                    .fields {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 16px;
                    }

                    label {
                        display: block;
                        font-weight: bold;
                        margin-bottom: 6px;
                    }

                    input,
                    select,
                    textarea {
                        width: 100%;
                        box-sizing: border-box;
                        padding: 10px;
                        border: 1px solid #ccc;
                        border-radius: 5px;
                    }

                    .full {
                        grid-column: 1 / -1;
                    }

                    .actions {
                        margin-top: 20px;
                        display: flex;
                        gap: 12px;
                    }

                    button,
                    .cancel {
                        padding: 10px 16px;
                        border: 0;
                        border-radius: 5px;
                        cursor: pointer;
                        text-decoration: none;
                    }

                    button {
                        background: #2563eb;
                        color: white;
                    }

                    .cancel {
                        background: #e5e7eb;
                        color: #111827;
                    }

                    @media (max-width: 600px) {
                        .fields {
                            grid-template-columns: 1fr;
                        }

                        .full {
                            grid-column: auto;
                        }
                    }
                </style>
            </head>

            <body>

                <h2>Edit Customer</h2>
                <p>Customer ID: <strong>
                        <%= customer.getCustomerId() %>
                    </strong></p>

                <form method="post" action="<%= context %>/edit-customer">
                    <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">

                    <div class="fields">
                        <div>
                            <label>Full Name</label>
                            <input name="fullName" required
                                value="<%= customer.getFullName() == null ? "" : customer.getFullName() %>">
                        </div>

                        <div>
                            <label>Gender</label>
                            <select name="gender" id="gender" required>
                                <option value="male" <%=customer.getGender() !=null &&
                                    customer.getGender().trim().equalsIgnoreCase("male") ? "selected" : "" %>>Male
                                </option>

                                <option value="female" <%=customer.getGender() !=null &&
                                    customer.getGender().trim().equalsIgnoreCase("female") ? "selected" : "" %>>Female
                                </option>

                                <option value="other" <%=customer.getGender() !=null &&
                                    customer.getGender().trim().equalsIgnoreCase("other") ? "selected" : "" %>>Other
                                </option>
                            </select>
                        </div>

                        <div>
                            <label>Date of Birth</label>
                            <input type="date" name="dateOfBirth"
                                value="<%= customer.getDateOfBirth() == null ? "" : customer.getDateOfBirth() %>">
                        </div>

                        <div>
                            <label>Mobile</label>
                            <input name="mobile" required
                                value="<%= customer.getMobile() == null ? "" : customer.getMobile() %>">
                        </div>

                        <div>
                            <label>Email</label>
                            <input type="email" name="email"
                                value="<%= customer.getEmail() == null ? "" : customer.getEmail() %>">
                        </div>

                        <div>
                            <label>Address Line 1</label>
                            <input name="addressLine1"
                                value="<%= customer.getAddressLine1() == null ? "" : customer.getAddressLine1() %>">
                        </div>

                        <div>
                            <label>Address Line 2</label>
                            <input name="addressLine2"
                                value="<%= customer.getAddressLine2() == null ? "" : customer.getAddressLine2() %>">
                        </div>

                        <div>
                            <label>City</label>
                            <input name="city" value="<%= customer.getCity() == null ? "" : customer.getCity() %>">
                        </div>

                        <div>
                            <label>State</label>
                            <input name="state" value="<%= customer.getState() == null ? "" : customer.getState() %>">
                        </div>

                        <div>
                            <label>Pincode</label>
                            <input name="pincode"
                                value="<%= customer.getPincode() == null ? "" : customer.getPincode() %>">
                        </div>

                        <div>
                            <label>ID Proof Type</label>
                            <input name="idProofType"
                                value="<%= customer.getIdProofType() == null ? "" : customer.getIdProofType() %>">
                        </div>

                        <div>
                            <label>ID Proof Number</label>
                            <input name="idProofNumber"
                                value="<%= customer.getIdProofNumber() == null ? "" : customer.getIdProofNumber() %>">
                        </div>

                        <div>
                            <label>Occupation</label>
                            <input name="occupation"
                                value="<%= customer.getOccupation() == null ? "" : customer.getOccupation() %>">
                        </div>

                        <div>
                            <label>Income Range</label>
                            <input name="incomeRange"
                                value="<%= customer.getIncomeRange() == null ? "" : customer.getIncomeRange() %>">
                        </div>

                        <div class="full">
                            <label>Notes</label>
                            <textarea name="notes"
                                rows="3"><%= customer.getNotes() == null ? "" : customer.getNotes() %></textarea>
                        </div>
                    </div>

                    <div class="actions">
                        <button type="submit">Save Changes</button>
                        <a class="cancel" href="<%= context %>/search-customers">Cancel</a>
                    </div>
                </form>

            </body>

            </html>