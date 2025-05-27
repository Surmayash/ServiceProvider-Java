# 🛠️ Service Provider Booking System

This is a Java Servlet + MySQL-based web application built during my internship at Softvyom Consulting Services Pvt. Ltd. The project allows users to book various service providers like maids, drivers, and tutors, with a backend system for login, booking management, admin view and worker panel.

---

## 📌 Features

- User Registration and Login (via Servlet & MySQL)
- Service Booking Form
- Admin View for All Bookings and User or Worker details
- Simple front-end using HTML, CSS & Js
- Fully Responsive

---

## 🧪 Screenshorts
![Screenshot 2025-05-27 223209](https://github.com/user-attachments/assets/55663576-3e8d-4a17-b269-4a33e4c374e8)
![Screenshot 2025-05-27 223152](https://github.com/user-attachments/assets/47908fea-4c9d-473e-ba09-b0deda071b59)
![Screenshot 2025-05-27 223130](https://github.com/user-attachments/assets/e166b5ff-7abe-4c9d-a153-6aced0c12dff)
![Screenshot 2025-05-27 223113](https://github.com/user-attachments/assets/5c47c31a-982c-49c1-9e49-90f334bd8235)
![Screenshot 2025-05-27 222954](https://github.com/user-attachments/assets/e63ab66e-91a8-462e-8930-23b333467288)

---

## 🧠 Technologies Used

- Java (Core + Servlet)
- HTML, CSS, JavaScript
- MySQL
- Apache Tomcat (Server)
- Eclipse IDE
- Git & GitHub

---

## 🧪 How to Run

1. Clone this repository or download ZIP
2. Import into Eclipse IDE
3. Configure Apache Tomcat in Eclipse
4. Create MySQL DB: `service_system`
5. Create tables
```sql
----------- User Section -----------------
   CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    contact VARCHAR(15),
    password VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(50),
    pin_code VARCHAR(10),
    country VARCHAR(50),
    state VARCHAR(50),
    photo LONGBLOB
);

CREATE TABLE user_queries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_delete (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    reason TEXT NOT NULL,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------- workers Section ----------------- 
CREATE TABLE workers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contact VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    pin_code VARCHAR(10) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    type ENUM('Maid', 'Plumber', 'Driver', 'Cook', 'Teacher', 'Electrician') NOT NULL,
    photo LONGBLOB
);

