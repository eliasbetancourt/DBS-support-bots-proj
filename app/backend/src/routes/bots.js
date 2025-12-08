import express from "express";
import db from "../db.js";

const router = express.Router();

// GET all bots
router.get("/", async (req, res) => {
  const [rows] = await db.query(`
    SELECT BotID, BotName, BotType, ServiceStartDate 
    FROM Bot
    ORDER BY ServiceStartDate;
  `);
  res.json(rows);
});

// GET one bot
router.get("/:id", async (req, res) => {
  const [rows] = await db.query(
    "SELECT * FROM Bot WHERE BotID = ?",
    [req.params.id]
  );
  res.json(rows[0] || {});
});

export default router;
