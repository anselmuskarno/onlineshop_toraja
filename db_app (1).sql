-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Agu 2023 pada 21.59
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(38, '11', 'INV-79162061', 4, 'Baju Kemeja Wanita', 2, 150000),
(39, '13', 'INV-86179038', 8, 'TIKAR', 2, 300000),
(40, '13', 'INV-86179038', 7, 'tikar', 1, 250000),
(41, '13', 'INV-92735741', 8, 'TIKAR', 2, 300000),
(42, '13', 'INV-92735741', 7, 'tikar', 2, 250000),
(43, '13', 'INV-5934930', 7, 'tikar', 3, 250000),
(44, '13', 'INV-5934930', 8, 'TIKAR', 1, 300000),
(45, '13', 'INV-79168494', 9, 'kapipe motif', 1, 100000),
(46, '13', 'INV-92738997', 9, 'kapipe motif', 1, 100000),
(47, '13', 'INV-92738997', 10, 'sepu', 1, 100000),
(48, '13', 'INV-67124698', 9, 'kapipe motif', 2, 100000),
(49, '13', 'INV-51950158', 10, 'sepu', 1, 100000),
(50, '13', 'INV-51950158', 9, 'kapipe motif', 2, 100000);

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
  `gambar` text NOT NULL,
  `berat` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`, `berat`) VALUES
(7, 'tikar', 'tikar biasa, bermotif. ukuran besar.', 'Tikar', 250000, 10, 'tikarku1.jpg', 0),
(8, 'TIKAR', 'tikar biasa, bermotif merah. ukuran besar.', 'Tikar', 300000, 15, 'irgijfkjkf.jpg', 1),
(9, 'kapipe motif', 'kapipe motif merah hijau. ukuran sedang.', 'Miniatur', 100000, 4, 'IMG20220501112254.jpg', 50),
(10, 'sepu', 'sepu motif ukuran sedang.', 'Kain Tenun', 100000, 8, 'Remini20220419094134594.jpg', 50),
(11, 'kapipe', 'kapipe motif merah, ukuran sedang', 'Miniatur', 100000, 10, 'IMG20220501112327.jpg', 50),
(12, 'kapipe', 'kapipe ukuran kecil', 'Miniatur', 100000, 10, 'kapipe1.png', 50),
(19, 'kapipe', 'kapipe biasa', 'Miniatur', 50000, 20, 'kapipe11.png', 500),
(20, 'kapipe', 'kapipe motif merah hijau', 'Miniatur', 100000, 10, 'IMG202205011122541.jpg', 1),
(21, 'tikar', 'tikar biasa', 'Tikar', 100000, 10, 'irgijfkjkf1.jpg', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`order_id`, `id_user`, `name`, `email`, `alamat`, `mobile_phone`, `city`, `kode_pos`, `payment_method`, `ekspedisi`, `tracking_id`, `transaction_time`, `payment_limit`, `status`, `gambar`) VALUES
('INV-51950158', '13', 'vebe', 'vebe@gmail.com', 'dgfhgj', '84758745', 'Pare-Pare', '234465', 'Direct Bank Transfer', 'JNE', '655733422200', '2023-07-17 08:01:17', '2023-07-18 08:01:17', '0', NULL),
('INV-5934930', '13', 'vebe', 'vebe@gmail.com', 'makale', '085244634315', 'Makale', '12345', 'Direct Bank Transfer', 'Pos Indonesia', '724251708419', '2023-02-11 17:16:49', '2023-02-12 17:16:49', '0', NULL),
('INV-65412464', '11', 'Tatok', 'bobbyh259@gmail.com', 'Jln. Adyaksa', '082293027118', 'Halmahera Barat', '91231', 'Direct Bank Transfer', 'ANTERAJA', '461840558082', '2023-01-18 21:53:17', '2023-01-19 21:53:17', '1', 'removal_ai_tmp-628c30ba9ecc7.png'),
('INV-67124698', '13', 'vebe', 'vebe@gmail.com', 'kjhgfd', '09876543', 'Makale', '7654', 'Direct Bank Transfer', 'JNE', '924234656668', '2023-07-17 07:45:29', '2023-07-18 07:45:29', '0', NULL),
('INV-79162061', '11', 'bobby', 'bobbyh259@gmail.com', 'Jln. Adyaksa', '082293027118', 'Serang', '91231', 'Direct Bank Transfer', 'JNE', '213732785555', '2023-01-18 22:20:14', '2023-01-19 22:20:14', '0', NULL),
('INV-79168494', '13', 'vebe', 'vebe@gmail.com', 'jl serang', '085244542678', 'Rantepao', '1234', 'Direct Bank Transfer', 'JNE', '374287472262', '2023-02-22 14:46:58', '2023-02-23 14:46:58', '0', NULL),
('INV-86179038', '13', 'vebe', 'vebe@gmail.com', 'makale', '085244634315', 'Makale', '12345', 'Direct Bank Transfer', 'JNE', '169790633892', '2023-02-11 17:12:08', '2023-02-12 17:12:08', '1', 'images.jpeg'),
('INV-92735741', '13', 'vebe', 'vebe@gmail.com', 'makale', '085244634315', 'Makale', '12345', 'Direct Bank Transfer', 'Pos Indonesia', '234962705309', '2023-02-11 17:13:44', '2023-02-12 17:13:44', '1', 'gui7.jpg'),
('INV-92738997', '13', 'vebe', 'vebe@gmail.com', 'jl. serang', '085244634315', 'Rantepao', '34567', 'Direct Bank Transfer', 'JNE', '517937727978', '2023-07-15 04:45:14', '2023-07-16 04:45:14', '0', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`, `avatar`) VALUES
(6, 'Admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1', 'user.png'),
(11, 'bobby', 'bobbyh259@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2', 'user.png'),
(12, 'Pa\'Baluk na', 'pabaluk@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2', 'user.png'),
(13, 'vebe', 'vebe@gmail.com', 'b13764e06bfb7ce72775fbdfca2780d7', '2', 'user.png'),
(14, 'veby madayana', 'veby@gmail.com', '4388f57d2725498835dff3ad59451ba5', '0', 'user.png'),
(15, 'coba', 'coba@gmail.com', 'd143b456e5dc4ea46dfd31430193aed0', '2', 'user.png'),
(16, 'coba', 'coba@gmail.com', 'a3040f90cc20fa672fe31efcae41d2db', '2', 'user.png');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
