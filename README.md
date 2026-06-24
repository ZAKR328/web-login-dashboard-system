# Web-Based Login & Dashboard System

A full-stack web application built with Java Servlets, JSP, and PostgreSQL, featuring secure user authentication and a dynamic dashboard.

## 🚀 Features

- User registration and login system
- Secure session management
- Interactive dashboard for managing user data
- Responsive frontend using HTML5 and CSS3
- RESTful request handling using Java Servlet API

## 🛠️ Tech Stack

- **Backend:** Java, Servlets, Apache Tomcat
- **Frontend:** HTML5, CSS3, JSP
- **Database:** PostgreSQL
- **Build Tool:** Maven
- **IDE:** IntelliJ IDEA
- **Deployment:** AWS EC2 (Ubuntu Server)

## ☁️ Deployment

This application is deployed on an **AWS EC2 instance (Ubuntu)** running Apache Tomcat, with a live, working dashboard accessible over the internet. Live demo available on request.

## 📂 Project Structure

```
src/main/java/com/example/assignment02/
├── dao/          # Data Access Objects (database operations)
├── model/        # Entity/model classes (e.g., User)
└── web/          # Servlets (LoginServlet, RegisterServlet, UserServlet)

src/main/resources/
└── META-INF/     # Persistence configuration

src/main/webapp/
└── *.jsp         # JSP pages (dashboard, error pages, etc.)
```

## ⚙️ Key Concepts Implemented

- Object-Oriented Programming (OOP) principles — inheritance, encapsulation, and polymorphism
- HTTP request/response lifecycle and routing
- Server-side logic using the Servlet API
- Session-based authentication
- Database connectivity using PostgreSQL

## 🏃 How to Run

1. Clone the repository
   ```bash
   git clone https://github.com/ZAKR328/web-login-dashboard-system.git
   ```
2. Configure your PostgreSQL database connection in `persistence.xml`
3. Build the project using Maven:
   ```bash
   ./mvnw clean install
   ```
4. Deploy the generated `.war` file to Apache Tomcat
5. Access the application via your browser

> **Note:** This project is also deployed live on an AWS EC2 (Ubuntu) instance running Apache Tomcat. Demo access available on request.

## 👤 Author

**Zain Ahmed Khan Rohila**
Computer Science Student, SZABIST University
