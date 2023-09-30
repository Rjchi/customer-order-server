const http = require("http");
const cors = require("cors");
const express = require("express");

/**--------------------------------------------------
 * Importaciones para la autenticación por sesiones
 --------------------------------------------------*/
const pool = require("./database/db.js");
const session = require("express-session");
const MySQLStore = require("express-mysql-session")(session);
const cookieParser = require('cookie-parser');
const { join } = require("path");
const config = require("./config.js");
const { Server: SocketServer } = require("socket.io");

/**----------------
 * Rutas
 ----------------*/
const cajaRoutes = require("./routes/caja.routes.js");
const testRoutes = require("./routes/test.routes.js");
const pedidoRoutes = require("./routes/pedito.routes.js");
const validateRoutes = require("./routes/validate.routes.js");
const productoRoutes = require("./routes/producto.routes.js");
const categoriaRoutes = require("./routes/categorias.routes.js");
const inicioSesionRoutes = require("./routes/inicioSesion.routes.js");

/**----------------
 * Servidores
 ----------------*/
const app = express();
const server = http.createServer(app);
const io = new SocketServer(server, {
  cors: {
    // origin: "*",
    origin: [config.ORIGEN,"http://localhost:5173"],
    credentials: true,
  },
  // cors: config.ORIGEN,
});

app.use(
  cors({
    /**------------------------------
   * Origen de las solicitudes
   * Y permitimos las cookies
   ------------------------------*/
   origin: [config.ORIGEN,"http://localhost:5173"],
    credentials: true,
  })
);

/**----------------
 * Procesamientos
 ----------------*/
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
/**--------------------------------------------------
 * Configuracion de sessions en la base de datos
 * --------------------------------------------------*/
const sessionStore = new MySQLStore(
  {
    pool,
    clearExpired: true,
    checkExpirationInterval: 900000,
    expiration: 60000,
  },
  pool
);

/**---------------------------------------
 * Configuracion de la cookie de sesión
 * --------------------------------------*/

app.use(
  session({
    secret: `${config.SECRETKEY}`,
    resave: false,
    saveUninitialized: false,
    store: sessionStore,
    cookie: {
      httpOnly: true,
      secure: false,
      maxAge: 60000,
    },
  })
);

app.use(cajaRoutes);
app.use(testRoutes);
app.use(pedidoRoutes);
app.use(productoRoutes);
app.use(categoriaRoutes);
app.use(inicioSesionRoutes);
app.use(validateRoutes);

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
server.listen(config.PORT, "0.0.0.0", () =>
  console.log(`SERVER ${config.PORT}`)
);
