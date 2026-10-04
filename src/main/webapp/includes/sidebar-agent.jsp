<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% // Get current page name for active state 
    String currentPage=request.getParameter("activePage"); 
    		
    if (currentPage==null) { currentPage=request.getRequestURI();
        currentPage=currentPage.substring(currentPage.lastIndexOf("/") + 1); } %>

        <!-- SIDEBAR OVERLAY (for mobile) -->
        <div class="sidebar-overlay" id="sidebarOverlay"></div>

        <!-- SIDEBAR -->
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <h2 class="sidebar-title">Agent Dashboard</h2>
                <p class="sidebar-subtitle">Investment Tracker Insurance System</p>
            </div>

            <nav class="nav-menu">
                <ul>
                    <li class="nav-item">
                        <a href="agent-dashboard.jsp" class="nav-link<%= " agent-dashboard.jsp".equals(currentPage)
                            ? " active" : "" %>">
                            <i class="fas fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="add-customer.jsp" class="nav-link<%= " add-customer.jsp".equals(currentPage)
                            ? " active" : "" %>">
                            <i class="fas fa-user-plus"></i>
                            <span>Add Customer</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="add-policy.jsp" class="nav-link<%= " add-policy.jsp".equals(currentPage) ? " active"
                            : "" %>">
                            <i class="fas fa-file-contract"></i>
                            <span>Add Policy</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="search-customer.jsp" class="nav-link<%= " search-customer.jsp".equals(currentPage)
                            ? " active" : "" %>">
                            <i class="fas fa-search"></i>
                            <span>Search Customers</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="notifications.jsp" class="nav-link<%= " notifications.jsp".equals(currentPage)
                            ? " active" : "" %>">
                            <i class="fas fa-bell"></i>
                            <span>Notifications</span>
                            <span class="notification-count">3</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="logout.jsp" class="nav-link">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Logout</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>