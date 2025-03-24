import express from "express";
import { PrismaClient } from "@prisma/client";

const app = express();
const prismaClient = new PrismaClient();

app.get("/", async (req, res) => {
  const data = await prismaClient.user.findMany();
  res.json({
    data,
  });
});
app.post("/", async (req, res) => {
  await prismaClient.user.create({
    data: {
      username: `user_${Math.random().toString(36).substring(2, 15)}`,
      password: Math.random().toString(),
    },
  });
  res.json({
    message: "get endpoint",
  });
});

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
