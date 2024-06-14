// server.js bluebird server backend

// Include node modules
const express = require('express');
const fs = require('fs');
const http = require('http');
const path = require('path');
const socketio = require('socket.io');
const { Pool } = require('pg')

// Initialize express app
const app = express();
app.use(express.json());

// PostgreSQL db configuration
const pool = new Pool({
    user: 'neevekadosh',
    host: 'localhost',
    database: 'ski_mountain_review_db',
    port: 5432
});

// Sample query from users table and post onto app
app.get('/', async (req, res) => {
    try {
        const client = await pool.connect();
        const result = await client.query('SELECT * FROM users;');
        client.release();
        res.json(result.rows);
    } catch (err) {
        console.error('Error executing query', err);
    }
});

// Setup config server and port
const server_connection = {
    hostname: "127.0.0.1",
    port: "3000"
};

// Create server
const server = http.createServer(app);
const io = socketio(server);

io.on('connection', (socket) => {
    console.log('A user connected');

    socket.on('disconnect', () => {
        console.log('user disconnected.');
    });

    socket.on('message', (msg) => {
        console.log('message: ' + msg);

        io.emit('message', msg);
    });
});

// Run the server
server.listen(server_connection.port, server_connection.hostname, () => {
    console.log(`Server running at http://${server_connection.hostname}:${server_connection.port}/`);
});
