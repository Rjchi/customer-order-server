const jwt = require("jsonwebtoken");
const utilsJwt = require("../utils/jwt.js");
const config = require("../config.js");

const userAuthenticated = (req, res, next) => {
  try {
    const { authorization } = req.headers;
    if (authorization) {
      const token = authorization.replace("Bearer ", "");
      const decoded = jwt.verify(token, config.JWT_SECRET_KEY);
      const userData = utilsJwt.decodedToken(token);

      if (decoded && userData) {
        /**--------------------------------------------------
         * | Recuperamos la fecha de expiración del token
         * --------------------------------------------------*/
        const { exp } = userData;
        const currentTime = new Date().getTime();

        if (exp < currentTime) {
          return res.status(403).json({ message: `El token ha expirado.` });
        } else {
          next();
        }
      } else {
        return res.status(401).json({ message: `Token no válido.` });
      }
    } else {
      return res.status(401).json({ message: "Token no proporcionado." });
    }
  } catch (error) {
    if (error.name === "TokenExpiredError") {
      return res.status(403).json({ message: "El token ha expirado." });
    } else if (error.name === "JsonWebTokenError") {
      return res.status(401).json({ message: "Token no válido." });
    } else {
      return res.status(500).json({ message: "Error interno del servidor." });
    }
  }
};

module.exports = userAuthenticated;
