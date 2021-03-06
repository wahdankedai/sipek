-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 20, 2011 at 01:54 AM
-- Server version: 5.0.45
-- PHP Version: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `sipek`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggaran`
--

CREATE TABLE `anggaran` (
  `id` int(11) NOT NULL auto_increment,
  `sumber` varchar(255) collate latin1_general_ci NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_terima` date NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `anggaran`
--

INSERT INTO `anggaran` (`id`, `sumber`, `jumlah`, `tanggal_terima`, `periode_id`) VALUES
(1, 'fsdgsgs', 4342525, '2011-05-16', 1),
(2, 'ghgjghjjjh', 689898988, '2011-05-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bobot`
--

CREATE TABLE `bobot` (
  `kriteria_id` int(11) NOT NULL,
  `kriteria_pembanding_id` int(11) NOT NULL,
  `nilai` double default NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY  (`kriteria_id`,`kriteria_pembanding_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `bobot`
--

INSERT INTO `bobot` (`kriteria_id`, `kriteria_pembanding_id`, `nilai`, `periode_id`) VALUES
(1, 1, 9, 1),
(1, 2, 9, 1),
(1, 3, 9, 1),
(1, 4, 9, 1),
(2, 1, 9, 1),
(2, 2, 9, 1),
(2, 3, 9, 1),
(2, 4, 9, 1),
(3, 1, 9, 1),
(3, 2, 9, 1),
(3, 3, 9, 1),
(3, 4, 9, 1),
(4, 1, 9, 1),
(4, 2, 9, 1),
(4, 3, 9, 1),
(4, 4, 9, 1),
(5, 5, 9, 1),
(5, 6, 9, 1),
(5, 7, 9, 1),
(6, 5, 9, 1),
(6, 6, 9, 1),
(6, 7, 9, 1),
(7, 5, 9, 1),
(7, 6, 9, 1),
(7, 7, 9, 1),
(8, 8, 9, 1),
(8, 9, 9, 1),
(8, 10, 9, 1),
(9, 8, 9, 1),
(9, 9, 9, 1),
(9, 10, 9, 1),
(10, 8, 9, 1),
(10, 9, 9, 1),
(10, 10, 9, 1),
(11, 11, 9, 1),
(11, 12, 9, 1),
(12, 11, 9, 1),
(12, 12, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

CREATE TABLE `inventaris` (
  `id` int(11) NOT NULL auto_increment,
  `jenis` varchar(255) collate latin1_general_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kondisi` varchar(255) collate latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `inventaris`
--

INSERT INTO `inventaris` (`id`, `jenis`, `jumlah`, `kondisi`, `periode_id`) VALUES
(1, 'bbfdbfb', 45, 'Baik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pelayanan`
--

CREATE TABLE `jenis_pelayanan` (
  `id` int(11) NOT NULL auto_increment,
  `nama` varchar(255) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jenis_pelayanan`
--

INSERT INTO `jenis_pelayanan` (`id`, `nama`) VALUES
(1, 'Perencanaan, pengendalian, dan pembangunan daerah'),
(2, 'Pengembangan komunikasi, informasi, media massa, dan pemanfaatan TI'),
(3, 'Peningkatan kapasitas sumber daya aparatur'),
(4, 'Peningkatan sarana dan prasarana aparatur'),
(5, 'Pemeliharaan sarana dan prasarana aparatur');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL auto_increment,
  `nama` varchar(255) collate latin1_general_ci NOT NULL,
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama`, `parent_id`) VALUES
(1, 'Finansial', NULL),
(2, 'Pelanggan', NULL),
(3, 'Internal Bisnis', NULL),
(4, 'Pembelajaran dan Pertumbuhan', NULL),
(5, 'Anggaran Masuk', 1),
(6, 'Penggunaan Anggaran', 1),
(7, 'Efektivitas Anggaran', 1),
(8, 'Kepuasan Kerja Pegawai', 3),
(9, 'Peningkatan Kualitas Pegawai', 3),
(10, 'Kualitas Sarana Prasaran', 3),
(11, 'Kualitas SDM', 4),
(12, 'Efektivitas Komunikasi', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL auto_increment,
  `nip` varchar(255) collate latin1_general_ci NOT NULL,
  `nama` varchar(255) collate latin1_general_ci NOT NULL,
  `jabatan` varchar(255) collate latin1_general_ci NOT NULL,
  `golongan` varchar(255) collate latin1_general_ci NOT NULL,
  `pend_formal` varchar(255) collate latin1_general_ci NOT NULL,
  `status` varchar(255) collate latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `nama`, `jabatan`, `golongan`, `pend_formal`, `status`, `periode_id`) VALUES
(1, '123456', 'c', 'c', 'II A', 'C', 'C', 0),
(2, 'a', 'a', 'a', 'II A', 'a', 'a', 0),
(3, '345677', 'fff', 'fff', 'II A', 'ggggg', 'gggg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penugasan`
--

CREATE TABLE `penugasan` (
  `pegawai_id` int(11) NOT NULL,
  `nama_penugasan` varchar(250) collate latin1_general_ci NOT NULL,
  `tingkat` varchar(250) collate latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY  (`pegawai_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `penugasan`
--


-- --------------------------------------------------------

--
-- Table structure for table `periode`
--

CREATE TABLE `periode` (
  `id` int(11) NOT NULL auto_increment,
  `nama` year(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `periode`
--

INSERT INTO `periode` (`id`, `nama`) VALUES
(1, 2010),
(2, 2011);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `pegawai_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `jumlah_hadir` int(11) NOT NULL,
  `jumlah_sakit` int(11) NOT NULL,
  `jumlah_izin` int(11) NOT NULL,
  `jumlah_tanpa_keterangan` int(11) NOT NULL,
  PRIMARY KEY  (`pegawai_id`,`periode_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`pegawai_id`, `periode_id`, `jumlah_hadir`, `jumlah_sakit`, `jumlah_izin`, `jumlah_tanpa_keterangan`) VALUES
(0, 1, 333, 2, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `program_kerja`
--

CREATE TABLE `program_kerja` (
  `id` int(11) NOT NULL auto_increment,
  `nama` varchar(255) collate latin1_general_ci NOT NULL,
  `jenis_pelayanan_id` int(11) NOT NULL,
  `target_anggaran` double NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_target_selesai` date NOT NULL,
  `riil_tanggal_selesai` date NOT NULL,
  `riil_anggaran` double NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `jenis_pelayanan_id` (`jenis_pelayanan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `program_kerja`
--

INSERT INTO `program_kerja` (`id`, `nama`, `jenis_pelayanan_id`, `target_anggaran`, `tanggal_mulai`, `tanggal_target_selesai`, `riil_tanggal_selesai`, `riil_anggaran`, `periode_id`) VALUES
(1, 'sfskgks', 0, 3940000, '2011-06-20', '2011-06-20', '2011-06-20', 4200000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sasaran`
--

CREATE TABLE `sasaran` (
  `id` int(11) NOT NULL auto_increment,
  `periode_id` int(11) NOT NULL,
  `cash_in` int(11) NOT NULL,
  `cash_out` int(11) NOT NULL,
  `target_anggaran` int(11) NOT NULL,
  `target_penggunaan_anggaran` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sasaran`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) collate latin1_general_ci NOT NULL,
  `password` varchar(255) collate latin1_general_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `is_admin`) VALUES
(1, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 1),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 0);
