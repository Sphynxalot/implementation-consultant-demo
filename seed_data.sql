-- Users
INSERT INTO Users (name, email, department, role) VALUES
('Alice Green', 'alice.green@client.com', 'Quality', 'Manager'),
('Bob Smith', 'bob.smith@client.com', 'Compliance', 'Analyst'),
('Charlie Wu', 'charlie.wu@client.com', 'IT', 'Technician'),
('Dina Patel', 'dina.patel@client.com', 'Quality', 'Coordinator'),
('Ethan James', 'ethan.james@client.com', 'IT', 'Manager'),
('Fiona Lee', 'fiona.lee@client.com', 'Compliance', 'Officer');

-- Modules
INSERT INTO Modules (name, enabled, setup_date) VALUES
('Document Control', TRUE, '2025-03-01'),
('Audit Management', TRUE, '2025-03-15'),
('Risk Register', FALSE, NULL),
('Training Records', TRUE, '2025-04-01'),
('Supplier Management', FALSE, NULL);

-- Permissions
INSERT INTO Permissions (user_id, module_id, granted_by, granted_on) VALUES
(1, 1, 'ethan.james@client.com', '2025-03-02'),
(1, 2, 'ethan.james@client.com', '2025-03-15'),
(2, 1, 'ethan.james@client.com', '2025-03-05'),
(2, 2, 'ethan.james@client.com', '2025-03-20'),
(3, 1, 'ethan.james@client.com', '2025-03-10'),
(5, 2, 'ethan.james@client.com', '2025-03-22');

-- Audit Logs
INSERT INTO AuditLogs (user_id, action, timestamp, status) VALUES
(1, 'Login attempt', '2025-03-01 08:32:10', 'Success'),
(1, 'Viewed Document Control module', '2025-03-01 08:33:05', 'Success'),
(1, 'Uploaded policy document', '2025-03-01 08:35:47', 'Success'),
(2, 'Login attempt', '2025-03-02 09:12:21', 'Failed'),
(2, 'Login attempt', '2025-03-02 09:13:09', 'Success'),
(2, 'Viewed Audit Management module', '2025-03-02 09:14:15', 'Success'),
(2, 'Generated audit report', '2025-03-02 09:18:40', 'Success'),
(3, 'Login attempt', '2025-03-04 10:01:00', 'Success'),
(3, 'Viewed Document Control module', '2025-03-04 10:01:45', 'Success'),
(3, 'Attempted file upload', '2025-03-04 10:02:10', 'Failed'),
(3, 'Viewed help documentation', '2025-03-04 10:03:30', 'Success'),
(6, 'Login attempt', '2025-03-05 08:45:00', 'Success'),
(6, 'Viewed Audit Management module', '2025-03-05 08:46:12', 'Success'),
(6, 'Changed audit threshold settings', '2025-03-05 08:49:50', 'Success'),
(1, 'Viewed Incident Management module', '2025-03-06 09:02:11', 'Success'),
(2, 'Attempted access to Incident Management', '2025-03-06 09:03:55', 'Failed'),
(3, 'Login attempt', '2025-03-17 10:04:25', 'Success'),
(2, 'Login attempt', '2025-04-15 10:04:25', 'Success'),
(3, 'Login attempt', '2025-04-14 23:26:05', 'Success');

-- Issues
INSERT INTO Issues (user_id, type, opened_on, resolved_on) VALUES
(1, 'Access Violation', '2025-03-01', '2025-03-02'),  
(2, 'Missing Module Configuration', '2025-03-02', NULL), 
(3, 'System Bug', '2025-03-03', '2025-03-04'),         
(4, 'Training Request', '2025-03-04', '2025-03-05'),   
(5, 'Permission Issue', '2025-03-05', NULL),            
(6, 'Feature Request', '2025-03-06', NULL),              
(2, 'Access Violation', '2025-03-07', '2025-03-08'),    
(3, 'Missing Document', '2025-03-08', '2025-03-10'),    
(1, 'System Bug', '2025-03-09', NULL),                 
(4, 'Missing Configuration', '2025-03-10', NULL);      
