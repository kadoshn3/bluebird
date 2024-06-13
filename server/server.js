// server.js bluebird server backend

// Include node modules
const express = require('express');
const fs = require('fs');
const http = require('http');
const path = require('path');
const socketio = require('socket.io');

// Initialize express app
const app = express();
app.use(express.json());

app.get('/', (req, res) => {
    res.send('Hello World!')
  })

// Setup config server and port
const server_connection = {
    hostname: "127.0.0.1",
    port: "3000"
};

// Create server
const server = http.createServer(app);

// Run the server
server.listen(server_connection.port, server_connection.hostname, () => {
    console.log(`Server running at http://${server_connection.hostname}:${server_connection.port}/`);
});
