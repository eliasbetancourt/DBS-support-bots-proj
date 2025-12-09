import express from "express";
import db from "../db.js";

const router = express.Router();

// GET all user-bot relationships
router.get("/", async (req, res) => {
  const [rows] = await db.query(`
    SELECT 
      ub.UserID, ub.BotID, ub.FirstUseDate, ub.AccessLevel,
      u.FirstName, u.LastName, u.Email,
      b.BotName, b.BotType
    FROM UserBot ub
    JOIN User u ON ub.UserID = u.UserID
    JOIN Bot b ON ub.BotID = b.BotID
    ORDER BY ub.FirstUseDate DESC;
  `);
  res.json(rows);
});

// GET bots for a specific user
router.get("/user/:userId", async (req, res) => {
  const [rows] = await db.query(`
    SELECT 
      b.BotID, b.BotName, b.BotType, b.ServiceStartDate,
      ub.FirstUseDate, ub.AccessLevel
    FROM UserBot ub
    JOIN Bot b ON ub.BotID = b.BotID
    WHERE ub.UserID = ?
    ORDER BY ub.FirstUseDate DESC
  `, [req.params.userId]);
  res.json(rows);
});

// GET users for a specific bot
router.get("/bot/:botId", async (req, res) => {
  const [rows] = await db.query(`
    SELECT 
      u.UserID, u.FirstName, u.LastName, u.Email, u.Department,
      ub.FirstUseDate, ub.AccessLevel
    FROM UserBot ub
    JOIN User u ON ub.UserID = u.UserID
    WHERE ub.BotID = ?
    ORDER BY ub.FirstUseDate DESC
  `, [req.params.botId]);
  res.json(rows);
});

export default router;
