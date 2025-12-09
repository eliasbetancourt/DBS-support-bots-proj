
-- Query to find the count of bots by profession/type.


SELECT BotType, COUNT(*) AS BotCount
FROM Bot
GROUP BY BotType;
