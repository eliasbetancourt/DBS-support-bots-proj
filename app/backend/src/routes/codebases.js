import express from "express";
import db from "../db.js";

const router = express.Router();

// GET all codebases
router.get("/", async (req, res) => {
  const [rows] = await db.query(`
    SELECT CodebaseID, CodebaseName, ReleaseDate, LatestVersion, 
           Language, ActiveStatus
    FROM Codebase
    ORDER BY CodebaseName;
  `);
  res.json(rows);
});

// GET one codebase
router.get("/:id", async (req, res) => {
  const [rows] = await db.query(
    "SELECT * FROM Codebase WHERE CodebaseID = ?",
    [req.params.id]
  );
  res.json(rows[0] || {});
});

// GET developers working on a codebase
router.get("/:id/developers", async (req, res) => {
  const [rows] = await db.query(`
    SELECT d.DeveloperID, d.FirstName, d.LastName, dc.Role
    FROM Developer d
    JOIN DeveloperCodebase dc ON d.DeveloperID = dc.DeveloperID
    WHERE dc.CodebaseID = ?
  `, [req.params.id]);
  res.json(rows);
});

// GET history for a codebase
router.get("/:id/history", async (req, res) => {
  const [rows] = await db.query(`
    SELECT HistoryID, ReleaseVersion, ReleaseDate, Language, ActiveStatus
    FROM CodebaseHistory
    WHERE CodebaseID = ?
    ORDER BY ReleaseDate DESC
  `, [req.params.id]);
  res.json(rows);
});

export default router;
