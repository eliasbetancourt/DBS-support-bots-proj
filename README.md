# DBS-support-bots-proj

CISC3500 Term Project — Group E: ZC Inc. Customer Support Bots.

This repository contains:
- **db/**: MySQL schema, seed data, and required queries
- **app/backend/**: Node.js + Express backend with REST API endpoints
- **app/frontend/**: Minimal HTML/JS frontend that calls the backend APIs
- **docs/**: ER diagram and query results
  - `queryResults/`: Formatted output from all 5 required queries

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

**Pre-generated query results** are available in `docs/queryResults/` for reference.

### 4. Start Backend Server
Install dependencies and start the server:
```bash
cd app/backend
npm install
npm start
```

### 5. Open Frontend
The frontend provides an interactive interface to explore the database schema and execute queries.

**Make sure the backend is running first** (Step 4), then open the frontend:

```bash
# Option 1: Open directly in browser
open app/frontend/index.html

# Option 2: Use a local HTTP server (recommended)
cd app/frontend
python3 -m http.server 8000
# Then visit http://localhost:8000

# Option 3: Use npx
cd app/frontend
npx http-server -p 8000
```

The frontend connects to the backend at `http://localhost:3000` to:
- Browse all database tables and their schemas
- Execute the 6 project queries interactively
- View formatted query results in real-time

## API Endpoints

The backend provides the following REST API endpoints:

- `GET /api/bots` - All bots
- `GET /api/owners` - All owners
- `GET /api/users` - All users
- `GET /api/developers` - All developers
- `GET /api/developers/:id/codebases` - Codebases for a specific developer
- `GET /api/codebases` - All codebases
- `GET /api/codebases/:id/developers` - Developers for a specific codebase
- `GET /api/codebases/:id/history` - History for a specific codebase
- `GET /api/customer-support-bots` - All customer support bots with details
- `GET /api/user-bots` - All user-bot relationships
- `POST /api/query` - Execute custom SQL queries (body: `{ "sql": "SELECT ..." }`)

## Project Structure

```
DBS-support-bots-proj/
├── db/
│   ├── schema.sql          # Database schema (9 tables)
│   ├── seedData.sql        # Test data (12-15 rows per table)
│   └── queries/            # 6 required SQL queries
│       ├── query1.sql
│       ├── query2.sql
│       ├── query3.sql
│       ├── query4.sql
│       ├── query5.sql
│       └── query6.sql
├── app/
│   ├── backend/
│   │   ├── src/
│   │   │   ├── server.js   # Express server
│   │   │   ├── db.js       # MySQL connection pool
│   │   │   └── routes/     # API route handlers
│   │   ├── package.json
│   │   ├── .env            # Database credentials (not in git)
│   │   └── .env.example    # Template for .env
│   └── frontend/
│       ├── index.html      # Main UI
│       ├── app.js          # Frontend logic
│       ├── styles.css      # Styling
│       └── data/           # Schema definitions
├── docs/
│   ├── ER_Diagram.png      # Entity-Relationship diagram
│   └── queryResults/       # Pre-generated query outputs
└── README.md

```

## Troubleshooting

**Backend won't start:**
- Ensure MySQL is running: `brew services list`
- Check `.env` file exists in `app/backend` with correct credentials
- Verify database exists: `mysql -u root -p -e "SHOW DATABASES;"`

**Query execution fails:**
- Confirm backend is running on port 3000
- Check browser console for error messages
- Verify database has data: `mysql -u root -p support_bots -e "SELECT COUNT(*) FROM Bot;"`

**Frontend shows "demo mode":**
- Hard refresh the page (Cmd+Shift+R or Ctrl+Shift+R)
- Ensure backend is running before opening frontend

---

Statement of Original Work:
This project represents our team's own design and implementation. AI tools were used only for incidental support (e.g., syntax checking, documentation), not for content creation.
