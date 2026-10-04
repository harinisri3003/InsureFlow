<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <script>
        // ===== DARK MODE TOGGLE =====
        // Apply theme immediately (before DOM ready) to prevent flash
        (function () {
            const savedTheme = localStorage.getItem('theme');
            if (savedTheme === 'dark') {
                document.documentElement.setAttribute('data-theme', 'dark');
            }
        })();

        function updateThemeToggle(isDark) {
            const icon = document.getElementById('themeIcon');
            const label = document.getElementById('themeLabel');
            if (icon && label) {
                if (isDark) {
                    icon.classList.remove('fa-moon');
                    icon.classList.add('fa-sun');
                    label.textContent = 'Light';
                } else {
                    icon.classList.remove('fa-sun');
                    icon.classList.add('fa-moon');
                    label.textContent = 'Dark';
                }
            }
        }

        function toggleTheme() {
            const html = document.documentElement;
            const currentTheme = html.getAttribute('data-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';

            if (newTheme === 'dark') {
                html.setAttribute('data-theme', 'dark');
                updateThemeToggle(true);
            } else {
                html.removeAttribute('data-theme');
                updateThemeToggle(false);
            }

            localStorage.setItem('theme', newTheme);
        }

        // Update toggle button after DOM is ready
        document.addEventListener('DOMContentLoaded', function () {
            // Update toggle button to match current theme
            const isDark = document.documentElement.getAttribute('data-theme') === 'dark';
            updateThemeToggle(isDark);

            // Add event listener to theme toggle
            const themeToggle = document.getElementById('themeToggle');
            if (themeToggle) {
                themeToggle.addEventListener('click', toggleTheme);
            }
        });

        // ===== MOBILE SIDEBAR TOGGLE =====
        function openSidebar() {
            document.getElementById('sidebar').classList.add('active');
            document.getElementById('sidebarOverlay').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeSidebar() {
            document.getElementById('sidebar').classList.remove('active');
            document.getElementById('sidebarOverlay').classList.remove('active');
            document.body.style.overflow = '';
        }

        document.addEventListener('DOMContentLoaded', function () {
            // Menu toggle button
            const menuToggle = document.getElementById('menuToggle');
            if (menuToggle) {
                menuToggle.addEventListener('click', function () {
                    const sidebar = document.getElementById('sidebar');
                    if (sidebar.classList.contains('active')) {
                        closeSidebar();
                    } else {
                        openSidebar();
                    }
                });
            }

            // Overlay click
            const overlay = document.getElementById('sidebarOverlay');
            if (overlay) {
                overlay.addEventListener('click', closeSidebar);
            }

            // Close sidebar on nav link click (mobile)
            const navLinks = document.querySelectorAll('.nav-link');
            navLinks.forEach(link => {
                link.addEventListener('click', function () {
                    if (window.innerWidth <= 1200) {
                        closeSidebar();
                    }
                });
            });

            // Close sidebar on escape key
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    closeSidebar();
                }
            });

            // Close sidebar on resize to desktop
            window.addEventListener('resize', function () {
                if (window.innerWidth > 1200) {
                    closeSidebar();
                }
            });
        });
    </script>