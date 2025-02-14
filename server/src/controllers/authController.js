const Admin = require('../models/admin');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    
    const admin = await Admin.findOne({ where: { email } });
    if (!admin) {
      return res.status(404).json({ message: 'Email tidak ditemukan' });
    }

    const isValidPassword = await bcrypt.compare(password, admin.password);
    if (!isValidPassword) {
      return res.status(401).json({ message: 'Password salah' });
    }

    const token = jwt.sign(
      { id: admin.id_admin, email: admin.email },
      process.env.JWT_SECRET,
      { expiresIn: '1d' }
    );

    res.json({
      message: 'Login berhasil',
      token,
      user: {
        id: admin.id_admin,
        email: admin.email,
        username: admin.username,
        type: admin.type
      }
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = { login };