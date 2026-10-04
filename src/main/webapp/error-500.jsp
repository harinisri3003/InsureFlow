<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>500 - Server Error | Investment Tracker</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary: #2c3e50;
                --secondary: #3498db;
                --danger: #e74c3c;
                --danger-dark: #c0392b;
                --light: #f8f9fa;
                --dark: #343a40;
                --gray: #6c757d;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                background: linear-gradient(135deg, #fef5f5 0%, #fce4e4 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .error-container {
                text-align: center;
                max-width: 600px;
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

            .error-icon {
                width: 150px;
                height: 150px;
                background: linear-gradient(135deg, var(--danger), var(--danger-dark));
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 30px;
                box-shadow: 0 15px 35px rgba(231, 76, 60, 0.3);
                animation: shake 0.5s ease-in-out;
            }

            @keyframes shake {

                0%,
                100% {
                    transform: translateX(0);
                }

                20%,
                60% {
                    transform: translateX(-5px);
                }

                40%,
                80% {
                    transform: translateX(5px);
                }
            }

            .error-icon i {
                font-size: 70px;
                color: white;
            }

            .error-code {
                font-size: 120px;
                font-weight: 800;
                background: linear-gradient(135deg, var(--danger), var(--danger-dark));
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                line-height: 1;
                margin-bottom: 10px;
            }

            .error-title {
                font-size: 28px;
                font-weight: 600;
                color: var(--danger);
                margin-bottom: 15px;
            }

            .error-message {
                font-size: 16px;
                color: var(--gray);
                margin-bottom: 30px;
                line-height: 1.6;
            }

            .error-actions {
                display: flex;
                gap: 15px;
                justify-content: center;
                flex-wrap: wrap;
            }

            .btn {
                padding: 14px 28px;
                border-radius: 10px;
                font-size: 15px;
                font-weight: 600;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 10px;
                transition: all 0.3s ease;
                cursor: pointer;
                border: none;
            }

            .btn-primary {
                background: linear-gradient(135deg, var(--primary), var(--secondary));
                color: white;
                box-shadow: 0 4px 15px rgba(44, 62, 80, 0.2);
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(44, 62, 80, 0.3);
            }

            .btn-danger {
                background: white;
                color: var(--danger);
                border: 2px solid var(--danger);
            }

            .btn-danger:hover {
                background: var(--danger);
                color: white;
            }

            .error-details {
                margin-top: 40px;
                padding: 20px;
                background: white;
                border-radius: 12px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
                text-align: left;
                border-left: 4px solid var(--danger);
            }

            .error-details h4 {
                color: var(--danger);
                margin-bottom: 10px;
                font-size: 14px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .error-details p {
                color: var(--gray);
                font-size: 13px;
                margin-bottom: 8px;
            }

            .error-details code {
                display: block;
                padding: 10px;
                background: #f8f9fa;
                border-radius: 6px;
                font-family: 'Consolas', monospace;
                font-size: 12px;
                color: var(--dark);
                word-break: break-all;
                max-height: 100px;
                overflow-y: auto;
            }

            .timestamp {
                margin-top: 15px;
                font-size: 12px;
                color: #adb5bd;
            }

            .brand {
                margin-top: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                color: var(--gray);
                font-size: 14px;
            }

            .brand-icon {
                width: 30px;
                height: 30px;
                background: linear-gradient(135deg, var(--primary), var(--secondary));
                border-radius: 6px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 14px;
            }

            @media (max-width: 576px) {
                .error-code {
                    font-size: 80px;
                }

                .error-title {
                    font-size: 22px;
                }

                .error-icon {
                    width: 120px;
                    height: 120px;
                }

                .error-icon i {
                    font-size: 50px;
                }
            }
        </style>
    </head>

    <body>
        <div class="error-container">
            <div class="error-icon">
                <i class="fas fa-exclamation-triangle"></i>
            </div>

            <div class="error-code">500</div>
            <h1 class="error-title">Internal Server Error</h1>
            <p class="error-message">
                Something went wrong on our end. Our team has been notified and is working to fix it.
                Please try again later or contact support if the problem persists.
            </p>

            <div class="error-actions">
                <a href="<%= request.getContextPath() %>/agent-dashboard.jsp" class="btn btn-primary">
                    <i class="fas fa-home"></i> Go to Dashboard
                </a>
                <a href="javascript:location.reload()" class="btn btn-danger">
                    <i class="fas fa-redo"></i> Try Again
                </a>
            </div>

            <div class="error-details">
                <h4><i class="fas fa-bug"></i> Error Details</h4>
                <p><strong>URL:</strong>
                    <%= request.getAttribute("jakarta.servlet.error.request_uri") !=null ?
                        request.getAttribute("jakarta.servlet.error.request_uri") : request.getRequestURI() %>
                </p>
                <% Throwable throwable=(Throwable) request.getAttribute("jakarta.servlet.error.exception"); if
                    (throwable !=null) { %>
                    <p><strong>Error:</strong></p>
                    <code><%= throwable.getClass().getName() %>: <%= throwable.getMessage() != null ? throwable.getMessage() : "No message" %></code>
                    <% } %>
                        <div class="timestamp">
                            <i class="far fa-clock"></i>
                            Occurred at: <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new
                                java.util.Date()) %>
                        </div>
            </div>

            <div class="brand">
                <div class="brand-icon"><i class="fas fa-shield-alt"></i></div>
                <span>Investment Tracker</span>
            </div>
        </div>
    </body>

    </html>