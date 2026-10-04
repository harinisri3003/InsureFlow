<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%-- Login Page - index.jsp If user is already logged in, redirect to dashboard. Otherwise, show login form. --%>
        <% // Check if user is already logged in 
        	Boolean isLoggedIn=(Boolean) session.getAttribute("isLoggedIn");
            if(isLoggedIn !=null && isLoggedIn) { response.sendRedirect(request.getContextPath()
            + "/agent-dashboard.jsp" ); return; } // Get error from request attribute (from forward) or URL parameter (from redirect) 
            String error=(String) request.getAttribute("error"); if (error==null) {
            error=request.getParameter("error"); } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login | Investment Tracker</title>
                <!-- Font Awesome for Icons -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <style>
                    /* ===== ROOT VARIABLES ===== */
                    :root {
                        --primary: #2c3e50;
                        --primary-dark: #1a252f;
                        --secondary: #3498db;
                        --accent: #2980b9;
                        --success: #27ae60;
                        --danger: #e74c3c;
                        --warning: #f39c12;
                        --light: #f8f9fa;
                        --dark: #343a40;
                        --gray: #6c757d;
                        --gray-light: #e9ecef;
                        --border-radius: 12px;
                        --box-shadow: 0 10px 40px rgba(0, 0, 0, 0.12);
                        --box-shadow-light: 0 5px 20px rgba(0, 0, 0, 0.08);
                        --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
                    }

                    /* ===== RESET & BASE ===== */
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    body {
                        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
                        background: linear-gradient(135deg, #f5f7fa 0%, #e4edf5 100%);
                        min-height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        padding: 20px;
                        line-height: 1.6;
                        color: var(--dark);
                    }

                    /* ===== LOGIN CONTAINER ===== */
                    .login-container {
                        width: 100%;
                        max-width: 480px;
                        animation: fadeInUp 0.8s ease-out;
                    }

                    @keyframes fadeInUp {
                        from {
                            opacity: 0;
                            transform: translateY(30px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    /* ===== LOGIN CARD ===== */
                    .login-card {
                        background: white;
                        border-radius: var(--border-radius);
                        box-shadow: var(--box-shadow);
                        overflow: hidden;
                        position: relative;
                    }

                    .login-card::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 5px;
                        background: linear-gradient(90deg, var(--primary) 0%, var(--secondary) 100%);
                    }

                    .card-header {
                        padding: 40px 40px 20px;
                        text-align: center;
                        background: white;
                    }

                    .logo-container {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin-bottom: 20px;
                    }

                    .logo-icon {
                        width: 60px;
                        height: 60px;
                        background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
                        border-radius: 12px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin-right: 15px;
                        box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
                    }

                    .logo-icon i {
                        font-size: 28px;
                        color: white;
                    }

                    .logo-text {
                        text-align: left;
                    }

                    .app-name {
                        font-size: 32px;
                        font-weight: 700;
                        background: linear-gradient(90deg, var(--primary) 0%, var(--secondary) 100%);
                        -webkit-background-clip: text;
                        background-clip: text;
                        -webkit-text-fill-color: transparent;
                        letter-spacing: -0.5px;
                        line-height: 1.2;
                    }

                    .app-tagline {
                        font-size: 14px;
                        color: var(--gray);
                        font-weight: 500;
                        margin-top: 5px;
                    }

                    .card-body {
                        padding: 20px 40px 40px;
                    }

                    /* ===== FORM STYLES ===== */
                    .form-group {
                        margin-bottom: 25px;
                        position: relative;
                    }

                    .form-label {
                        display: block;
                        margin-bottom: 8px;
                        font-weight: 600;
                        color: var(--primary);
                        font-size: 15px;
                        display: flex;
                        align-items: center;
                    }

                    .form-label i {
                        margin-right: 10px;
                        color: var(--secondary);
                        font-size: 16px;
                        width: 20px;
                    }

                    .input-group {
                        position: relative;
                        display: flex;
                        align-items: center;
                    }

                    .form-control {
                        width: 100%;
                        padding: 16px 20px 16px 50px;
                        border: 2px solid var(--gray-light);
                        border-radius: 10px;
                        font-size: 16px;
                        transition: var(--transition);
                        background-color: white;
                        color: var(--dark);
                    }

                    .form-control:focus {
                        outline: none;
                        border-color: var(--secondary);
                        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
                    }

                    .form-control::placeholder {
                        color: #adb5bd;
                    }

                    .input-icon {
                        position: absolute;
                        left: 18px;
                        color: var(--gray);
                        font-size: 18px;
                        pointer-events: none;
                    }

                    .password-toggle {
                        position: absolute;
                        right: 18px;
                        background: none;
                        border: none;
                        color: var(--gray);
                        cursor: pointer;
                        font-size: 18px;
                        transition: var(--transition);
                        padding: 5px;
                        border-radius: 50%;
                    }

                    .password-toggle:hover {
                        color: var(--secondary);
                        background-color: rgba(52, 152, 219, 0.1);
                    }

                    /* ===== LOGIN BUTTON ===== */
                    .btn-login {
                        width: 100%;
                        padding: 18px;
                        background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
                        color: white;
                        border: none;
                        border-radius: 10px;
                        font-size: 16px;
                        font-weight: 600;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        letter-spacing: 0.5px;
                        margin-top: 10px;
                        box-shadow: 0 4px 15px rgba(44, 62, 80, 0.2);
                    }

                    .btn-login:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 6px 20px rgba(44, 62, 80, 0.3);
                    }

                    .btn-login:active {
                        transform: translateY(0);
                    }

                    .btn-login i {
                        margin-right: 10px;
                        font-size: 18px;
                    }

                    /* ===== ERROR MESSAGE ===== */
                    .alert {
                        padding: 16px 20px;
                        border-radius: 10px;
                        margin-bottom: 25px;
                        display: flex;
                        align-items: center;
                        animation: slideInDown 0.5s ease-out;
                        border-left: 4px solid var(--danger);
                        background: linear-gradient(to right, rgba(231, 76, 60, 0.05), rgba(231, 76, 60, 0.02));
                    }

                    @keyframes slideInDown {
                        from {
                            opacity: 0;
                            transform: translateY(-10px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    .alert-danger {
                        color: var(--danger);
                    }

                    .alert-icon {
                        margin-right: 12px;
                        font-size: 20px;
                    }

                    .alert-message {
                        font-weight: 500;
                        font-size: 14.5px;
                    }

                    /* ===== FOOTER ===== */
                    .card-footer {
                        padding: 25px 40px;
                        background-color: #f8fafc;
                        border-top: 1px solid var(--gray-light);
                        text-align: center;
                    }

                    .system-info {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        font-size: 13px;
                        color: var(--gray);
                    }

                    .timestamp {
                        display: flex;
                        align-items: center;
                    }

                    .timestamp i {
                        margin-right: 8px;
                        color: var(--secondary);
                    }

                    .copyright {
                        font-size: 12px;
                        color: #adb5bd;
                    }

                    /* ===== SECURITY BADGE ===== */
                    .security-badge {
                        display: inline-flex;
                        align-items: center;
                        background: var(--light);
                        padding: 8px 15px;
                        border-radius: 20px;
                        font-size: 13px;
                        color: var(--gray);
                        margin-top: 15px;
                    }

                    .security-badge i {
                        color: var(--success);
                        margin-right: 8px;
                        font-size: 14px;
                    }

                    /* ===== RESPONSIVE ===== */
                    @media (max-width: 576px) {
                        .login-container {
                            max-width: 100%;
                        }

                        .card-header,
                        .card-body,
                        .card-footer {
                            padding: 30px 25px;
                        }

                        .logo-container {
                            flex-direction: column;
                            text-align: center;
                        }

                        .logo-icon {
                            margin-right: 0;
                            margin-bottom: 15px;
                        }

                        .logo-text {
                            text-align: center;
                        }

                        .system-info {
                            flex-direction: column;
                            gap: 10px;
                        }
                    }

                    /* ===== LOADING STATE ===== */
                    .btn-login.loading {
                        position: relative;
                        color: transparent;
                    }

                    .btn-login.loading::after {
                        content: '';
                        position: absolute;
                        width: 24px;
                        height: 24px;
                        border: 3px solid rgba(255, 255, 255, 0.3);
                        border-radius: 50%;
                        border-top-color: white;
                        animation: spin 0.8s linear infinite;
                    }

                    @keyframes spin {
                        to {
                            transform: rotate(360deg);
                        }
                    }

                    /* ===== PULSE ANIMATION FOR FOCUS ===== */
                    @keyframes pulse {
                        0% {
                            box-shadow: 0 0 0 0 rgba(52, 152, 219, 0.4);
                        }

                        70% {
                            box-shadow: 0 0 0 10px rgba(52, 152, 219, 0);
                        }

                        100% {
                            box-shadow: 0 0 0 0 rgba(52, 152, 219, 0);
                        }
                    }

                    .form-control:focus {
                        animation: pulse 1.5s infinite;
                    }

                    /* ===== STATUS INDICATOR ===== */
                    .status-indicator {
                        position: absolute;
                        top: 20px;
                        right: 20px;
                        display: flex;
                        align-items: center;
                        font-size: 12px;
                        color: var(--success);
                        font-weight: 500;
                    }

                    .status-dot {
                        width: 8px;
                        height: 8px;
                        background-color: var(--success);
                        border-radius: 50%;
                        margin-right: 6px;
                        animation: pulseDot 2s infinite;
                    }

                    @keyframes pulseDot {
                        0% {
                            opacity: 1;
                        }

                        50% {
                            opacity: 0.5;
                        }

                        100% {
                            opacity: 1;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="login-container">
                    <div class="login-card">
                        <!-- Status Indicator -->
                        <div class="status-indicator">
                            <span class="status-dot"></span>
                            System Online
                        </div>

                        <!-- Card Header with Logo -->
                        <div class="card-header">
                            <div class="logo-container">
                                <div class="logo-icon">
                                    <i class="fas fa-shield-alt"></i>
                                </div>
                                <div class="logo-text">
                                    <h1 class="app-name">Investment Tracker</h1>
                                    <p class="app-tagline">Investment Management System</p>
                                </div>
                            </div>
                        </div>

                        <!-- Card Body with Form -->
                        <div class="card-body">
                            <!-- Error Message Display -->
                            <% if (error !=null && !error.isEmpty()) { %>
                                <div class="alert alert-danger">
                                    <i class="fas fa-exclamation-circle alert-icon"></i>
                                    <span class="alert-message">
                                        <%= error %>
                                    </span>
                                </div>
                                <% } %>

                                    <!-- Login Form -->
                                    <form id="loginForm" action="<%= request.getContextPath() %>/login" method="POST">
                                        <!-- Username Field -->
                                        <div class="form-group">
                                            <label class="form-label" for="username">
                                                <i class="fas fa-user"></i>Username
                                            </label>
                                            <div class="input-group">
                                                <i class="fas fa-user input-icon"></i>
                                                <input type="text" id="username" name="username" class="form-control"
                                                    placeholder="Enter your username or email" required
                                                    autocomplete="username" autofocus>
                                            </div>
                                        </div>

                                        <!-- Password Field -->
                                        <div class="form-group">
                                            <label class="form-label" for="password">
                                                <i class="fas fa-lock"></i>Password
                                            </label>
                                            <div class="input-group">
                                                <i class="fas fa-lock input-icon"></i>
                                                <input type="password" id="password" name="password"
                                                    class="form-control" placeholder="Enter your password" required
                                                    autocomplete="current-password">
                                                <button type="button" class="password-toggle" id="togglePassword">
                                                    <i class="far fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>

                                        <!-- Login Button -->
                                        <button type="submit" class="btn-login" id="loginBtn">
                                            <i class="fas fa-sign-in-alt"></i>Access System
                                        </button>
                                    </form>

                                    <!-- Security Badge -->
                                    <div class="security-badge">
                                        <i class="fas fa-shield-check"></i>
                                        <span>Secured by Investment Tracker Authentication</span>
                                    </div>
                        </div>

                        <!-- Card Footer -->
                        <div class="card-footer">
                            <div class="system-info">
                                <div class="timestamp" id="currentDateTime">
                                    <i class="far fa-clock"></i>
                                    <span id="dateTimeText">Loading...</span>
                                </div>
                                <div class="copyright">
                                    &copy; 2023 Investment Tracker v2.0 • Authorized Access Only
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    // DOM Ready
                    document.addEventListener('DOMContentLoaded', function () {
                        // Password Toggle
                        const togglePassword = document.getElementById('togglePassword');
                        const passwordInput = document.getElementById('password');
                        const eyeIcon = togglePassword.querySelector('i');

                        togglePassword.addEventListener('click', function () {
                            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                            passwordInput.setAttribute('type', type);
                            eyeIcon.className = type === 'password' ? 'far fa-eye' : 'far fa-eye-slash';
                        });

                        // Form Submission
                        const loginForm = document.getElementById('loginForm');
                        const loginBtn = document.getElementById('loginBtn');

                        loginForm.addEventListener('submit', function (e) {
                            const username = document.getElementById('username').value.trim();
                            const password = document.getElementById('password').value;

                            // Basic validation
                            if (!username || !password) {
                                e.preventDefault();
                                showError('Please fill in all required fields');
                                return;
                            }

                            // Add loading state
                            loginBtn.classList.add('loading');
                            loginBtn.innerHTML = '';

                            // Simulate network delay for demo
                            setTimeout(() => {
                                loginBtn.classList.remove('loading');
                                loginBtn.innerHTML = '<i class="fas fa-sign-in-alt"></i>Access System';
                            }, 2000);
                        });

                        // Live Date Time
                        function updateDateTime() {
                            const now = new Date();
                            const options = {
                                weekday: 'long',
                                year: 'numeric',
                                month: 'long',
                                day: 'numeric',
                                hour: '2-digit',
                                minute: '2-digit',
                                second: '2-digit'
                            };
                            const dateTimeStr = now.toLocaleDateString('en-US', options);
                            document.getElementById('dateTimeText').textContent = dateTimeStr;
                        }

                        updateDateTime();
                        setInterval(updateDateTime, 1000);

                        // Auto-hide error messages
                        const errorAlert = document.querySelector('.alert');
                        if (errorAlert) {
                            setTimeout(() => {
                                errorAlert.style.opacity = '0';
                                errorAlert.style.transform = 'translateY(-10px)';
                                setTimeout(() => {
                                    errorAlert.remove();
                                }, 500);
                            }, 8000);
                        }

                        // Input validation on focus out
                        const inputs = document.querySelectorAll('.form-control');
                        inputs.forEach(input => {
                            input.addEventListener('blur', function () {
                                if (!this.value.trim()) {
                                    this.style.borderColor = 'var(--danger)';
                                } else {
                                    this.style.borderColor = 'var(--gray-light)';
                                }
                            });

                            input.addEventListener('input', function () {
                                this.style.borderColor = 'var(--gray-light)';
                            });
                        });

                        // Keyboard shortcuts
                        document.addEventListener('keydown', function (e) {
                            // Ctrl+Enter to submit
                            if (e.ctrlKey && e.key === 'Enter') {
                                loginForm.requestSubmit();
                            }

                            // Escape to focus username
                            if (e.key === 'Escape') {
                                document.getElementById('username').focus();
                            }
                        });

                        // Add visual feedback on successful input
                        inputs.forEach(input => {
                            input.addEventListener('input', function () {
                                if (this.value.length > 0) {
                                    this.parentElement.style.transform = 'translateY(-1px)';
                                } else {
                                    this.parentElement.style.transform = 'translateY(0)';
                                }
                            });
                        });
                    });

                    // Function to show error messages
                    function showError(message) {
                        // Remove existing error
                        const existingError = document.querySelector('.alert');
                        if (existingError) existingError.remove();

                        // Create new error
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'alert alert-danger';
                        errorDiv.innerHTML = `
                <i class="fas fa-exclamation-circle alert-icon"></i>
                <span class="alert-message">${message}</span>
            `;

                        // Insert at top of form
                        const form = document.getElementById('loginForm');
                        form.parentNode.insertBefore(errorDiv, form);

                        // Auto-remove after 5 seconds
                        setTimeout(() => {
                            errorDiv.style.opacity = '0';
                            errorDiv.style.transform = 'translateY(-10px)';
                            setTimeout(() => errorDiv.remove(), 500);
                        }, 5000);
                    }

                    // Add subtle animation to login card on load
                    window.addEventListener('load', function () {
                        const card = document.querySelector('.login-card');
                        card.style.transform = 'scale(0.98)';
                        setTimeout(() => {
                            card.style.transition = 'transform 0.5s ease';
                            card.style.transform = 'scale(1)';
                        }, 100);
                    });
                </script>
            </body>

            </html>