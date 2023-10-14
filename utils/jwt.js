const jwt = require("jsonwebtoken");
const config = require("../config.js");

const createAccessToken = (user) => {
  const expiration = new Date();
  /**--------------------------------------------------------------
   * | Ese + 5 horas depende de lo que queramos que dure el token
   * ------------------------------------------------------------*/
  expiration.setHours(expiration.getHours() + 5);
  // expiration.setMinutes(expiration.getMinutes() + 5);

  return jwt.sign(_tokenPayload(user, expiration), config.JWT_SECRET_KEY);
};

const createRefreshToken = (user) => {
  const expiration = new Date();
  /**---------------------------------------------------------
   * | Ese + 1 estamos diciendo que el refresh dure un mes
   * ---------------------------------------------------------*/
  expiration.setMonth(expiration.getMonth() + 1);
  return jwt.sign(_tokenPayload(user, expiration, "refresh"), config.JWT_SECRET_KEY);
};

/**-----------------------------
 * | Decodificamos el token
 * -----------------------------*/
const decodedToken = (token) => {
  return jwt.decode(token, config.JWT_SECRET_KEY);
};

const _tokenPayload = (user, expiration, tokenType = "token") => {
  return {
    tokenType,
    user,
    iat: new Date().getTime(),
    exp: expiration.getTime(),
  };
};

module.exports = {
  createAccessToken,
  createRefreshToken,
  decodedToken,
};
