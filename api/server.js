const express = require("express");

const BudgetRouter = require("../api/budget-router.js");

const db = require("../data/dbConfig.js");

const server = express();

server.use(express.json());

server.use("/api/accounts", BudgetRouter);

module.exports = server;
