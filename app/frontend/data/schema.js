// Database Schema Information
const schema = {
  tables: [
    {
      name: 'Developer',
      description: 'Stores information about developers who work on codebases',
      columns: [
        { name: 'DeveloperID', type: 'INT', constraints: 'PRIMARY KEY, AUTO_INCREMENT' },
        { name: 'LastName', type: 'VARCHAR(50)', constraints: 'NOT NULL' },
        { name: 'FirstName', type: 'VARCHAR(50)', constraints: '' },
        { name: 'Alias', type: 'VARCHAR(50)', constraints: '' },
        { name: 'PrimaryProgrammingLanguage', type: 'VARCHAR(50)', constraints: '' },
        { name: 'YearsExperience', type: 'INT', constraints: '' },
        { name: 'City', type: 'VARCHAR(50)', constraints: '' },
        { name: 'State', type: 'CHAR(2)', constraints: '' },
        { name: 'CustomAttribute', type: 'VARCHAR(100)', constraints: '' }
      ],
      relationships: [
        { type: 'One-to-Many', with: 'DeveloperCodebase', description: 'A developer can work on multiple codebases' }
      ]
    },
    {
      name: 'Codebase',
      description: 'Contains information about software codebases used by bots',
      columns: [
        { name: 'CodebaseID', type: 'INT', constraints: 'PRIMARY KEY, AUTO_INCREMENT' },
        { name: 'CodebaseName', type: 'VARCHAR(100)', constraints: 'NOT NULL' },
        { name: 'ReleaseDate', type: 'DATE', constraints: '' },
        { name: 'LatestVersion', type: 'VARCHAR(20)', constraints: '' },
        { name: 'Language', type: 'VARCHAR(50)', constraints: '' },
        { name: 'ActiveStatus', type: 'VARCHAR(20)', constraints: '' },
        { name: 'CustomAttribute', type: 'VARCHAR(100)', constraints: '' }
      ],
      relationships: [
        { type: 'One-to-Many', with: 'DeveloperCodebase', description: 'A codebase can have multiple developers' },
        { type: 'One-to-Many', with: 'Bot', description: 'A codebase can be used by multiple bots' },
        { type: 'One-to-Many', with: 'CodebaseHistory', description: 'A codebase has version history records' }
      ]
    },
    {
      name: 'DeveloperCodebase',
      description: 'Junction table linking developers to codebases they work on',
      columns: [
        { name: 'DeveloperID', type: 'INT', constraints: 'PRIMARY KEY, FOREIGN KEY' },
        { name: 'CodebaseID', type: 'INT', constraints: 'PRIMARY KEY, FOREIGN KEY' },
        { name: 'Role', type: 'VARCHAR(45)', constraints: '' }
      ],
      relationships: [
        { type: 'Many-to-One', with: 'Developer', description: 'References Developer table' },
        { type: 'Many-to-One', with: 'Codebase', description: 'References Codebase table' }
      ]
    },
    {
      name: 'CodebaseHistory',
      description: 'Tracks version history for codebases',
      columns: [
        { name: 'HistoryID', type: 'INT', constraints: 'PRIMARY KEY, AUTO_INCREMENT' },
        { name: 'CodebaseID', type: 'INT', constraints: 'NOT NULL, FOREIGN KEY' },
        { name: 'ReleaseVersion', type: 'VARCHAR(20)', constraints: '' },
        { name: 'ReleaseDate', type: 'DATE', constraints: '' },
        { name: 'Language', type: 'VARCHAR(50)', constraints: '' },
        { name: 'ActiveStatus', type: 'VARCHAR(20)', constraints: '' },
        { name: 'CustomAttribute', type: 'VARCHAR(100)', constraints: '' }
      ],
      relationships: [
        { type: 'Many-to-One', with: 'Codebase', description: 'References Codebase table' }
      ]
    },
    {
      name: 'Owner',
      description: 'Stores information about bot owners (companies/individuals)',
      columns: [
        { name: 'OwnerID', type: 'INT', constraints: 'PRIMARY KEY, AUTO_INCREMENT' },
        { name: 'FirstName', type: 'VARCHAR(50)', constraints: '' },
        { name: 'LastName', type: 'VARCHAR(50)', constraints: '' },
        { name: 'CompanyName', type: 'VARCHAR(100)', constraints: '' },
        { name: 'Phone', type: 'VARCHAR(20)', constraints: '' },
        { name: 'Email', type: 'VARCHAR(100)', constraints: '' },
        { name: 'YearsInBusiness', type: 'INT', constraints: '' },
        { name: 'CustomAttribute', type: 'VARCHAR(100)', constraints: '' }
      ],
      relationships: [
        { type: 'One-to-Many', with: 'Bot', description: 'An owner can have multiple bots' }
      ]
    },
    {
      name: 'Bot',
      description: 'Main table for all bots in the system',
      columns: [
        { name: 'BotID', type: 'INT', constraints: 'PRIMARY KEY, AUTO_INCREMENT' },
        { name: 'BotName', type: 'VARCHAR(100)', constraints: 'NOT NULL' },
        { name: 'UniversalID', type: 'CHAR(11)', constraints: '' },
        { name: 'TrainingDatasetName', type: 'VARCHAR(100)', constraints: '' },
        { name: 'BotType', type: 'VARCHAR(50)', constraints: '' },
        { name: 'ServiceStartDate', type: 'DATE', constraints: '' },
        { name: 'ServiceEndDate', type: 'DATE', constraints: '' },
        { name: 'CustomAttribute', type: 'VARCHAR(100)', constraints: '' },
        { name: 'CodebaseID', type: 'INT', constraints: 'NOT NULL, FOREIGN KEY' },
        { name: 'OwnerID', type: 'INT', constraints: 'NOT NULL, FOREIGN KEY' }
      ],
      relationships: [
        { type: 'Many-to-One', with: 'Codebase', description: 'References Codebase table' },
        { type: 'Many-to-One', with: 'Owner', description: 'References Owner table' },
        { type: 'One-to-Many', with: 'UserBot', description: 'A bot can have multiple users' },
        { type: 'One-to-One', with: 'CustomerSupportBot', description: 'Can be specialized as CustomerSupportBot' }
      ]
    },
    {
      name: 'CustomerSupportBot',
      description: 'Specialization table for customer support bots',
      columns: [
        { name: 'BotID', type: 'INT', constraints: 'PRIMARY KEY, FOREIGN KEY' },
        { name: 'SupportedPlatforms', type: 'VARCHAR(200)', constraints: '' },
        { name: 'PackageTrackingIntegrationLevel', type: 'VARCHAR(20)', constraints: '' },
        { name: 'MaxConcurrentSessions', type: 'INT', constraints: '' },
        { name: 'UsesRealTimeTrackingAPI', type: 'BOOLEAN', constraints: '' },
        { name: 'EscalationRulesetID', type: 'VARCHAR(50)', constraints: '' },
        { name: 'ResponseClassificationModel', type: 'VARCHAR(100)', constraints: '' },
        { name: 'AvgCustomerWaitTime', type: 'DECIMAL(5,2)', constraints: '' },
        { name: 'ResolutionSuccessRate', type: 'DECIMAL(5,2)', constraints: '' },
        { name: 'CustomAttribute', type: 'VARCHAR(100)', constraints: '' }
      ],
      relationships: [
        { type: 'One-to-One', with: 'Bot', description: 'Extends Bot table' }
      ]
    },
    {
      name: 'User',
      description: 'Information about users who interact with bots',
      columns: [
        { name: 'UserID', type: 'INT', constraints: 'PRIMARY KEY, AUTO_INCREMENT' },
        { name: 'FirstName', type: 'VARCHAR(50)', constraints: '' },
        { name: 'LastName', type: 'VARCHAR(50)', constraints: '' },
        { name: 'Email', type: 'VARCHAR(100)', constraints: '' },
        { name: 'Department', type: 'VARCHAR(50)', constraints: '' },
        { name: 'CustomAttribute', type: 'VARCHAR(100)', constraints: '' }
      ],
      relationships: [
        { type: 'One-to-Many', with: 'UserBot', description: 'A user can interact with multiple bots' }
      ]
    },
    {
      name: 'UserBot',
      description: 'Junction table tracking user interactions with bots',
      columns: [
        { name: 'UserID', type: 'INT', constraints: 'PRIMARY KEY, FOREIGN KEY' },
        { name: 'BotID', type: 'INT', constraints: 'PRIMARY KEY, FOREIGN KEY' },
        { name: 'FirstUseDate', type: 'DATE', constraints: '' },
        { name: 'AccessLevel', type: 'VARCHAR(20)', constraints: '' }
      ],
      relationships: [
        { type: 'Many-to-One', with: 'User', description: 'References User table' },
        { type: 'Many-to-One', with: 'Bot', description: 'References Bot table' }
      ]
    }
  ]
};

// Export for use in app.js
if (typeof module !== 'undefined' && module.exports) {
  module.exports = schema;
}
