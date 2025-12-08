DROP SCHEMA IF EXISTS support_bots;
CREATE SCHEMA support_bots;
USE support_bots;

CREATE TABLE Developer (
    DeveloperID INT AUTO_INCREMENT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50),
    Alias VARCHAR(50),
    PrimaryProgrammingLanguage VARCHAR(50),
    YearsExperience INT,
    City VARCHAR(50),
    State CHAR(2),
    CustomAttribute VARCHAR(100)

);

CREATE TABLE Codebase (
    CodebaseID INT AUTO_INCREMENT PRIMARY KEY,
    CodebaseName VARCHAR(100) NOT NULL,
    ReleaseDate DATE,
    LatestVersion VARCHAR(20),
    Language VARCHAR(50),
    ActiveStatus VARCHAR(20),
    CustomAttribute VARCHAR(100)

);

CREATE TABLE DeveloperCodebase (
    DeveloperID INT NOT NULL,
    CodebaseID INT NOT NULL,
    Role VARCHAR(45),

    PRIMARY KEY (DeveloperID, CodebaseID),
    FOREIGN KEY (DeveloperID) REFERENCES Developer(DeveloperID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CodebaseID) REFERENCES Codebase(CodebaseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CodebaseHistory (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    CodebaseID INT NOT NULL,
    ReleaseVersion VARCHAR(20),
    ReleaseDate DATE,
    Language VARCHAR(50),
    ActiveStatus VARCHAR(20),
    CustomAttribute VARCHAR(100),

    FOREIGN KEY (CodebaseID) REFERENCES Codebase(CodebaseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE

        
);

CREATE TABLE Owner (

    OwnerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    CompanyName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    YearsInBusiness INT,
    CustomAttribute VARCHAR(100)

);

CREATE TABLE Bot (

    BotID INT AUTO_INCREMENT PRIMARY KEY,
    BotName VARCHAR(100) NOT NULL,
    UniversalID CHAR(11),
    TrainingDatasetName VARCHAR(100),
    BotType VARCHAR(50),
    ServiceStartDate DATE,
    ServiceEndDate DATE,
    CustomAttribute VARCHAR(100),
    CodebaseID INT NOT NULL,
    OwnerID INT NOT NULL,

    FOREIGN KEY (CodebaseID) REFERENCES Codebase(CodebaseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (OwnerID) REFERENCES Owner(OwnerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CustomerSupportBot (
    BotID INT PRIMARY KEY,
    SupportedPlatforms VARCHAR(200),
    PackageTrackingIntegrationLevel VARCHAR(20),
    MaxConcurrentSessions INT,
    UsesRealTimeTrackingAPI BOOLEAN,
    EscalationRulesetID VARCHAR(50),
    ResponseClassificationModel VARCHAR(100),
    AvgCustomerWaitTime DECIMAL(5,2),
    ResolutionSuccessRate DECIMAL(5,2),
    CustomAttribute VARCHAR(100),

    FOREIGN KEY (BotID) REFERENCES Bot(BotID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Department VARCHAR(50),
    CustomAttribute VARCHAR(100)
);

CREATE TABLE UserBot (
    UserID INT NOT NULL,
    BotID INT NOT NULL,
    FirstUseDate DATE,
    AccessLevel VARCHAR(20),
    PRIMARY KEY (UserID, BotID),

    FOREIGN KEY (UserID) REFERENCES User(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (BotID) REFERENCES Bot(BotID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
