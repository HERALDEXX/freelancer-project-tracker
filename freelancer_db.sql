-- Create the database
CREATE DATABASE IF NOT EXISTS freelancer_db;
USE freelancer_db;

-- Clients table
CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    company VARCHAR(100),
    country VARCHAR(50)
);

-- Projects table
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    client_id INT,
    budget DECIMAL(10,2) NOT NULL,
    deadline DATE NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

-- Payments table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    method ENUM('Bank Transfer', 'PayPal', 'Crypto') NOT NULL,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- Insert sample clients
INSERT INTO Clients (name, email, company, country) VALUES
('Ada Lovelace', 'ada@example.com', 'TechVerse', 'UK'),
('Chidi Nwosu', 'chidi@example.com', 'DevSphere', 'Nigeria'),
('Fatima Khan', 'fatima@example.com', 'NextGen AI', 'Pakistan'),
('John Smith', 'john@example.com', 'DesignLab', 'USA'),
('Maria Garcia', 'maria@example.com', 'SmartApps', 'Spain'),
('Zainab Bello', 'zainab@example.com', 'ZB Designs', 'Nigeria'),
('Liam Chen', 'liam@example.com', 'CodeEdge', 'Singapore'),
('Olivia Brown', 'olivia@example.com', 'UIUX Studios', 'Canada'),
('Adewale James', 'adewale@example.com', 'WaleTech', 'Nigeria'),
('Emma Rossi', 'emma@example.com', 'CloudNine', 'Italy');

-- Insert sample projects
INSERT INTO Projects (title, description, client_id, budget, deadline, status) VALUES
('E-Commerce Website', 'Online shop with payment gateway', 1, 1000.00, '2025-08-15', 'In Progress'),
('Mobile App UI Design', 'Designing UI for food delivery app', 2, 500.00, '2025-08-01', 'Completed'),
('AI Chatbot Integration', NULL, 3, 1200.00, '2025-09-10', 'Pending'),
('Landing Page Redesign', 'Modernizing a product landing page', 4, 300.00, '2025-07-25', 'In Progress'),
('Portfolio Website', 'Static portfolio for photographer', 5, 450.00, '2025-08-05', 'Completed'),
('Company Dashboard', NULL, 6, 800.00, '2025-08-20', 'Pending'),
('Event Registration System', 'Web app for event signups', 7, 700.00, '2025-08-10', 'In Progress'),
('Educational Blog Setup', 'WordPress blog with SEO plugins', 8, 200.00, '2025-07-30', 'Completed'),
('API Integration Task', NULL, 9, 350.00, '2025-08-02', 'Pending'),
('Resume Builder Tool', 'Interactive CV builder', 10, 600.00, '2025-08-18', 'In Progress');

-- Insert sample payments
INSERT INTO Payments (project_id, amount, payment_date, method) VALUES
(1, 500.00, '2025-07-10', 'Bank Transfer'),
(2, 500.00, '2025-07-05', 'PayPal'),
(3, 600.00, '2025-07-15', 'Crypto'),
(4, 150.00, '2025-07-12', 'Bank Transfer'),
(5, 450.00, '2025-07-08', 'PayPal'),
(6, 400.00, '2025-07-18', 'Crypto'),
(7, 350.00, '2025-07-14', 'Bank Transfer'),
(8, 200.00, '2025-07-06', 'PayPal'),
(9, 200.00, '2025-07-16', 'Bank Transfer'),
(10, 300.00, '2025-07-20', 'Crypto');

-- Sample SELECT queries (for testing)

-- 1. List all upcoming projects sorted by deadline
SELECT title, deadline, status
FROM Projects
WHERE deadline > CURDATE()
ORDER BY deadline ASC;

-- 2. Count how many projects each client has
SELECT c.name, COUNT(p.project_id) AS project_count
FROM Clients c
LEFT JOIN Projects p ON c.client_id = p.client_id
GROUP BY c.client_id;

-- 3. Show total payments received by payment method
SELECT method, SUM(amount) AS total_received
FROM Payments
GROUP BY method;
