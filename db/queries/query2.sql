--- Query to count the number of bots for each bot type

SELECT
    BotType,
    COUNT(*) AS `Bot Type Count`
FROM Bot
GROUP BY BotType
ORDER BY `Bot Type Count` DESC;
