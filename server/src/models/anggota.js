const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Anggota = sequelize.define('Anggota', {
    id_anggota: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    nama: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
    nip: {
        type: DataTypes.STRING(20),
        allowNull: true,
    },
    tempat_lahir: {
        type: DataTypes.STRING(255),
        allowNull: true,
    },
    tanggal_lahir: {
        type: DataTypes.DATE,
        allowNull: true,
    },
    jenis_kelamin: {
        type: DataTypes.STRING(10),
        allowNull: true,
    },
    pendidikan_terakhir: {
        type: DataTypes.STRING(100),
        allowNull: true,
    },
    status_perkawinan: {
        type: DataTypes.STRING(50),
        allowNull: true,
    },
    status_anggota: {
        type: DataTypes.STRING(50),
        allowNull: true,
    },
    id_jabatan: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    id_kelompok: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    agama: {
        type: DataTypes.STRING(50),
        allowNull: true,
    },
    alamat: {
        type: DataTypes.TEXT,
        allowNull: true,
    },
    no_ktp: {
        type: DataTypes.STRING(20),
        allowNull: true,
    },
    no_rumah: {
        type: DataTypes.STRING(20),
        allowNull: true,
    },
    no_handphone: {
        type: DataTypes.STRING(15),
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING(150),
        allowNull: false,
    },
    password: {
        type: DataTypes.TEXT,
        allowNull: false,
    },
    id_admin: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    tanggal_pengangkatan: {
        type: DataTypes.DATE,
        allowNull: true,
    },
    avatar: {
        type: DataTypes.TEXT,
        allowNull: false,
    }
}, {
    tableName: 'tb_anggota',
    timestamps: false
});

module.exports = Anggota;