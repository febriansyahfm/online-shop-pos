-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for project_cn
CREATE DATABASE IF NOT EXISTS `project_cn` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `project_cn`;

-- Dumping structure for table project_cn.master_produk
CREATE TABLE IF NOT EXISTS `master_produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `harga` float NOT NULL,
  `stok` int(11) NOT NULL,
  `foto1` varchar(255) NOT NULL,
  `foto2` varchar(255) DEFAULT NULL,
  `foto3` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `spesifikasi` text DEFAULT NULL,
  `info_penting` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project_cn.master_produk: ~5 rows (approximately)
INSERT INTO `master_produk` (`id`, `nama`, `kategori_id`, `harga`, `stok`, `foto1`, `foto2`, `foto3`, `video`, `deskripsi`, `spesifikasi`, `info_penting`, `created_at`, `created_by`, `updated_at`, `updated_by`, `active`) VALUES
	(1, 'Baju Tidur Baru', 13, 129000, 1, 'download.jpg', '', '', '', 'Baju Tidur Baru', 'Ukuran xl', 'Tidak diperjual belikan selain ditoko ini', '2024-10-18 22:05:04', 1, '0000-00-00 00:00:00', 0, 0),
	(2, 'Baju Baru', 13, 125000, 2, 'test@123_20241021_203454_download.jpg', NULL, NULL, NULL, 'baju baru', 'baru banget', 'baru banget gitu loh', '2024-10-21 20:34:54', 1, '0000-00-00 00:00:00', 0, 0),
	(3, 'Baju Baru', 13, 125000, 2, 'test@123_20241021_203508_download.jpg', NULL, NULL, NULL, 'baju baru', 'baru banget', 'baru banget gitu loh', '2024-10-21 20:35:08', 1, '0000-00-00 00:00:00', 0, 0),
	(4, 'Baju Tidur Baru Banget', 13, 1231560, 2, 'test@123_20241021_203907_download.jpg', NULL, NULL, NULL, 'Baju Tidur Baru Banget', 'Baju Tidur Baru Banget ukuran s-xllll', 'stok tidak banyak', '2024-10-21 20:39:07', 1, '0000-00-00 00:00:00', 0, 0),
	(5, 'Iphone 16 Terbaru', 6, 16500000, 3, 'test@123_20241021_212649_iphone16_1.jpg', 'test@123_20241021_212649_iphone16_2.jpg', 'test@123_20241021_212649_iphone16_3.jpg', NULL, 'iphone 16 garansi resmi', 'iphone 16 garansi resmi 128gb', 'Stok terbatas. siapa cepat dia dapat', '2024-10-21 21:26:49', 1, '0000-00-00 00:00:00', 0, 0);

-- Dumping structure for table project_cn.master_produk_kategori
CREATE TABLE IF NOT EXISTS `master_produk_kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project_cn.master_produk_kategori: ~15 rows (approximately)
INSERT INTO `master_produk_kategori` (`id`, `nama`) VALUES
	(1, 'Buku'),
	(2, 'Film & Musik'),
	(3, 'Logam Mulia'),
	(4, 'Olahraga'),
	(5, 'Dapur'),
	(6, 'Gadget'),
	(7, 'Mainan & Hobi'),
	(8, 'Otomotif'),
	(9, 'Elektronik'),
	(10, 'Perawatan'),
	(11, 'Makanan & Minuman'),
	(12, 'Properti'),
	(13, 'Fashion'),
	(14, 'Kesehatan'),
	(15, 'Office & Stationery');

-- Dumping structure for table project_cn.trans_keranjang
CREATE TABLE IF NOT EXISTS `trans_keranjang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NOT NULL DEFAULT 0,
  `id_user` int(11) NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project_cn.trans_keranjang: ~1 rows (approximately)
INSERT INTO `trans_keranjang` (`id`, `id_produk`, `id_user`, `qty`, `updated_at`) VALUES
	(2, 4, 1, 1, '2024-10-24 14:07:32');

-- Dumping structure for table project_cn.trans_pembelian
CREATE TABLE IF NOT EXISTS `trans_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `updated_at` datetime NOT NULL,
  `diterima` int(11) DEFAULT NULL,
  `dikirim` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project_cn.trans_pembelian: ~3 rows (approximately)
INSERT INTO `trans_pembelian` (`id`, `id_produk`, `id_user`, `qty`, `harga`, `updated_at`, `diterima`, `dikirim`) VALUES
	(10, 5, 2, 1, 16500000.000000, '2024-10-30 15:17:12', NULL, 1),
	(11, 4, 2, 1, 1231560.000000, '2024-10-30 15:17:12', NULL, 1),
	(14, 5, 2, 1, 16500000.000000, '2024-10-30 15:49:28', NULL, NULL),
	(16, 4, 2, 1, 1.000000, '2024-10-31 22:00:22', NULL, NULL);

-- Dumping structure for table project_cn.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table project_cn.user: ~2 rows (approximately)
INSERT INTO `user` (`id`, `email`, `password`, `nama_lengkap`, `role_id`, `created_at`) VALUES
	(1, 'test@123', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 'Akun Penjual', 1, '2024-10-30 21:48:45'),
	(2, 'test@belanja', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 'Akun Belanja', 2, '2024-10-30 21:48:42');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
