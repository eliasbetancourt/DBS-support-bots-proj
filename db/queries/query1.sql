-- Query to retrieve owners and their bots ordered by the bots' service start date

SELECT
    Owner.OwnerID,
    Owner.FirstName,
    Owner.LastName,
    Bot.BotName,
    Bot.ServiceStartDate
FROM Owner
JOIN Bot ON Owner.OwnerID = Bot.OwnerID
ORDER BY Bot.ServiceStartDate;