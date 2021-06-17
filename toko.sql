-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jun 2021 pada 11.22
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan akumulatif`
--

CREATE TABLE `laporan akumulatif` (
  `kode_aku` varchar(20) NOT NULL,
  `kode_toko` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan toko`
--

CREATE TABLE `laporan toko` (
  `kode_toko` varchar(20) NOT NULL,
  `kode_transaksi` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan transaksi`
--

CREATE TABLE `laporan transaksi` (
  `kode_transaksi` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `nama_brg` varchar(30) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `user` varchar(10) NOT NULL,
  `pass` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pencatatan_transaksi`
--

CREATE TABLE `pencatatan_transaksi` (
  `kode_brg` varchar(20) NOT NULL,
  `nama_brg` varchar(30) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `user` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `register`
--

CREATE TABLE `register` (
  `nama` varchar(30) NOT NULL,
  `email` varchar(20) NOT NULL,
  `user` varchar(10) NOT NULL,
  `pass` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock barang`
--

CREATE TABLE `stock barang` (
  `kode_brg` varchar(20) NOT NULL,
  `nama_brg` int(11) NOT NULL,
  `qty_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `laporan akumulatif`
--
ALTER TABLE `laporan akumulatif`
  ADD PRIMARY KEY (`kode_aku`),
  ADD KEY `kode_tok` (`kode_toko`);

--
-- Indeks untuk tabel `laporan toko`
--
ALTER TABLE `laporan toko`
  ADD PRIMARY KEY (`kode_toko`),
  ADD KEY `kode_brg3` (`kode_brg`),
  ADD KEY `kode_trans` (`kode_transaksi`);

--
-- Indeks untuk tabel `laporan transaksi`
--
ALTER TABLE `laporan transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_brg2` (`kode_brg`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user`);

--
-- Indeks untuk tabel `pencatatan_transaksi`
--
ALTER TABLE `pencatatan_transaksi`
  ADD KEY `kode_brg` (`kode_brg`),
  ADD KEY `usr` (`user`);

--
-- Indeks untuk tabel `register`
--
ALTER TABLE `register`
  ADD KEY `user` (`user`);

--
-- Indeks untuk tabel `stock barang`
--
ALTER TABLE `stock barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laporan akumulatif`
--
ALTER TABLE `laporan akumulatif`
  ADD CONSTRAINT `kode_tok` FOREIGN KEY (`kode_toko`) REFERENCES `laporan toko` (`kode_toko`);

--
-- Ketidakleluasaan untuk tabel `laporan toko`
--
ALTER TABLE `laporan toko`
  ADD CONSTRAINT `kode_brg3` FOREIGN KEY (`kode_brg`) REFERENCES `stock barang` (`kode_brg`),
  ADD CONSTRAINT `kode_trans` FOREIGN KEY (`kode_transaksi`) REFERENCES `laporan transaksi` (`kode_transaksi`);

--
-- Ketidakleluasaan untuk tabel `laporan transaksi`
--
ALTER TABLE `laporan transaksi`
  ADD CONSTRAINT `kode_brg2` FOREIGN KEY (`kode_brg`) REFERENCES `stock barang` (`kode_brg`);

--
-- Ketidakleluasaan untuk tabel `pencatatan_transaksi`
--
ALTER TABLE `pencatatan_transaksi`
  ADD CONSTRAINT `kode_brg` FOREIGN KEY (`kode_brg`) REFERENCES `stock barang` (`kode_brg`),
  ADD CONSTRAINT `usr` FOREIGN KEY (`user`) REFERENCES `login` (`user`);

--
-- Ketidakleluasaan untuk tabel `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `login` (`user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
