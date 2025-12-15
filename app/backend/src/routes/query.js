import express from "express";
import db from "../db.js";

const router = express.Router();

// Execute custom SQL query
router.post("/", async (req, res) => {
  try {
    const { sql } = req.body;
    
    if (!sql) {
      return res.status(400).json({ error: "SQL query is required" });
    }
    
    const [rows] = await db.query(sql);
    res.json(rows);
  } catch (err) {
    console.error("Query execution error:", err);
    res.status(500).json({ 
      error: "Query execution failed", 
      message: err.message 
    });
  }
});

export default router;
