<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="includes/auth-check.jsp" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search Customers | Investment Tracker</title>

        <%-- Common Styles --%>
            <jsp:include page="includes/common-styles.jsp" />

            <style>
                /* Search Panel */
                .search-panel {
                    background: white;
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    padding: 24px;
                    margin-bottom: 20px;
                    box-shadow: var(--box-shadow);
                    position: sticky;
                    top: 0;
                    z-index: 10;
                }

                .search-main {
                    display: flex;
                    gap: 12px;
                    align-items: flex-end;
                }

                .search-input-wrapper {
                    flex: 1;
                    position: relative;
                }

                .search-label {
                    display: block;
                    font-size: 13px;
                    font-weight: 500;
                    color: var(--neutral-700);
                    margin-bottom: 6px;
                }

                .search-input-container {
                    position: relative;
                    display: flex;
                    align-items: center;
                }

                .search-icon {
                    position: absolute;
                    left: 14px;
                    color: var(--neutral-500);
                    font-size: 16px;
                }

                .search-input {
                    width: 100%;
                    padding: 12px 14px 12px 44px;
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    font-size: 14px;
                    background: var(--neutral-100);
                    color: var(--neutral-800);
                    transition: all 0.2s ease;
                }

                .search-input:focus {
                    outline: none;
                    border-color: var(--primary);
                    box-shadow: 0 0 0 3px rgba(37, 47, 63, 0.1);
                }

                .search-input::placeholder {
                    color: var(--neutral-500);
                }

                .search-type-selector {
                    display: flex;
                    gap: 16px;
                    margin-top: 12px;
                }

                .search-type-item {
                    display: flex;
                    align-items: center;
                    gap: 6px;
                    cursor: pointer;
                    font-size: 13px;
                    color: var(--neutral-600);
                }

                .search-type-item input[type="radio"] {
                    width: 14px;
                    height: 14px;
                    cursor: pointer;
                }

                .btn {
                    padding: 12px 20px;
                    border-radius: var(--border-radius);
                    font-size: 14px;
                    font-weight: 500;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    cursor: pointer;
                    transition: all 0.2s ease;
                    border: none;
                    white-space: nowrap;
                }

                .btn-primary {
                    background: var(--primary);
                    color: white;
                }

                .btn-primary:hover {
                    opacity: 0.9;
                }

                .btn-secondary {
                    background: var(--neutral-200);
                    color: var(--neutral-700);
                }

                .btn-secondary:hover {
                    background: var(--neutral-300);
                }

                .btn-sm {
                    padding: 8px 12px;
                    font-size: 13px;
                }

                /* Advanced Filters */
                .filters-toggle {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    color: var(--accent);
                    font-size: 13px;
                    cursor: pointer;
                    margin-top: 16px;
                    padding-top: 16px;
                    border-top: 1px solid var(--neutral-200);
                }

                .filters-toggle:hover {
                    text-decoration: underline;
                }

                .filters-toggle i {
                    transition: transform 0.3s ease;
                }

                .filters-toggle.active i {
                    transform: rotate(180deg);
                }

                .advanced-filters {
                    display: none;
                    padding-top: 16px;
                }

                .advanced-filters.active {
                    display: block;
                }

                .filters-grid {
                    display: grid;
                    grid-template-columns: repeat(4, 1fr);
                    gap: 16px;
                }

                .filter-group {
                    display: flex;
                    flex-direction: column;
                    gap: 6px;
                }

                .filter-label {
                    font-size: 12px;
                    font-weight: 500;
                    color: var(--neutral-600);
                }

                .filter-input,
                .filter-select {
                    padding: 8px 12px;
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    font-size: 13px;
                    background: var(--neutral-100);
                    color: var(--neutral-800);
                }

                .filter-input:focus,
                .filter-select:focus {
                    outline: none;
                    border-color: var(--primary);
                }

                /* Results Section */
                .results-section {
                    background: white;
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    box-shadow: var(--box-shadow);
                    overflow: hidden;
                }

                .results-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 16px 20px;
                    border-bottom: 1px solid var(--neutral-200);
                    background: var(--neutral-100);
                }

                .results-count {
                    font-size: 14px;
                    color: var(--neutral-700);
                }

                .results-count strong {
                    color: var(--neutral-800);
                }

                .per-page-selector {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    font-size: 13px;
                    color: var(--neutral-600);
                }

                .per-page-selector select {
                    padding: 6px 10px;
                    border: 1px solid var(--neutral-300);
                    border-radius: var(--border-radius);
                    font-size: 13px;
                    background: white;
                    cursor: pointer;
                }

                /* Table */
                .results-table {
                    width: 100%;
                    border-collapse: collapse;
                }

                .results-table th {
                    padding: 14px 16px;
                    text-align: left;
                    font-size: 12px;
                    font-weight: 600;
                    color: var(--neutral-600);
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    background: var(--neutral-100);
                    border-bottom: 2px solid var(--neutral-300);
                    cursor: pointer;
                    user-select: none;
                    white-space: nowrap;
                }

                .results-table th:hover {
                    background: var(--neutral-200);
                }

                .results-table th i {
                    margin-left: 6px;
                    font-size: 10px;
                    opacity: 0.5;
                }

                .results-table th.sorted i {
                    opacity: 1;
                    color: var(--primary);
                }

                .results-table td {
                    padding: 14px 16px;
                    font-size: 14px;
                    color: var(--neutral-700);
                    border-bottom: 1px solid var(--neutral-200);
                }

                .results-table tbody tr:hover {
                    background: var(--neutral-100);
                }

                .customer-name {
                    font-weight: 500;
                    color: var(--neutral-800);
                }

                .customer-id {
                    font-family: monospace;
                    font-size: 13px;
                    color: var(--accent);
                }

                .policy-badge {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    min-width: 28px;
                    height: 28px;
                    padding: 0 8px;
                    background: var(--neutral-200);
                    color: var(--neutral-700);
                    border-radius: 14px;
                    font-size: 13px;
                    font-weight: 600;
                }

                .policy-badge.has-policies {
                    background: rgba(56, 161, 105, 0.1);
                    color: var(--success);
                }

                /* Actions */
                .action-buttons {
                    display: flex;
                    gap: 8px;
                }

                .btn-action {
                    width: 32px;
                    height: 32px;
                    border: none;
                    border-radius: var(--border-radius);
                    background: var(--neutral-200);
                    color: var(--neutral-600);
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    transition: all 0.2s ease;
                }

                .btn-action:hover {
                    background: var(--primary);
                    color: white;
                }

                .btn-action.view:hover {
                    background: var(--accent);
                }

                .btn-action.add:hover {
                    background: var(--success);
                }

                /* Highlight search term */
                .highlight {
                    background: rgba(214, 158, 46, 0.3);
                    padding: 1px 2px;
                    border-radius: 2px;
                }

                /* Empty State */
                .empty-state {
                    padding: 60px 20px;
                    text-align: center;
                }

                .empty-icon {
                    width: 80px;
                    height: 80px;
                    background: var(--neutral-200);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 20px;
                }

                .empty-icon i {
                    font-size: 32px;
                    color: var(--neutral-500);
                }

                .empty-title {
                    font-size: 18px;
                    font-weight: 600;
                    color: var(--neutral-800);
                    margin-bottom: 8px;
                }

                .empty-message {
                    font-size: 14px;
                    color: var(--neutral-600);
                    margin-bottom: 20px;
                }

                /* Pagination */
                .pagination {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 16px 20px;
                    border-top: 1px solid var(--neutral-200);
                    background: var(--neutral-100);
                }

                .pagination-info {
                    font-size: 13px;
                    color: var(--neutral-600);
                }

                .pagination-buttons {
                    display: flex;
                    gap: 4px;
                }

                .page-btn {
                    min-width: 36px;
                    height: 36px;
                    padding: 0 12px;
                    border: 1px solid var(--neutral-300);
                    background: white;
                    color: var(--neutral-700);
                    border-radius: var(--border-radius);
                    font-size: 13px;
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    transition: all 0.2s ease;
                }

                .page-btn:hover {
                    background: var(--neutral-200);
                }

                .page-btn.active {
                    background: var(--primary);
                    color: white;
                    border-color: var(--primary);
                }

                .page-btn:disabled {
                    opacity: 0.5;
                    cursor: not-allowed;
                }

                /* Dark Mode */
                [data-theme="dark"] .search-panel,
                [data-theme="dark"] .results-section {
                    background: var(--neutral-200);
                    border-color: var(--neutral-300);
                }

                [data-theme="dark"] .search-input,
                [data-theme="dark"] .filter-input,
                [data-theme="dark"] .filter-select {
                    background: var(--neutral-100);
                    border-color: var(--neutral-400);
                    color: var(--neutral-800);
                }

                [data-theme="dark"] .results-table th {
                    background: var(--neutral-300);
                }

                [data-theme="dark"] .results-table tbody tr:hover {
                    background: var(--neutral-300);
                }

                [data-theme="dark"] .page-btn {
                    background: var(--neutral-300);
                    border-color: var(--neutral-400);
                    color: var(--neutral-800);
                }

                /* Responsive */
                @media (max-width: 1024px) {
                    .filters-grid {
                        grid-template-columns: repeat(2, 1fr);
                    }
                }

                @media (max-width: 768px) {
                    .search-main {
                        flex-direction: column;
                        align-items: stretch;
                    }

                    .filters-grid {
                        grid-template-columns: 1fr;
                    }

                    .results-table {
                        display: block;
                        overflow-x: auto;
                    }

                    .pagination {
                        flex-direction: column;
                        gap: 12px;
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
                            <jsp:param name="pageTitle" value="Search Customers" />
                        </jsp:include>

                        <!-- SEARCH PANEL -->
                        <div class="search-panel">
                            <div class="search-main">
                                <div class="search-input-wrapper">
                                    <label class="search-label">Find Customer</label>
                                    <div class="search-input-container">
                                        <i class="fas fa-search search-icon"></i>
                                        <input type="text" class="search-input" id="searchInput"
                                            placeholder="Search by name, mobile, email, or customer ID..." autofocus>
                                    </div>
                                    <div class="search-type-selector">
                                        <label class="search-type-item">
                                            <input type="radio" name="searchType" value="auto" checked>
                                            Auto Detect
                                        </label>
                                        <label class="search-type-item">
                                            <input type="radio" name="searchType" value="name">
                                            Name
                                        </label>
                                        <label class="search-type-item">
                                            <input type="radio" name="searchType" value="mobile">
                                            Mobile
                                        </label>
                                        <label class="search-type-item">
                                            <input type="radio" name="searchType" value="email">
                                            Email
                                        </label>
                                        <label class="search-type-item">
                                            <input type="radio" name="searchType" value="id">
                                            Customer ID
                                        </label>
                                    </div>
                                </div>
                                <button class="btn btn-primary" onclick="performSearch()">
                                    <i class="fas fa-search"></i> Search
                                </button>
                                <button class="btn btn-secondary" onclick="resetSearch()">
                                    <i class="fas fa-redo"></i> Reset
                                </button>
                            </div>

                            <!-- Advanced Filters Toggle -->
                            <div class="filters-toggle" onclick="toggleFilters()">
                                <i class="fas fa-chevron-down"></i>
                                <span>Advanced Filters</span>
                            </div>

                            <!-- Advanced Filters -->
                            <div class="advanced-filters" id="advancedFilters">
                                <div class="filters-grid">
                                    <div class="filter-group">
                                        <label class="filter-label">City</label>
                                        <input type="text" class="filter-input" id="filterCity"
                                            placeholder="Enter city">
                                    </div>
                                    <div class="filter-group">
                                        <label class="filter-label">State</label>
                                        <select class="filter-select" id="filterState">
                                            <option value="">All States</option>
                                            <option value="MH">Maharashtra</option>
                                            <option value="DL">Delhi</option>
                                            <option value="KA">Karnataka</option>
                                            <option value="TN">Tamil Nadu</option>
                                            <option value="GJ">Gujarat</option>
                                            <option value="UP">Uttar Pradesh</option>
                                            <option value="RJ">Rajasthan</option>
                                            <option value="WB">West Bengal</option>
                                        </select>
                                    </div>
                                    <div class="filter-group">
                                        <label class="filter-label">Created From</label>
                                        <input type="date" class="filter-input" id="filterFromDate">
                                    </div>
                                    <div class="filter-group">
                                        <label class="filter-label">Created To</label>
                                        <input type="date" class="filter-input" id="filterToDate">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- RESULTS SECTION -->
                        <div class="results-section">
                            <div class="results-header">
                                <div class="results-count">
                                    Showing <strong id="resultStart">1</strong> - <strong id="resultEnd">10</strong> of
                                    <strong id="totalResults">156</strong> customers
                                </div>
                                <div class="per-page-selector">
                                    <span>Show</span>
                                    <select id="perPage" onchange="changePerPage()">
                                        <option value="10">10</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                    </select>
                                    <span>per page</span>
                                </div>
                            </div>

                            <table class="results-table" id="resultsTable">
                                <thead>
                                    <tr>
                                        <th onclick="sortBy('id')">Customer ID <i class="fas fa-sort"></i></th>
                                        <th onclick="sortBy('name')" class="sorted">Customer Name <i
                                                class="fas fa-sort-up"></i></th>
                                        <th onclick="sortBy('mobile')">Mobile <i class="fas fa-sort"></i></th>
                                        <th onclick="sortBy('email')">Email <i class="fas fa-sort"></i></th>
                                        <th onclick="sortBy('city')">City <i class="fas fa-sort"></i></th>
                                        <th onclick="sortBy('policies')">Policies <i class="fas fa-sort"></i></th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>

                                <tbody id="resultsBody">
                                    <% java.util.List<com.policytrack.model.Customer> customers =
                                        (java.util.List<com.policytrack.model.Customer>)
                                            request.getAttribute("customers");

                                            if (customers != null && !customers.isEmpty()) {
                                            for (com.policytrack.model.Customer customer : customers) {
                                            %>
                                            <tr>
                                                <td>
                                                    <span class="customer-id">
                                                        <%= customer.getCustomerId() %>
                                                    </span>
                                                </td>

                                                <td>
                                                    <span class="customer-name">
                                                        <%= customer.getFullName() %>
                                                    </span>
                                                </td>

                                                <td>
                                                    <%= customer.getMobile() !=null ? customer.getMobile() : "-" %>
                                                </td>
                                                <td>
                                                    <%= customer.getEmail() !=null ? customer.getEmail() : "-" %>
                                                </td>
                                                <td>
                                                    <%= customer.getCity() !=null ? customer.getCity() : "-" %>
                                                </td>

                                                <td>
                                                    <span class="policy-badge">0</span>
                                                </td>

                                                <td>
                                                    <div class="action-buttons">
                                                        <button class="btn-action view" title="View Details"
                                                            onclick="viewCustomer('<%= customer.getCustomerId() %>')">
                                                            <i class="fas fa-eye"></i>
                                                        </button>

                                                        <button class="btn-action" title="View Policies"
                                                            onclick="viewPolicies('<%= customer.getCustomerId() %>')">
                                                            <i class="fas fa-file-alt"></i>
                                                        </button>

                                                        <button class="btn-action add" title="Add Policy"
                                                            onclick="addPolicy('<%= customer.getCustomerId() %>')">
                                                            <i class="fas fa-plus"></i>
                                                        </button>

                                                        <button class="btn-action" title="Edit Customer"
                                                            onclick="window.location.href='<%= request.getContextPath() %>/edit-customer?id=<%= customer.getCustomerId() %>'">
                                                            <i class="fas fa-edit"></i>
                                                        </button>


                                                        <form method="post"
                                                            action="<%= request.getContextPath() %>/delete-customer"
                                                            style="display: inline;"
                                                            onsubmit="return confirm('Are you sure you want to delete this customer?');">

                                                            <input type="hidden" name="customerId"
                                                                value="<%= customer.getCustomerId() %>">

                                                            <button type="submit" class="btn-action"
                                                                title="Delete Customer" style="color: #dc2626;">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% } } else { %>
                                                <tr>
                                                    <td colspan="7" style="text-align: center; padding: 24px;">
                                                        No customers found. Add a customer to get started.
                                                    </td>
                                                </tr>
                                                <% } %>
                                </tbody>
                            </table>

                            <!-- Empty State (hidden by default) -->
                            <div class="empty-state" id="emptyState" style="display: none;">
                                <div class="empty-icon">
                                    <i class="fas fa-users-slash"></i>
                                </div>
                                <h3 class="empty-title">No customers found</h3>
                                <p class="empty-message">Try changing your search criteria or add a new customer.</p>
                                <button class="btn btn-primary" onclick="location.href='add-customer.jsp'">
                                    <i class="fas fa-user-plus"></i> Add New Customer
                                </button>
                            </div>

                            <!-- Pagination -->
                            <div class="pagination" id="pagination">
                                <div class="pagination-info">
                                    Page <strong>1</strong> of <strong>16</strong>
                                </div>
                                <div class="pagination-buttons">
                                    <button class="page-btn" disabled>
                                        <i class="fas fa-chevron-left"></i>
                                    </button>
                                    <button class="page-btn active">1</button>
                                    <button class="page-btn">2</button>
                                    <button class="page-btn">3</button>
                                    <button class="page-btn">4</button>
                                    <button class="page-btn">5</button>
                                    <button class="page-btn">...</button>
                                    <button class="page-btn">16</button>
                                    <button class="page-btn">
                                        <i class="fas fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                </div>
        </div>

        <%-- Common Scripts --%>
            <jsp:include page="includes/common-scripts.jsp" />

            <script>
                // ===== GLOBAL VARIABLES =====
                let currentPage = 1;
                let perPage = 10;
                let sortColumn = 'name';
                let sortDirection = 'asc';

                // ===== SEARCH FUNCTIONS =====
                function performSearch() {
                    const searchValue = document.getElementById('searchInput').value.trim();
                    const searchType = document.querySelector('input[name="searchType"]:checked').value;

                    console.log('Searching:', searchValue, 'Type:', searchType);

                    // Highlight matching text in results
                    if (searchValue) {
                        highlightSearchTerm(searchValue);
                    }

                    // In real app, this would call API
                    // For demo, we filter the visible results
                }

                function resetSearch() {
                    document.getElementById('searchInput').value = '';
                    document.querySelector('input[name="searchType"][value="auto"]').checked = true;
                    document.getElementById('filterCity').value = '';
                    document.getElementById('filterState').value = '';
                    document.getElementById('filterFromDate').value = '';
                    document.getElementById('filterToDate').value = '';

                    // Remove highlights
                    removeHighlights();

                    // Collapse filters
                    document.getElementById('advancedFilters').classList.remove('active');
                    document.querySelector('.filters-toggle').classList.remove('active');
                }

                function highlightSearchTerm(term) {
                    removeHighlights();
                    const rows = document.querySelectorAll('#resultsBody tr');
                    const regex = new RegExp('(' + term.replace(/[.*+?^\x24\x7B\x7D()|[\]\\]/g, '\\$&') + ')', 'gi');

                    rows.forEach(row => {
                        const cells = row.querySelectorAll('td');
                        cells.forEach((cell, index) => {
                            if (index < 5) { // Skip actions column
                                const text = cell.innerHTML;
                                if (!text.includes('btn-action')) {
                                    cell.innerHTML = text.replace(regex, '<span class="highlight">$1</span>');
                                }
                            }
                        });
                    });
                }

                function removeHighlights() {
                    const highlights = document.querySelectorAll('.highlight');
                    highlights.forEach(el => {
                        el.outerHTML = el.textContent;
                    });
                }

                // ===== FILTER FUNCTIONS =====
                function toggleFilters() {
                    const filters = document.getElementById('advancedFilters');
                    const toggle = document.querySelector('.filters-toggle');
                    filters.classList.toggle('active');
                    toggle.classList.toggle('active');
                }

                // ===== TABLE FUNCTIONS =====
                function sortBy(column) {
                    // Update sort state
                    if (sortColumn === column) {
                        sortDirection = sortDirection === 'asc' ? 'desc' : 'asc';
                    } else {
                        sortColumn = column;
                        sortDirection = 'asc';
                    }

                    // Update UI
                    document.querySelectorAll('.results-table th').forEach(th => {
                        th.classList.remove('sorted');
                        th.querySelector('i').className = 'fas fa-sort';
                    });

                    const activeHeader = event.target.closest('th');
                    activeHeader.classList.add('sorted');
                    activeHeader.querySelector('i').className = 'fas fa-sort-' + (sortDirection === 'asc' ? 'up' : 'down');

                    console.log('Sorting by:', column, sortDirection);
                    // In real app, this would re-fetch or sort data
                }

                function changePerPage() {
                    perPage = parseInt(document.getElementById('perPage').value);
                    currentPage = 1;
                    console.log('Per page:', perPage);
                    // In real app, this would re-fetch data
                }

                // ===== ACTION FUNCTIONS =====
                function viewCustomer(customerId) {
                    window.location.href = 'customer-details.jsp?id=' + customerId;
                }

                function viewPolicies(customerId) {
                    window.location.href = 'customer-policies.jsp?id=' + customerId;
                }

                function addPolicy(customerId) {
                    window.location.href = 'add-policy.jsp?customerId=' + customerId;
                }

                // ===== DOM READY =====
                document.addEventListener('DOMContentLoaded', function () {
                    // Enter key to search
                    document.getElementById('searchInput').addEventListener('keypress', function (e) {
                        if (e.key === 'Enter') {
                            performSearch();
                        }
                    });

                    // Auto-detect search type based on input
                    document.getElementById('searchInput').addEventListener('input', function () {
                        const value = this.value.trim();

                        if (/^[0-9]{10}$/.test(value)) {
                            document.querySelector('input[name="searchType"][value="mobile"]').checked = true;
                        } else if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
                            document.querySelector('input[name="searchType"][value="email"]').checked = true;
                        } else if (/^CUS-/i.test(value)) {
                            document.querySelector('input[name="searchType"][value="id"]').checked = true;
                        } else if (document.querySelector('input[name="searchType"][value="auto"]')) {
                            document.querySelector('input[name="searchType"][value="auto"]').checked = true;
                        }
                    });
                });
            </script>
    </body>

    </html>