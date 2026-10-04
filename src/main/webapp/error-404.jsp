<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>404 - Page Not Found | Investment Tracker</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary: #2c3e50;
                --secondary: #3498db;
                --accent: #2980b9;
                --danger: #e74c3c;
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
                background: linear-gradient(135deg, #f5f7fa 0%, #e4edf5 100%);
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
                background: linear-gradient(135deg, var(--secondary), var(--accent));
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 30px;
                box-shadow: 0 15px 35px rgba(52, 152, 219, 0.3);
                animation: pulse 2s infinite;
            }

            @keyframes pulse {

                0%,
                100% {
                    transform: scale(1);
                }

                50% {
                    transform: scale(1.05);
                }
            }

            .error-icon i {
                font-size: 70px;
                color: white;
            }

            .error-code {
                font-size: 120px;
                font-weight: 800;
                background: linear-gradient(135deg, var(--primary), var(--secondary));
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                line-height: 1;
                margin-bottom: 10px;
            }

            .error-title {
                font-size: 28px;
                font-weight: 600;
                color: var(--primary);
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

            .btn-secondary {
                background: white;
                color: var(--primary);
                border: 2px solid var(--primary);
            }

            .btn-secondary:hover {
                background: var(--primary);
                color: white;
            }

            .error-details {
                margin-top: 40px;
                padding: 20px;
                background: white;
                border-radius: 12px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            }

            .error-details h4 {
                color: var(--primary);
                margin-bottom: 10px;
                font-size: 14px;
            }

            .error-details p {
                color: var(--gray);
                font-size: 13px;
                word-break: break-all;
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
                <i class="fas fa-search"></i>
            </div>

            <div class="error-code">404</div>
            <h1 class="error-title">Page Not Found</h1>
            <p class="error-message">
                Oops! The page you're looking for doesn't exist or has been moved.
                Please check the URL or navigate back to safety.
            </p>

            <div class="error-actions">
                <a href="<%= request.getContextPath() %>/agent-dashboard.jsp" class="btn btn-primary">
                    <i class="fas fa-home"></i> Go to Dashboard
                </a>
                <a href="javascript:history.back()" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Go Back
                </a>
            </div>

            <div class="error-details">
                <h4><i class="fas fa-info-circle"></i> Requested URL</h4>
                <p>
                    <%= request.getAttribute("jakarta.servlet.error.request_uri") !=null ?
                        request.getAttribute("jakarta.servlet.error.request_uri") : request.getRequestURI() %>
                </p>
            </div>

            <div class="brand">
                <div class="brand-icon"><i class="fas fa-shield-alt"></i></div>
                <span>Investment Tracker</span>
            </div>
        </div>
    </body>

    </html>