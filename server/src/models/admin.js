const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const bcrypt = require('bcryptjs');

const Admin = sequelize.define('Admin', {
  id_admin: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  username: {
    type: DataTypes.STRING(60),
    allowNull: false,
    unique: true
  },
  email: {
    type: DataTypes.STRING(60),
    allowNull: false,
    unique: true
  },
  namalengkap: {
    type: DataTypes.STRING(60),
    allowNull: false
  },
  password: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  type: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  avatar: {
    type: DataTypes.TEXT,
    allowNull: false
  }
}, {
  tableName: 'tb_admin',
  timestamps: false,
  hooks: {
    beforeCreate: async (admin) => {
      if (admin.password) {
        admin.password = await bcrypt.hash(admin.password, 10);
      }
    }
  }
});
