-- Query to show active bots with their codebase and service duration

SELECT
    b.BotID,
    b.BotName,
    b.BotType,
    b.ServiceStartDate,
    b.ServiceEndDate,
    c.CodebaseName,
    c.Language,
    DATEDIFF(COALESCE(b.ServiceEndDate, CURDATE()), b.ServiceStartDate) AS DaysInService
FROM Bot b
JOIN Codebase c ON b.CodebaseID = c.CodebaseID
ORDER BY DaysInService DESC;
