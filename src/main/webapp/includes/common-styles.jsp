<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        /* ===== CORPORATE INSURANCE COLOR PALETTE ===== */
        :root {
            --primary: #1a365d;
            --primary-light: #2d4a8a;
            --secondary: #2c5282;
            --accent: #3182ce;
            --success: #38a169;
            --warning: #d69e2e;
            --danger: #c53030;
            --neutral-100: #f7fafc;
            --neutral-200: #edf2f7;
            --neutral-300: #e2e8f0;
            --neutral-400: #cbd5e0;
            --neutral-500: #a0aec0;
            --neutral-600: #718096;
            --neutral-700: #4a5568;
            --neutral-800: #2d3748;
            --border-radius: 6px;
            --box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --box-shadow-hover: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --transition: all 0.2s ease-in-out;
        }

        /* ===== DARK MODE VARIABLES ===== */
        [data-theme="dark"] {
            --primary: #90cdf4;
            --primary-light: #63b3ed;
            --secondary: #4299e1;
            --accent: #63b3ed;
            --success: #68d391;
            --warning: #f6e05e;
            --danger: #fc8181;
            --neutral-100: #1a202c;
            --neutral-200: #2d3748;
            --neutral-300: #4a5568;
            --neutral-400: #718096;
            --neutral-500: #a0aec0;
            --neutral-600: #cbd5e0;
            --neutral-700: #e2e8f0;
            --neutral-800: #f7fafc;
            --box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.3), 0 1px 2px 0 rgba(0, 0, 0, 0.2);
            --box-shadow-hover: 0 4px 6px -1px rgba(0, 0, 0, 0.3), 0 2px 4px -1px rgba(0, 0, 0, 0.2);
        }

        /* ===== BASE STYLES ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: var(--neutral-100);
            color: var(--neutral-800);
            line-height: 1.5;
            font-size: 14px;
        }

        /* ===== DASHBOARD LAYOUT ===== */
        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 240px;
            height: 100vh;
            background: white;
            border-right: 1px solid var(--neutral-300);
            z-index: 101;
            transition: transform 0.3s ease;
        }

        .sidebar-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index: 100;
        }

        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid var(--neutral-300);
        }

        .sidebar-title {
            color: var(--primary);
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 4px;
        }

        .sidebar-subtitle {
            color: var(--neutral-500);
            font-size: 12px;
        }

        .nav-menu {
            padding: 16px 0;
        }

        .nav-menu ul {
            list-style: none;
        }

        .nav-item {
            margin-bottom: 2px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 20px;
            color: var(--neutral-700);
            font-size: 14px;
            font-weight: 500;
            transition: var(--transition);
            border-left: 3px solid transparent;
            text-decoration: none;
            position: relative;
        }

        .nav-link:hover {
            background: var(--neutral-100);
            color: var(--primary);
        }

        .nav-link.active {
            background: var(--neutral-100);
            color: var(--primary);
            border-left-color: var(--accent);
            font-weight: 600;
        }

        .nav-link i {
            width: 20px;
            font-size: 16px;
            text-align: center;
            color: var(--neutral-500);
        }

        .nav-link.active i,
        .nav-link:hover i {
            color: var(--primary);
        }

        .notification-count {
            position: absolute;
            right: 16px;
            background: var(--danger);
            color: white;
            font-size: 11px;
            font-weight: 600;
            padding: 2px 6px;
            border-radius: 10px;
            min-width: 18px;
            text-align: center;
        }

        /* ===== HEADER ===== */
        .header {
            position: fixed;
            top: 0;
            left: 240px;
            right: 0;
            height: 60px;
            background: white;
            border-bottom: 1px solid var(--neutral-300);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 24px;
            z-index: 100;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 24px;
        }

        .menu-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 20px;
            color: var(--neutral-600);
            cursor: pointer;
            padding: 8px;
        }

        .page-title {
            font-size: 20px;
            font-weight: 500;
            color: var(--neutral-800);
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .theme-toggle {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 6px 12px;
            background: var(--neutral-100);
            border: 1px solid var(--neutral-300);
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            font-size: 14px;
            color: var(--neutral-600);
        }

        .theme-toggle:hover {
            background: var(--neutral-200);
        }

        .agent-info {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 12px;
            background: var(--neutral-100);
            border: 1px solid var(--neutral-300);
            border-radius: var(--border-radius);
        }

        .agent-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: var(--neutral-200);
            border: 1px solid var(--neutral-300);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-weight: 600;
            font-size: 14px;
        }

        .agent-details h3 {
            font-size: 14px;
            font-weight: 600;
            color: var(--neutral-800);
            margin: 0;
        }

        .agent-details p {
            font-size: 12px;
            color: var(--neutral-500);
            margin: 0;
        }

        .btn-logout {
            padding: 8px 16px;
            background: white;
            color: var(--neutral-700);
            border: 1px solid var(--neutral-300);
            border-radius: var(--border-radius);
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-logout:hover {
            background: var(--neutral-100);
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            flex: 1;
            margin-left: 240px;
            margin-top: 60px;
            padding: 24px;
        }

        /* ===== DARK MODE ===== */
        [data-theme="dark"] body {
            background-color: var(--neutral-100);
            color: var(--neutral-800);
        }

        [data-theme="dark"] .sidebar,
        [data-theme="dark"] .header {
            background: var(--neutral-200);
            border-color: var(--neutral-300);
        }

        [data-theme="dark"] .nav-link:hover,
        [data-theme="dark"] .nav-link.active {
            background: var(--neutral-300);
        }

        [data-theme="dark"] .theme-toggle,
        [data-theme="dark"] .agent-info,
        [data-theme="dark"] .btn-logout {
            background: var(--neutral-300);
            border-color: var(--neutral-400);
            color: var(--neutral-700);
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 1200px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .sidebar-overlay.active {
                display: block;
            }

            .header {
                left: 0;
            }

            .main-content {
                margin-left: 0;
            }

            .menu-toggle {
                display: block;
            }
        }

        @media (max-width: 768px) {
            .header {
                padding: 0 12px;
                height: 56px;
            }

            .header-right .agent-details {
                display: none;
            }

            .btn-logout span {
                display: none;
            }

            .page-title {
                font-size: 16px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 150px;
            }

            .main-content {
                padding: 16px 12px;
                margin-top: 56px;
            }

            .theme-toggle span {
                display: none;
            }

            .theme-toggle {
                padding: 8px;
                min-width: 36px;
            }

            .agent-info {
                padding: 6px 8px;
            }

            .agent-avatar {
                width: 32px;
                height: 32px;
                font-size: 12px;
            }
        }

        @media (max-width: 480px) {
            .page-title {
                font-size: 14px;
                max-width: 120px;
            }

            .header-left {
                gap: 8px;
            }

            .header-right {
                gap: 8px;
            }

            .main-content {
                padding: 12px 8px;
            }

            .agent-info {
                display: none;
            }
        }
    </style>