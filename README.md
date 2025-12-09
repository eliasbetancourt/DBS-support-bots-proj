# DBS-support-bots-proj

CISC3500 Term Project — Group E: ZC Inc. Customer Support Bots.

This repository contains:
- db/: MySQL schema, seed data, and required queries
- app/backend/: Node.js + Express backend demo that queries the MySQL DB
- app/frontend/: Minimal HTML/JS frontend that calls the backend APIs
- docs/: ER diagram placeholder and project report outline

## Quick Start

### 1. Install MySQL
If you don't have MySQL installed:
```bash
brew install mysql
brew services start mysql
mysql_secure_installation  # Follow prompts to set root password
```

### 2. Set Up Database
Create a local `.env` file in `app/backend` with DB credentials:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=support_bots
DB_PORT=3306
PORT=3000
```

Run the schema and seed data:
```bash
mysql -u root -p < db/schema.sql
mysql -u root -p support_bots < db/seedData.sql
```

### 3. Run Queries
To execute any of the project queries with proper formatting, connect to MySQL:
```bash
mysql -u root -p support_bots
```

Then at the `mysql>` prompt, run:
```sql
SOURCE db/queries/query1.sql;
SOURCE db/queries/query2.sql;
SOURCE db/queries/query3.sql;
SOURCE db/queries/query4.sql;
SOURCE db/queries/query5.sql;
```

Or run individual queries from the command line:
```bash
mysql -u root -p -e "USE support_bots; SOURCE db/queries/query1.sql;"
```

### 4. Start Backend Server
Install dependencies and start the server:
```bash
cd app/backend
npm install
npm start
```

### 5. Open Frontend
Open `app/frontend/index.html` in your browser to use the demo UI.

Statement of Original Work:
This project represents our team's own design and implementation. AI tools were used only for incidental support (e.g., syntax checking, documentation), not for content creation.
