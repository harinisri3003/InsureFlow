<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="includes/auth-check.jsp" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agent Dashboard | Investment Tracker</title>

        <%-- Common Styles --%>
            <jsp:include page="includes/common-styles.jsp" />

            <style>
                /* Dashboard-specific styles */
                .logo {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                }

                .logo-icon {
                    width: 36px;
                    height: 36px;
                    background: linear-gradient(135deg, var(--primary), var(--secondary));
                    border-radius: 8px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: white;
                    font-size: 18px;
                }

                .logo-text h1 {
                    font-size: 18px;
                    font-weight: 700;
                    color: var(--primary);
                    margin: 0;
                }

                .logo-text p {
                    font-size: 11px;
                    color: var(--neutral-500);
                    margin: 0;
                }

                .notification-bell {
                    position: relative;
                    width: 36px;
                    height: 36px;
                    background: var(--neutral-100);
                    border: 1px solid var(--neutral-300);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    cursor: pointer;
                    transition: var(--transition);
                }

                .notification-bell:hover {
                    background: var(--neutral-200);
                }

                .notification-bell .notification-count {
                    position: absolute;
                    top: -4px;
                    right: -4px;
                    background: var(--danger);
                    color: white;
                    font-size: 11px;
                    font-weight: 600;
                    padding: 2px 6px;
                    border-radius: 10px;
                    min-width: 18px;
                    text-align: center;
                }

                .quick-actions {
                    display: flex;
                    gap: 12px;
                    margin-bottom: 24px;
                    flex-wrap: wrap;
                }

                .btn-action {
                    padding: 10px 20px;
                    background: white;
                    color: var(--neutral-700);
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    font-size: 14px;
                    font-weight: 500;
                    cursor: pointer;
                    transition: var(--transition);
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .btn-action:hover {
                    background: var(--neutral-100);
                    border-color: var(--accent);
                    color: var(--accent);
                }

                .btn-action.secondary {
                    background: var(--neutral-100);
                }

                .summary-section {
                    margin-bottom: 24px;
                }

                .section-header {
                    margin-bottom: 16px;
                }

                .section-title {
                    font-size: 18px;
                    font-weight: 600;
                    color: var(--neutral-800);
                    margin-bottom: 4px;
                }

                .section-subtitle {
                    font-size: 13px;
                    color: var(--neutral-500);
                }

                .summary-cards {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                    gap: 16px;
                }

                .summary-card {
                    background: white;
                    border-radius: var(--border-radius);
                    padding: 20px;
                    border: 1px solid var(--neutral-300);
                    transition: var(--transition);
                }

                .summary-card:hover {
                    box-shadow: var(--box-shadow-hover);
                }

                .summary-card.critical {
                    border-left: 4px solid var(--danger);
                }

                .summary-card.warning {
                    border-left: 4px solid var(--warning);
                }

                .summary-card.success {
                    border-left: 4px solid var(--success);
                }

                .summary-card.default {
                    border-left: 4px solid var(--accent);
                }

                .card-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-start;
                    margin-bottom: 12px;
                }

                .card-title {
                    font-size: 14px;
                    font-weight: 500;
                    color: var(--neutral-600);
                }

                .card-icon {
                    width: 40px;
                    height: 40px;
                    border-radius: 6px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 18px;
                    color: var(--primary);
                    background: var(--neutral-100);
                }

                .card-value {
                    font-size: 28px;
                    font-weight: 600;
                    color: var(--neutral-800);
                    margin-bottom: 4px;
                }

                .card-change {
                    font-size: 13px;
                    color: var(--neutral-500);
                }

                .card-change.positive {
                    color: var(--success);
                }

                .card-change.negative {
                    color: var(--danger);
                }

                .text-danger {
                    color: var(--danger);
                }

                .text-warning {
                    color: var(--warning);
                }

                .alerts-section {
                    margin-bottom: 24px;
                }

                .alert-tabs {
                    display: flex;
                    gap: 4px;
                    margin-bottom: 16px;
                    border-bottom: 1px solid var(--neutral-300);
                    padding-bottom: 4px;
                }

                .alert-tab {
                    padding: 8px 16px;
                    background: none;
                    border: none;
                    font-size: 14px;
                    font-weight: 500;
                    color: var(--neutral-600);
                    cursor: pointer;
                    position: relative;
                    transition: var(--transition);
                }

                .alert-tab:hover {
                    color: var(--primary);
                }

                .alert-tab.active {
                    color: var(--primary);
                    font-weight: 600;
                }

                .alert-tab.active::after {
                    content: '';
                    position: absolute;
                    bottom: -5px;
                    left: 0;
                    width: 100%;
                    height: 2px;
                    background: var(--accent);
                }

                .alert-cards {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                    gap: 16px;
                }

                .alert-card {
                    background: white;
                    border-radius: var(--border-radius);
                    padding: 16px;
                    border: 1px solid var(--neutral-300);
                    border-left-width: 4px;
                    transition: var(--transition);
                }

                .alert-card:hover {
                    box-shadow: var(--box-shadow);
                }

                .alert-card.overdue {
                    border-left-color: var(--danger);
                }

                .alert-card.due-today {
                    border-left-color: var(--warning);
                }

                .alert-card.upcoming {
                    border-left-color: var(--accent);
                }

                .alert-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 12px;
                }

                .alert-title {
                    font-size: 16px;
                    font-weight: 600;
                    color: var(--neutral-800);
                }

                .alert-badge {
                    padding: 4px 10px;
                    border-radius: 12px;
                    font-size: 11px;
                    font-weight: 600;
                    text-transform: uppercase;
                }

                .alert-badge.danger {
                    background: rgba(197, 48, 48, 0.1);
                    color: var(--danger);
                }

                .alert-badge.warning {
                    background: rgba(214, 158, 46, 0.1);
                    color: var(--warning);
                }

                .alert-badge.info {
                    background: rgba(49, 130, 206, 0.1);
                    color: var(--accent);
                }

                .alert-content {
                    display: grid;
                    grid-template-columns: repeat(3, 1fr);
                    gap: 8px;
                    margin-bottom: 12px;
                }

                .alert-field {
                    font-size: 13px;
                }

                .field-label {
                    color: var(--neutral-500);
                    display: block;
                    margin-bottom: 2px;
                }

                .field-value {
                    color: var(--neutral-800);
                    font-weight: 500;
                }

                .alert-actions {
                    display: flex;
                    gap: 8px;
                }

                .btn-sm {
                    padding: 6px 12px;
                    background: white;
                    color: var(--neutral-700);
                    border: 1px solid var(--neutral-300);
                    border-radius: 4px;
                    font-size: 12px;
                    font-weight: 500;
                    cursor: pointer;
                    transition: var(--transition);
                }

                .btn-sm:hover {
                    background: var(--neutral-100);
                }

                .btn-success {
                    background: var(--success);
                    color: white;
                    border-color: var(--success);
                }

                .btn-success:hover {
                    background: #2f855a;
                }

                /* Dark mode */
                [data-theme="dark"] .summary-card,
                [data-theme="dark"] .alert-card {
                    background: var(--neutral-200);
                    border-color: var(--neutral-300);
                }

                [data-theme="dark"] .card-icon {
                    background: var(--neutral-300);
                }

                [data-theme="dark"] .notification-bell {
                    background: var(--neutral-300);
                    border-color: var(--neutral-400);
                }

                [data-theme="dark"] .btn-action {
                    background: var(--neutral-200);
                    border-color: var(--neutral-400);
                    color: var(--neutral-700);
                }

                [data-theme="dark"] .btn-action:hover {
                    background: var(--neutral-300);
                    border-color: var(--accent);
                    color: var(--accent);
                }

                [data-theme="dark"] .btn-action.secondary {
                    background: var(--neutral-300);
                    border-color: var(--neutral-400);
                    color: var(--neutral-700);
                }

                /* Responsive */
                @media (max-width: 768px) {
                    .summary-cards {
                        grid-template-columns: 1fr;
                    }

                    .alert-cards {
                        grid-template-columns: 1fr;
                    }

                    .alert-content {
                        grid-template-columns: 1fr;
                    }
                }

                /* Print styles */
                @media print {

                    .sidebar,
                    .header,
                    .quick-actions,
                    .notification-bell,
                    .btn-logout,
                    .theme-toggle,
                    .alert-actions,
                    .btn-sm {
                        display: none !important;
                    }

                    .main-content {
                        margin-left: 0;
                        margin-top: 0;
                    }

                    body {
                        background: white !important;
                        color: black !important;
                    }

                    .summary-card,
                    .alert-card {
                        break-inside: avoid;
                        page-break-inside: avoid;
                    }
                }
            </style>
    </head>

    <body>
        <div class="dashboard-container">
            <%-- Sidebar --%>
                <jsp:include page="includes/sidebar-agent.jsp" />

                <div class="main-content">
                    <%--Header with custom logo for dashboard --%>
                        <header class="header">
                            <div class="header-left">
                                <button class="menu-toggle" id="menuToggle" aria-label="Toggle menu">
                                    <i class="fas fa-bars"></i>
                                </button>

                                <div class="logo">
                                    <div class="logo-icon">
                                        <i class="fas fa-shield-alt"></i>
                                    </div>
                                    <div class="logo-text">
                                        <h1>Investment Tracker</h1>
                                        <p>Insurance System</p>
                                    </div>
                                </div>

                                <h2 class="page-title">Agent Dashboard</h2>
                            </div>

                            <% String agentName=(String) session.getAttribute("agentName"); if (agentName==null)
                                agentName="John Smith" ; String agentId=(String) session.getAttribute("agentId"); if
                                (agentId==null) agentId="AGT-0001" ; String avatarInitial=agentName.substring(0,
                                1).toUpperCase(); %>

                                <div class="header-right">
                                    <button class="theme-toggle" id="themeToggle" aria-label="Toggle dark mode">
                                        <i class="fas fa-moon" id="themeIcon"></i>
                                        <span id="themeLabel">Dark</span>
                                    </button>

                                    <div class="notification-bell" aria-label="Notifications" title="3 notifications">
                                        <i class="far fa-bell"></i>
                                        <span class="notification-count">3</span>
                                    </div>

                                    <div class="agent-info">
                                        <div class="agent-avatar">
                                            <%= avatarInitial %>
                                        </div>
                                        <div class="agent-details">
                                            <h3>
                                                <%= agentName %>
                                            </h3>
                                            <p>Agent ID: <%= agentId %>
                                            </p>
                                        </div>
                                    </div>

                                    <button class="btn-logout" onclick="location.href='logout.jsp'" aria-label="Logout">
                                        <i class="fas fa-sign-out-alt"></i>
                                        <span>Logout</span>
                                    </button>
                                </div>
                        </header>

                        <!-- QUICK ACTIONS -->
                        <section class="quick-actions" aria-label="Quick actions">
                            <button class="btn-action" onclick="location.href='add-customer.jsp'">
                                <i class="fas fa-user-plus"></i> New Customer
                            </button>
                            <button class="btn-action" onclick="location.href='add-policy.jsp'">
                                <i class="fas fa-file-contract"></i> New Policy
                            </button>
                            <button class="btn-action secondary" onclick="location.href='reports.jsp'">
                                <i class="fas fa-chart-bar"></i> View Reports
                            </button>
                            <button class="btn-action secondary" onclick="window.print()">
                                <i class="fas fa-print"></i> Print Summary
                            </button>
                        </section>

                        <!-- SUMMARY CARDS -->
                        <section class="summary-section" aria-label="Performance metrics">
                            <div class="section-header">
                                <h3 class="section-title">Performance Overview</h3>
                                <p class="section-subtitle">Key metrics for today</p>
                            </div>

                            <div class="summary-cards">
                                <div class="summary-card default">
                                    <div class="card-header">
                                        <h4 class="card-title">Total Customers</h4>
                                        <div class="card-icon">
                                            <i class="fas fa-users"></i>
                                        </div>
                                    </div>
                                    <div class="card-value">156</div>
                                    <div class="card-change positive">
                                        <i class="fas fa-arrow-up"></i> 12% from last month
                                    </div>
                                </div>

                                <div class="summary-card default">
                                    <div class="card-header">
                                        <h4 class="card-title">Active Policies</h4>
                                        <div class="card-icon">
                                            <i class="fas fa-file-contract"></i>
                                        </div>
                                    </div>
                                    <div class="card-value">89</div>
                                    <div class="card-change positive">
                                        <i class="fas fa-arrow-up"></i> 5 new this week
                                    </div>
                                </div>

                                <div class="summary-card critical">
                                    <div class="card-header">
                                        <h4 class="card-title">Due Today</h4>
                                        <div class="card-icon">
                                            <i class="fas fa-exclamation-triangle text-danger"></i>
                                        </div>
                                    </div>
                                    <div class="card-value">7</div>
                                    <div class="card-change negative">
                                        <i class="fas fa-clock text-danger"></i> Requires attention
                                    </div>
                                </div>

                                <div class="summary-card warning">
                                    <div class="card-header">
                                        <h4 class="card-title">Due in 7 Days</h4>
                                        <div class="card-icon">
                                            <i class="fas fa-calendar-week text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="card-value">15</div>
                                    <div class="card-change">
                                        <i class="fas fa-clock text-warning"></i> Schedule follow-ups
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- PREMIUM ALERTS -->
                        <section class="alerts-section">
                            <div class="section-header">
                                <h3 class="section-title">Premium Alerts</h3>
                                <p class="section-subtitle">Track and manage premium payments</p>
                            </div>

                            <div class="alert-tabs" role="tablist">
                                <button class="alert-tab active" data-tab="overdue" role="tab"
                                    aria-selected="true">Overdue</button>
                                <button class="alert-tab" data-tab="due-today" role="tab" aria-selected="false">Due
                                    Today</button>
                                <button class="alert-tab" data-tab="upcoming" role="tab" aria-selected="false">Upcoming
                                    (7 Days)</button>
                            </div>

                            <!-- Overdue Premiums -->
                            <div class="alert-cards" id="overdue-tab" role="tabpanel" style="display: grid;">
                                <div class="alert-card overdue">
                                    <div class="alert-header">
                                        <h4 class="alert-title">Rahul Sharma</h4>
                                        <span class="alert-badge danger">Overdue - 3 days</span>
                                    </div>
                                    <div class="alert-content">
                                        <div class="alert-field">
                                            <span class="field-label">Policy No:</span>
                                            <span class="field-value">POL-2023-8765</span>
                                        </div>
                                        <div class="alert-field">
                                            <span class="field-label">Due Date:</span>
                                            <span class="field-value">Jan 13, 2026</span>
                                        </div>
                                        <div class="alert-field">
                                            <span class="field-label">Amount:</span>
                                            <span class="field-value">₹12,500</span>
                                        </div>
                                    </div>
                                    <div class="alert-actions">
                                        <button class="btn-sm btn-success">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm">
                                            <i class="fas fa-eye"></i> View
                                        </button>
                                    </div>
                                </div>

                                <div class="alert-card overdue">
                                    <div class="alert-header">
                                        <h4 class="alert-title">Priya Patel</h4>
                                        <span class="alert-badge danger">Overdue - 1 day</span>
                                    </div>
                                    <div class="alert-content">
                                        <div class="alert-field">
                                            <span class="field-label">Policy No:</span>
                                            <span class="field-value">POL-2023-9210</span>
                                        </div>
                                        <div class="alert-field">
                                            <span class="field-label">Due Date:</span>
                                            <span class="field-value">Jan 15, 2026</span>
                                        </div>
                                        <div class="alert-field">
                                            <span class="field-label">Amount:</span>
                                            <span class="field-value">₹8,300</span>
                                        </div>
                                    </div>
                                    <div class="alert-actions">
                                        <button class="btn-sm btn-success">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm">
                                            <i class="fas fa-eye"></i> View
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- Due Today -->
                            <div class="alert-cards" id="due-today-tab" role="tabpanel" style="display: none;">
                                <div class="alert-card due-today">
                                    <div class="alert-header">
                                        <h4 class="alert-title">Amit Kumar</h4>
                                        <span class="alert-badge warning">Due Today</span>
                                    </div>
                                    <div class="alert-content">
                                        <div class="alert-field">
                                            <span class="field-label">Policy No:</span>
                                            <span class="field-value">POL-2024-1123</span>
                                        </div>
                                        <div class=alert-field">
                                            <span class="field-label">Due Date:</span>
                                            <span class="field-value">Jan 16, 2026</span>
                                        </div>
                                        <div class="alert-field">
                                            <span class="field-label">Amount:</span>
                                            <span class="field-value">₹15,750</span>
                                        </div>
                                    </div>
                                    <div class="alert-actions">
                                        <button class="btn-sm btn-success">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm">
                                            <i class="fas fa-eye"></i> View
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- Upcoming -->
                            <div class="alert-cards" id="upcoming-tab" role="tabpanel" style="display: none;">
                                <div class="alert-card upcoming">
                                    <div class="alert-header">
                                        <h4 class="alert-title">Neha Singh</h4>
                                        <span class="alert-badge info">Due in 5 days</span>
                                    </div>
                                    <div class="alert-content">
                                        <div class="alert-field">
                                            <span class="field-label">Policy No:</span>
                                            <span class="field-value">POL-2024-1456</span>
                                        </div>
                                        <div class="alert-field">
                                            <span class="field-label">Due Date:</span>
                                            <span class="field-value">Jan 21, 2026</span>
                                        </div>
                                        <div class="alert-field">
                                            <span class="field-label">Amount:</span>
                                            <span class="field-value">₹9,200</span>
                                        </div>
                                    </div>
                                    <div class="alert-actions">
                                        <button class="btn-sm btn-success">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm">
                                            <i class="fas fa-eye"></i> View
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- QUICK SEARCH -->
                        <section class="summary-section">
                            <div class="section-header">
                                <h3 class="section-title">Quick Search</h3>
                                <p class="section-subtitle">Find customers or policies</p>
                            </div>

                            <div class="summary-card" style="padding: 24px;">
                                <form class="search-form" onsubmit="return false;" style="display: flex; gap: 12px;">
                                    <div style="flex: 1; position: relative;">
                                        <i class="fas fa-search"
                                            style="position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: var(--neutral-500);"></i>
                                        <input type="text"
                                            style="width: 100%; padding: 10px 14px 10px 40px; border: 1px solid var(--neutral-300); border-radius: var(--border-radius); font-size: 14px; background: var(--neutral-100);"
                                            placeholder="Search by customer name, policy number, mobile..." />
                                    </div>
                                    <button type="submit" class="btn-action" style="margin: 0;">
                                        <i class="fas fa-search"></i> Search
                                    </button>
                                </form>
                            </div>
                        </section>

                        <!-- RECENT ACTIVITY -->
                        <section class="summary-section">
                            <div class="section-header">
                                <h3 class="section-title">Recent Activity</h3>
                                <p class="section-subtitle">Latest updates and actions</p>
                            </div>

                            <div class="summary-card" style="padding: 0;">
                                <div
                                    style="padding: 16px; border-bottom: 1px solid var(--neutral-200); display: flex; gap: 16px; align-items: center;">
                                    <div class="card-icon"
                                        style="background: rgba(56, 161, 105, 0.1); color: var(--success);">
                                        <i class="fas fa-check-circle"></i>
                                    </div>
                                    <div style="flex: 1;">
                                        <h4
                                            style="font-size: 14px; font-weight: 600; color: var(--neutral-800); margin: 0 0 4px 0;">
                                            Policy Payment Received
                                        </h4>
                                        <p style="font-size: 13px; color: var(--neutral-600); margin: 0;">
                                            Rahul Sharma paid ₹12,500 for POL-2023-8765
                                        </p>
                                    </div>
                                    <span style="font-size: 12px; color: var(--neutral-500); white-space: nowrap;">2
                                        hours ago</span>
                                </div>

                                <div
                                    style="padding: 16px; border-bottom: 1px solid var(--neutral-200); display: flex; gap: 16px; align-items: center;">
                                    <div class="card-icon"
                                        style="background: rgba(49, 130, 206, 0.1); color: var(--accent);">
                                        <i class="fas fa-user-plus"></i>
                                    </div>
                                    <div style="flex: 1;">
                                        <h4
                                            style="font-size: 14px; font-weight: 600; color: var(--neutral-800); margin: 0 0 4px 0;">
                                            New Customer Added
                                        </h4>
                                        <p style="font-size: 13px; color: var(--neutral-600); margin: 0;">
                                            Anjali Mehta registered as a new customer
                                        </p>
                                    </div>
                                    <span style="font-size: 12px; color: var(--neutral-500); white-space: nowrap;">5
                                        hours ago</span>
                                </div>

                                <div
                                    style="padding: 16px; border-bottom: 1px solid var(--neutral-200); display: flex; gap: 16px; align-items: center;">
                                    <div class="card-icon"
                                        style="background: rgba(49, 130, 206, 0.1); color: var(--accent);">
                                        <i class="fas fa-file-contract"></i>
                                    </div>
                                    <div style="flex: 1;">
                                        <h4
                                            style="font-size: 14px; font-weight: 600; color: var(--neutral-800); margin: 0 0 4px 0;">
                                            New Policy Created
                                        </h4>
                                        <p style="font-size: 13px; color: var(--neutral-600); margin: 0;">
                                            Life insurance policy POL-2024-3421 created for Vikram Shah
                                        </p>
                                    </div>
                                    <span style="font-size: 12px; color: var(--neutral-500); white-space: nowrap;">1 day
                                        ago</span>
                                </div>

                                <div style="padding: 16px; display: flex; gap: 16px; align-items: center;">
                                    <div class="card-icon"
                                        style="background: rgba(214, 158, 46, 0.1); color: var(--warning);">
                                        <i class="fas fa-bell"></i>
                                    </div>
                                    <div style="flex: 1;">
                                        <h4
                                            style="font-size: 14px; font-weight: 600; color: var(--neutral-800); margin: 0 0 4px 0;">
                                            Premium Reminder Sent
                                        </h4>
                                        <p style="font-size: 13px; color: var(--neutral-600); margin: 0;">
                                            Reminder sent to 15 customers for upcoming premiums
                                        </p>
                                    </div>
                                    <span style="font-size: 12px; color: var(--neutral-500); white-space: nowrap;">2
                                        days ago</span>
                                </div>
                            </div>
                        </section>
                </div>
        </div>

        <%-- Common Scripts --%>
            <jsp:include page="includes/common-scripts.jsp" />

            <script>
                // Alert tabs functionality
                const alertTabs = document.querySelectorAll('.alert-tab');
                const alertPanels = document.querySelectorAll('.alert-cards');

                alertTabs.forEach(tab => {
                    tab.addEventListener('click', () => {
                        // Remove active from all tabs
                        alertTabs.forEach(t => {
                            t.classList.remove('active');
                            t.setAttribute('aria-selected', 'false');
                        });

                        // Add active to clicked tab
                        tab.classList.add('active');
                        tab.setAttribute('aria-selected', 'true');

                        // Hide all panels
                        alertPanels.forEach(panel => {
                            panel.style.display = 'none';
                        });

                        // Show corresponding panel
                        const tabName = tab.getAttribute('data-tab');
                        document.getElementById(tabName + '-tab').style.display = 'grid';
                    });
                });
            </script>
    </body>

    </html>