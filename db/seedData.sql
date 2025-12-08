USE support_bots;

-- ==========================================
-- DEVELOPER
-- ==========================================

INSERT INTO Developer (LastName, FirstName, Alias, PrimaryProgrammingLanguage, YearsExperience, City, State, CustomAttribute)
VALUES
('Kim', 'Daniel', 'dK_Dev', 'JavaScript', 5, 'New York', 'NY', 'AI workflow specialist'),
('Patel', 'Riya', 'rLogic', 'Python', 4, 'Jersey City', 'NJ', 'ML optimizer'),
('Hernandez', 'Carlos', 'cHex', 'Java', 6, 'Brooklyn', 'NY', 'API specialist'),
('Nguyen', 'Linh', 'lByte', 'C#', 3, 'Philadelphia', 'PA', 'Cloud integrator'),
('Thompson', 'Mia', 'mLoop', 'Go', 7, 'Boston', 'MA', 'Systems architect'),
('Olsen', 'Mark', 'mOmega', 'Rust', 2, 'New York', 'NY', 'Memory optimization'),
('Lee', 'Amy', 'aSpark', 'SQL', 4, 'Hoboken', 'NJ', 'Database engineer'),
('Rodriguez', 'Javier', 'jWave', 'Python', 8, 'Chicago', 'IL', 'AI trainer'),
('Brown', 'Elise', 'eCoder', 'Node.js', 3, 'New York', 'NY', 'Backend dev'),
('Chang', 'Kevin', 'kFlow', 'TypeScript', 5, 'San Diego', 'CA', 'Frontend systems');


-- ==========================================
-- CODEBASE
-- ==========================================

INSERT INTO Codebase (CodebaseName, ReleaseDate, LatestVersion, Language, ActiveStatus, CustomAttribute)
VALUES
('SupportFlow Core', '2023-01-15', '1.4.2', 'Node.js', 'Active', 'Optimized for customer support'),
('BotVision Framework', '2022-11-10', '2.1.0', 'Python', 'Active', 'Natural Language Processing'),
('TrackAI Engine', '2021-05-22', '3.0.5', 'Go', 'Deprecated', 'Legacy tracking model'),
('AssistX Neural', '2024-02-12', '1.0.1', 'Rust', 'Active', 'High-speed inference'),
('QueryMaster Base', '2020-07-30', '0.9.8', 'SQL', 'Stable', 'Internal reporting engine');


-- ==========================================
-- DEVELOPER ↔ CODEBASE (M:N)
-- ==========================================

INSERT INTO DeveloperCodebase (DeveloperID, CodebaseID, Role)
VALUES
(1, 1, 'Lead Developer'),
(2, 1, 'ML Integration'),
(3, 2, 'API Engineer'),
(4, 3, 'Legacy Maintenance'),
(5, 2, 'Core Architect'),
(6, 4, 'Performance Engineer'),
(7, 5, 'SQL Designer'),
(8, 2, 'AI Trainer'),
(9, 1, 'Backend Engineer'),
(10, 4, 'Feature Developer');


-- ==========================================
-- CODEBASE HISTORY
-- ==========================================

INSERT INTO CodebaseHistory (CodebaseID, ReleaseVersion, ReleaseDate, Language, ActiveStatus, CustomAttribute)
VALUES
(1, '1.0.0', '2022-05-01', 'Node.js', 'Stable', 'Initial release'),
(1, '1.2.0', '2022-11-15', 'Node.js', 'Active', 'Bug fixes'),
(1, '1.4.2', '2023-01-15', 'Node.js', 'Active', 'Performance improvement'),
(2, '2.0.0', '2021-09-10', 'Python', 'Stable', 'Major NLP update'),
(2, '2.1.0', '2022-11-10', 'Python', 'Active', 'Transformer upgrade'),
(4, '1.0.0', '2024-02-12', 'Rust', 'Active', 'First release');


-- ==========================================
-- OWNER
-- ==========================================

INSERT INTO Owner (FirstName, LastName, CompanyName, Phone, Email, YearsInBusiness, CustomAttribute)
VALUES
('Sarah', 'Coleman', 'Coleman Retail Group', '555-123-9876', 's.coleman@crg.com', 12, 'Primary enterprise client'),
('David', 'Hunter', 'Hunter Logistics', '555-885-2211', 'd.hunter@hlog.com', 8, 'National shipping partner'),
('Jasmine', 'Reed', 'Reed Apparel Co.', '555-991-3300', 'j.reed@reedapparel.com', 5, 'Boutique client'),
('Marcus', 'Stone', 'Stone Electronics', '555-448-7755', 'm.stone@stoneelec.com', 10, 'High-volume support needs'),
('Elena', 'Vega', 'Vega Home Goods', '555-602-2244', 'e.vega@vegahome.com', 7, 'Growing retailer');


-- ==========================================
-- BOT (SUPERTYPE)
-- ==========================================

INSERT INTO Bot (BotName, UniversalID, TrainingDatasetName, BotType, ServiceStartDate, ServiceEndDate, CustomAttribute, CodebaseID, OwnerID)
VALUES
('HelioAssist', '123-456-789', 'SupportFlow-v1', 'CustomerSupport', '2023-05-01', NULL, 'Standard tier', 1, 1),
('TrackMaster', '987-654-321', 'TrackAI-v3', 'CustomerSupport', '2022-09-12', NULL, 'Tracking bot', 3, 2),
('NeuroHelp', '555-222-777', 'BotVision-v2', 'CustomerSupport', '2023-11-20', NULL, 'NLP enhanced', 2, 3),
('QuickServe', '852-963-741', 'AssistX-v1', 'CustomerSupport', '2024-02-15', NULL, 'High-speed processing', 4, 4),
('RetailGuide', '741-852-963', 'SupportFlow-v1', 'CustomerSupport', '2023-07-30', NULL, 'Retail optimized', 1, 5);


-- ==========================================
-- CUSTOMER SUPPORT BOT (SUBTYPE)
-- ==========================================

INSERT INTO CustomerSupportBot (BotID, SupportedPlatforms, PackageTrackingIntegrationLevel, MaxConcurrentSessions, UsesRealTimeTrackingAPI, EscalationRulesetID, ResponseClassificationModel, AvgCustomerWaitTime, ResolutionSuccessRate, CustomAttribute)
VALUES
(1, 'Web, iOS, Android', 'High', 120, TRUE, 'RS-101', 'NLP-v2', 3.2, 0.91, 'Premium'),
(2, 'Web, SMS', 'Medium', 80, TRUE, 'RS-202', 'Tracking-v1', 4.8, 0.88, 'Legacy'),
(3, 'Web, App', 'Low', 60, FALSE, 'RS-303', 'NLP-v1', 5.1, 0.85, 'Beta'),
(4, 'iOS Only', 'None', 200, TRUE, 'RS-404', 'Inference-v1', 2.5, 0.95, 'High performance'),
(5, 'Web, Android', 'Medium', 100, TRUE, 'RS-505', 'NLP-v2', 3.9, 0.89, 'Retail version');


-- ==========================================
-- USER TABLE
-- ==========================================

INSERT INTO User (FirstName, LastName, Email, Department, CustomAttribute)
VALUES
('Liam', 'Turner', 'liam.turner@example.com', 'Support', 'Tier 1 agent'),
('Ava', 'Morris', 'ava.morris@example.com', 'Support', 'Tier 2 agent'),
('Noah', 'Walker', 'noah.walker@example.com', 'Logistics', 'Tracking team'),
('Emma', 'Howard', 'emma.howard@example.com', 'Support', 'Escalation specialist'),
('Ethan', 'Griffin', 'ethan.griffin@example.com', 'Support', 'New trainee'),
('Olivia', 'Price', 'olivia.price@example.com', 'Retail', 'Customer care'),
('Mason', 'Brooks', 'mason.brooks@example.com', 'Support', 'Live chat agent'),
('Sophia', 'Rivera', 'sophia.rivera@example.com', 'Support', 'Team lead'),
('Logan', 'Carter', 'logan.carter@example.com', 'Support', 'Data review'),
('Isabella', 'Soto', 'isabella.soto@example.com', 'Support', 'Quality assurance');


-- ==========================================
-- USER ↔ BOT (M:N)
-- ==========================================

INSERT INTO UserBot (UserID, BotID, FirstUseDate, AccessLevel)
VALUES
(1, 1, '2023-05-02', 'Agent'),
(2, 1, '2023-06-10', 'Agent'),
(3, 2, '2022-09-15', 'Agent'),
(4, 3, '2023-12-01', 'Supervisor'),
(5, 1, '2023-08-22', 'Agent'),
(6, 5, '2023-07-31', 'Agent'),
(7, 4, '2024-02-16', 'Agent'),
(8, 1, '2023-05-05', 'Admin'),
(9, 2, '2022-10-01', 'Agent'),
(10, 3, '2023-11-23', 'Agent');

