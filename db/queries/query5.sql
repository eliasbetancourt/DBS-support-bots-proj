-- Query to find the top 3 most used bots

SELECT
    b.BotID,
    b.BotName,
    COUNT(ub.UserID) AS UsageCount
FROM UserBot ub
JOIN Bot b ON ub.BotID = b.BotID
GROUP BY b.BotID, b.BotName
ORDER BY UsageCount DESC
LIMIT 3;