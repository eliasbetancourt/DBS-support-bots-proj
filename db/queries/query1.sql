-- Query to retrieve all bots ordered by their service start date


SELECT
    BotID,
    BotName,
    BotType,
    ServiceStartDate
FROM Bot
ORDER BY ServiceStartDate;
