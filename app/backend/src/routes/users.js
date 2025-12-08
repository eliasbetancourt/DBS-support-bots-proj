import express from "express";
import db from "../db.js";

const router = express.Router();

// GET user usage history
router.get("/", async (req, res) => {
  const [rows] = await db.query(`
    SELECT
        u.UserID,
        u.FirstName,
        u.LastName,
        b.BotID,
        b.BotName,
        ub.FirstUseDate,
        ub.AccessLevel
    FROM User u
    JOIN UserBot ub ON u.UserID = ub.UserID
    JOIN Bot b      ON ub.BotID = b.BotID
    ORDER BY u.UserID, ub.FirstUseDate;
  `);
  res.json(rows);
});

export default router;
