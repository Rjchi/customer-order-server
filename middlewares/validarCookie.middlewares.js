const validateCookie = (req, res, next) => {
  if (req.session && req.session.user) {
    return next();
  }
  return res.status(403).send("Acceso prohibido cookie");
};

module.exports = validateCookie;
