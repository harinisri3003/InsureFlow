# 🛡️ PolicyTrack — Insurance Policy Management System

A full-stack web application for insurance agents to manage customers, track policies, and handle premium-related workflows. Built with **Java EE (Jakarta Servlet + JSP)** and **MySQL**.

> 🚧 **This project is under active development.** Some features are still being built.

---

## ✨ Features

- 🔐 **Secure Authentication** — BCrypt password hashing with session-based login
- 👥 **Customer Management** — Add, search, and manage customer records with KYC details
- 📋 **Policy Management** — Create and track insurance policies for customers
- 📊 **Agent Dashboard** — Overview of key metrics and recent activity
- 🔔 **Notifications** — Stay updated on important policy events
- 🎨 **Modern UI** — Responsive design with smooth animations and a clean interface
- 🐳 **Docker Ready** — One-command deployment with Docker Compose

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| **Backend** | Java 21, Jakarta Servlet 6.0, JSP |
| **Database** | MySQL 8.0 |
| **Connection Pool** | HikariCP |
| **Security** | BCrypt (jBCrypt) |
| **Build Tool** | Maven |
| **Server** | Apache Tomcat 11 |
| **Containerization** | Docker, Docker Compose |

---

## 📁 Project Structure

```
PolicyTrack/
├── src/main/
│   ├── java/com/policytrack/
│   │   ├── config/          # Database configuration (HikariCP)
│   │   ├── dao/             # Data Access Objects
│   │   ├── filter/          # Authentication filter
│   │   ├── model/           # Entity classes
│   │   ├── service/         # Business logic
│   │   ├── servlet/         # HTTP request handlers
│   │   └── util/            # Utility classes (password hashing)
│   └── webapp/
│       ├── WEB-INF/         # Web app configuration
│       ├── includes/        # Reusable JSP components
│       ├── index.jsp        # Login page
│       ├── agent-dashboard.jsp
│       ├── add-customer.jsp
│       ├── search-customer.jsp
│       ├── add-policy.jsp
│       └── notifications.jsp
├── database/                # SQL schema scripts
├── Dockerfile               # Multi-stage Docker build
├── docker-compose.yml       # Full stack deployment
└── pom.xml                  # Maven dependencies
```

---

## 🚀 Getting Started

### Prerequisites

- **Java 21** or later
- **Maven 3.9+**
- **MySQL 8.0** (or use Docker)
- **Apache Tomcat 11** (or use Docker)

### Option 1: Run with Docker (Recommended)

```bash
# 1. Clone the repository
git clone https://github.com/Akshatsharma2205/PolicyTrack.git
cd PolicyTrack

# 2. Create your .env file from the template
cp .env.example .env
# Edit .env and set your passwords

# 3. Start the application
docker-compose up -d

# 4. Open in browser
# http://localhost:8080
```

### Option 2: Run Locally

```bash
# 1. Clone the repository
git clone https://github.com/Akshatsharma2205/PolicyTrack.git
cd PolicyTrack

# 2. Set up MySQL database
#    Create a database and run the SQL scripts from the database/ folder

# 3. Set environment variables
export DB_URL=jdbc:mysql://localhost:3306/policytrack
export DB_USER=your_db_user
export DB_PASSWORD=your_db_password

# 4. Build the WAR file
mvn clean package

# 5. Deploy the WAR file to Tomcat's webapps directory
```

---

## ⚙️ Environment Variables

| Variable | Description |
|----------|-------------|
| `DB_URL` | JDBC connection URL |
| `DB_USER` | Database username |
| `DB_PASSWORD` | Database password |
| `MYSQL_ROOT_PASSWORD` | MySQL root password (Docker only) |

---

## 📸 Screenshots

*Coming soon — the project is still in development.*

---

## 🗺️ Roadmap

- [x] Agent authentication (login/logout)
- [x] Agent dashboard
- [x] Add & search customers
- [x] Add policies
- [x] Notifications page
- [ ] Edit/Delete customers
- [ ] Policy renewal tracking
- [ ] Premium payment history
- [ ] Report generation
- [ ] Admin panel

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/Akshatsharma2205">Akshat Sharma</a>
</p>