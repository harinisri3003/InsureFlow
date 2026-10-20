# InsureFlow – Insurance Policy Management System

InsureFlow is a web application that helps insurance agents manage customer records through a simple interface.

**Live Demo:** [https://insureflow-n6ur.onrender.com/agent-dashboard.jsp](https://insureflow-n6ur.onrender.com/agent-dashboard.jsp)

**GitHub Repository:** [https://github.com/harinisri3003/InsureFlow](https://github.com/harinisri3003/InsureFlow)

## Features

- Secure agent login using BCrypt password hashing
- Add and manage customer records
- Search for customers
- Update customer details
- Soft delete customer records
- Agent dashboard
- Database integration

## Technologies Used

- **Backend:** Java, Jakarta Servlets
- **Frontend:** JSP, HTML, CSS, JavaScript
- **Database:** TiDB Cloud (MySQL-compatible)
- **Connection Pool:** HikariCP
- **Security:** BCrypt
- **Build Tool:** Maven
- **Server:** Apache Tomcat
- **Deployment:** Render
- **Containerization:** Docker

## Getting Started

### Prerequisites

- Java JDK
- Apache Maven
- MySQL or a compatible database
- Apache Tomcat
- Git

### Installation

**1. Clone the repository**

```
git clone https://github.com/harinisri3003/InsureFlow.git
cd InsureFlow
```

**2. Set up the database**

Create the `Policy_Track` database and execute the required SQL scripts from the `database` folder.

**3. Configure environment variables**

Set the following variables with your database details:

```
DB_URL=jdbc:mysql://localhost:3306/Policy_Track
DB_USER=your_db_username
DB_PASSWORD=your_db_password
```

**4. Build the application**

```
mvn clean package
```

**5. Deploy to Tomcat**

Copy the generated WAR file from the `target` folder into Tomcat's `webapps` folder and start the server.

Open the application at:

```
http://localhost:8080/
```

## Deployment

The application is hosted on Render and uses TiDB Cloud for database connectivity.

**Live Application:** [https://insureflow-n6ur.onrender.com/agent-dashboard.jsp](https://insureflow-n6ur.onrender.com/agent-dashboard.jsp)

## Author

**Harini Sri**

- [GitHub](https://github.com/harinisri3003)
- [LinkedIn](https://www.linkedin.com/in/harinisri3003/)
