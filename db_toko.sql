-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 23 Jun 2024 pada 09.43
-- Versi server: 8.0.30
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` int NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_kategori` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci,
  `gambar` text COLLATE utf8mb4_general_ci,
  `berat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `kode_barang`, `nama_barang`, `id_kategori`, `harga`, `deskripsi`, `gambar`, `berat`) VALUES
(10, NULL, 'Buku Tulis Sidu ', 2, 5000, 'Buku Tulis Sidu 38 Lembar', 'download_(1).jpg', 100),
(11, NULL, 'Buku Tulis Kiky', 2, 4500, 'Buku tulis kiky 38 lembar', 'download_(4).jpg', 100),
(12, NULL, 'Bolpoin Hi tech', 2, 40000, 'Satu Pack bolopin Hi tech', 'download_(5).jpg', 144),
(13, NULL, 'Pensil staedler 2B', 2, 42000, 'Satu pack pensil staedler 2B', 'download_(8).jpg', 100),
(14, NULL, 'Spidol Snowman', 2, 15000, 'Spidol Snowman warna warni', 'download_(9).jpg', 100),
(15, NULL, 'Baterai ABC ', 8, 5000, 'Baterai ABC type aaa', 'download_(11).jpg', 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_gambar`
--

CREATE TABLE `tbl_gambar` (
  `id_gambar` int NOT NULL,
  `id_barang` int NOT NULL,
  `ket` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gambar` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_gambar`
--

INSERT INTO `tbl_gambar` (`id_gambar`, `id_barang`, `ket`, `gambar`) VALUES
(1, 1, 'test', 'test1.jpg'),
(2, 1, 'test2', 'test2.jpg'),
(7, 9, '1', 'download.jpg'),
(8, 10, '1', 'download_(2).jpg'),
(9, 11, '1', 'download_(3).jpg'),
(11, 12, '1', 'download_(6).jpg'),
(12, 13, '1', 'download_(7).jpg'),
(13, 14, '1', 'download_(10).jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int NOT NULL,
  `nama_kategori` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Alat Tulis'),
(8, 'Elektronik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id_pelanggan` int NOT NULL,
  `nama_pelanggan` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` text COLLATE utf8mb4_general_ci,
  `foto` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `email`, `password`, `foto`) VALUES
(1, 'san', 'san@gmail.com', '123', 'foto1.jpg'),
(2, 'test', 'test@gmai.com', '123', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_rekening`
--

CREATE TABLE `tbl_rekening` (
  `id_rekening` int NOT NULL,
  `nama_bank` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_rek` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `atas_nama` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_rekening`
--

INSERT INTO `tbl_rekening` (`id_rekening`, `nama_bank`, `no_rek`, `atas_nama`) VALUES
(1, 'BRI', '6574839824743', 'Ohsan'),
(2, 'DANA', '086758392745', 'OHSAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_rinci_transaksi`
--

CREATE TABLE `tbl_rinci_transaksi` (
  `id_rinci` int NOT NULL,
  `no_order` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_barang` int DEFAULT NULL,
  `qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_rinci_transaksi`
--

INSERT INTO `tbl_rinci_transaksi` (`id_rinci`, `no_order`, `id_barang`, `qty`) VALUES
(3, '20240515J6LJZ8MR', 13, 3),
(4, '20240515J6LJZ8MR', 11, 1),
(5, '20240515J6LJZ8MR', 12, 1),
(6, '20240515LTGIA5VD', 13, 4),
(7, '20240515LTGIA5VD', 15, 1),
(8, '202405164L6QGSVE', 15, 1),
(9, '202405164L6QGSVE', 12, 1),
(10, '20240522FXYDMRIW', 10, 1),
(11, '20240522FXYDMRIW', 13, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id` int NOT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lokasi` int DEFAULT NULL,
  `alamat_toko` text COLLATE utf8mb4_general_ci,
  `no_telpon` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `nama_toko`, `lokasi`, `alamat_toko`, `no_telpon`) VALUES
(1, 'ISTOK', 74, 'Jl.Puntodewo Bendowulung Kecamatan Sanankulon', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int NOT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `no_order` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_order` date DEFAULT NULL,
  `nama_penerima` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hp_penerima` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provinsi` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kota` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_general_ci,
  `kode_pos` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `expedisi` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paket` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estimasi` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ongkir` int DEFAULT NULL,
  `berat` int DEFAULT NULL,
  `grand_total` int DEFAULT NULL,
  `total_bayar` int DEFAULT NULL,
  `status_bayar` int DEFAULT NULL,
  `bukti_bayar` text COLLATE utf8mb4_general_ci,
  `atas_nama` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_bank` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_rek` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_order` int DEFAULT NULL,
  `no_resi` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `id_pelanggan`, `no_order`, `tgl_order`, `nama_penerima`, `hp_penerima`, `provinsi`, `kota`, `alamat`, `kode_pos`, `expedisi`, `paket`, `estimasi`, `ongkir`, `berat`, `grand_total`, `total_bayar`, `status_bayar`, `bukti_bayar`, `atas_nama`, `nama_bank`, `no_rek`, `status_order`, `no_resi`) VALUES
(9, 1, '20240515J6LJZ8MR', '2024-05-15', 'Ohsan', '085', 'Kalimantan Timur', 'Bontang', 'Blitar', '66151', 'tiki', 'REG', '3 Hari', 50000, 544, 170500, 220500, 0, NULL, NULL, NULL, NULL, 0, NULL),
(10, 1, '20240515LTGIA5VD', '2024-05-15', 'Ohsann', '085', 'DI Yogyakarta', 'Bantul', 'Blitar', '66151', 'tiki', 'ECO', '4 Hari', 15000, 420, 173000, 188000, 1, 'test2.png', 'ohsan', 'dana', '08564849393', 3, 'test123'),
(11, 2, '202405164L6QGSVE', '2024-05-16', 'test', '085', 'Nanggroe Aceh Darussalam (NAD)', 'Pidie', 'test', '43434', 'jne', 'OKE', '3-6 Hari', 83000, 164, 45000, 128000, 0, NULL, NULL, NULL, NULL, 0, NULL),
(12, 2, '20240522FXYDMRIW', '2024-05-22', 'test', '085', 'DKI Jakarta', 'Jakarta Selatan', 'Blitar', '66151', 'jne', 'OKE', '2-3 Hari', 18000, 200, 47000, 65000, 1, 'test3.png', 'ohsan', 'dana', '08564849393', 3, 'test123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int NOT NULL,
  `nama_user` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_user`, `username`, `password`, `level_user`) VALUES
(1, 'Ohsan', 'admin', 'admin', 1),
(2, 'san', 'user', 'user', 2),
(4, 'test', 'test', 'test', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `tbl_gambar`
--
ALTER TABLE `tbl_gambar`
  ADD PRIMARY KEY (`id_gambar`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `tbl_rekening`
--
ALTER TABLE `tbl_rekening`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indeks untuk tabel `tbl_rinci_transaksi`
--
ALTER TABLE `tbl_rinci_transaksi`
  ADD PRIMARY KEY (`id_rinci`);

--
-- Indeks untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id_barang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tbl_gambar`
--
ALTER TABLE `tbl_gambar`
  MODIFY `id_gambar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `id_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_rekening`
--
ALTER TABLE `tbl_rekening`
  MODIFY `id_rekening` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_rinci_transaksi`
--
ALTER TABLE `tbl_rinci_transaksi`
  MODIFY `id_rinci` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
