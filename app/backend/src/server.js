import express from "express";
import cors from "cors";
import botsRouter from "./routes/bots.js";
import ownersRouter from "./routes/owners.js";
import usersRouter from "./routes/users.js";
import developersRouter from "./routes/developers.js";
import codebasesRouter from "./routes/codebases.js";
import customerSupportBotsRouter from "./routes/customerSupportBots.js";
import userBotsRouter from "./routes/userBots.js";

const app = express();
app.use(cors());
app.use(express.json());

// Routes
app.use("/api/bots", botsRouter);
app.use("/api/owners", ownersRouter);
app.use("/api/users", usersRouter);
app.use("/api/developers", developersRouter);
app.use("/api/codebases", codebasesRouter);
app.use("/api/customer-support-bots", customerSupportBotsRouter);
app.use("/api/user-bots", userBotsRouter);

app.listen(3000, () => {
  console.log("Backend running on http://localhost:3000");
});
