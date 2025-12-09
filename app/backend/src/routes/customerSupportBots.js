import express from "express";
import db from "../db.js";

const router = express.Router();

// GET all customer support bots with details
router.get("/", async (req, res) => {
  const [rows] = await db.query(`
    SELECT 
      b.BotID, b.BotName, b.UniversalID, b.ServiceStartDate,
      csb.SupportedPlatforms, csb.MaxConcurrentSessions,
      csb.UsesRealTimeTrackingAPI, csb.AvgCustomerWaitTime,
      csb.ResolutionSuccessRate
    FROM Bot b
    JOIN CustomerSupportBot csb ON b.BotID = csb.BotID
    ORDER BY b.BotName;
  `);
  res.json(rows);
});

// GET one customer support bot with full details
router.get("/:id", async (req, res) => {
  const [rows] = await db.query(`
    SELECT 
      b.*, csb.*
    FROM Bot b
    JOIN CustomerSupportBot csb ON b.BotID = csb.BotID
    WHERE b.BotID = ?
  `, [req.params.id]);
  res.json(rows[0] || {});
});

export default router;
