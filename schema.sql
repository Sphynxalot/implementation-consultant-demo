CREATE DATABASE IF NOT EXISTS ideagen_audit;
USE ideagen_audit;

-- Users table
CREATE TABLE Users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    role VARCHAR(50)
);

-- Modules table
CREATE TABLE Modules (
	module_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    enabled BOOLEAN,
    setup_date DATE
);

-- Permissions table
CREATE TABLE Permissions (
	permission_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    module_id INT,
    granted_by VARCHAR(100),
    granted_on DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (module_id) REFERENCES Modules(module_id)
);

-- Audit Logs table
CREATE TABLE AuditLogs (
	log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    action VARCHAR(100),
    timestamp DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Compliance Issues table
CREATE TABLE Issues (
	issue_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    type VARCHAR(50),
    opened_on DATE,
    resolved_on DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);