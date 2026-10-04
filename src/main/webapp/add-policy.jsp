<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="includes/auth-check.jsp" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Policy | Investment Tracker</title>

        <%-- Common Styles --%>
            <jsp:include page="includes/common-styles.jsp" />

            <style>
                /* Page-specific styles */
                .form-section {
                    background: white;
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    padding: 24px;
                    margin-bottom: 20px;
                    box-shadow: var(--box-shadow);
                }

                .section-header {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    margin-bottom: 20px;
                    padding-bottom: 12px;
                    border-bottom: 2px solid var(--neutral-200);
                }

                .section-icon {
                    width: 36px;
                    height: 36px;
                    background: var(--neutral-100);
                    border-radius: var(--border-radius);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: var(--primary);
                    font-size: 16px;
                }

                .section-title {
                    font-size: 16px;
                    font-weight: 600;
                    color: var(--neutral-800);
                }

                .section-subtitle {
                    font-size: 13px;
                    color: var(--neutral-500);
                    margin-top: 2px;
                }

                .form-grid {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    gap: 20px;
                }

                .form-group {
                    display: flex;
                    flex-direction: column;
                    gap: 6px;
                }

                .form-group.full-width {
                    grid-column: 1 / -1;
                }

                .form-label {
                    font-size: 13px;
                    font-weight: 500;
                    color: var(--neutral-700);
                }

                .required {
                    color: var(--danger);
                }

                .form-input,
                .form-select,
                .form-textarea {
                    padding: 10px 14px;
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    font-size: 14px;
                    transition: var(--transition);
                    background: white;
                    color: var(--neutral-800);
                }

                .form-input:focus,
                .form-select:focus,
                .form-textarea:focus {
                    outline: none;
                    border-color: var(--accent);
                    box-shadow: 0 0 0 3px rgba(49, 130, 206, 0.1);
                }

                .form-input.error,
                .form-select.error {
                    border-color: var(--danger);
                }

                .form-input:disabled,
                .form-select:disabled {
                    background: var(--neutral-100);
                    cursor: not-allowed;
                    color: var(--neutral-500);
                }

                .form-input:read-only {
                    background: var(--neutral-100);
                    color: var(--neutral-600);
                }

                .form-textarea {
                    resize: vertical;
                    min-height: 80px;
                }

                .form-helper {
                    font-size: 12px;
                    color: var(--neutral-500);
                }

                .form-error {
                    font-size: 12px;
                    color: var(--danger);
                    display: none;
                }

                .form-input.error+.form-error,
                .form-select.error+.form-error {
                    display: block;
                }

                .search-box {
                    position: relative;
                }

                .search-input {
                    width: 100%;
                    padding-left: 40px;
                }

                .search-icon {
                    position: absolute;
                    left: 14px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: var(--neutral-500);
                }

                .search-results {
                    position: absolute;
                    top: 100%;
                    left: 0;
                    right: 0;
                    background: white;
                    border: 1px solid var(--neutral-300);
                    border-top: none;
                    border-radius: 0 0 var(--border-radius) var(--border-radius);
                    max-height: 300px;
                    overflow-y: auto;
                    display: none;
                    z-index: 10;
                    box-shadow: var(--box-shadow-hover);
                }

                .search-results.active {
                    display: block;
                }

                .search-result-item {
                    padding: 12px 16px;
                    cursor: pointer;
                    border-bottom: 1px solid var(--neutral-200);
                    transition: var(--transition);
                }

                .search-result-item:hover {
                    background: var(--neutral-100);
                }

                .result-name {
                    font-weight: 500;
                    color: var(--neutral-800);
                }

                .result-details {
                    font-size: 12px;
                    color: var(--neutral-500);
                }

                .customer-card {
                    background: var(--neutral-100);
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    padding: 16px;
                    display: none;
                }

                .customer-card.active {
                    display: block;
                }

                .customer-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 12px;
                }

                .customer-name {
                    font-size: 16px;
                    font-weight: 600;
                    color: var(--neutral-800);
                }

                .btn-change {
                    padding: 4px 12px;
                    background: transparent;
                    border: 1px solid var(--neutral-400);
                    border-radius: 4px;
                    font-size: 12px;
                    color: var(--neutral-600);
                    cursor: pointer;
                    transition: var(--transition);
                }

                .btn-change:hover {
                    background: var(--neutral-200);
                }

                .customer-details {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    gap: 8px;
                }

                .detail-label {
                    color: var(--neutral-500);
                }

                .detail-value {
                    color: var(--neutral-700);
                    font-weight: 500;
                }

                .collapsible-header {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    cursor: pointer;
                    padding: 12px 0;
                }

                .collapsible-toggle {
                    color: var(--accent);
                    font-size: 12px;
                    font-weight: 500;
                    display: flex;
                    align-items: center;
                    gap: 6px;
                }

                .collapsible-content {
                    display: none;
                    padding-top: 12px;
                }

                .collapsible-content.active {
                    display: block;
                }

                .toggle-icon {
                    transition: transform 0.3s ease;
                }

                .collapsible-content.active~.collapsible-header .toggle-icon {
                    transform: rotate(180deg);
                }

                .file-upload {
                    border: 2px dashed var(--neutral-300);
                    border-radius: var(--border-radius);
                    padding: 24px;
                    text-align: center;
                    cursor: pointer;
                    transition: var(--transition);
                }

                .file-upload:hover {
                    border-color: var(--accent);
                    background: var(--neutral-100);
                }

                .file-upload-icon {
                    font-size: 32px;
                    color: var(--neutral-400);
                    margin-bottom: 8px;
                }

                .file-upload-text {
                    font-size: 14px;
                    color: var(--neutral-600);
                }

                .file-upload-hint {
                    font-size: 12px;
                    color: var(--neutral-500);
                }

                .file-input {
                    display: none;
                }

                .uploaded-files {
                    margin-top: 16px;
                }

                .uploaded-file-item {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 10px;
                    background: var(--neutral-100);
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    margin-bottom: 8px;
                }

                .file-info {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .file-icon {
                    color: var(--primary);
                }

                .file-name {
                    font-size: 13px;
                    color: var(--neutral-700);
                }

                .file-size {
                    font-size: 12px;
                    color: var(--neutral-500);
                }

                .btn-remove-file {
                    background: none;
                    border: none;
                    color: var(--danger);
                    cursor: pointer;
                }

                .alert {
                    padding: 14px 16px;
                    border-radius: var(--border-radius);
                    margin-bottom: 20px;
                    display: none;
                    align-items: center;
                    gap: 12px;
                }

                .alert.active {
                    display: flex;
                }

                .alert-error {
                    background: #fff5f5;
                    color: var(--danger);
                    border: 1px solid #feb2b2;
                }

                .alert-icon {
                    font-size: 18px;
                }

                .alert-content {
                    flex: 1;
                }

                .alert-title {
                    font-weight: 600;
                }

                .alert-message {
                    font-size: 13px;
                }

                .btn-close-alert {
                    background: none;
                    border: none;
                    color: inherit;
                    cursor: pointer;
                }

                .form-actions {
                    display: flex;
                    justify-content: flex-end;
                    gap: 12px;
                    padding-top: 24px;
                    border-top: 1px solid var(--neutral-200);
                    margin-top: 24px;
                }

                .btn {
                    padding: 10px 24px;
                    border-radius: var(--border-radius);
                    font-size: 14px;
                    font-weight: 500;
                    cursor: pointer;
                    transition: var(--transition);
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    border: none;
                }

                .btn-primary {
                    background: var(--primary);
                    color: white;
                }

                .btn-primary:hover:not(:disabled) {
                    background: var(--primary-light);
                }

                .btn-primary:disabled {
                    opacity: 0.5;
                    cursor: not-allowed;
                }

                .btn-secondary {
                    background: white;
                    color: var(--neutral-700);
                    border: 1px solid var(--neutral-300);
                }

                .btn-secondary:hover {
                    background: var(--neutral-100);
                }

                .modal-overlay {
                    position: fixed;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background: rgba(0, 0, 0, 0.5);
                    display: none;
                    align-items: center;
                    justify-content: center;
                    z-index: 1000;
                }

                .modal-overlay.active {
                    display: flex;
                }

                .modal {
                    background: white;
                    border-radius: var(--border-radius);
                    padding: 32px;
                    max-width: 500px;
                    text-align: center;
                    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                }

                .modal-icon {
                    width: 64px;
                    height: 64px;
                    background: #f0fff4;
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 16px;
                }

                .modal-icon i {
                    font-size: 32px;
                    color: var(--success);
                }

                .modal-title {
                    font-size: 20px;
                    font-weight: 600;
                    color: var(--neutral-800);
                }

                .modal-message {
                    font-size: 14px;
                    color: var(--neutral-600);
                    margin: 8px 0 24px;
                }

                .modal-actions {
                    display: flex;
                    gap: 12px;
                    justify-content: center;
                }

                [data-theme="dark"] .form-section,
                [data-theme="dark"] .modal {
                    background: var(--neutral-200);
                    border-color: var(--neutral-300);
                }

                [data-theme="dark"] .form-input,
                [data-theme="dark"] .form-select,
                [data-theme="dark"] .form-textarea {
                    background: var(--neutral-300);
                    border-color: var(--neutral-400);
                    color: var(--neutral-800);
                }

                [data-theme="dark"] .customer-card,
                [data-theme="dark"] .uploaded-file-item {
                    background: var(--neutral-300);
                }

                [data-theme="dark"] .search-results {
                    background: var(--neutral-200);
                }

                [data-theme="dark"] .btn-secondary {
                    background: var(--neutral-300);
                    border-color: var(--neutral-400);
                    color: var(--neutral-700);
                }

                @media (max-width: 768px) {
                    .form-grid {
                        grid-template-columns: 1fr;
                    }

                    .customer-details {
                        grid-template-columns: 1fr;
                    }

                    .form-actions {
                        flex-direction: column-reverse;
                    }

                    .btn {
                        width: 100%;
                        justify-content: center;
                    }

                    .form-section {
                        padding: 16px;
                        margin-bottom: 16px;
                    }

                    .section-header {
                        flex-wrap: wrap;
                        gap: 8px;
                    }

                    .section-title {
                        font-size: 15px;
                        word-wrap: break-word;
                    }

                    .section-subtitle {
                        font-size: 12px;
                    }

                    .section-icon {
                        width: 32px;
                        height: 32px;
                        font-size: 14px;
                    }

                    .modal {
                        margin: 16px;
                        padding: 24px 16px;
                        max-width: calc(100vw - 32px);
                    }

                    .modal-title {
                        font-size: 18px;
                    }

                    .modal-actions {
                        flex-direction: column;
                    }

                    .modal-actions .btn {
                        width: 100%;
                    }
                }

                @media (max-width: 480px) {
                    .form-section {
                        padding: 12px;
                    }

                    .section-header {
                        margin-bottom: 14px;
                        padding-bottom: 10px;
                    }

                    .section-title {
                        font-size: 14px;
                    }

                    .form-label {
                        font-size: 12px;
                    }

                    .form-input,
                    .form-select,
                    .form-textarea {
                        padding: 10px 12px;
                        font-size: 14px;
                    }

                    .form-helper,
                    .form-error {
                        font-size: 11px;
                    }

                    .file-upload {
                        padding: 16px;
                    }

                    .file-upload-icon {
                        font-size: 24px;
                    }

                    .file-upload-text {
                        font-size: 13px;
                    }

                    .customer-card {
                        padding: 12px;
                    }

                    .customer-name {
                        font-size: 14px;
                    }

                    .detail-label,
                    .detail-value {
                        font-size: 12px;
                    }
                }
            </style>
    </head>

    <body>
        <div class="dashboard-container">
            <%-- Sidebar --%>
                <jsp:include page="includes/sidebar-agent.jsp" />

                <div class="main-content">
                    <%-- Header --%>
                        <jsp:include page="includes/header-agent.jsp">
                            <jsp:param name="pageTitle" value="Add New Policy" />
                        </jsp:include>

                        <!-- ALERT MESSAGES -->
                        <div class="alert alert-error" id="errorAlert">
                            <i class="fas fa-exclamation-circle alert-icon"></i>
                            <div class="alert-content">
                                <div class="alert-title">Error</div>
                                <div class="alert-message" id="errorMessage"></div>
                            </div>
                            <button class="btn-close-alert" onclick="closeAlert('errorAlert')">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>

                        <form id="policyForm">
                            <!-- SECTION 1: CUSTOMER SELECTION -->
                            <div class="form-section">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">Customer Selection</h2>
                                        <p class="section-subtitle">Search and select the customer for this policy</p>
                                    </div>
                                </div>

                                <div class="form-group full-width" id="searchGroup">
                                    <label class="form-label">
                                        Search Customer <span class="required">*</span>
                                    </label>
                                    <div class="search-box">
                                        <i class="fas fa-search search-icon"></i>
                                        <input type="text" class="form-input search-input" id="customerSearch"
                                            placeholder="Search by name, mobile number, email, or policy number..."
                                            autocomplete="off">
                                        <div class="search-results" id="searchResults">
                                            <div class="search-result-item"
                                                onclick="selectCustomer(1, 'Rahul Sharma', 'CUST-001', '9876543210', 'rahul.sharma @email.com')">
                                                <div class="result-name">Rahul Sharma</div>
                                                <div class="result-details">ID: CUST-001 | Mobile: 9876543210</div>
                                            </div>
                                            <div class="search-result-item"
                                                onclick="selectCustomer(2, 'Priya Patel', 'CUST-002', '9876543211', 'priya.patel@email.com')">
                                                <div class="result-name">Priya Patel</div>
                                                <div class="result-details">ID: CUST-002 | Mobile: 9876543211</div>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="form-helper">Start typing to search for customers</span>
                                </div>

                                <div class="customer-card" id="customerCard">
                                    <div class="customer-header">
                                        <div class="customer-name" id="selectedCustomerName"></div>
                                        <button type="button" class="btn-change" onclick="changeCustomer()">
                                            <i class="fas fa-edit"></i> Change
                                        </button>
                                    </div>
                                    <div class="customer-details">
                                        <div class="customer-detail-item">
                                            <span class="detail-label">Customer ID:</span>
                                            <span class="detail-value" id="selectedCustomerId"></span>
                                        </div>
                                        <div class="customer-detail-item">
                                            <span class="detail-label">Mobile:</span>
                                            <span class="detail-value" id="selectedCustomerMobile"></span>
                                        </div>
                                        <div class="customer-detail-item">
                                            <span class="detail-label">Email:</span>
                                            <span class="detail-value" id="selectedCustomerEmail"></span>
                                        </div>
                                    </div>
                                    <input type="hidden" id="customerId" name="customerId">
                                </div>
                            </div>

                            <!-- SECTION 2: POLICY BASIC DETAILS -->
                            <div class="form-section">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-file-contract"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">Policy Basic Details</h2>
                                        <p class="section-subtitle">Define the policy type and coverage period</p>
                                    </div>
                                </div>

                                <div class="form-grid">
                                    <div class="form-group">
                                        <label class="form-label">Policy Type <span class="required">*</span></label>
                                        <select class="form-select" id="policyType" name="policyType" required>
                                            <option value="">Select Policy Type</option>
                                            <option value="life">Life Insurance</option>
                                            <option value="health">Health Insurance</option>
                                            <option value="vehicle">Vehicle Insurance</option>
                                            <option value="term">Term Insurance</option>
                                            <option value="ulip">ULIP</option>
                                        </select>
                                        <span class="form-error">Please select a policy type</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Policy Provider <span
                                                class="required">*</span></label>
                                        <select class="form-select" id="policyProvider" name="policyProvider" required>
                                            <option value="">Select Provider</option>
                                            <option value="lic">LIC of India</option>
                                            <option value="hdfc">HDFC Life</option>
                                            <option value="icici">ICICI Prudential</option>
                                            <option value="sbi">SBI Life</option>
                                        </select>
                                        <span class="form-error">Please select a provider</span>
                                    </div>

                                    <div class="form-group full-width">
                                        <label class="form-label">Policy Name / Plan Name <span
                                                class="required">*</span></label>
                                        <input type="text" class="form-input" id="policyName" name="policyName"
                                            placeholder="Enter policy plan name" required>
                                        <span class="form-error">Please enter policy name</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Policy Start Date <span
                                                class="required">*</span></label>
                                        <input type="date" class="form-input" id="policyStartDate"
                                            name="policyStartDate" required>
                                        <span class="form-error">Please select start date</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Policy End Date <span
                                                class="required">*</span></label>
                                        <input type="date" class="form-input" id="policyEndDate" name="policyEndDate"
                                            required>
                                        <span class="form-error">Please select end date</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Total Policy Term (Years)</label>
                                        <input type="text" class="form-input" id="policyTerm" name="policyTerm" readonly
                                            placeholder="Auto-calculated">
                                        <span class="form-helper">Auto-calculated from start and end dates</span>
                                    </div>
                                </div>
                            </div>

                            <!-- SECTION 3: PREMIUM DETAILS -->
                            <div class="form-section">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-rupee-sign"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">Premium Details</h2>
                                        <p class="section-subtitle">Configure premium amount and payment schedule</p>
                                    </div>
                                </div>

                                <div class="form-grid">
                                    <div class="form-group">
                                        <label class="form-label">Premium Amount (₹) <span
                                                class="required">*</span></label>
                                        <input type="number" class="form-input" id="premiumAmount" name="premiumAmount"
                                            placeholder="Enter amount" min="1" max="10000000" step="0.01" required>
                                        <span class="form-helper">Maximum: ₹1,00,00,000</span>
                                        <span class="form-error">Please enter valid premium amount</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Payment Frequency <span
                                                class="required">*</span></label>
                                        <select class="form-select" id="paymentFrequency" name="paymentFrequency"
                                            required>
                                            <option value="monthly" selected>Monthly</option>
                                            <option value="quarterly">Quarterly</option>
                                            <option value="half-yearly">Half-Yearly</option>
                                            <option value="yearly">Yearly</option>
                                        </select>
                                        <span class="form-error">Please select payment frequency</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">First Due Date <span class="required">*</span></label>
                                        <input type="date" class="form-input" id="firstDueDate" name="firstDueDate"
                                            required>
                                        <span class="form-error">Please select first due date</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Grace Period (Days)</label>
                                        <input type="number" class="form-input" id="gracePeriod" name="gracePeriod"
                                            placeholder="e.g., 15, 30" min="0" max="90" value="15">
                                        <span class="form-helper">Days allowed after due date (max 90)</span>
                                    </div>
                                </div>
                            </div>

                            <!-- SECTION 4: PAYMENT MODE & REMINDERS -->
                            <div class="form-section">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-credit-card"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">Payment Mode & Reminders</h2>
                                        <p class="section-subtitle">Set payment preferences and notification settings
                                        </p>
                                    </div>
                                </div>

                                <div class="form-grid">
                                    <div class="form-group">
                                        <label class="form-label">Preferred Payment Mode</label>
                                        <select class="form-select" id="paymentMode" name="paymentMode">
                                            <option value="cash">Cash</option>
                                            <option value="upi">UPI</option>
                                            <option value="bank-transfer">Bank Transfer</option>
                                            <option value="cheque">Cheque</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Reminder Preference</label>
                                        <select class="form-select" id="reminderPreference" name="reminderPreference">
                                            <option value="sms">SMS Only</option>
                                            <option value="email">Email Only</option>
                                            <option value="both">Both SMS & Email</option>
                                            <option value="none">No Reminders</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Reminder Start (Days Before Due)</label>
                                        <input type="number" class="form-input" id="reminderDays" name="reminderDays"
                                            placeholder="e.g., 7" min="1" max="30" value="7">
                                        <span class="form-helper">Send reminder before due date (max 30 days)</span>
                                    </div>
                                </div>
                            </div>

                            <!-- SECTION 5: ULIP FUND ALLOCATION (Conditional) -->
                            <div class="form-section" id="ulipSection" style="display: none;">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-chart-pie"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">ULIP Fund Allocation</h2>
                                        <p class="section-subtitle">Allocate premium across investment funds (Total must
                                            be 100%)</p>
                                    </div>
                                </div>

                                <div class="fund-allocation-table">
                                    <table style="width: 100%; border-collapse: collapse;">
                                        <thead>
                                            <tr
                                                style="background: var(--neutral-100); border-bottom: 2px solid var(--neutral-300);">
                                                <th
                                                    style="padding: 12px; text-align: left; font-weight: 600; color: var(--neutral-700);">
                                                    Fund Name</th>
                                                <th
                                                    style="padding: 12px; text-align: left; font-weight: 600; color: var(--neutral-700);">
                                                    Fund Type</th>
                                                <th
                                                    style="padding: 12px; text-align: center; font-weight: 600; color: var(--neutral-700);">
                                                    Risk Level</th>
                                                <th
                                                    style="padding: 12px; text-align: center; font-weight: 600; color: var(--neutral-700); width: 120px;">
                                                    Allocation (%)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr style="border-bottom: 1px solid var(--neutral-200);">
                                                <td style="padding: 12px;">
                                                    <div style="font-weight: 500; color: var(--neutral-800);">Equity
                                                        Growth Fund</div>
                                                    <div style="font-size: 12px; color: var(--neutral-500);">High
                                                        returns, market-linked</div>
                                                </td>
                                                <td style="padding: 12px; color: var(--neutral-600);">Equity</td>
                                                <td style="padding: 12px; text-align: center;">
                                                    <span
                                                        style="padding: 4px 10px; background: rgba(197, 48, 48, 0.1); color: var(--danger); border-radius: 12px; font-size: 11px; font-weight: 600;">High</span>
                                                </td>
                                                <td style="padding: 12px; text-align: center;">
                                                    <input type="number" class="form-input fund-allocation"
                                                        id="equityAllocation" name="equityAllocation" min="0" max="100"
                                                        value="40" style="width: 80px; text-align: center;"
                                                        oninput="updateFundTotal()">
                                                </td>
                                            </tr>
                                            <tr style="border-bottom: 1px solid var(--neutral-200);">
                                                <td style="padding: 12px;">
                                                    <div style="font-weight: 500; color: var(--neutral-800);">Balanced
                                                        Fund</div>
                                                    <div style="font-size: 12px; color: var(--neutral-500);">Mix of
                                                        equity & debt</div>
                                                </td>
                                                <td style="padding: 12px; color: var(--neutral-600);">Hybrid</td>
                                                <td style="padding: 12px; text-align: center;">
                                                    <span
                                                        style="padding: 4px 10px; background: rgba(214, 158, 46, 0.1); color: var(--warning); border-radius: 12px; font-size: 11px; font-weight: 600;">Medium</span>
                                                </td>
                                                <td style="padding: 12px; text-align: center;">
                                                    <input type="number" class="form-input fund-allocation"
                                                        id="balancedAllocation" name="balancedAllocation" min="0"
                                                        max="100" value="30" style="width: 80px; text-align: center;"
                                                        oninput="updateFundTotal()">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 12px;">
                                                    <div style="font-weight: 500; color: var(--neutral-800);">Debt
                                                        Secure Fund</div>
                                                    <div style="font-size: 12px; color: var(--neutral-500);">Stable,
                                                        low-risk returns</div>
                                                </td>
                                                <td style="padding: 12px; color: var(--neutral-600);">Debt</td>
                                                <td style="padding: 12px; text-align: center;">
                                                    <span
                                                        style="padding: 4px 10px; background: rgba(56, 161, 105, 0.1); color: var(--success); border-radius: 12px; font-size: 11px; font-weight: 600;">Low</span>
                                                </td>
                                                <td style="padding: 12px; text-align: center;">
                                                    <input type="number" class="form-input fund-allocation"
                                                        id="debtAllocation" name="debtAllocation" min="0" max="100"
                                                        value="30" style="width: 80px; text-align: center;"
                                                        oninput="updateFundTotal()">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- Total Allocation Indicator -->
                                <div id="allocationTotal"
                                    style="margin-top: 16px; padding: 12px 16px; background: rgba(56, 161, 105, 0.1); border: 1px solid var(--success); border-radius: var(--border-radius); display: flex; justify-content: space-between; align-items: center;">
                                    <span style="font-weight: 500; color: var(--neutral-700);">Total Allocated:</span>
                                    <span id="totalPercentage"
                                        style="font-size: 18px; font-weight: 700; color: var(--success);">100%</span>
                                </div>
                                <p id="allocationError"
                                    style="display: none; margin-top: 8px; font-size: 12px; color: var(--danger);">
                                    <i class="fas fa-exclamation-circle"></i> Total allocation must be exactly 100%
                                </p>
                            </div>

                            <!-- SECTION 6: OPTIONAL DETAILS (COLLAPSIBLE) -->
                            <div class="form-section">
                                <div class="collapsible-header" onclick="toggleCollapsible('optionalDetails')">
                                    <div style="display: flex; align-items: center; gap: 12px;">
                                        <div class="section-icon">
                                            <i class="fas fa-info-circle"></i>
                                        </div>
                                        <div>
                                            <h2 class="section-title">Optional Policy Details</h2>
                                            <p class="section-subtitle">Additional information (not mandatory)</p>
                                        </div>
                                    </div>
                                    <div class="collapsible-toggle">
                                        <span>Expand</span>
                                        <i class="fas fa-chevron-down toggle-icon"></i>
                                    </div>
                                </div>

                                <div class="collapsible-content" id="optionalDetails">
                                    <div class="form-grid">
                                        <div class="form-group">
                                            <label class="form-label">Nominee Name</label>
                                            <input type="text" class="form-input" id="nomineeName" name="nomineeName"
                                                placeholder="Enter nominee name">
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Nominee Relationship</label>
                                            <select class="form-select" id="nomineeRelation" name="nomineeRelation">
                                                <option value="">Select Relationship</option>
                                                <option value="spouse">Spouse</option>
                                                <option value="parent">Parent</option>
                                                <option value="child">Child</option>
                                                <option value="sibling">Sibling</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>

                                        <div class="form-group full-width">
                                            <label class="form-label">Agent Remarks / Notes</label>
                                            <textarea class="form-textarea" id="remarks" name="remarks"
                                                placeholder="Add any additional notes or remarks about this policy..."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- SECTION 6: DOCUMENTS -->
                            <div class="form-section">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-paperclip"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">Documents</h2>
                                        <p class="section-subtitle">Attach policy documents and ID proof (optional)</p>
                                    </div>
                                </div>

                                <div class="file-upload" onclick="document.getElementById('policyDocuments').click()">
                                    <div class="file-upload-icon">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                    </div>
                                    <div class="file-upload-text">Click to upload or drag and drop</div>
                                    <div class="file-upload-hint">PDF, JPG, PNG up to 10MB each</div>
                                </div>
                                <input type="file" id="policyDocuments" class="file-input" multiple
                                    accept=".pdf,.jpg,.jpeg,.png" onchange="handleFileUpload(this)">

                                <div class="uploaded-files" id="uploadedFiles"></div>
                            </div>

                            <!-- FORM ACTIONS -->
                            <div class="form-actions">
                                <button type="button" class="btn btn-secondary" onclick="cancelForm()">
                                    <i class="fas fa-times"></i> Cancel
                                </button>
                                <button type="submit" class="btn btn-primary" id="submitBtn">
                                    <i class="fas fa-check"></i> Create Policy
                                </button>
                            </div>
                        </form>
                </div>
        </div>

        <!-- SUCCESS MODAL -->
        <div class="modal-overlay" id="successModal">
            <div class="modal">
                <div class="modal-icon">
                    <i class="fas fa-check"></i>
                </div>
                <h3 class="modal-title">Policy Created Successfully!</h3>
                <p class="modal-message">The policy has been created and assigned to the customer.</p>
                <div class="modal-actions">
                    <button class="btn btn-secondary" onclick="addAnother()">
                        <i class="fas fa-plus"></i> Add Another Policy
                    </button>
                    <button class="btn btn-primary" onclick="goToDashboard()">
                        <i class="fas fa-tachometer-alt"></i> Go to Dashboard
                    </button>
                </div>
            </div>
        </div>

        <%-- Common Scripts --%>
            <jsp:include page="includes/common-scripts.jsp" />

            <script>
                // Global variables
                let selectedCustomerId = null;

                // ===== GLOBAL FUNCTIONS (called from HTML onclick) =====

                // Customer selection
                function selectCustomer(id, name, customerId, mobile, email) {
                    selectedCustomerId = id;
                    document.getElementById('selectedCustomerName').textContent = name;
                    document.getElementById('selectedCustomerId').textContent = customerId;
                    document.getElementById('selectedCustomerMobile').textContent = mobile;
                    document.getElementById('selectedCustomerEmail').textContent = email;
                    document.getElementById('customerId').value = id;
                    document.getElementById('searchGroup').style.display = 'none';
                    document.getElementById('customerCard').classList.add('active');
                    document.getElementById('searchResults').classList.remove('active');
                    enableFormFields();
                }

                function changeCustomer() {
                    selectedCustomerId = null;
                    document.getElementById('customerSearch').value = '';
                    document.getElementById('searchGroup').style.display = 'block';
                    document.getElementById('customerCard').classList.remove('active');
                    disableFormFields();
                }

                function enableFormFields() {
                    const inputs = document.querySelectorAll('#policyForm input:not(#customerSearch):not([readonly]), #policyForm select, #policyForm textarea');
                    inputs.forEach(input => input.disabled = false);
                    document.getElementById('submitBtn').disabled = false;
                }

                function disableFormFields() {
                    const inputs = document.querySelectorAll('#policyForm input:not(#customerSearch):not([readonly]), #policyForm select, #policyForm textarea');
                    inputs.forEach(input => input.disabled = true);
                    document.getElementById('submitBtn').disabled = true;
                }

                // Collapsible toggle
                function toggleCollapsible(id) {
                    const content = document.getElementById(id);
                    const toggle = content.previousElementSibling.querySelector('.collapsible-toggle span');
                    content.classList.toggle('active');
                    toggle.textContent = content.classList.contains('active') ? 'Collapse' : 'Expand';
                }

                // ULIP Fund Allocation
                function updateFundTotal() {
                    const equity = parseInt(document.getElementById('equityAllocation').value) || 0;
                    const balanced = parseInt(document.getElementById('balancedAllocation').value) || 0;
                    const debt = parseInt(document.getElementById('debtAllocation').value) || 0;
                    const total = equity + balanced + debt;
                    const totalDisplay = document.getElementById('totalPercentage');
                    const totalContainer = document.getElementById('allocationTotal');
                    const errorMsg = document.getElementById('allocationError');

                    totalDisplay.textContent = total + '%';

                    if (total === 100) {
                        totalDisplay.style.color = 'var(--success)';
                        totalContainer.style.background = 'rgba(56, 161, 105, 0.1)';
                        totalContainer.style.borderColor = 'var(--success)';
                        errorMsg.style.display = 'none';
                    } else {
                        totalDisplay.style.color = 'var(--danger)';
                        totalContainer.style.background = 'rgba(197, 48, 48, 0.1)';
                        totalContainer.style.borderColor = 'var(--danger)';
                        errorMsg.style.display = 'block';
                    }
                }

                function resetUlipAllocation() {
                    document.getElementById('equityAllocation').value = 40;
                    document.getElementById('balancedAllocation').value = 30;
                    document.getElementById('debtAllocation').value = 30;
                    updateFundTotal();
                }

                function clearUlipAllocation() {
                    document.getElementById('equityAllocation').value = 0;
                    document.getElementById('balancedAllocation').value = 0;
                    document.getElementById('debtAllocation').value = 0;
                }

                function handlePolicyTypeChange() {
                    const policyType = document.getElementById('policyType').value;
                    const ulipSection = document.getElementById('ulipSection');

                    if (policyType === 'ulip') {
                        ulipSection.style.display = 'block';
                        resetUlipAllocation();
                    } else {
                        ulipSection.style.display = 'none';
                        clearUlipAllocation();
                    }
                }

                // File upload
                function handleFileUpload(input) {
                    const files = input.files;
                    const uploadedFilesContainer = document.getElementById('uploadedFiles');

                    for (let file of files) {
                        if (file.size > 10 * 1024 * 1024) {
                            showError('File size must be less than 10MB: ' + file.name);
                            continue;
                        }

                        const fileItem = document.createElement('div');
                        fileItem.className = 'uploaded-file-item';
                        fileItem.innerHTML = `
                        <div class="file-info">
                            <i class="fas fa-file-pdf file-icon"></i>
                            <div>
                                <div class="file-name">${'$'}{file.name}</div>
                                <div class="file-size">${'$'}{formatFileSize(file.size)}</div>
                            </div>
                        </div>
                        <button type="button" class="btn-remove-file" onclick="this.parentElement.remove()">
                            <i class="fas fa-trash"></i>
                        </button>
                    `;
                        uploadedFilesContainer.appendChild(fileItem);
                    }
                }

                function formatFileSize(bytes) {
                    if (bytes === 0) return '0 Bytes';
                    const k = 1024;
                    const sizes = ['Bytes', 'KB', 'MB'];
                    const i = Math.floor(Math.log(bytes) / Math.log(k));
                    return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
                }

                function showError(message) {
                    const errorAlert = document.getElementById('errorAlert');
                    const errorMessage = document.getElementById('errorMessage');
                    errorMessage.textContent = message;
                    errorAlert.classList.add('active');
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                    setTimeout(() => errorAlert.classList.remove('active'), 5000);
                }

                function closeAlert(id) {
                    document.getElementById(id).classList.remove('active');
                }

                function cancelForm() {
                    if (confirm('Are you sure you want to cancel? All unsaved changes will be lost.')) {
                        window.location.href = 'agent-dashboard.jsp';
                    }
                }

                function addAnother() {
                    document.getElementById('successModal').classList.remove('active');
                    document.getElementById('policyForm').reset();
                    changeCustomer();
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                }

                function goToDashboard() {
                    window.location.href = 'agent-dashboard.jsp';
                }

                // Policy term calculation
                function calculatePolicyTerm() {
                    const startDateValue = document.getElementById('policyStartDate').value;
                    const endDateValue = document.getElementById('policyEndDate').value;

                    if (startDateValue && endDateValue) {
                        const startDate = new Date(startDateValue);
                        const endDate = new Date(endDateValue);

                        if (endDate > startDate) {
                            const diffTime = endDate - startDate;
                            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                            const years = Math.floor(diffDays / 365);
                            const months = Math.floor((diffDays % 365) / 30);

                            let termText = '';
                            if (years > 0) termText = years + (years === 1 ? ' year' : ' years');
                            if (months > 0) {
                                if (termText) termText += ' ';
                                termText += months + (months === 1 ? ' month' : ' months');
                            }
                            if (!termText) termText = diffDays + ' days';

                            document.getElementById('policyTerm').value = termText;
                        } else {
                            document.getElementById('policyTerm').value = '';
                        }
                    } else {
                        document.getElementById('policyTerm').value = '';
                    }
                }

                // Validation
                function validateForm() {
                    let isValid = true;
                    const requiredFields = document.querySelectorAll('[required]');

                    requiredFields.forEach(field => {
                        if (!field.value.trim()) {
                            field.classList.add('error');
                            isValid = false;
                        } else {
                            field.classList.remove('error');
                        }
                    });

                    if (!selectedCustomerId) {
                        showError('Please select a customer before creating a policy');
                        isValid = false;
                    }

                    const premiumAmount = parseFloat(document.getElementById('premiumAmount').value);
                    if (premiumAmount > 10000000) {
                        showError('Premium amount cannot exceed ₹1,00,00,000');
                        document.getElementById('premiumAmount').classList.add('error');
                        isValid = false;
                    }

                    const gracePeriod = parseInt(document.getElementById('gracePeriod').value);
                    if (gracePeriod > 90) {
                        showError('Grace period cannot exceed 90 days');
                        document.getElementById('gracePeriod').classList.add('error');
                        isValid = false;
                    }

                    const reminderDays = parseInt(document.getElementById('reminderDays').value);
                    if (reminderDays > 30) {
                        showError('Reminder days cannot exceed 30 days');
                        document.getElementById('reminderDays').classList.add('error');
                        isValid = false;
                    }

                    const startDate = new Date(document.getElementById('policyStartDate').value);
                    const endDate = new Date(document.getElementById('policyEndDate').value);
                    const today = new Date();
                    today.setHours(0, 0, 0, 0);

                    if (startDate < today) {
                        showError('Policy start date cannot be in the past');
                        document.getElementById('policyStartDate').classList.add('error');
                        isValid = false;
                    }

                    if (endDate <= startDate) {
                        showError('Policy end date must be after start date');
                        document.getElementById('policyEndDate').classList.add('error');
                        isValid = false;
                    }

                    // ULIP validation
                    const policyType = document.getElementById('policyType').value;
                    if (policyType === 'ulip') {
                        const equity = parseInt(document.getElementById('equityAllocation').value) || 0;
                        const balanced = parseInt(document.getElementById('balancedAllocation').value) || 0;
                        const debt = parseInt(document.getElementById('debtAllocation').value) || 0;
                        if (equity + balanced + debt !== 100) {
                            showError('ULIP fund allocation must total exactly 100%');
                            isValid = false;
                        }
                    }

                    return isValid;
                }

                // ===== DOM READY - Event Listeners =====
                document.addEventListener('DOMContentLoaded', function () {
                    // Customer search
                    document.getElementById('customerSearch').addEventListener('input', function () {
                        if (this.value.length > 0) {
                            document.getElementById('searchResults').classList.add('active');
                        } else {
                            document.getElementById('searchResults').classList.remove('active');
                        }
                    });

                    document.addEventListener('click', function (e) {
                        if (!e.target.closest('.search-box')) {
                            document.getElementById('searchResults').classList.remove('active');
                        }
                    });

                    // Set minimum dates
                    const today = new Date().toISOString().split('T')[0];
                    document.getElementById('policyStartDate').setAttribute('min', today);
                    document.getElementById('firstDueDate').setAttribute('min', today);

                    // Add event listeners
                    document.getElementById('policyStartDate').addEventListener('change', calculatePolicyTerm);
                    document.getElementById('policyEndDate').addEventListener('change', calculatePolicyTerm);
                    document.getElementById('policyType').addEventListener('change', handlePolicyTypeChange);

                    // Form submission
                    document.getElementById('policyForm').addEventListener('submit', function (e) {
                        e.preventDefault();
                        if (!validateForm()) return;

                        const submitBtn = document.getElementById('submitBtn');
                        submitBtn.disabled = true;
                        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Creating Policy...';

                        setTimeout(() => {
                            submitBtn.disabled = false;
                            submitBtn.innerHTML = '<i class="fas fa-check"></i> Create Policy';
                            document.getElementById('successModal').classList.add('active');
                        }, 1500);
                    });

                    // Disable form fields initially
                    disableFormFields();
                }); // End DOMContentLoaded
            </script>
    </body>

    </html>