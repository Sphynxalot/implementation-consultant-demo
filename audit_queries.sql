-- Get users with access to a specific module (e.g., 'Document Control')
SELECT u.name, u.email, p.granted_on
FROM Permissions p
JOIN Users u ON p.user_id = u.user_id
JOIN Modules m ON p.module_id = m.module_id
WHERE m.name = 'Document Control';

-- Get users who have not logged in for 30 days
-- Simulates a deployment health check to see if users are actively engaging with system
SELECT u.name, u.email
FROM Users u
WHERE NOT EXISTS (
	SELECT 1
    FROM AuditLogs al
    WHERE al.user_id = u.user_id
    AND al.action = 'Login attempt'
    AND al.timestamp > NOW() - INTERVAL 30 DAY
);

-- Get unresolved issues by user
-- Simulates tracking client issues or ensuring open issues are prioritised
SELECT u.name, u.email, i.type, i.opened_on
FROM Issues i
JOIN Users u ON i.user_id = u.user_id
WHERE i.resolved_on IS NULL;

-- Get users who attempted access but were denied
-- Simulates security audits or compliance reports
SELECT u.name, u.email, al.action, al.timestamp
FROM AuditLogs al
JOIN Users u ON al.user_id = u.user_id
WHERE al.action LIKE 'Attempted Access %' AND al.status = 'Failed';

-- Get successful logins in the past 24 hours
SELECT COUNT(*) AS successful_logins
FROM AuditLogs
WHERE action = 'Login attempt'
AND status = 'Success'
AND timestamp > NOW() - INTERVAL 1 DAY;

-- Get most active modules by usage count
-- Helps identify module interaction which could influnece module support, updates, training etc.
SELECT m.name AS module_name, COUNT(al.log_id) AS usage_count
FROM Modules m
LEFT JOIN AuditLogs al
	ON al.action LIKE CONCAT('%', m.name, '%')
GROUP BY m.name
ORDER BY usage_count DESC
LIMIT 5;

-- Get peak login times
-- Indentifies usage trends which could inform scheduling of maintenance or training
SELECT HOUR(timestamp) AS login_hour, COUNT(*) AS login_count
FROM AuditLogs
WHERE action = 'Login attempt'
	AND status = 'Success'
GROUP BY login_hour
ORDER BY login_count DESC;

-- Get daily login trend
-- Helps track user engagement trends
SELECT DATE(timestamp) AS login_date, COUNT(*) as login_count
FROM AuditLogs
WHERE action = 'Login attempt'
	AND status = 'Success'
    AND timestamp > NOW() - INTERVAL 30 DAY
GROUP BY login_date
ORDER BY login_date DESC;