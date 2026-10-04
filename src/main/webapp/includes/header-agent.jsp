<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% // Get agent info from session 
      	String agentName=(String) session.getAttribute("agentName"); if (agentName==null)
        agentName="John Smith" ; String agentId=(String) session.getAttribute("agentId"); if (agentId==null)
        agentId="AGT-0001" ; String avatarInitial=agentName.substring(0, 1).toUpperCase(); // Get page title from request parameter 
        String pageTitle=request.getParameter("pageTitle"); if (pageTitle==null) pageTitle="Dashboard"
        ; %>

        <!-- HEADER -->
        <header class="header">
            <div class="header-left">
                <button class="menu-toggle" id="menuToggle" aria-label="Toggle menu">
                    <i class="fas fa-bars"></i>
                </button>
                <h2 class="page-title">
                    <%= pageTitle %>
                </h2>
            </div>

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