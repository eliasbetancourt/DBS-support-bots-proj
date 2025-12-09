import express from "express";
import db from "../db.js";

const router = express.Router();

// GET all developers
router.get("/", async (req, res) => {
  const [rows] = await db.query(`
    SELECT DeveloperID, FirstName, LastName, Alias, 
           PrimaryProgrammingLanguage, YearsExperience, City, State
    FROM Developer
    ORDER BY LastName, FirstName;
  `);
  res.json(rows);
});

// GET one developer
router.get("/:id", async (req, res) => {
  const [rows] = await db.query(
    "SELECT * FROM Developer WHERE DeveloperID = ?",
    [req.params.id]
  );
  res.json(rows[0] || {});
});

// GET codebases for a developer
router.get("/:id/codebases", async (req, res) => {
  const [rows] = await db.query(`
    SELECT c.CodebaseID, c.CodebaseName, c.Language, dc.Role
    FROM Codebase c
    JOIN DeveloperCodebase dc ON c.CodebaseID = dc.CodebaseID
    WHERE dc.DeveloperID = ?
  `, [req.params.id]);
  res.json(rows);
});

export default router;
