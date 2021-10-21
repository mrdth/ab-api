import express from 'express';
import http from 'http';
import { authorRouter, bookRouter } from './routes';
require('dotenv').config();

const app = express();

// Register out routes
app.use('/authors/', authorRouter);
app.use('/books/', bookRouter);

const port = process.env.APP_PORT;
const server = http.createServer(app).listen(port);

module.exports = server;
