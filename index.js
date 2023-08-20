const express = require("express");
const http = require("http");
const cors = require("cors");

const { join } = require("path");
const { PORT } = require("./config.js");
const { Server : SocketServer } = require("socket.io");

// Rutas:
const testRoutes = require("./routes/test.routes.js")
const pedidoRoutes = require("./routes/pedito.routes.js")

// Servidores:
const app = express();
const server = http.createServer(app);
const io = new SocketServer(server, {
    cors: "*"
})

app.use(cors());

// Procesamientos:
app.use(express.json());

app.use(testRoutes);
app.use(pedidoRoutes);

server.listen(PORT, () => console.log(`SERVER ${PORT}`));