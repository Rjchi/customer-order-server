const getUserLogged = async (req, res) => {
  try {
    return res.json(req.session.user);
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

module.exports = { getUserLogged };
