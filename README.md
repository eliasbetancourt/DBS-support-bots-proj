# DBS-support-bots-proj

CISC3500 Term Project — Group E: ZC Inc. Customer Support Bots.

This repository contains:
- db/: MySQL schema, seed data, and required queries
- app/backend/: Node.js + Express backend demo that queries the MySQL DB
- app/frontend/: Minimal HTML/JS frontend that calls the backend APIs
- docs/: ER diagram placeholder and project report outline

Quick start
1. Create a local .env file in `app/backend` with DB credentials:
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_USER=root
   DB_PASSWORD=yourpassword
   DB_NAME=zc_support_bots
   PORT=3000

2. Run DB schema:
   mysql -u root -p < db/schema.sql
   mysql -u root -p zc_support_bots < db/seed-data.sql

3. Install backend deps and start:
   cd app/backend && npm install
   npm run start

4. Open `app/frontend/index.html` in browser and use the demo UI.

Statement of Original Work:
This project represents our team's own design and implementation. AI tools were used only for incidental support (e.g., syntax checking, documentation), not for content creation.
