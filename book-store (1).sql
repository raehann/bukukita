-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jul 2024 pada 16.14
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book-store`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkout`
--

CREATE TABLE `checkout` (
  `id_checkout` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nama_buku` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` char(20) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `harga_buku` int(100) NOT NULL,
  `tipe_pembayaran` enum('Alfamart','Indomaret','DANA','GOPAY','OVO','Bank Transfer','Kartu Kredit') NOT NULL,
  `status_buku` enum('pending','reject','accept') NOT NULL,
  `tanggal_checkout` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `checkout`
--

INSERT INTO `checkout` (`id_checkout`, `id_ongkir`, `id_product`, `nama`, `nama_buku`, `email`, `no_telp`, `alamat`, `harga_buku`, `tipe_pembayaran`, `status_buku`, `tanggal_checkout`) VALUES
(24, 1, 22, 'demo', 'Good Habits Bad Habits: Cara Membentuk Kebiasaan Baik untuk Menghasilkan Perubahan Positif', 'demo@gmail.com', '123456789098765', 'asdfg', 208000, 'Alfamart', 'reject', '2024-07-22 20:07:44'),
(25, 1, 21, 'demo', 'Toward The Age Of Electric Vehicles (Sc)', 'demo@gmail.com', '123456789098765', 'asdfg', 220000, 'Alfamart', 'accept', '2024-07-22 20:07:57'),
(26, 1, 19, 'demo', 'Dasar Logika Pemrograman Komputer (Update Version)', 'demo@gmail.com', '123456789098765', 'asd', 88000, 'Alfamart', 'accept', '2024-07-22 21:07:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Jakarta', 25000),
(2, 'Bandung', 40000),
(3, 'Bali', 70000),
(4, 'Semarang', 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `kategori_buku` varchar(100) NOT NULL,
  `diskon_buku` int(11) NOT NULL,
  `harga_buku` int(100) NOT NULL,
  `pembuat_buku` varchar(50) NOT NULL,
  `deskripsi_buku` varchar(500) NOT NULL,
  `rilis_buku` timestamp NOT NULL DEFAULT current_timestamp(),
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id_product`, `judul_buku`, `kategori_buku`, `diskon_buku`, `harga_buku`, `pembuat_buku`, `deskripsi_buku`, `rilis_buku`, `gambar`) VALUES
(14, 'Dunia Saham Tak Seindah Di Sosial Media – Panduan Untuk Pemula', 'BisnisEkonomi', 0, 50400, 'JOICE TAURIS SANTI CFP', 'Pasar modal semakin mudah diakses dan menarik minat berbagai kalangan, termasuk anak-anak muda. Buku ini menyajikan panduan bagi para investor yang baru masuk ke pasar modal. Idealnya, sebelum masuk ke pasar modal, para investor muda membekali diri dengan persiapan, seperti pengetahuan dasar tentang pasar modal. Di buku ini, pembaca tidak hanya dapat memperoleh pengetahuan dasar bagaimana berinvestasi, tetapi juga tipstips berinvestasi pada saham. Selain itu ada pula petunjuk mengenai apa yang s', '2021-07-15 22:07:19', 'duniasaham.png'),
(15, 'Sapiens', 'Pendidikan', 0, 100000, 'Yuval Noah Harari', 'SELAMA dua setengah juta tahun, berbagai spesies manusia hidup dan punah di Bumi, sampai akhirnya tersisa satu, Homo sapiens, Manusia Bijaksana, sejak seratusan ribu tahun lalu. Namun spesies ini bisa menyebar ke seluruh dunia dan beranak-pinak hingga berjumlah 7 miliar, dan kini menjadi kekuatan alam yang dapat mengubah kondisi planet. Apa penyebabnya?\r\n\r\nSapiens membahas sisi yang tak banyak diungkit buku sejarah atau evolusi manusia lain: bagaimana manusia berangkat dari sekadar satu spesies ', '2021-07-15 22:07:34', 'sapiens.jpg'),
(16, 'Pemberdayaan Umat Berbasis Masjid', 'Agama', 0, 53600, 'Pemberdayaan Umat Berbasis Masjid', 'PEMBERDAYAAN UMAT BERBASIS MASJID\r\nMasjid adalah rumah bagi kaum muslim, adalah simbol rumah bagi Allah, adalah pusat kegiatan umat Islam dari zaman Nabi Saw. hingga kelak hari akhir tiba.\r\nPemberdayaan Umat Be•basis Lllasjid ini mengupas fungsi masjid yang menjadi sentral aktivitas perjuangan Islam zaman Nabi Saw. Sebagai seorang pemimpin spiritual dan pemerintahan. Nabi Saw. menggunakan masjid sebagai kantor pemerintahan pusat peradaban Islam. Segala hal tentang keumatan, didiskusikan dan dipu', '2021-07-15 22:07:32', '9786020528267_Pemberdayaan_Umat_Berbasis_Masjid_4_1-1.jpg'),
(17, 'Resep Kue dan Kudapan Tradisional & Populer Ala Cheche Kitchen', 'BukuMasakan', 0, 94400, 'Mince Sriwati', 'RESEP KUE DAN KUDAPAN TRADISIONAL& POPULER @cheche_kitchen\r\n\r\nAkun instagram @cheche_kitchen dengan sekitar lebih dari 128.000 followernya telah turut meramaikan dunia kuliner di media social. Penulis buku ini, pemilik akun instagram @cheche_kitchen, adalah seorang ibu rumah tangga kelahiran Batu Sangkar- Sumatera Barat, yang saat ini berdomisili di Riau. Hobinya memasak dilakukan secara ototididak khususnya masakan dan kue Minang dan Nusantara.\r\nBuku ini berisi kumpulan 60 resep kue dan kudapan', '2021-07-15 22:07:28', '9786020654270_chece_C_1_4-1.jpg'),
(18, 'Be A Dream Parent', 'Keluarga', 0, 64000, 'Sumiyati dan Liya Afifatul Muawanah', 'Anak membawa kebahagiaan bagi orang tua. Menjadi orang tua idaman yang di idolakan anak bukanlah hal yang mudah. Akan tetapi meskipun tidak mudah kita tetap bisa mewujudkan hal tersebut. Cara yang bisa kita lakukan adalah dengan menumbuhkan kesadaran kita sebagai orang tua, senantiasa belajar memahami dan mengasuh anak, karena orang tua sebagai guru pertama dan utama bagi anak. Semoga lembaran-lembaran dari artikel dalam buku ini dapat bermanfaat bagi para orang tua, dan bermanfaat bagi siapapun', '2021-07-15 18:07:14', 'Cover_Be_A_Dream_Parent.jpg'),
(19, 'Dasar Logika Pemrograman Komputer (Update Version)', 'Komputer & Teknologi', 0, 88000, 'Abdul Kadir', 'Buku yang sangat cocok untuk Anda yang sedang mempelajari dasar pemrograman komputer. Buku ini mengajarkan logika untuk menyelesaikan berbagai masalah yang ditangani oleh komputer dengan menggunakan Flowgorithm. Dengan menggunakan perangkat lunak ini, berbagai permasalahan komputasi dapat diselesaikan dengan menyusun diagram alir. Kemudian, Anda bisa mengujinya untuk memastikan bahwa solusi yang Anda buat memang sudah sesuai atau tidak, tanpa perlu melibatkan orang lain. Sejumlah perubahan telah', '2021-07-15 18:07:40', 'Cover_Logika_Pemrograman_Update_Version_.jpg'),
(20, 'The Complete Book Of The Ielts Preparation', 'Kamus', 0, 79200, 'SLAMET RIYANTO DAN LAILA SURYANI', 'The Complete Book Of The Ielts Preparation', '2021-07-15 18:07:29', 'ielts.jpg'),
(21, 'Toward The Age Of Electric Vehicles (Sc)', 'Sains', 0, 220000, 'CYRILLUS HARINOWO, PH.D DAN IKA MAYA SARI KHAIDIR,', '“Masa depan itu datang lebih cepat dari dugaan saya: mobil listrik. Kini banyak negara seperti berlomba memproduksi mobil listrik. Buku Bung Cyrillus Harinowo ini membuat kita seperti berada di dunia masa depan itu.” —Dahlan Iskan Mantan Menteri BUMN, Jurnalis, dan Pengusaha “Buku Toward the Age of Electiric Vehicles karya seorang putra bangsa, Cyrillus Harinowo, Ph.D., ini adalah eye opener bagi aktor-aktor ekonomi untuk memanfaatkan tantangan carbon neutral menjadi peluang usaha yang menjanjik', '2021-07-15 18:07:20', 'Towards_the_Age_of_Electronic_Vehicles_C_1_4-1.jpg'),
(22, 'Good Habits Bad Habits: Cara Membentuk Kebiasaan Baik untuk Menghasilkan Perubahan Positif', 'Psikologi', 0, 104000, 'Wendy Wood', 'Buku acuan tentang cara kita membentuk kebiasaan dan apa yang bisa kita lakukan dengannya untuk membuat perubahan positif.\r\n\r\nKita menghabiskan 43% hari kita melakukan tindakan tanpa memikirkannya. Cara kita merespons orang dan membawa diri dalam rapat, apa yang kita beli, serta kapan dan bagaimana kita berolahraga, makan, dan minum—semua itu kita laku-kan tanpa sadar sebagai hasil dari kebiasaan. Namun, ketika ingin mengubah diri, kita berharap diri sadar kita, keteguhan dan niat kita, cukup un', '2021-07-16 20:07:48', '9786020638393.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `book_favorite` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Lelaki','Perempuan') NOT NULL,
  `role` enum('buyyer','seller') NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `book_favorite`, `jenis_kelamin`, `role`, `createdAt`) VALUES
(42, 'admin', 'admin@gmail.com', '$2y$10$y6l81MsU2TxmP21amVpRvO6TnPMuwQJdZKSh/vit6s7eq0IPJFpG2', 'admin', 'Lelaki', 'seller', '2024-07-22 20:07:00'),
(43, 'demo', 'demo@gmail.com', '$2y$10$uS/VhwZFj/sMleLOWra4O.CZJwVSG1F/nMWP5cLTOPCzPH2HmNL2y', 'demo', 'Lelaki', 'buyyer', '2024-07-22 20:07:36');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id_checkout`),
  ADD KEY `id_product` (`id_product`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id_checkout` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
