-- Query to find developers in New York and display their expertise

SELECT 
    DeveloperID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Alias,
    PrimaryProgrammingLanguage,
    YearsExperience,
    City,
    State
FROM Developer
WHERE State = 'NY'
ORDER BY YearsExperience DESC;