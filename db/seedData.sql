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
('Chang', 'Kevin', 'kFlow', 'TypeScript', 5, 'San Diego', 'CA', 'Frontend systems'),
('Wilson', 'Sarah', 'sCode', 'Ruby', 6, 'Austin', 'TX', 'Full-stack developer'),
('Martinez', 'Luis', 'lDev', 'Kotlin', 4, 'Seattle', 'WA', 'Mobile specialist'),
('Davis', 'Nicole', 'nBit', 'Swift', 5, 'Portland', 'OR', 'iOS architect'),
('Garcia', 'Miguel', 'mScript', 'PHP', 7, 'Miami', 'FL', 'Legacy systems'),
('Anderson', 'Jordan', 'jStack', 'Java', 3, 'Denver', 'CO', 'Microservices engineer');


-- ==========================================
-- CODEBASE
-- ==========================================

INSERT INTO Codebase (CodebaseName, ReleaseDate, LatestVersion, Language, ActiveStatus, CustomAttribute)
VALUES
('SupportFlow Core', '2023-01-15', '1.4.2', 'Node.js', 'Active', 'Optimized for customer support'),
('BotVision Framework', '2022-11-10', '2.1.0', 'Python', 'Active', 'Natural Language Processing'),
('TrackAI Engine', '2021-05-22', '3.0.5', 'Go', 'Deprecated', 'Legacy tracking model'),
('AssistX Neural', '2024-02-12', '1.0.1', 'Rust', 'Active', 'High-speed inference'),
('QueryMaster Base', '2020-07-30', '0.9.8', 'SQL', 'Stable', 'Internal reporting engine'),
('ChatEngine Pro', '2023-03-20', '2.3.1', 'Python', 'Active', 'Conversational AI'),
('VoiceBot Platform', '2022-08-15', '1.8.0', 'Node.js', 'Active', 'Voice interaction system'),
('DataSync Hub', '2021-12-01', '3.2.4', 'Java', 'Stable', 'Real-time data synchronization'),
('SmartResponse AI', '2023-09-10', '1.5.7', 'Python', 'Active', 'Intelligent response generation'),
('AutoReply System', '2020-11-05', '4.1.2', 'PHP', 'Deprecated', 'Email automation'),
('TicketBot Core', '2022-04-18', '2.0.9', 'Ruby', 'Active', 'Ticket management'),
('SentimentAnalyzer', '2023-06-22', '1.2.3', 'Python', 'Active', 'Customer sentiment analysis'),
('KnowledgeBase AI', '2021-09-30', '2.7.5', 'Node.js', 'Stable', 'FAQ and knowledge management');


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
(10, 4, 'Feature Developer'),
(11, 6, 'Lead Developer'),
(12, 7, 'Mobile Specialist'),
(13, 8, 'Integration Engineer'),
(14, 9, 'AI Developer'),
(15, 10, 'Maintenance Lead');


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
(4, '1.0.0', '2024-02-12', 'Rust', 'Active', 'First release'),
(6, '1.0.0', '2022-10-15', 'Python', 'Stable', 'Beta launch'),
(6, '2.0.0', '2023-01-20', 'Python', 'Active', 'Production ready'),
(6, '2.3.1', '2023-03-20', 'Python', 'Active', 'Enhanced AI models'),
(7, '1.0.0', '2022-02-10', 'Node.js', 'Stable', 'Initial voice support'),
(7, '1.5.0', '2022-05-22', 'Node.js', 'Active', 'Multi-language support'),
(7, '1.8.0', '2022-08-15', 'Node.js', 'Active', 'Improved recognition'),
(9, '1.0.0', '2023-04-01', 'Python', 'Stable', 'First beta'),
(9, '1.5.7', '2023-09-10', 'Python', 'Active', 'Enhanced responses');


-- ==========================================
-- OWNER
-- ==========================================

INSERT INTO Owner (FirstName, LastName, CompanyName, Phone, Email, YearsInBusiness, CustomAttribute)
VALUES
('Sarah', 'Coleman', 'Coleman Retail Group', '555-123-9876', 's.coleman@crg.com', 12, 'Primary enterprise client'),
('David', 'Hunter', 'Hunter Logistics', '555-885-2211', 'd.hunter@hlog.com', 8, 'National shipping partner'),
('Jasmine', 'Reed', 'Reed Apparel Co.', '555-991-3300', 'j.reed@reedapparel.com', 5, 'Boutique client'),
('Marcus', 'Stone', 'Stone Electronics', '555-448-7755', 'm.stone@stoneelec.com', 10, 'High-volume support needs'),
('Elena', 'Vega', 'Vega Home Goods', '555-602-2244', 'e.vega@vegahome.com', 7, 'Growing retailer'),
('Patricia', 'Chen', 'Chen Tech Solutions', '555-234-5678', 'p.chen@chentech.com', 15, 'Technology partner'),
('Robert', 'Johnson', 'Johnson & Associates', '555-345-6789', 'r.johnson@jassoc.com', 9, 'Professional services'),
('Linda', 'Martinez', 'Martinez Foods', '555-456-7890', 'l.martinez@mfoods.com', 6, 'Food industry'),
('Michael', 'Taylor', 'Taylor Auto Group', '555-567-8901', 'm.taylor@taylorauto.com', 11, 'Automotive sector'),
('Jennifer', 'White', 'White Enterprises', '555-678-9012', 'j.white@whiteent.com', 8, 'Multi-industry'),
('Christopher', 'Lee', 'Lee Manufacturing', '555-789-0123', 'c.lee@leemfg.com', 13, 'Industrial client'),
('Amanda', 'Garcia', 'Garcia Retail Chain', '555-890-1234', 'a.garcia@garciaretail.com', 4, 'Regional retailer'),
('Daniel', 'Rodriguez', 'Rodriguez Construction', '555-901-2345', 'd.rodriguez@rodconst.com', 10, 'Construction services');


-- ==========================================
-- BOT (SUPERTYPE)
-- ==========================================

INSERT INTO Bot (BotName, UniversalID, TrainingDatasetName, BotType, ServiceStartDate, ServiceEndDate, CustomAttribute, CodebaseID, OwnerID)
VALUES
('HelioAssist', '123-456-789', 'SupportFlow-v1', 'CustomerSupport', '2023-05-01', NULL, 'Standard tier', 1, 1),
('TrackMaster', '987-654-321', 'TrackAI-v3', 'CustomerSupport', '2022-09-12', NULL, 'Tracking bot', 3, 2),
('NeuroHelp', '555-222-777', 'BotVision-v2', 'CustomerSupport', '2023-11-20', NULL, 'NLP enhanced', 2, 3),
('QuickServe', '852-963-741', 'AssistX-v1', 'CustomerSupport', '2024-02-15', NULL, 'High-speed processing', 4, 4),
('RetailGuide', '741-852-963', 'SupportFlow-v1', 'CustomerSupport', '2023-07-30', NULL, 'Retail optimized', 1, 5),
('ChatAssist', '111-222-333', 'ChatEngine-v2', 'CustomerSupport', '2023-04-12', NULL, 'Conversational AI', 6, 6),
('VoiceHelper', '222-333-444', 'VoiceBot-v1', 'CustomerSupport', '2022-09-20', NULL, 'Voice support', 7, 7),
('DataBot', '333-444-555', 'DataSync-v3', 'CustomerSupport', '2022-01-15', NULL, 'Data integration', 8, 8),
('SmartReply', '444-555-666', 'SmartResponse-v1', 'CustomerSupport', '2023-10-05', NULL, 'Intelligent responses', 9, 9),
('TicketAssist', '555-666-777', 'TicketBot-v2', 'CustomerSupport', '2022-06-18', NULL, 'Ticket automation', 11, 10),
('SentimentBot', '666-777-888', 'Sentiment-v1', 'CustomerSupport', '2023-07-22', NULL, 'Emotion detection', 12, 11),
('KnowledgeBot', '777-888-999', 'Knowledge-v2', 'CustomerSupport', '2022-03-10', NULL, 'FAQ assistant', 13, 12),
('AutoSupport', '888-999-000', 'AutoReply-v4', 'CustomerSupport', '2021-11-25', NULL, 'Email automation', 10, 13);


-- ==========================================
-- CUSTOMER SUPPORT BOT (SUBTYPE)
-- ==========================================

INSERT INTO CustomerSupportBot (BotID, SupportedPlatforms, PackageTrackingIntegrationLevel, MaxConcurrentSessions, UsesRealTimeTrackingAPI, EscalationRulesetID, ResponseClassificationModel, AvgCustomerWaitTime, ResolutionSuccessRate, CustomAttribute)
VALUES
(1, 'Web, iOS, Android', 'High', 120, TRUE, 'RS-101', 'NLP-v2', 3.2, 0.91, 'Premium'),
(2, 'Web, SMS', 'Medium', 80, TRUE, 'RS-202', 'Tracking-v1', 4.8, 0.88, 'Legacy'),
(3, 'Web, App', 'Low', 60, FALSE, 'RS-303', 'NLP-v1', 5.1, 0.85, 'Beta'),
(4, 'iOS Only', 'None', 200, TRUE, 'RS-404', 'Inference-v1', 2.5, 0.95, 'High performance'),
(5, 'Web, Android', 'Medium', 100, TRUE, 'RS-505', 'NLP-v2', 3.9, 0.89, 'Retail version'),
(6, 'Web, iOS, Android', 'Low', 150, FALSE, 'RS-606', 'Chat-v2', 3.5, 0.90, 'Chat specialist'),
(7, 'Phone, Web', 'None', 90, FALSE, 'RS-707', 'Voice-v1', 4.2, 0.87, 'Voice only'),
(8, 'Web, API', 'High', 110, TRUE, 'RS-808', 'Data-v3', 3.8, 0.92, 'Data integration'),
(9, 'Web, Mobile', 'Medium', 130, TRUE, 'RS-909', 'Smart-v1', 2.9, 0.93, 'AI-powered'),
(10, 'Web, Email', 'Low', 85, FALSE, 'RS-010', 'Ticket-v2', 4.5, 0.86, 'Ticket management'),
(11, 'Web, iOS, Android', 'None', 95, FALSE, 'RS-111', 'Sentiment-v1', 4.0, 0.88, 'Emotion analysis'),
(12, 'Web Only', 'Low', 120, FALSE, 'RS-212', 'Knowledge-v2', 3.3, 0.91, 'FAQ expert'),
(13, 'Email, Web', 'None', 70, FALSE, 'RS-313', 'Auto-v4', 5.2, 0.84, 'Email automation');


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
('Isabella', 'Soto', 'isabella.soto@example.com', 'Support', 'Quality assurance'),
('Lucas', 'Bennett', 'lucas.bennett@example.com', 'Support', 'Senior agent'),
('Mia', 'Foster', 'mia.foster@example.com', 'Support', 'Training specialist'),
('Jackson', 'Cooper', 'jackson.cooper@example.com', 'Support', 'Night shift lead'),
('Charlotte', 'Reed', 'charlotte.reed@example.com', 'Support', 'Customer success'),
('Aiden', 'Murphy', 'aiden.murphy@example.com', 'Support', 'Technical support');


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
(10, 3, '2023-11-23', 'Agent'),
(11, 6, '2023-04-15', 'Agent'),
(12, 7, '2022-09-25', 'Supervisor'),
(13, 8, '2022-02-10', 'Agent'),
(14, 9, '2023-10-12', 'Agent'),
(15, 10, '2022-06-20', 'Agent');

