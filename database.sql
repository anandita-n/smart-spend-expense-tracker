CREATE DATABASE IF NOT EXISTS smartspend;

USE smartspend;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    category VARCHAR(100),
    description TEXT,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE budgets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    monthly_limit DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(id)
);