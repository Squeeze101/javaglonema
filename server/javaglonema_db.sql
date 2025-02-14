/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.32-MariaDB : Database - javaglonema_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`javaglonema_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `javaglonema_db`;

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `namalengkap` varchar(60) NOT NULL,
  `password` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `avatar` text NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`id_admin`,`username`,`email`,`namalengkap`,`password`,`type`,`avatar`) values (1,'admin','admin@gmail.com','Administrator','21232f297a57a5a743894a0e4a801fc3','admin','avatar.png'),(6,'baak','baak@gmail.com','Ka. BAAK','d4bda4c4694ff1dea98f0b15728e034b','baak','avatar.png'),(7,'baak2','baak2@gmail.com','Ka. BAAK 2','3cf1462ae5dadb71e6d875df74ecbd9f','baak','avatar.png');

/*Table structure for table `tb_anggota` */

DROP TABLE IF EXISTS `tb_anggota`;

CREATE TABLE `tb_anggota` (
  `id_anggota` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `pendidikan_terakhir` varchar(100) DEFAULT NULL,
  `status_perkawinan` varchar(50) DEFAULT NULL,
  `status_anggota` varchar(50) DEFAULT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_ktp` varchar(20) DEFAULT NULL,
  `no_rumah` varchar(20) DEFAULT NULL,
  `no_handphone` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `id_admin` int(11) NOT NULL,
  `tanggal_pengangkatan` date DEFAULT NULL,
  `avatar` text NOT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_anggota` */

insert  into `tb_anggota`(`id_anggota`,`nama`,`nip`,`tempat_lahir`,`tanggal_lahir`,`jenis_kelamin`,`pendidikan_terakhir`,`status_perkawinan`,`status_anggota`,`id_jabatan`,`id_kelompok`,`agama`,`alamat`,`no_ktp`,`no_rumah`,`no_handphone`,`email`,`password`,`id_admin`,`tanggal_pengangkatan`,`avatar`) values (10,'Nalika Alzahra','41551','Jakarta','1989-02-09','Perempuan','S1','Belum kawin','Karyawan tetap',3,1,'Islam','Komplek Permata Hijau No. 12','2147483647','12','2147483647','pegawai@gmail.com','047aeeb234644b9e2d4138ed3bc7976a',0,'2018-07-04','avatar.png'),(11,'Kendal Janner','144124','Bandung','1990-07-10','Perempuan','S3','Belum kawin','Karyawan tetap',1,1,'Kristen Protestan','Komplek Permata Hijau No. 12','2147483647','21','2147483647','pegawai1@gmail.com','0b96cb1d0dfbcc85f6b57041656abc49',0,'2017-09-01','avatar.png'),(12,'Benjamin Aljabar R','412411','Jakarta','1997-01-06','Laki-laki','SMP/SMA','Belum kawin','Karyawan kontrak',3,3,'Islam','Komplek Permata Hijau No. 12','2147483647','22','2147483647','pegawai2@gmail.com','fa23517aa1adfaab707494340009a330',0,'2018-02-06','avatar.png');

/*Table structure for table `tb_jabatan` */

DROP TABLE IF EXISTS `tb_jabatan`;

CREATE TABLE `tb_jabatan` (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_jabatan` */

insert  into `tb_jabatan`(`id_jabatan`,`nama_jabatan`) values (1,'Ketua'),(2,'Anggota'),(3,'Koordinator Pendamping'),(4,'Pendamping'),(5,'Tim Pemasaran');

/*Table structure for table `tb_kelompok` */

DROP TABLE IF EXISTS `tb_kelompok`;

CREATE TABLE `tb_kelompok` (
  `id_kelompok` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelompok` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kelompok`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_kelompok` */

insert  into `tb_kelompok`(`id_kelompok`,`nama_kelompok`) values (1,'Kelompok 1'),(3,'Kelompok 3'),(4,'Kelompok 4'),(5,'Kelompok 5');

/*Table structure for table `tb_log_stok` */

DROP TABLE IF EXISTS `tb_log_stok`;

CREATE TABLE `tb_log_stok` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_stok` int(11) DEFAULT NULL,
  `ket` enum('Bertambah','Berkurang','Tetap') DEFAULT 'Tetap',
  `jml` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_log`),
  KEY `id_stok` (`id_stok`),
  CONSTRAINT `tb_log_stok_ibfk_1` FOREIGN KEY (`id_stok`) REFERENCES `tb_stok` (`id_stok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_log_stok` */

insert  into `tb_log_stok`(`id_log`,`id_user`,`id_stok`,`ket`,`jml`,`created_at`,`updated_at`) values (2,11,1,'Bertambah',5,'2025-02-08 01:23:26','2025-02-08 01:23:26'),(3,11,2,'Bertambah',5,'2025-02-08 01:23:26','2025-02-08 01:23:26'),(4,11,3,'Bertambah',15,'2025-02-08 01:23:26','2025-02-08 01:23:26'),(5,12,4,'Bertambah',5,'2025-02-08 01:23:26','2025-02-08 01:23:26');

/*Table structure for table `tb_stok` */

DROP TABLE IF EXISTS `tb_stok`;

CREATE TABLE `tb_stok` (
  `id_stok` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggota` int(11) DEFAULT NULL,
  `id_tanaman` int(11) DEFAULT NULL,
  `kunjungan` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `tgl_update` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_stok`),
  KEY `id_tanaman` (`id_tanaman`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `tb_stok_ibfk_1` FOREIGN KEY (`id_tanaman`) REFERENCES `tb_tanaman` (`id_tanaman`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_stok_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `tb_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_stok` */

insert  into `tb_stok`(`id_stok`,`id_anggota`,`id_tanaman`,`kunjungan`,`stok`,`tgl_update`,`created_at`,`updated_at`) values (1,11,1,1,5,'2025-01-11 00:00:00','2025-02-08 01:23:26','2025-02-08 01:23:26'),(2,11,3,1,5,'2023-09-11 00:00:00','2025-02-08 01:23:26','2025-02-08 01:23:26'),(3,11,1,2,15,'2025-01-12 00:00:00','2025-02-08 01:23:26','2025-02-08 01:23:26'),(4,12,1,1,5,'2025-01-12 00:00:00','2025-02-08 01:23:26','2025-02-08 01:23:26');

/*Table structure for table `tb_tanaman` */

DROP TABLE IF EXISTS `tb_tanaman`;

CREATE TABLE `tb_tanaman` (
  `id_tanaman` int(11) NOT NULL AUTO_INCREMENT,
  `nama_tanaman` varchar(100) DEFAULT NULL,
  `status_tanaman` enum('Wajib','Non Wajib') DEFAULT 'Non Wajib',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_tanaman`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_tanaman` */

insert  into `tb_tanaman`(`id_tanaman`,`nama_tanaman`,`status_tanaman`,`created_at`,`updated_at`) values (1,'Tiara','Wajib','2025-02-08 01:13:16','2025-02-08 01:13:16'),(3,'Adelia','Non Wajib','2025-02-08 01:13:16','2025-02-08 01:13:16');

/* Trigger structure for table `tb_stok` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_stok_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_stok_insert` AFTER INSERT ON `tb_stok` FOR EACH ROW BEGIN
    INSERT INTO tb_log_stok (id_user, id_stok, ket, jml)
    VALUES (NEW.id_anggota, NEW.id_stok, 'Bertambah', NEW.stok);
END */$$


DELIMITER ;

/* Trigger structure for table `tb_stok` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `after_stok_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `after_stok_update` AFTER UPDATE ON `tb_stok` FOR EACH ROW BEGIN
    DECLARE log_ket ENUM('Bertambah', 'Berkurang', 'Tetap');
    
    IF NEW.stok > OLD.stok THEN
        SET log_ket = 'Bertambah';
    ELSEIF NEW.stok < OLD.stok THEN
        SET log_ket = 'Berkurang';
    ELSE
        SET log_ket = 'Tetap';
    END IF;
    
    INSERT INTO tb_log_stok (id_user, id_stok, ket, jml)
    VALUES (NEW.id_anggota, NEW.id_stok, log_ket, ABS(NEW.stok - OLD.stok));
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
