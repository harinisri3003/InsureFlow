<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="includes/auth-check.jsp" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Customer | Investment Tracker</title>

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
                    max-width: 900px;
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
                    font-size: 12px;
                    color: var(--neutral-500);
                    margin-top: 2px;
                }

                .form-grid {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    gap: 16px;
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
                    transition: all 0.2s ease;
                    background: var(--neutral-100);
                    color: var(--neutral-800);
                }

                .form-input:focus,
                .form-select:focus,
                .form-textarea:focus {
                    outline: none;
                    border-color: var(--primary);
                    box-shadow: 0 0 0 3px rgba(37, 47, 63, 0.1);
                }

                .form-input.error,
                .form-select.error {
                    border-color: var(--danger);
                }

                .form-error {
                    font-size: 11px;
                    color: var(--danger);
                    display: none;
                }

                .form-input.error+.form-error,
                .form-select.error+.form-error {
                    display: block;
                }

                .form-helper {
                    font-size: 11px;
                    color: var(--neutral-500);
                }

                .form-textarea {
                    min-height: 80px;
                    resize: vertical;
                }

                /* Radio Group */
                .radio-group {
                    display: flex;
                    gap: 16px;
                    flex-wrap: wrap;
                }

                .radio-item {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    cursor: pointer;
                }

                .radio-item input[type="radio"] {
                    width: 18px;
                    height: 18px;
                    cursor: pointer;
                }

                .radio-label {
                    font-size: 14px;
                    color: var(--neutral-700);
                }

                /* Collapsible Section */
                .collapsible-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    cursor: pointer;
                    padding: 4px 0;
                }

                .collapsible-toggle {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    font-size: 13px;
                    color: var(--accent);
                }

                .toggle-icon {
                    transition: transform 0.3s ease;
                }

                .collapsible-content {
                    display: none;
                    padding-top: 20px;
                }

                .collapsible-content.active {
                    display: block;
                }

                /* File Upload */
                .upload-zone {
                    border: 2px dashed var(--neutral-300);
                    border-radius: var(--border-radius);
                    padding: 24px;
                    text-align: center;
                    transition: all 0.2s ease;
                    cursor: pointer;
                }

                .upload-zone:hover {
                    border-color: var(--primary);
                    background: var(--neutral-100);
                }

                .upload-icon {
                    font-size: 32px;
                    color: var(--neutral-400);
                    margin-bottom: 8px;
                }

                .upload-text {
                    font-size: 14px;
                    color: var(--neutral-600);
                }

                .upload-hint {
                    font-size: 12px;
                    color: var(--neutral-500);
                    margin-top: 4px;
                }

                .uploaded-file-item {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 10px 12px;
                    background: var(--neutral-100);
                    border-radius: var(--border-radius);
                    margin-top: 8px;
                }

                .file-info {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .file-icon {
                    color: var(--danger);
                    font-size: 20px;
                }

                .file-name {
                    font-size: 13px;
                    font-weight: 500;
                    color: var(--neutral-800);
                }

                .file-size {
                    font-size: 11px;
                    color: var(--neutral-500);
                }

                .btn-remove-file {
                    background: none;
                    border: none;
                    color: var(--neutral-500);
                    cursor: pointer;
                    padding: 4px;
                }

                .btn-remove-file:hover {
                    color: var(--danger);
                }

                /* Form Actions */
                .form-actions {
                    display: flex;
                    justify-content: flex-end;
                    gap: 12px;
                    margin-top: 24px;
                    padding-top: 20px;
                    border-top: 1px solid var(--neutral-200);
                    max-width: 900px;
                }

                .btn {
                    padding: 12px 24px;
                    border-radius: var(--border-radius);
                    font-size: 14px;
                    font-weight: 500;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    cursor: pointer;
                    transition: all 0.2s ease;
                    border: none;
                }

                .btn-secondary {
                    background: var(--neutral-200);
                    color: var(--neutral-700);
                }

                .btn-secondary:hover {
                    background: var(--neutral-300);
                }

                .btn-primary {
                    background: var(--primary);
                    color: white;
                }

                .btn-primary:hover {
                    opacity: 0.9;
                }

                .btn-primary:disabled {
                    opacity: 0.5;
                    cursor: not-allowed;
                }

                /* Alert */
                .alert {
                    display: none;
                    padding: 14px 16px;
                    border-radius: var(--border-radius);
                    margin-bottom: 20px;
                    align-items: center;
                    gap: 12px;
                    max-width: 900px;
                }

                .alert.active {
                    display: flex;
                }

                .alert-error {
                    background: rgba(197, 48, 48, 0.1);
                    border: 1px solid var(--danger);
                    color: var(--danger);
                }

                .alert-success {
                    background: rgba(56, 161, 105, 0.1);
                    border: 1px solid var(--success);
                    color: var(--success);
                }

                .alert-icon {
                    font-size: 18px;
                }

                .alert-content {
                    flex: 1;
                }

                .alert-title {
                    font-weight: 600;
                    font-size: 14px;
                }

                .alert-message {
                    font-size: 13px;
                    margin-top: 2px;
                }

                .btn-close-alert {
                    background: none;
                    border: none;
                    cursor: pointer;
                    color: inherit;
                    opacity: 0.7;
                }

                .btn-close-alert:hover {
                    opacity: 1;
                }

                /* Success Modal */
                .modal-overlay {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background: rgba(0, 0, 0, 0.5);
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
                    flex-wrap: wrap;
                }

                /* Dark Mode */
                [data-theme="dark"] .form-section,
                [data-theme="dark"] .modal {
                    background: var(--neutral-200);
                    border-color: var(--neutral-300);
                }

                [data-theme="dark"] .form-input,
                [data-theme="dark"] .form-select,
                [data-theme="dark"] .form-textarea {
                    background: var(--neutral-100);
                    border-color: var(--neutral-400);
                    color: var(--neutral-800);
                }

                [data-theme="dark"] .upload-zone {
                    border-color: var(--neutral-400);
                }

                [data-theme="dark"] .modal-icon {
                    background: rgba(56, 161, 105, 0.2);
                }

                /* Responsive */
                @media (max-width: 768px) {
                    .form-grid {
                        grid-template-columns: 1fr;
                    }

                    .form-actions {
                        flex-direction: column-reverse;
                    }

                    .btn {
                        width: 100%;
                        justify-content: center;
                    }

                    .modal-actions {
                        flex-direction: column;
                    }

                    .modal-actions .btn {
                        width: 100%;
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
                            <jsp:param name="pageTitle" value="Add New Customer" />
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

                        <form id="customerForm" action="${pageContext.request.contextPath}/customer" method="POST">
                            <!-- SECTION 1: BASIC CUSTOMER DETAILS -->
                            <div class="form-section">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">Basic Customer Details</h2>
                                        <p class="section-subtitle">Primary identification information</p>
                                    </div>
                                </div>

                                <div class="form-grid">
                                    <div class="form-group full-width">
                                        <label class="form-label">Full Name (as per ID) <span
                                                class="required">*</span></label>
                                        <input type="text" class="form-input" id="fullName" name="fullName"
                                            placeholder="Enter customer's full name" required>
                                        <span class="form-error">Please enter the full name</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Gender <span class="required">*</span></label>
                                        <div class="radio-group">
                                            <label class="radio-item">
                                                <input type="radio" name="gender" value="male" required>
                                                <span class="radio-label">Male</span>
                                            </label>
                                            <label class="radio-item">
                                                <input type="radio" name="gender" value="female">
                                                <span class="radio-label">Female</span>
                                            </label>
                                            <label class="radio-item">
                                                <input type="radio" name="gender" value="other">
                                                <span class="radio-label">Other</span>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Date of Birth <span class="required">*</span></label>
                                        <div style="display: flex; gap: 12px; align-items: center;">
                                            <input type="date" class="form-input" id="dob" name="dob" required
                                                style="flex: 1;">
                                            <div id="ageDisplay"
                                                style="padding: 10px 14px; background: var(--neutral-100); border: 1px solid var(--neutral-300); border-radius: var(--border-radius); font-size: 14px; color: var(--neutral-600); white-space: nowrap; display: none;">
                                                Age: <span id="ageValue"
                                                    style="font-weight: 600; color: var(--neutral-800);">--</span> years
                                            </div>
                                        </div>
                                        <span class="form-error">Please select date of birth</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Mobile Number <span class="required">*</span></label>
                                        <input type="tel" class="form-input" id="mobile" name="mobile"
                                            placeholder="10-digit mobile number" maxlength="10" required>
                                        <span class="form-error">Please enter a valid 10-digit mobile number</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Email Address</label>
                                        <input type="email" class="form-input" id="email" name="email"
                                            placeholder="customer@example.com">
                                        <span class="form-helper">Optional but recommended for notifications</span>
                                    </div>
                                </div>
                            </div>

                            <!-- SECTION 2: ADDRESS DETAILS -->
                            <div class="form-section">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">Address Details</h2>
                                        <p class="section-subtitle">Residential address for communication</p>
                                    </div>
                                </div>

                                <div class="form-grid">
                                    <div class="form-group full-width">
                                        <label class="form-label">Address Line 1 <span class="required">*</span></label>
                                        <input type="text" class="form-input" id="address1" name="address1"
                                            placeholder="House/Flat No., Building Name, Street" required>
                                        <span class="form-error">Please enter address</span>
                                    </div>

                                    <div class="form-group full-width">
                                        <label class="form-label">Address Line 2</label>
                                        <input type="text" class="form-input" id="address2" name="address2"
                                            placeholder="Landmark, Area (optional)">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">City <span class="required">*</span></label>
                                        <input type="text" class="form-input" id="city" name="city"
                                            placeholder="Enter city" required>
                                        <span class="form-error">Please enter city</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">State <span class="required">*</span></label>
                                        <select class="form-select" id="state" name="state" required>
                                            <option value="">Select State</option>
                                            <option value="AP">Andhra Pradesh</option>
                                            <option value="AR">Arunachal Pradesh</option>
                                            <option value="AS">Assam</option>
                                            <option value="BR">Bihar</option>
                                            <option value="CG">Chhattisgarh</option>
                                            <option value="GA">Goa</option>
                                            <option value="GJ">Gujarat</option>
                                            <option value="HR">Haryana</option>
                                            <option value="HP">Himachal Pradesh</option>
                                            <option value="JH">Jharkhand</option>
                                            <option value="KA">Karnataka</option>
                                            <option value="KL">Kerala</option>
                                            <option value="MP">Madhya Pradesh</option>
                                            <option value="MH">Maharashtra</option>
                                            <option value="MN">Manipur</option>
                                            <option value="ML">Meghalaya</option>
                                            <option value="MZ">Mizoram</option>
                                            <option value="NL">Nagaland</option>
                                            <option value="OD">Odisha</option>
                                            <option value="PB">Punjab</option>
                                            <option value="RJ">Rajasthan</option>
                                            <option value="SK">Sikkim</option>
                                            <option value="TN">Tamil Nadu</option>
                                            <option value="TS">Telangana</option>
                                            <option value="TR">Tripura</option>
                                            <option value="UP">Uttar Pradesh</option>
                                            <option value="UK">Uttarakhand</option>
                                            <option value="WB">West Bengal</option>
                                            <option value="DL">Delhi</option>
                                        </select>
                                        <span class="form-error">Please select state</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Pincode <span class="required">*</span></label>
                                        <input type="text" class="form-input" id="pincode" name="pincode"
                                            placeholder="6-digit pincode" maxlength="6" required>
                                        <span class="form-error">Please enter valid 6-digit pincode</span>
                                    </div>
                                </div>
                            </div>

                            <!-- SECTION 3: KYC DETAILS -->
                            <div class="form-section">
                                <div class="section-header">
                                    <div class="section-icon">
                                        <i class="fas fa-id-card"></i>
                                    </div>
                                    <div>
                                        <h2 class="section-title">KYC Details</h2>
                                        <p class="section-subtitle">Identity verification information</p>
                                    </div>
                                </div>

                                <div class="form-grid">
                                    <div class="form-group">
                                        <label class="form-label">ID Proof Type <span class="required">*</span></label>
                                        <select class="form-select" id="idProofType" name="idProofType" required>
                                            <option value="">Select ID Type</option>
                                            <option value="aadhaar">Aadhaar Card</option>
                                            <option value="pan">PAN Card</option>
                                            <option value="passport">Passport</option>
                                            <option value="voter">Voter ID</option>
                                            <option value="driving">Driving License</option>
                                        </select>
                                        <span class="form-error">Please select ID proof type</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">ID Proof Number <span
                                                class="required">*</span></label>
                                        <input type="text" class="form-input" id="idProofNumber" name="idProofNumber"
                                            placeholder="Enter ID number" required>
                                        <span class="form-error">Please enter ID proof number</span>
                                    </div>

                                    <div class="form-group full-width">
                                        <label class="form-label">Upload ID Proof (Optional)</label>
                                        <div class="upload-zone"
                                            onclick="document.getElementById('idProofFile').click()">
                                            <i class="fas fa-cloud-upload-alt upload-icon"></i>
                                            <div class="upload-text">Click to upload or drag and drop</div>
                                            <div class="upload-hint">PDF, JPG, PNG (Max 5MB)</div>
                                        </div>
                                        <input type="file" id="idProofFile" name="idProofFile" style="display: none;"
                                            accept=".pdf,.jpg,.jpeg,.png"
                                            onchange="handleFileUpload(this, 'idProofFiles')">
                                        <div id="idProofFiles"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- SECTION 4: ADDITIONAL DETAILS (COLLAPSIBLE) -->
                            <div class="form-section">
                                <div class="collapsible-header" onclick="toggleCollapsible('additionalDetails')">
                                    <div style="display: flex; align-items: center; gap: 12px;">
                                        <div class="section-icon">
                                            <i class="fas fa-info-circle"></i>
                                        </div>
                                        <div>
                                            <h2 class="section-title">Additional Details</h2>
                                            <p class="section-subtitle">Optional information (not mandatory)</p>
                                        </div>
                                    </div>
                                    <div class="collapsible-toggle">
                                        <span>Expand</span>
                                        <i class="fas fa-chevron-down toggle-icon"></i>
                                    </div>
                                </div>

                                <div class="collapsible-content" id="additionalDetails">
                                    <div class="form-grid">
                                        <div class="form-group">
                                            <label class="form-label">Occupation</label>
                                            <select class="form-select" id="occupation" name="occupation">
                                                <option value="">Select Occupation</option>
                                                <option value="salaried">Salaried</option>
                                                <option value="self-employed">Self Employed</option>
                                                <option value="business">Business Owner</option>
                                                <option value="professional">Professional</option>
                                                <option value="retired">Retired</option>
                                                <option value="homemaker">Homemaker</option>
                                                <option value="student">Student</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Annual Income Range</label>
                                            <select class="form-select" id="incomeRange" name="incomeRange">
                                                <option value="">Select Income Range</option>
                                                <option value="below-3">Below ₹3 Lakhs</option>
                                                <option value="3-5">₹3 - 5 Lakhs</option>
                                                <option value="5-10">₹5 - 10 Lakhs</option>
                                                <option value="10-25">₹10 - 25 Lakhs</option>
                                                <option value="25-50">₹25 - 50 Lakhs</option>
                                                <option value="above-50">Above ₹50 Lakhs</option>
                                            </select>
                                        </div>

                                        <div class="form-group full-width">
                                            <label class="form-label">Notes / Remarks by Agent</label>
                                            <textarea class="form-textarea" id="notes" name="notes"
                                                placeholder="Any additional notes about this customer..."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- FORM ACTIONS -->
                            <div class="form-actions">
                                <button type="button" class="btn btn-secondary" onclick="cancelForm()">
                                    <i class="fas fa-times"></i> Cancel
                                </button>
                                <button type="submit" class="btn btn-primary" id="submitBtn">
                                    <i class="fas fa-check"></i> Save Customer
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
                <h3 class="modal-title">Customer Added Successfully!</h3>
                <p class="modal-message">The customer has been registered and is ready for policy assignment.</p>
                <div class="modal-actions">
                    <button class="btn btn-secondary" onclick="addAnother()">
                        <i class="fas fa-user-plus"></i> Add Another Customer
                    </button>
                    <button class="btn btn-primary" onclick="addPolicyForCustomer()">
                        <i class="fas fa-file-contract"></i> Add Policy for Customer
                    </button>
                    <button class="btn btn-secondary" onclick="goToDashboard()">
                        <i class="fas fa-tachometer-alt"></i> Go to Dashboard
                    </button>
                </div>
            </div>
        </div>

        <%-- Common Scripts --%>
            <jsp:include page="includes/common-scripts.jsp" />

            <script>
                // ===== GLOBAL FUNCTIONS =====

                // Collapsible toggle
                function toggleCollapsible(id) {
                    const content = document.getElementById(id);
                    const toggle = content.previousElementSibling.querySelector('.collapsible-toggle span');
                    content.classList.toggle('active');
                    toggle.textContent = content.classList.contains('active') ? 'Collapse' : 'Expand';
                }

                // File upload
                function handleFileUpload(input, containerId) {
                    const files = input.files;
                    const container = document.getElementById(containerId);

                    for (let file of files) {
                        if (file.size > 5 * 1024 * 1024) {
                            showError('File size must be less than 5MB: ' + file.name);
                            continue;
                        }

                        const fileItem = document.createElement('div');
                        fileItem.className = 'uploaded-file-item';
                        fileItem.innerHTML = `
                    <div class="file-info">
                        <i class="fas fa-file file-icon"></i>
                        <div>
                            <div class="file-name">${'$'}{file.name}</div>
                            <div class="file-size">${'$'}{formatFileSize(file.size)}</div>
                        </div>
                    </div>
                    <button type="button" class="btn-remove-file" onclick="this.parentElement.remove()">
                        <i class="fas fa-trash"></i>
                    </button>
                `;
                        container.appendChild(fileItem);
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
                    document.getElementById('customerForm').reset();
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                }

                function addPolicyForCustomer() {
                    window.location.href = 'add-policy.jsp';
                }

                function goToDashboard() {
                    window.location.href = 'agent-dashboard.jsp';
                }

                // Validation
                function validateForm() {
                    let isValid = true;
                    const requiredFields = document.querySelectorAll('[required]');

                    requiredFields.forEach(field => {
                        if (!field.value.trim() && field.type !== 'radio') {
                            field.classList.add('error');
                            isValid = false;
                        } else {
                            field.classList.remove('error');
                        }
                    });

                    // Check radio buttons
                    const genderSelected = document.querySelector('input[name="gender"]:checked');
                    if (!genderSelected) {
                        showError('Please select gender');
                        isValid = false;
                    }

                    // Validate mobile
                    const mobile = document.getElementById('mobile').value;
                    if (!/^[0-9]{10}$/.test(mobile)) {
                        showError('Please enter a valid 10-digit mobile number');
                        document.getElementById('mobile').classList.add('error');
                        isValid = false;
                    }

                    // Validate pincode
                    const pincode = document.getElementById('pincode').value;
                    if (!/^[0-9]{6}$/.test(pincode)) {
                        showError('Please enter a valid 6-digit pincode');
                        document.getElementById('pincode').classList.add('error');
                        isValid = false;
                    }

                    // Validate email if provided
                    const email = document.getElementById('email').value;
                    if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                        showError('Please enter a valid email address');
                        document.getElementById('email').classList.add('error');
                        isValid = false;
                    }

                    // Validate DOB (cannot be future)
                    const dob = new Date(document.getElementById('dob').value);
                    const today = new Date();
                    today.setHours(0, 0, 0, 0);
                    if (dob >= today) {
                        showError('Date of birth cannot be today or in the future');
                        document.getElementById('dob').classList.add('error');
                        isValid = false;
                    }

                    return isValid;
                }

                // ===== DOM READY =====
                document.addEventListener('DOMContentLoaded', function () {

                    // Show success popup after customer is saved
                    const urlParams = new URLSearchParams(window.location.search);

                    if (urlParams.get('success') === 'true') {
                        document.getElementById('successModal').classList.add('active');
                    }

                    // Set max date for DOB (today)
                    const today = new Date().toISOString().split('T')[0];
                    document.getElementById('dob').setAttribute('max', today);

                    // Form submission
                    document.getElementById('customerForm').addEventListener('submit', function (e) {

                        if (!validateForm()) {
                            e.preventDefault();
                            return;
                        }

                        const submitBtn = document.getElementById('submitBtn');
                        submitBtn.disabled = true;
                        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
                    });

                    // Auto-capitalize name (Title Case)
                    document.getElementById('fullName').addEventListener('input', function () {
                        this.value = this.value.replace(/\b\w/g, c => c.toUpperCase());
                    });

                    // Calculate and display age from DOB
                    document.getElementById('dob').addEventListener('change', function () {
                        const dob = new Date(this.value);
                        const today = new Date();
                        let age = today.getFullYear() - dob.getFullYear();
                        const monthDiff = today.getMonth() - dob.getMonth();
                        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
                            age--;
                        }
                        if (age >= 0 && age < 150) {
                            document.getElementById('ageValue').textContent = age;
                            document.getElementById('ageDisplay').style.display = 'block';
                        } else {
                            document.getElementById('ageDisplay').style.display = 'none';
                        }
                    });

                    // Mobile number - only digits
                    document.getElementById('mobile').addEventListener('input', function () {
                        this.value = this.value.replace(/[^0-9]/g, '');
                    });

                    // Pincode - only digits
                    document.getElementById('pincode').addEventListener('input', function () {
                        this.value = this.value.replace(/[^0-9]/g, '');
                    });

                    // ID number format hint based on type
                    document.getElementById('idProofType').addEventListener('change', function () {
                        const idInput = document.getElementById('idProofNumber');
                        switch (this.value) {
                            case 'aadhaar':
                                idInput.placeholder = '12-digit Aadhaar number';
                                idInput.maxLength = 12;
                                break;
                            case 'pan':
                                idInput.placeholder = 'e.g., ABCDE1234F';
                                idInput.maxLength = 10;
                                break;
                            case 'passport':
                                idInput.placeholder = 'e.g., A1234567';
                                idInput.maxLength = 8;
                                break;
                            case 'voter':
                                idInput.placeholder = 'e.g., ABC1234567';
                                idInput.maxLength = 10;
                                break;
                            case 'driving':
                                idInput.placeholder = 'e.g., MH12 20210012345';
                                idInput.maxLength = 16;
                                break;
                            default:
                                idInput.placeholder = 'Enter ID number';
                                idInput.maxLength = 20;
                        }
                    });
                });
            </script>
    </body>

    </html>