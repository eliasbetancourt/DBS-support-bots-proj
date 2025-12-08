import express from "express";
import cors from "cors";
import botsRouter from "./routes/bots.js";
import ownersRouter from "./routes/owners.js";
import usersRouter from "./routes/users.js";

const app = express();
app.use(cors());
app.use(express.json());

// Routes
app.use("/api/bots", botsRouter);
app.use("/api/owners", ownersRouter);
app.use("/api/users", usersRouter);

app.listen(3000, () => {
  console.log("Backend running on http://localhost:3000");
});
