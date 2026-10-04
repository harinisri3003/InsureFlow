<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="includes/auth-check.jsp" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Notifications | Investment Tracker</title>

        <%-- Common Styles --%>
            <jsp:include page="includes/common-styles.jsp" />

            <style>
                /* ===== NOTIFICATIONS PAGE STYLES ===== */

                /* Page Header */
                .page-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 24px;
                    flex-wrap: wrap;
                    gap: 16px;
                }

                .page-header-content h2 {
                    font-size: 24px;
                    font-weight: 600;
                    color: var(--neutral-800);
                    margin: 0 0 4px 0;
                }

                .page-header-content p {
                    font-size: 14px;
                    color: var(--neutral-600);
                    margin: 0;
                }

                .header-actions {
                    display: flex;
                    gap: 12px;
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

                /* ===== NOTIFICATION SUMMARY CARDS ===== */
                .summary-cards {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                    gap: 16px;
                    margin-bottom: 24px;
                }

                .summary-card {
                    background: white;
                    border-radius: var(--border-radius);
                    padding: 20px;
                    border: 1px solid var(--neutral-300);
                    cursor: pointer;
                    transition: var(--transition);
                    position: relative;
                    overflow: hidden;
                }

                .summary-card::before {
                    content: '';
                    position: absolute;
                    left: 0;
                    top: 0;
                    bottom: 0;
                    width: 4px;
                }

                .summary-card.overdue::before {
                    background: var(--danger);
                }

                .summary-card.due-today::before {
                    background: var(--warning);
                }

                .summary-card.upcoming::before {
                    background: var(--accent);
                }

                .summary-card.system::before {
                    background: var(--neutral-500);
                }

                .summary-card:hover {
                    box-shadow: var(--box-shadow-hover);
                    transform: translateY(-2px);
                }

                .summary-card.active {
                    border-color: var(--accent);
                    box-shadow: 0 0 0 2px rgba(49, 130, 206, 0.2);
                }

                .summary-card-icon {
                    width: 44px;
                    height: 44px;
                    border-radius: 8px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 20px;
                    margin-bottom: 12px;
                }

                .summary-card.overdue .summary-card-icon {
                    background: rgba(197, 48, 48, 0.1);
                    color: var(--danger);
                }

                .summary-card.due-today .summary-card-icon {
                    background: rgba(214, 158, 46, 0.1);
                    color: var(--warning);
                }

                .summary-card.upcoming .summary-card-icon {
                    background: rgba(49, 130, 206, 0.1);
                    color: var(--accent);
                }

                .summary-card.system .summary-card-icon {
                    background: var(--neutral-200);
                    color: var(--neutral-600);
                }

                .summary-card-value {
                    font-size: 32px;
                    font-weight: 700;
                    color: var(--neutral-800);
                    line-height: 1;
                    margin-bottom: 4px;
                }

                .summary-card-label {
                    font-size: 14px;
                    font-weight: 500;
                    color: var(--neutral-600);
                }

                /* ===== TABS & FILTERS SECTION ===== */
                .filters-section {
                    background: white;
                    border-radius: var(--border-radius);
                    border: 1px solid var(--neutral-300);
                    margin-bottom: 24px;
                }

                .primary-tabs {
                    display: flex;
                    border-bottom: 1px solid var(--neutral-300);
                    overflow-x: auto;
                    padding: 0 8px;
                }

                .tab-btn {
                    padding: 16px 20px;
                    background: none;
                    border: none;
                    font-size: 14px;
                    font-weight: 500;
                    color: var(--neutral-600);
                    cursor: pointer;
                    position: relative;
                    white-space: nowrap;
                    transition: var(--transition);
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .tab-btn:hover {
                    color: var(--primary);
                }

                .tab-btn.active {
                    color: var(--primary);
                    font-weight: 600;
                }

                .tab-btn.active::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    height: 3px;
                    background: var(--accent);
                    border-radius: 3px 3px 0 0;
                }

                .tab-count {
                    font-size: 12px;
                    padding: 2px 8px;
                    border-radius: 10px;
                    background: var(--neutral-200);
                    color: var(--neutral-700);
                }

                .tab-btn.active .tab-count {
                    background: rgba(49, 130, 206, 0.1);
                    color: var(--accent);
                }

                /* Secondary Filters */
                .secondary-filters {
                    padding: 16px;
                    display: none;
                }

                .secondary-filters.active {
                    display: block;
                    border-top: 1px solid var(--neutral-300);
                }

                .filter-toggle {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 12px 16px;
                    cursor: pointer;
                    background: none;
                    border: none;
                    width: 100%;
                    font-size: 14px;
                    color: var(--neutral-700);
                    transition: var(--transition);
                }

                .filter-toggle:hover {
                    background: var(--neutral-100);
                }

                .filter-toggle i {
                    transition: transform 0.2s;
                }

                .filter-toggle.active i {
                    transform: rotate(180deg);
                }

                .filter-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                    gap: 16px;
                }

                .filter-group label {
                    display: block;
                    font-size: 13px;
                    font-weight: 500;
                    color: var(--neutral-600);
                    margin-bottom: 6px;
                }

                .filter-input {
                    width: 100%;
                    padding: 10px 12px;
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    font-size: 14px;
                    background: var(--neutral-100);
                    color: var(--neutral-800);
                    transition: var(--transition);
                }

                .filter-input:focus {
                    outline: none;
                    border-color: var(--accent);
                    box-shadow: 0 0 0 3px rgba(49, 130, 206, 0.1);
                }

                /* ===== BULK ACTIONS BAR ===== */
                .bulk-actions {
                    display: none;
                    background: var(--primary);
                    color: white;
                    padding: 12px 20px;
                    border-radius: var(--border-radius);
                    margin-bottom: 16px;
                    align-items: center;
                    justify-content: space-between;
                    animation: slideDown 0.3s ease;
                }

                .bulk-actions.active {
                    display: flex;
                }

                @keyframes slideDown {
                    from {
                        opacity: 0;
                        transform: translateY(-10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .bulk-info {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                }

                .bulk-info span {
                    font-weight: 500;
                }

                .bulk-buttons {
                    display: flex;
                    gap: 8px;
                }

                .btn-bulk {
                    padding: 8px 16px;
                    border-radius: var(--border-radius);
                    font-size: 13px;
                    font-weight: 500;
                    cursor: pointer;
                    transition: var(--transition);
                    display: flex;
                    align-items: center;
                    gap: 6px;
                    border: 1px solid rgba(255, 255, 255, 0.3);
                    background: rgba(255, 255, 255, 0.1);
                    color: white;
                }

                .btn-bulk:hover {
                    background: rgba(255, 255, 255, 0.2);
                }

                .btn-bulk.clear {
                    background: transparent;
                    border-color: transparent;
                }

                /* ===== NOTIFICATIONS LIST ===== */
                .notifications-list {
                    display: flex;
                    flex-direction: column;
                    gap: 16px;
                }

                .notification-card {
                    background: white;
                    border-radius: var(--border-radius);
                    border: 1px solid var(--neutral-300);
                    transition: var(--transition);
                    overflow: hidden;
                    position: relative;
                }

                .notification-card::before {
                    content: '';
                    position: absolute;
                    left: 0;
                    top: 0;
                    bottom: 0;
                    width: 4px;
                }

                .notification-card.overdue::before {
                    background: var(--danger);
                }

                .notification-card.due-today::before {
                    background: var(--warning);
                }

                .notification-card.upcoming::before {
                    background: var(--accent);
                }

                .notification-card.system::before {
                    background: var(--neutral-500);
                }

                .notification-card:hover {
                    box-shadow: var(--box-shadow-hover);
                }

                .notification-card.selected {
                    border-color: var(--accent);
                    box-shadow: 0 0 0 2px rgba(49, 130, 206, 0.15);
                }

                .notification-content {
                    padding: 20px;
                    padding-left: 24px;
                }

                .notification-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-start;
                    margin-bottom: 12px;
                    gap: 12px;
                }

                .notification-header-left {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    flex: 1;
                }

                .notification-checkbox {
                    width: 18px;
                    height: 18px;
                    accent-color: var(--accent);
                    cursor: pointer;
                }

                .customer-name {
                    font-size: 16px;
                    font-weight: 600;
                    color: var(--neutral-800);
                    margin: 0;
                }

                .notification-badge {
                    padding: 4px 12px;
                    border-radius: 12px;
                    font-size: 11px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    white-space: nowrap;
                }

                .notification-badge.overdue {
                    background: rgba(197, 48, 48, 0.1);
                    color: var(--danger);
                }

                .notification-badge.due-today {
                    background: rgba(214, 158, 46, 0.1);
                    color: var(--warning);
                }

                .notification-badge.upcoming {
                    background: rgba(49, 130, 206, 0.1);
                    color: var(--accent);
                }

                .notification-badge.system {
                    background: var(--neutral-200);
                    color: var(--neutral-600);
                }

                .notification-body {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
                    gap: 16px;
                    margin-bottom: 16px;
                }

                .notification-field {
                    display: flex;
                    flex-direction: column;
                    gap: 2px;
                }

                .field-label {
                    font-size: 12px;
                    color: var(--neutral-500);
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .field-value {
                    font-size: 14px;
                    font-weight: 500;
                    color: var(--neutral-800);
                }

                .field-value.amount {
                    font-size: 16px;
                    font-weight: 600;
                    color: var(--primary);
                }

                .notification-message {
                    font-size: 14px;
                    color: var(--neutral-600);
                    padding: 10px 14px;
                    background: var(--neutral-100);
                    border-radius: var(--border-radius);
                    margin-bottom: 16px;
                    border-left: 3px solid;
                }

                .notification-message.overdue {
                    border-left-color: var(--danger);
                }

                .notification-message.due-today {
                    border-left-color: var(--warning);
                }

                .notification-message.upcoming {
                    border-left-color: var(--accent);
                }

                .notification-message.system {
                    border-left-color: var(--neutral-500);
                }

                .notification-footer {
                    display: flex;
                    gap: 10px;
                    flex-wrap: wrap;
                }

                /* Action Buttons */
                .btn-sm {
                    padding: 8px 16px;
                    border-radius: var(--border-radius);
                    font-size: 13px;
                    font-weight: 500;
                    cursor: pointer;
                    transition: var(--transition);
                    display: inline-flex;
                    align-items: center;
                    gap: 6px;
                    border: 1px solid var(--neutral-300);
                    background: white;
                    color: var(--neutral-700);
                }

                .btn-sm:hover {
                    background: var(--neutral-100);
                }

                .btn-sm.btn-call {
                    background: var(--accent);
                    color: white;
                    border-color: var(--accent);
                }

                .btn-sm.btn-call:hover {
                    background: #2b6cb0;
                }

                .btn-sm.btn-paid {
                    background: var(--success);
                    color: white;
                    border-color: var(--success);
                }

                .btn-sm.btn-paid:hover {
                    background: #2f855a;
                }

                .btn-sm.btn-view {
                    background: white;
                    color: var(--neutral-700);
                }

                .btn-sm.btn-snooze {
                    background: white;
                    color: var(--warning);
                    border-color: var(--warning);
                }

                .btn-sm.btn-snooze:hover {
                    background: rgba(214, 158, 46, 0.1);
                }

                /* ===== PAGINATION ===== */
                .pagination-section {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-top: 24px;
                    padding: 16px 20px;
                    background: white;
                    border-radius: var(--border-radius);
                    border: 1px solid var(--neutral-300);
                    flex-wrap: wrap;
                    gap: 16px;
                }

                .pagination-info {
                    font-size: 14px;
                    color: var(--neutral-600);
                }

                .pagination-controls {
                    display: flex;
                    gap: 4px;
                }

                .page-btn {
                    width: 36px;
                    height: 36px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    border: 1px solid var(--neutral-300);
                    background: white;
                    color: var(--neutral-700);
                    border-radius: var(--border-radius);
                    cursor: pointer;
                    font-size: 14px;
                    transition: var(--transition);
                }

                .page-btn:hover {
                    background: var(--neutral-100);
                    border-color: var(--accent);
                }

                .page-btn.active {
                    background: var(--accent);
                    color: white;
                    border-color: var(--accent);
                }

                .page-btn:disabled {
                    opacity: 0.5;
                    cursor: not-allowed;
                }

                /* ===== EMPTY STATE ===== */
                .empty-state {
                    text-align: center;
                    padding: 60px 20px;
                    background: white;
                    border-radius: var(--border-radius);
                    border: 1px solid var(--neutral-300);
                }

                .empty-state-icon {
                    width: 80px;
                    height: 80px;
                    margin: 0 auto 20px;
                    background: rgba(56, 161, 105, 0.1);
                    color: var(--success);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 36px;
                }

                .empty-state h3 {
                    font-size: 20px;
                    font-weight: 600;
                    color: var(--neutral-800);
                    margin: 0 0 8px 0;
                }

                .empty-state p {
                    font-size: 14px;
                    color: var(--neutral-600);
                    margin: 0 0 24px 0;
                }

                .empty-state-actions {
                    display: flex;
                    gap: 12px;
                    justify-content: center;
                }

                /* ===== DARK MODE ===== */
                [data-theme="dark"] .summary-card,
                [data-theme="dark"] .filters-section,
                [data-theme="dark"] .notification-card,
                [data-theme="dark"] .pagination-section,
                [data-theme="dark"] .empty-state {
                    background: var(--neutral-200);
                    border-color: var(--neutral-300);
                }

                [data-theme="dark"] .btn-action,
                [data-theme="dark"] .btn-sm {
                    background: var(--neutral-300);
                    border-color: var(--neutral-400);
                    color: var(--neutral-700);
                }

                [data-theme="dark"] .filter-input {
                    background: var(--neutral-300);
                    border-color: var(--neutral-400);
                }

                [data-theme="dark"] .notification-message {
                    background: var(--neutral-300);
                }

                [data-theme="dark"] .tab-count {
                    background: var(--neutral-300);
                }

                /* ===== RESPONSIVE ===== */
                @media (max-width: 768px) {
                    .summary-cards {
                        grid-template-columns: repeat(2, 1fr);
                    }

                    .notification-body {
                        grid-template-columns: 1fr 1fr;
                    }

                    .notification-footer {
                        flex-direction: column;
                    }

                    .notification-footer .btn-sm {
                        width: 100%;
                        justify-content: center;
                    }

                    .bulk-actions {
                        flex-direction: column;
                        gap: 12px;
                        text-align: center;
                    }

                    .bulk-buttons {
                        width: 100%;
                        justify-content: center;
                    }

                    .pagination-section {
                        flex-direction: column;
                        text-align: center;
                    }
                }

                @media (max-width: 480px) {
                    .summary-cards {
                        grid-template-columns: 1fr;
                    }

                    .primary-tabs {
                        padding: 0;
                    }

                    .tab-btn {
                        padding: 12px 14px;
                        font-size: 13px;
                    }
                }

                /* ===== ANIMATIONS ===== */
                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .notification-card {
                    animation: fadeIn 0.3s ease;
                }

                /* Toast Notifications */
                .toast {
                    position: fixed;
                    bottom: 20px;
                    right: 20px;
                    padding: 16px 20px;
                    background: var(--neutral-800);
                    color: white;
                    border-radius: var(--border-radius);
                    box-shadow: var(--box-shadow-hover);
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    z-index: 1000;
                    animation: slideInRight 0.3s ease;
                }

                .toast.success {
                    background: var(--success);
                }

                .toast.error {
                    background: var(--danger);
                }

                @keyframes slideInRight {
                    from {
                        opacity: 0;
                        transform: translateX(100px);
                    }

                    to {
                        opacity: 1;
                        transform: translateX(0);
                    }
                }

                /* ===== PRINT STYLES ===== */
                @media print {

                    .sidebar,
                    .header,
                    .bulk-actions,
                    .notification-footer,
                    .pagination-section,
                    .filter-toggle,
                    .secondary-filters {
                        display: none !important;
                    }

                    .main-content {
                        margin-left: 0;
                        margin-top: 0;
                    }

                    body {
                        background: white !important;
                    }

                    .notification-card,
                    .summary-card {
                        break-inside: avoid;
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
                        <header class="header">
                            <div class="header-left">
                                <button class="menu-toggle" id="menuToggle" aria-label="Toggle menu">
                                    <i class="fas fa-bars"></i>
                                </button>
                                <h2 class="page-title">Notifications</h2>
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

                        <!-- PAGE HEADER -->
                        <section class="page-header">
                            <div class="page-header-content">
                                <h2><i class="fas fa-bell"></i> Notifications</h2>
                                <p>Your daily work checklist — never miss a premium due or policy event</p>
                            </div>
                            <div class="header-actions">
                                <button class="btn-action" onclick="markAllRead()">
                                    <i class="fas fa-check-double"></i> Mark All Read
                                </button>
                                <button class="btn-action" onclick="window.print()">
                                    <i class="fas fa-print"></i> Print
                                </button>
                            </div>
                        </section>

                        <!-- NOTIFICATION SUMMARY CARDS -->
                        <section class="summary-cards" aria-label="Notification summary">
                            <div class="summary-card overdue active" data-filter="overdue"
                                onclick="filterByCard(this, 'overdue')">
                                <div class="summary-card-icon">
                                    <i class="fas fa-exclamation-circle"></i>
                                </div>
                                <div class="summary-card-value">5</div>
                                <div class="summary-card-label">Overdue Premiums</div>
                            </div>

                            <div class="summary-card due-today" data-filter="due-today"
                                onclick="filterByCard(this, 'due-today')">
                                <div class="summary-card-icon">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="summary-card-value">8</div>
                                <div class="summary-card-label">Due Today</div>
                            </div>

                            <div class="summary-card upcoming" data-filter="upcoming"
                                onclick="filterByCard(this, 'upcoming')">
                                <div class="summary-card-icon">
                                    <i class="fas fa-calendar-alt"></i>
                                </div>
                                <div class="summary-card-value">12</div>
                                <div class="summary-card-label">Upcoming (7 Days)</div>
                            </div>

                            <div class="summary-card system" data-filter="system"
                                onclick="filterByCard(this, 'system')">
                                <div class="summary-card-icon">
                                    <i class="fas fa-cog"></i>
                                </div>
                                <div class="summary-card-value">3</div>
                                <div class="summary-card-label">System Updates</div>
                            </div>
                        </section>

                        <!-- TABS & FILTERS -->
                        <section class="filters-section">
                            <!-- Primary Tabs -->
                            <div class="primary-tabs" role="tablist">
                                <button class="tab-btn active" data-tab="all" role="tab" onclick="switchTab('all')">
                                    All <span class="tab-count">28</span>
                                </button>
                                <button class="tab-btn" data-tab="overdue" role="tab" onclick="switchTab('overdue')">
                                    Overdue <span class="tab-count">5</span>
                                </button>
                                <button class="tab-btn" data-tab="due-today" role="tab"
                                    onclick="switchTab('due-today')">
                                    Due Today <span class="tab-count">8</span>
                                </button>
                                <button class="tab-btn" data-tab="upcoming" role="tab" onclick="switchTab('upcoming')">
                                    Upcoming <span class="tab-count">12</span>
                                </button>
                                <button class="tab-btn" data-tab="system" role="tab" onclick="switchTab('system')">
                                    System <span class="tab-count">3</span>
                                </button>
                            </div>

                            <!-- Filter Toggle -->
                            <button class="filter-toggle" id="filterToggle" onclick="toggleFilters()">
                                <span><i class="fas fa-filter"></i> Advanced Filters</span>
                                <i class="fas fa-chevron-down"></i>
                            </button>

                            <!-- Secondary Filters (Collapsible) -->
                            <div class="secondary-filters" id="secondaryFilters">
                                <div class="filter-grid">
                                    <div class="filter-group">
                                        <label for="filterDateFrom">Date From</label>
                                        <input type="date" id="filterDateFrom" class="filter-input">
                                    </div>
                                    <div class="filter-group">
                                        <label for="filterDateTo">Date To</label>
                                        <input type="date" id="filterDateTo" class="filter-input">
                                    </div>
                                    <div class="filter-group">
                                        <label for="filterPolicyType">Policy Type</label>
                                        <select id="filterPolicyType" class="filter-input">
                                            <option value="">All Types</option>
                                            <option value="life">Life Insurance</option>
                                            <option value="health">Health Insurance</option>
                                            <option value="vehicle">Vehicle Insurance</option>
                                            <option value="property">Property Insurance</option>
                                        </select>
                                    </div>
                                    <div class="filter-group">
                                        <label for="filterCustomer">Customer Name</label>
                                        <input type="text" id="filterCustomer" class="filter-input"
                                            placeholder="Search customer...">
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- BULK ACTIONS BAR -->
                        <div class="bulk-actions" id="bulkActionsBar">
                            <div class="bulk-info">
                                <span id="selectedCount">0 selected</span>
                            </div>
                            <div class="bulk-buttons">
                                <button class="btn-bulk" onclick="bulkMarkRead()">
                                    <i class="fas fa-check"></i> Mark as Read
                                </button>
                                <button class="btn-bulk" onclick="bulkSnooze()">
                                    <i class="fas fa-clock"></i> Snooze
                                </button>
                                <button class="btn-bulk clear" onclick="clearSelection()">
                                    <i class="fas fa-times"></i> Clear
                                </button>
                            </div>
                        </div>

                        <!-- NOTIFICATIONS LIST -->
                        <section class="notifications-list" id="notificationsList">
                            <!-- OVERDUE NOTIFICATIONS -->
                            <div class="notification-card overdue" data-type="overdue" data-id="1">
                                <div class="notification-content">
                                    <div class="notification-header">
                                        <div class="notification-header-left">
                                            <input type="checkbox" class="notification-checkbox"
                                                onchange="updateBulkActions()">
                                            <h3 class="customer-name">Rahul Sharma</h3>
                                        </div>
                                        <span class="notification-badge overdue">Overdue - 5 days</span>
                                    </div>
                                    <div class="notification-body">
                                        <div class="notification-field">
                                            <span class="field-label">Policy No.</span>
                                            <span class="field-value">POL-2023-8765</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Due Date</span>
                                            <span class="field-value">Jan 18, 2026</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Amount</span>
                                            <span class="field-value amount">₹12,500</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Policy Type</span>
                                            <span class="field-value">Life Insurance</span>
                                        </div>
                                    </div>
                                    <div class="notification-message overdue">
                                        <i class="fas fa-exclamation-triangle"></i> Premium overdue by 5 days. Immediate
                                        action required.
                                    </div>
                                    <div class="notification-footer">
                                        <button class="btn-sm btn-call" onclick="callCustomer('9876543210')">
                                            <i class="fas fa-phone"></i> Call Customer
                                        </button>
                                        <button class="btn-sm btn-paid" onclick="markPaid(1)">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm btn-view" onclick="viewPolicy('POL-2023-8765')">
                                            <i class="fas fa-eye"></i> View Policy
                                        </button>
                                        <button class="btn-sm btn-snooze" onclick="snoozeNotification(1)">
                                            <i class="fas fa-clock"></i> Snooze
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="notification-card overdue" data-type="overdue" data-id="2">
                                <div class="notification-content">
                                    <div class="notification-header">
                                        <div class="notification-header-left">
                                            <input type="checkbox" class="notification-checkbox"
                                                onchange="updateBulkActions()">
                                            <h3 class="customer-name">Priya Patel</h3>
                                        </div>
                                        <span class="notification-badge overdue">Overdue - 2 days</span>
                                    </div>
                                    <div class="notification-body">
                                        <div class="notification-field">
                                            <span class="field-label">Policy No.</span>
                                            <span class="field-value">POL-2023-9210</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Due Date</span>
                                            <span class="field-value">Jan 21, 2026</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Amount</span>
                                            <span class="field-value amount">₹8,300</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Policy Type</span>
                                            <span class="field-value">Health Insurance</span>
                                        </div>
                                    </div>
                                    <div class="notification-message overdue">
                                        <i class="fas fa-exclamation-triangle"></i> Premium overdue by 2 days. Please
                                        follow up.
                                    </div>
                                    <div class="notification-footer">
                                        <button class="btn-sm btn-call" onclick="callCustomer('9876543211')">
                                            <i class="fas fa-phone"></i> Call Customer
                                        </button>
                                        <button class="btn-sm btn-paid" onclick="markPaid(2)">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm btn-view" onclick="viewPolicy('POL-2023-9210')">
                                            <i class="fas fa-eye"></i> View Policy
                                        </button>
                                        <button class="btn-sm btn-snooze" onclick="snoozeNotification(2)">
                                            <i class="fas fa-clock"></i> Snooze
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- DUE TODAY NOTIFICATIONS -->
                            <div class="notification-card due-today" data-type="due-today" data-id="3">
                                <div class="notification-content">
                                    <div class="notification-header">
                                        <div class="notification-header-left">
                                            <input type="checkbox" class="notification-checkbox"
                                                onchange="updateBulkActions()">
                                            <h3 class="customer-name">Amit Kumar</h3>
                                        </div>
                                        <span class="notification-badge due-today">Due Today</span>
                                    </div>
                                    <div class="notification-body">
                                        <div class="notification-field">
                                            <span class="field-label">Policy No.</span>
                                            <span class="field-value">POL-2024-1123</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Due Date</span>
                                            <span class="field-value">Jan 23, 2026</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Amount</span>
                                            <span class="field-value amount">₹15,750</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Policy Type</span>
                                            <span class="field-value">Vehicle Insurance</span>
                                        </div>
                                    </div>
                                    <div class="notification-message due-today">
                                        <i class="fas fa-clock"></i> Premium due today. Contact customer for payment
                                        confirmation.
                                    </div>
                                    <div class="notification-footer">
                                        <button class="btn-sm btn-call" onclick="callCustomer('9876543212')">
                                            <i class="fas fa-phone"></i> Call Customer
                                        </button>
                                        <button class="btn-sm btn-paid" onclick="markPaid(3)">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm btn-view" onclick="viewPolicy('POL-2024-1123')">
                                            <i class="fas fa-eye"></i> View Policy
                                        </button>
                                        <button class="btn-sm btn-snooze" onclick="snoozeNotification(3)">
                                            <i class="fas fa-clock"></i> Snooze
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="notification-card due-today" data-type="due-today" data-id="4">
                                <div class="notification-content">
                                    <div class="notification-header">
                                        <div class="notification-header-left">
                                            <input type="checkbox" class="notification-checkbox"
                                                onchange="updateBulkActions()">
                                            <h3 class="customer-name">Sunita Reddy</h3>
                                        </div>
                                        <span class="notification-badge due-today">Due Today</span>
                                    </div>
                                    <div class="notification-body">
                                        <div class="notification-field">
                                            <span class="field-label">Policy No.</span>
                                            <span class="field-value">POL-2024-1567</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Due Date</span>
                                            <span class="field-value">Jan 23, 2026</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Amount</span>
                                            <span class="field-value amount">₹6,200</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Policy Type</span>
                                            <span class="field-value">Health Insurance</span>
                                        </div>
                                    </div>
                                    <div class="notification-message due-today">
                                        <i class="fas fa-clock"></i> Premium due today. Customer has auto-debit enabled.
                                    </div>
                                    <div class="notification-footer">
                                        <button class="btn-sm btn-call" onclick="callCustomer('9876543213')">
                                            <i class="fas fa-phone"></i> Call Customer
                                        </button>
                                        <button class="btn-sm btn-paid" onclick="markPaid(4)">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm btn-view" onclick="viewPolicy('POL-2024-1567')">
                                            <i class="fas fa-eye"></i> View Policy
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- UPCOMING NOTIFICATIONS -->
                            <div class="notification-card upcoming" data-type="upcoming" data-id="5">
                                <div class="notification-content">
                                    <div class="notification-header">
                                        <div class="notification-header-left">
                                            <input type="checkbox" class="notification-checkbox"
                                                onchange="updateBulkActions()">
                                            <h3 class="customer-name">Neha Singh</h3>
                                        </div>
                                        <span class="notification-badge upcoming">Due in 3 days</span>
                                    </div>
                                    <div class="notification-body">
                                        <div class="notification-field">
                                            <span class="field-label">Policy No.</span>
                                            <span class="field-value">POL-2024-1456</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Due Date</span>
                                            <span class="field-value">Jan 26, 2026</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Amount</span>
                                            <span class="field-value amount">₹9,200</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Policy Type</span>
                                            <span class="field-value">Life Insurance</span>
                                        </div>
                                    </div>
                                    <div class="notification-message upcoming">
                                        <i class="fas fa-info-circle"></i> Premium due in 3 days. Send reminder if
                                        needed.
                                    </div>
                                    <div class="notification-footer">
                                        <button class="btn-sm btn-call" onclick="callCustomer('9876543214')">
                                            <i class="fas fa-phone"></i> Call Customer
                                        </button>
                                        <button class="btn-sm btn-paid" onclick="markPaid(5)">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm btn-view" onclick="viewPolicy('POL-2024-1456')">
                                            <i class="fas fa-eye"></i> View Policy
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="notification-card upcoming" data-type="upcoming" data-id="6">
                                <div class="notification-content">
                                    <div class="notification-header">
                                        <div class="notification-header-left">
                                            <input type="checkbox" class="notification-checkbox"
                                                onchange="updateBulkActions()">
                                            <h3 class="customer-name">Vikram Malhotra</h3>
                                        </div>
                                        <span class="notification-badge upcoming">Due in 5 days</span>
                                    </div>
                                    <div class="notification-body">
                                        <div class="notification-field">
                                            <span class="field-label">Policy No.</span>
                                            <span class="field-value">POL-2024-1890</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Due Date</span>
                                            <span class="field-value">Jan 28, 2026</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Amount</span>
                                            <span class="field-value amount">₹22,000</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Policy Type</span>
                                            <span class="field-value">Property Insurance</span>
                                        </div>
                                    </div>
                                    <div class="notification-message upcoming">
                                        <i class="fas fa-info-circle"></i> Premium due in 5 days. High-value policy.
                                    </div>
                                    <div class="notification-footer">
                                        <button class="btn-sm btn-call" onclick="callCustomer('9876543215')">
                                            <i class="fas fa-phone"></i> Call Customer
                                        </button>
                                        <button class="btn-sm btn-paid" onclick="markPaid(6)">
                                            <i class="fas fa-check-circle"></i> Mark Paid
                                        </button>
                                        <button class="btn-sm btn-view" onclick="viewPolicy('POL-2024-1890')">
                                            <i class="fas fa-eye"></i> View Policy
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- SYSTEM NOTIFICATIONS -->
                            <div class="notification-card system" data-type="system" data-id="7">
                                <div class="notification-content">
                                    <div class="notification-header">
                                        <div class="notification-header-left">
                                            <input type="checkbox" class="notification-checkbox"
                                                onchange="updateBulkActions()">
                                            <h3 class="customer-name">System Notification</h3>
                                        </div>
                                        <span class="notification-badge system">System</span>
                                    </div>
                                    <div class="notification-body">
                                        <div class="notification-field">
                                            <span class="field-label">Type</span>
                                            <span class="field-value">New Customer Added</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Time</span>
                                            <span class="field-value">2 hours ago</span>
                                        </div>
                                    </div>
                                    <div class="notification-message system">
                                        <i class="fas fa-user-plus"></i> New customer "Anjali Mehta" has been added to
                                        your portfolio.
                                    </div>
                                    <div class="notification-footer">
                                        <button class="btn-sm btn-view" onclick="viewCustomer('CUST-2024-0012')">
                                            <i class="fas fa-eye"></i> View Customer
                                        </button>
                                        <button class="btn-sm" onclick="dismissNotification(7)">
                                            <i class="fas fa-times"></i> Dismiss
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="notification-card system" data-type="system" data-id="8">
                                <div class="notification-content">
                                    <div class="notification-header">
                                        <div class="notification-header-left">
                                            <input type="checkbox" class="notification-checkbox"
                                                onchange="updateBulkActions()">
                                            <h3 class="customer-name">System Notification</h3>
                                        </div>
                                        <span class="notification-badge system">System</span>
                                    </div>
                                    <div class="notification-body">
                                        <div class="notification-field">
                                            <span class="field-label">Type</span>
                                            <span class="field-value">Policy Created</span>
                                        </div>
                                        <div class="notification-field">
                                            <span class="field-label">Time</span>
                                            <span class="field-value">Yesterday</span>
                                        </div>
                                    </div>
                                    <div class="notification-message system">
                                        <i class="fas fa-file-contract"></i> New policy POL-2024-2001 created for Ravi
                                        Verma.
                                    </div>
                                    <div class="notification-footer">
                                        <button class="btn-sm btn-view" onclick="viewPolicy('POL-2024-2001')">
                                            <i class="fas fa-eye"></i> View Policy
                                        </button>
                                        <button class="btn-sm" onclick="dismissNotification(8)">
                                            <i class="fas fa-times"></i> Dismiss
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- EMPTY STATE (hidden by default) -->
                        <section class="empty-state" id="emptyState" style="display: none;">
                            <div class="empty-state-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <h3>🎉 You're all caught up!</h3>
                            <p>No pending notifications. Great job staying on top of your work!</p>
                            <div class="empty-state-actions">
                                <button class="btn-action" onclick="location.href='agent-dashboard.jsp'">
                                    <i class="fas fa-home"></i> Go to Dashboard
                                </button>
                                <button class="btn-action" onclick="location.href='search-customer.jsp'">
                                    <i class="fas fa-users"></i> View Customers
                                </button>
                            </div>
                        </section>

                        <!-- PAGINATION -->
                        <section class="pagination-section" id="paginationSection">
                            <div class="pagination-info">
                                Showing <strong>1-8</strong> of <strong>28</strong> notifications
                            </div>
                            <div class="pagination-controls">
                                <button class="page-btn" disabled><i class="fas fa-chevron-left"></i></button>
                                <button class="page-btn active">1</button>
                                <button class="page-btn">2</button>
                                <button class="page-btn">3</button>
                                <button class="page-btn">4</button>
                                <button class="page-btn"><i class="fas fa-chevron-right"></i></button>
                            </div>
                        </section>
                </div>
        </div>

        <script>
            // ===== THEME TOGGLE =====
            const themeToggle = document.getElementById('themeToggle');
            const themeIcon = document.getElementById('themeIcon');
            const themeLabel = document.getElementById('themeLabel');

            function setTheme(theme) {
                document.documentElement.setAttribute('data-theme', theme);
                localStorage.setItem('theme', theme);
                if (theme === 'dark') {
                    themeIcon.classList.remove('fa-moon');
                    themeIcon.classList.add('fa-sun');
                    themeLabel.textContent = 'Light';
                } else {
                    themeIcon.classList.remove('fa-sun');
                    themeIcon.classList.add('fa-moon');
                    themeLabel.textContent = 'Dark';
                }
            }

            // Initialize theme
            const savedTheme = localStorage.getItem('theme') || 'light';
            setTheme(savedTheme);

            themeToggle.addEventListener('click', () => {
                const currentTheme = document.documentElement.getAttribute('data-theme') || 'light';
                setTheme(currentTheme === 'light' ? 'dark' : 'light');
            });

            // ===== SIDEBAR TOGGLE =====
            const menuToggle = document.getElementById('menuToggle');
            const sidebar = document.getElementById('sidebar');
            const sidebarOverlay = document.getElementById('sidebarOverlay');

            menuToggle.addEventListener('click', () => {
                sidebar.classList.toggle('active');
                sidebarOverlay.classList.toggle('active');
            });

            sidebarOverlay.addEventListener('click', () => {
                sidebar.classList.remove('active');
                sidebarOverlay.classList.remove('active');
            });

            // ===== FILTER BY SUMMARY CARD =====
            function filterByCard(card, type) {
                // Update card active state
                document.querySelectorAll('.summary-card').forEach(c => c.classList.remove('active'));
                card.classList.add('active');

                // Update tab active state
                document.querySelectorAll('.tab-btn').forEach(t => t.classList.remove('active'));
                document.querySelector(`.tab-btn[data-tab="${type}"]`).classList.add('active');

                // Filter notifications
                filterNotifications(type);
            }

            // ===== TAB SWITCHING =====
            function switchTab(tab) {
                // Update tab active state
                document.querySelectorAll('.tab-btn').forEach(t => t.classList.remove('active'));
                document.querySelector(`.tab-btn[data-tab="${tab}"]`).classList.add('active');

                // Update card active state
                document.querySelectorAll('.summary-card').forEach(c => c.classList.remove('active'));
                if (tab !== 'all') {
                    document.querySelector(`.summary-card[data-filter="${tab}"]`)?.classList.add('active');
                }

                // Filter notifications
                filterNotifications(tab);
            }

            // ===== FILTER NOTIFICATIONS =====
            function filterNotifications(type) {
                const cards = document.querySelectorAll('.notification-card');
                let visibleCount = 0;

                cards.forEach(card => {
                    if (type === 'all' || card.dataset.type === type) {
                        card.style.display = 'block';
                        visibleCount++;
                    } else {
                        card.style.display = 'none';
                    }
                });

                // Show/hide empty state
                const emptyState = document.getElementById('emptyState');
                const paginationSection = document.getElementById('paginationSection');

                if (visibleCount === 0) {
                    emptyState.style.display = 'block';
                    paginationSection.style.display = 'none';
                } else {
                    emptyState.style.display = 'none';
                    paginationSection.style.display = 'flex';
                }
            }

            // ===== TOGGLE FILTERS =====
            function toggleFilters() {
                const toggle = document.getElementById('filterToggle');
                const filters = document.getElementById('secondaryFilters');
                toggle.classList.toggle('active');
                filters.classList.toggle('active');
            }

            // ===== BULK ACTIONS =====
            function updateBulkActions() {
                const checkboxes = document.querySelectorAll('.notification-checkbox:checked');
                const bulkBar = document.getElementById('bulkActionsBar');
                const selectedCount = document.getElementById('selectedCount');

                if (checkboxes.length > 0) {
                    bulkBar.classList.add('active');
                    selectedCount.textContent = `${checkboxes.length} selected`;
                } else {
                    bulkBar.classList.remove('active');
                }

                // Update card selected state
                document.querySelectorAll('.notification-card').forEach(card => {
                    const checkbox = card.querySelector('.notification-checkbox');
                    if (checkbox && checkbox.checked) {
                        card.classList.add('selected');
                    } else {
                        card.classList.remove('selected');
                    }
                });
            }

            function clearSelection() {
                document.querySelectorAll('.notification-checkbox').forEach(cb => cb.checked = false);
                updateBulkActions();
            }

            function bulkMarkRead() {
                const checkboxes = document.querySelectorAll('.notification-checkbox:checked');
                checkboxes.forEach(cb => {
                    // Mark as read logic here
                });
                showToast('Marked as read', 'success');
                clearSelection();
            }

            function bulkSnooze() {
                const checkboxes = document.querySelectorAll('.notification-checkbox:checked');
                showToast(`Snoozed ${checkboxes.length} notifications`, 'success');
                clearSelection();
            }

            // ===== NOTIFICATION ACTIONS =====
            function callCustomer(phone) {
                // In a real app, this would integrate with a phone system
                showToast(`Calling ${phone}...`, 'success');
                // window.open(`tel:${phone}`);
            }

            function markPaid(id) {
                const card = document.querySelector(`.notification-card[data-id="${id}"]`);
                if (card) {
                    card.style.animation = 'fadeOut 0.3s ease forwards';
                    setTimeout(() => {
                        card.remove();
                        updateCounts();
                        checkEmptyState();
                    }, 300);
                    showToast('Payment marked as received', 'success');
                }
            }

            function viewPolicy(policyNo) {
                // Navigate to policy details
                window.location.href = `add-policy.jsp?view=${policyNo}`;
            }

            function viewCustomer(customerId) {
                window.location.href = `search-customer.jsp?id=${customerId}`;
            }

            function snoozeNotification(id) {
                showToast('Notification snoozed for 24 hours', 'success');
            }

            function dismissNotification(id) {
                const card = document.querySelector(`.notification-card[data-id="${id}"]`);
                if (card) {
                    card.style.animation = 'fadeOut 0.3s ease forwards';
                    setTimeout(() => {
                        card.remove();
                        updateCounts();
                        checkEmptyState();
                    }, 300);
                    showToast('Notification dismissed', 'success');
                }
            }

            function markAllRead() {
                showToast('All notifications marked as read', 'success');
            }

            // ===== HELPER FUNCTIONS =====
            function updateCounts() {
                const types = ['overdue', 'due-today', 'upcoming', 'system'];
                let total = 0;

                types.forEach(type => {
                    const count = document.querySelectorAll(`.notification-card[data-type="${type}"]`).length;
                    const summaryCard = document.querySelector(`.summary-card[data-filter="${type}"] .summary-card-value`);
                    const tabCount = document.querySelector(`.tab-btn[data-tab="${type}"] .tab-count`);

                    if (summaryCard) summaryCard.textContent = count;
                    if (tabCount) tabCount.textContent = count;
                    total += count;
                });

                const allTabCount = document.querySelector('.tab-btn[data-tab="all"] .tab-count');
                if (allTabCount) allTabCount.textContent = total;
            }

            function checkEmptyState() {
                const visibleCards = document.querySelectorAll('.notification-card:not([style*="display: none"])');
                const emptyState = document.getElementById('emptyState');
                const paginationSection = document.getElementById('paginationSection');

                if (visibleCards.length === 0) {
                    emptyState.style.display = 'block';
                    paginationSection.style.display = 'none';
                } else {
                    emptyState.style.display = 'none';
                    paginationSection.style.display = 'flex';
                }
            }

            function showToast(message, type = 'success') {
                // Remove existing toast
                const existingToast = document.querySelector('.toast');
                if (existingToast) existingToast.remove();

                // Create new toast
                const toast = document.createElement('div');
                toast.className = 'toast ' + type;
                var iconClass = (type === 'success') ? 'check-circle' : 'exclamation-circle';
                toast.innerHTML = '<i class="fas fa-' + iconClass + '"></i><span>' + message + '</span>';
                document.body.appendChild(toast);

                // Auto remove after 3 seconds
                setTimeout(() => {
                    toast.style.animation = 'slideInRight 0.3s ease reverse';
                    setTimeout(() => toast.remove(), 300);
                }, 3000);
            }

            // Add fadeOut animation
            const style = document.createElement('style');
            style.textContent = `
            @keyframes fadeOut {
                from { opacity: 1; transform: translateX(0); }
                to { opacity: 0; transform: translateX(-20px); }
            }
        `;
            document.head.appendChild(style);

            // ===== PAGINATION =====
            document.querySelectorAll('.page-btn:not(:disabled)').forEach(btn => {
                btn.addEventListener('click', function () {
                    if (!this.disabled) {
                        document.querySelectorAll('.page-btn').forEach(b => b.classList.remove('active'));
                        this.classList.add('active');
                        // Load page content here
                    }
                });
            });
        </script>
    </body>

    </html>