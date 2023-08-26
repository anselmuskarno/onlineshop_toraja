-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jan 2023 pada 11.08
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` varchar(25) NOT NULL,
  `id_invoice` varchar(30) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`) VALUES
(27, '11', 'INV-23137885', 1, 'Sepatu Converse', 1, 100000),
(28, '11', 'INV-23137885', 2, 'Sepatu New Era', 1, 300000),
(29, '11', 'INV-4586389', 6, 'Pensil', 1, 10000),
(30, '12', 'INV-22678529', 6, 'Pensil', 5, 10000),
(31, '12', 'INV-22678529', 5, 'HP Spectre X-360', 1, 7850000),
(32, '12', 'INV-22678529', 4, 'Baju Kemeja Wanita', 3, 150000),
(33, '11', 'INV-72894166', 5, 'HP Spectre X-360', 1, 7850000),
(34, '11', 'INV-72894166', 4, 'Baju Kemeja Wanita', 1, 150000),
(35, '11', 'INV-72894166', 2, 'Sepatu New Era', 4, 300000),
(36, '11', 'INV-104951466', 1, 'Sepatu Converse', 2, 100000),
(37, '11', 'INV-65412464', 1, 'Sepatu Converse', 1, 100000),
(38, '11', 'INV-79162061', 4, 'Baju Kemeja Wanita', 2, 150000);

--
-- Trigger `cart`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `cart` FOR EACH ROW BEGIN
	UPDATE product SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Sepatu Converse', 'Sepatu Santai Pria Converse', 'Aksesoris', 100000, 3, 'sepatu.jpg'),
(2, 'Sepatu New Era', 'Sepatu Santai Pria New Era', 'Miniatur', 300000, 8, 'era.jpg'),
(4, 'Baju Kemeja Wanita', 'Kemeja Style Modis Wanita', 'Kain Tenun', 150000, 8, 'baju.jpg'),
(5, 'HP Spectre X-360', 'Laptop HP Spectre X-360', 'Aksesoris', 7850000, 5, 'image624ea5989d1e8.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `order_id` char(30) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `city` varchar(255) NOT NULL,
  `kode_pos` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `ekspedisi` varchar(100) NOT NULL,
  `tracking_id` varchar(30) NOT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `payment_limit` datetime DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`order_id`, `id_user`, `name`, `email`, `alamat`, `mobile_phone`, `city`, `kode_pos`, `payment_method`, `ekspedisi`, `tracking_id`, `transaction_time`, `payment_limit`, `status`, `gambar`) VALUES
('INV-104951466', '11', 'Tatok', 'bobbyh259@gmail.com', 'Jln. Adyaksa', '082293027118', 'Tana Toraja', '91231', 'Direct Bank Transfer', 'JNE', '39679191261', '2023-01-18 20:05:20', '2023-01-19 20:05:20', '0', NULL),
('INV-14654220', '11', 'Tatok', 'bobbyh259@gmail.com', 'Jln. Adyaksa', '082293027118', 'Bangka Barat', '91231', 'Direct Bank Transfer', 'JNE', '1071364316864', '2023-01-18 21:52:45', '2023-01-19 21:52:45', '0', NULL),
('INV-65412464', '11', 'Tatok', 'bobbyh259@gmail.com', 'Jln. Adyaksa', '082293027118', 'Halmahera Barat', '91231', 'Direct Bank Transfer', 'ANTERAJA', '461840558082', '2023-01-18 21:53:17', '2023-01-19 21:53:17', '1', 'removal_ai_tmp-628c30ba9ecc7.png'),
('INV-79162061', '11', 'bobby', 'bobbyh259@gmail.com', 'Jln. Adyaksa', '082293027118', 'Serang', '91231', 'Direct Bank Transfer', 'JNE', '213732785555', '2023-01-18 22:20:14', '2023-01-19 22:20:14', '0', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`, `avatar`) VALUES
(6, 'Admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1', 'user.png'),
(11, 'bobby', 'bobbyh259@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2', 'user.png'),
(12, 'Pa\'Baluk na', 'pabaluk@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2', 'user.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
