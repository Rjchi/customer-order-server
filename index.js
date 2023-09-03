const express = require("express");
const http = require("http");
const cors = require("cors");

const { join } = require("path");
const { PORT } = require("./config.js");
const { Server: SocketServer } = require("socket.io");

// Rutas:
const testRoutes = require("./routes/test.routes.js");
const pedidoRoutes = require("./routes/pedito.routes.js");
const productoRoutes = require("./routes/producto.routes.js");
const categoriaRoutes = require("./routes/categorias.routes.js");
const cajaRoutes = require("./routes/caja.routes.js");

const openaiRoutes = require("./routes/openai.routes.js");

// Servidores:
const app = express();
const server = http.createServer(app);
const io = new SocketServer(server, {
  cors: "*",
});

app.use(cors());

// Procesamientos:
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(testRoutes);
app.use(pedidoRoutes);
app.use(productoRoutes);
app.use(categoriaRoutes);
app.use(cajaRoutes);

app.use(openaiRoutes);

io.on("connection", (socket) => {
  console.log("Cliente conectado");

  socket.on("nuevoPedido", () => {
    // Emitir evento a todos los usuarios de una sala en especifico
    io.to("cocina").emit("nuevoPedidoCocina");
    io.to("caja").emit("nuevoPedidoCocina");
  });

  // Manejar conexión de la cocina
  socket.on("cocinaConectada", () => {
    console.log("Tablet de cocina conectada");
    // Unimos al usuario a una sala en especifico
    socket.join("cocina");
  });

  socket.on("cajaConectada", () => {
    console.log("Caja conectada");
    socket.join("caja");
  });

  socket.on("recargaPedidos", () => {
    console.log("RECARGA BACKEND")
    io.to("cocina").emit("recargaPedidos");
  });
});

server.listen(PORT, () => console.log(`SERVER ${PORT}`));
