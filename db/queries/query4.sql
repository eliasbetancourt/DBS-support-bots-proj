-- Query toshow which users used which bots.

SELECT
    User.UserID,
    User.FirstName,
    User.LastName,
    Bot.BotName,
    UserBot.UsageDate
FROM UserBot
JOIN User ON UserBot.UserID = User.UserID
JOIN Bot ON UserBot.BotID = Bot.BotID
ORDER BY UserBot.UsageDate DESC;