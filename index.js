const http = require("http");
const cors = require("cors");
const express = require("express");

const { join } = require("path");
const { PORT } = require("./config.js");
const { Server: SocketServer } = require("socket.io");

/**----------------
 * Rutas
 ----------------*/
const cajaRoutes = require("./routes/caja.routes.js");
const testRoutes = require("./routes/test.routes.js");
const pedidoRoutes = require("./routes/pedito.routes.js");
const productoRoutes = require("./routes/producto.routes.js");
const categoriaRoutes = require("./routes/categorias.routes.js");

/**----------------
 * Servidores
 ----------------*/
const app = express();
const server = http.createServer(app);
const io = new SocketServer(server, {
  cors: "*",
});

app.use(cors());

/**----------------
 * Procesamientos
 ----------------*/
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(cajaRoutes);
app.use(testRoutes);
app.use(pedidoRoutes);
app.use(productoRoutes);
app.use(categoriaRoutes);

io.on("connection", (socket) => {
  console.log("Cliente conectado 🧍‍♂️🧍‍♂️");

  /**------------------------------
   * Manejar conexión con cocina
  ------------------------------*/
  socket.on("cocinaConectada", () => {
    console.log("Cocina conectada 🍽️👨‍🍳");

    /**-----------------------------------------------
     * Unimos al usuario a una sala en especifico
    -----------------------------------------------*/
    socket.join("cocina");
  });

  socket.on("cajaConectada", () => {
    console.log("Caja conectada 👨💰");
    socket.join("caja");
  });

  socket.on("nuevoPedido", () => {
    /**--------------------------------------------------------------
   * Emitir evento a todos los usuarios de una sala en especifico
   --------------------------------------------------------------*/
    io.to("cocina").emit("nuevoPedidoCocina");
    io.to("caja").emit("nuevoPedidoCocina");
  });

  socket.on("recargaPedidos", () => {
    io.to("cocina").emit("recargaPedidos");
  });

  socket.on("recargaPedidosCaja", () => {
    io.to("caja").emit("recargaPedidosCaja");
  });
});

/**------------------------------------------------------------------------------------------------
 * 0.0.0.0 es la representación de una dirección IP especial que indica "cualquier dirección"
 ------------------------------------------------------------------------------------------------*/
server.listen(PORT, "0.0.0.0", () => console.log(`SERVER ${PORT}`));
