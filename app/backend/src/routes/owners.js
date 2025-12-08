import express from "express";
import db from "../db.js";

const router = express.Router();

// GET owners & their bots
router.get("/", async (req, res) => {
  const [rows] = await db.query(`
    SELECT 
      o.OwnerID, o.CompanyName, 
      b.BotID, b.BotName, b.ServiceStartDate
    FROM Owner o
    JOIN Bot b ON o.OwnerID = b.OwnerID
    ORDER BY o.CompanyName, b.ServiceStartDate;
  `);
  res.json(rows);
});

export default router;
