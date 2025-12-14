// Pre-defined Queries
const queries = [
  {
    id: 'query1',
    name: 'Owners and Their Bots',
    description: 'Retrieve owners and their bots ordered by the bots\' service start date',
    sql: `SELECT
    Owner.OwnerID,
    Owner.FirstName,
    Owner.LastName,
    Bot.BotName,
    Bot.ServiceStartDate
FROM Owner
JOIN Bot ON Owner.OwnerID = Bot.OwnerID
ORDER BY Bot.ServiceStartDate;`,
    category: 'Reporting'
  },
  {
    id: 'query2',
    name: 'Active Bots with Service Duration',
    description: 'Show active bots with their codebase and service duration',
    sql: `SELECT
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
ORDER BY DaysInService DESC;`,
    category: 'Analytics'
  },
  {
    id: 'query3',
    name: 'Developers in New York',
    description: 'Find developers in New York and display their expertise',
    sql: `SELECT 
    DeveloperID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Alias,
    PrimaryProgrammingLanguage,
    YearsExperience,
    City,
    State
FROM Developer
WHERE State = 'NY'
ORDER BY YearsExperience DESC;`,
    category: 'Developer Management'
  },
  {
    id: 'query4',
    name: 'User Bot Usage History',
    description: 'Show which users used which bots with their access levels',
    sql: `SELECT
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
ORDER BY UserBot.FirstUseDate DESC;`,
    category: 'User Analytics'
  },
  {
    id: 'query5',
    name: 'Top 3 Most Used Bots',
    description: 'Find the top 3 most used bots',
    sql: `SELECT
    b.BotID,
    b.BotName,
    COUNT(ub.UserID) AS UsageCount
FROM UserBot ub
JOIN Bot b ON ub.BotID = b.BotID
GROUP BY b.BotID, b.BotName
ORDER BY UsageCount DESC
LIMIT 3;`,
    category: 'Analytics'
  },
  {
    id: 'query6',
    name: 'Bot Count by Type',
    description: 'Find the count of bots by profession/type',
    sql: `SELECT BotType, COUNT(*) AS BotCount
FROM Bot
GROUP BY BotType;`,
    category: 'Reporting'
  }
];

// Export for use in app.js
if (typeof module !== 'undefined' && module.exports) {
  module.exports = queries;
}
