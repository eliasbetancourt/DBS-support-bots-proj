-- Query to show which users used which bots with their access levels

SELECT
    User.UserID,
    User.FirstName,
    User.LastName,
    User.Department,
    Bot.BotName,
    Bot.BotType,
    UserBot.FirstUseDate,
    UserBot.AccessLevel
FROM UserBot
JOIN User ON UserBot.UserID = User.UserID
JOIN Bot ON UserBot.BotID = Bot.BotID
ORDER BY UserBot.FirstUseDate DESC;