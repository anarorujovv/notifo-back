-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for notifo
CREATE DATABASE IF NOT EXISTS `notifo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `notifo`;

-- Dumping structure for table notifo.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_az` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table notifo.categories: ~139 rows (approximately)
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(1, 'Elektronika', NULL, 'elektronika', NULL, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(2, 'Telefonlar', NULL, 'telefonlar', 1, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(3, 'Smartfonlar', NULL, 'smartfonlar', 2, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(4, 'Düyməli telefonlar', NULL, 'duymeli-telefonlar', 2, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(5, 'Aksesuarlar', NULL, 'aksesuarlar', 2, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(6, 'Qulaqlıqlar', NULL, 'qulaqliqlar', 5, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(7, 'Powerbank', NULL, 'powerbank', 5, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(8, 'Adapterlər və kabellər', NULL, 'adapterler-ve-kabeller', 5, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(9, 'Telefon qabları', NULL, 'telefon-qablari', 5, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(10, 'Ekran qoruyucular', NULL, 'ekran-qoruyucular', 5, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(11, 'Kompüterlər və noutbuklar', NULL, 'komputerler-ve-noutbuklar', 1, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(12, 'Noutbuklar', NULL, 'noutbuklar', 11, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(13, 'Stolüstü kompüterlər', NULL, 'stolustu-komputerler', 11, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(14, 'Monitorlar', NULL, 'monitorlar', 11, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(15, 'Klaviatura və siçanlar', NULL, 'klaviatura-ve-sicanlar', 11, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(16, 'Printer və skanerlər', NULL, 'printer-ve-skanerler', 11, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(17, 'Kompüter aksesuarları', NULL, 'komputer-aksesuarlar', 11, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(18, 'Planşetlər və eBook oxuyucular', NULL, 'plansetler-ve-ebook', 1, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(19, 'TV və audio/video texnikası', NULL, 'tv-ve-audio-video', 1, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(20, 'Televizorlar', NULL, 'televizorlar', 19, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(21, 'TV Box və Smart cihazlar', NULL, 'tv-box-ve-smart-cihazlar', 19, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(22, 'Akustik sistemlər', NULL, 'akustik-sistemler', 19, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(23, 'Radiolar', NULL, 'radiolar', 19, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(24, 'Foto və video texnikası', NULL, 'foto-ve-video-texnikasi', 1, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(25, 'Fotoaparatlar', NULL, 'fotoaparatlar', 24, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(26, 'Videokameralar', NULL, 'videokameralar', 24, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(27, 'Linzalar və aksesuarlar', NULL, 'linzalar-ve-aksesuarlar', 24, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(28, 'Oyun konsolları', NULL, 'oyun-konsollari', 1, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(29, 'PlayStation', NULL, 'playstation', 28, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(30, 'Xbox', NULL, 'xbox', 28, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(31, 'Nintendo', NULL, 'nintendo', 28, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(32, 'Oyun aksesuarları', NULL, 'oyun-aksesuarlar', 28, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(33, 'Məişət texnikası', NULL, 'meiset-texnikasi', NULL, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(34, 'Mətbəx texnikası', NULL, 'metbex-texnikasi', 33, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(35, 'Soyuducular', NULL, 'soyuducular', 34, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(36, 'Qabyuyan maşınlar', NULL, 'qabyuyan-masinlar', 34, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(37, 'Mikrodalğalı sobalar', NULL, 'mikrodalga-sobalar', 34, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(38, 'Blenderlər və mikserlər', NULL, 'blenderler-ve-mikserler', 34, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(39, 'Qəhvə maşınları', NULL, 'qehve-masinlari', 34, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(40, 'Ev texnikası', NULL, 'ev-texnikasi', 33, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(41, 'Tozsoranlar', NULL, 'tozsoranlar', 40, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(42, 'Ütülər', NULL, 'utuler', 40, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(43, 'Kondisionerlər', NULL, 'kondisionerler', 40, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(44, 'Hava təmizləyiciləri', NULL, 'hava-temizleyicileri', 40, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(45, 'Qızdırıcılar', NULL, 'qizdiricilar', 40, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(46, 'Geyim və parça baxımı', NULL, 'geyim-ve-parca-baximi', 33, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(47, 'Paltaryuyan maşınlar', NULL, 'paltaryuyan-masinlar', 46, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(48, 'Qurutma maşınları', NULL, 'qurutma-masinlari', 46, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(49, 'Ütü masaları', NULL, 'utu-masalari', 46, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(50, 'Nəqliyyat', NULL, 'neqliyyat', NULL, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(51, 'Avtomobillər', NULL, 'avtomobiller', 50, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(52, 'Motosikletlər', NULL, 'motosikletler', 50, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(53, 'Velosipedlər', NULL, 'velosipedler', 50, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(54, 'Avto ehtiyat hissələri', NULL, 'avto-ehtiyat-hisseleri', 50, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(55, 'Təkərlər', NULL, 'tekeler', 54, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(56, 'Disklər', NULL, 'diskler', 54, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(57, 'Akumulyatorlar', NULL, 'akumulyatorlar', 54, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(58, 'Yağlar və filtrlər', NULL, 'yaglar-ve-filtrler', 54, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(59, 'Avto aksesuarlar', NULL, 'avto-aksesuarlar', 50, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(60, 'DVR kameralar', NULL, 'dvr-kameralar', 59, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(61, 'Telefon tutacaqları', NULL, 'telefon-tutacaqlari', 59, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(62, 'GPS naviqatorlar', NULL, 'gps-naviqatorlar', 59, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(63, 'Daşınmaz əmlak', NULL, 'emlak', NULL, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(64, 'Mənzillər', NULL, 'menziller', 63, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(65, 'Ev və bağlar', NULL, 'ev-ve-baglar', 63, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(66, 'Obyektlər', NULL, 'obyektler', 63, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(67, 'Torpaq sahələri', NULL, 'torpaq-saheleri', 63, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(68, 'Ofislər və kommersiya əmlakı', NULL, 'ofisler-ve-kommersiya-emlaki', 63, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(69, 'Geyim və aksessuarlar', NULL, 'geyim-ve-aksesuarlar', NULL, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(70, 'Kişi geyimləri', NULL, 'kisi-geyimleri', 69, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(71, 'Qadın geyimləri', NULL, 'qadin-geyimleri', 69, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(72, 'Uşaq geyimləri', NULL, 'usaq-geyimleri', 69, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(73, 'Ayaqqabılar', NULL, 'ayaqqabilar', 69, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(74, 'Çantalar', NULL, 'cantalar', 69, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(75, 'Saatlar və zinyət əşyaları', NULL, 'saatlar-ve-zinyet-esyalari', 69, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(76, 'Uşaq dünyası', NULL, 'usaq-dunyasi', NULL, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(77, 'Oyuncaqlar', NULL, 'oyuncaqlar', 76, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(78, 'Uşaq arabaları', NULL, 'usaq-arabalari', 76, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(79, 'Uşaq mebelləri', NULL, 'usaq-mebelleri', 76, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(80, 'Uşaq geyimləri', NULL, 'usaq-geyimleri-aksessuarlar', 76, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(81, 'Uşaq yeməyi və aksesuarları', NULL, 'usaq-yemeyi-ve-aksesuarlar', 76, '2025-10-21 09:38:17');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(82, 'Ev və bağ', NULL, 'ev-ve-bag', NULL, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(83, 'Mebel', NULL, 'mebel', 82, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(84, 'Ev dekorasiyası', NULL, 'ev-dekorasiyasi', 82, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(85, 'Mətbəx əşyaları', NULL, 'metbex-esyalari', 82, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(86, 'Bağ alətləri', NULL, 'bag-aletleri', 82, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(87, 'Bitkilər və güllər', NULL, 'bitkiler-ve-guller', 82, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(88, 'Hobbi və asudə vaxt', NULL, 'hobbi-ve-asude-vaxt', NULL, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(89, 'İdman avadanlıqları', NULL, 'idman-avadanliqlari', 88, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(90, 'Musiqi alətləri', NULL, 'musiqi-aletleri', 88, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(91, 'Kitablar və jurnallar', NULL, 'kitablar-ve-jurnallar', 88, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(92, 'Turizm və kamp avadanlığı', NULL, 'turizm-ve-kamp', 88, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(93, 'Kolleksiyalar', NULL, 'kolleksiyalar', 88, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(94, 'Heyvanlar aləmi', NULL, 'heyvanlar', NULL, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(95, 'Ev heyvanları (pişik, it, quş)', NULL, 'ev-heyvanlari', 94, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(96, 'Heyvan aksesuarları', NULL, 'heyvan-aksesuarlar', 94, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(97, 'Qidalar və baxım vasitələri', NULL, 'qida-ve-baxim-vasiteleri', 94, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(98, 'Xidmətlər və iş elanları', NULL, 'xidmetler-ve-is-elanlari', NULL, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(99, 'Usta və təmir xidmətləri', NULL, 'usta-ve-temir', 98, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(100, 'Təmizlik xidmətləri', NULL, 'temizlik-xidmetleri', 98, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(101, 'Tədris və kurslar', NULL, 'tedris-ve-kurslar', 98, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(102, 'Nəqliyyat xidmətləri', NULL, 'neqliyyat-xidmetleri', 98, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(103, 'İş elanları', NULL, 'is-elanlari', 98, '2025-10-21 09:38:18');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(104, 'Apple', NULL, 'apple', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(105, 'Samsung', NULL, 'samsung', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(106, 'Xiaomi', NULL, 'xiaomi', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(107, 'Huawei', NULL, 'huawei', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(108, 'OnePlus', NULL, 'oneplus', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(109, 'Oppo', NULL, 'oppo', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(110, 'Vivo', NULL, 'vivo', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(111, 'Realme', NULL, 'realme', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(112, 'Honor', NULL, 'honor', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(113, 'Google', NULL, 'google', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(114, 'Nokia', NULL, 'nokia', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(115, 'Sony', NULL, 'sony', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(116, 'Motorola', NULL, 'motorola', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(117, 'ZTE', NULL, 'zte', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(118, 'Asus', NULL, 'asus', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(119, 'Infinix', NULL, 'infinix', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(120, 'Tecno', NULL, 'tecno', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(121, 'Nothing', NULL, 'nothing', 3, '2025-10-27 16:51:51');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(122, 'iPhone 16 Pro Max', NULL, 'iphone-16-pro-max', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(123, 'iPhone 16 Pro', NULL, 'iphone-16-pro', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(124, 'iPhone 16', NULL, 'iphone-16', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(125, 'iPhone 15 Pro Max', NULL, 'iphone-15-pro-max', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(126, 'iPhone 15 Pro', NULL, 'iphone-15-pro', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(127, 'iPhone 15', NULL, 'iphone-15', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(128, 'iPhone 14 Pro Max', NULL, 'iphone-14-pro-max', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(129, 'iPhone 14 Pro', NULL, 'iphone-14-pro', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(130, 'iPhone 14', NULL, 'iphone-14', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(131, 'iPhone 13 Pro Max', NULL, 'iphone-13-pro-max', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(132, 'iPhone 13', NULL, 'iphone-13', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(133, 'iPhone 12', NULL, 'iphone-12', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(134, 'iPhone 11', NULL, 'iphone-11', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(135, 'iPhone SE (3rd Gen)', NULL, 'iphone-se-3', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(136, 'iPhone XR', NULL, 'iphone-xr', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(137, 'iPhone X', NULL, 'iphone-x', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(138, 'iPhone 8 Plus', NULL, 'iphone-8-plus', 104, '2025-10-27 16:51:56');
INSERT INTO `categories` (`id`, `name_az`, `name_en`, `slug`, `parent_id`, `created_at`) VALUES
	(139, 'iPhone 8', NULL, 'iphone-8', 104, '2025-10-27 16:51:56');

-- Dumping structure for table notifo.filters
CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `min_price` decimal(10,2) DEFAULT 0.00,
  `max_price` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `filters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `filters_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table notifo.filters: ~1 rows (approximately)
INSERT INTO `filters` (`id`, `user_id`, `category_id`, `min_price`, `max_price`, `created_at`, `updated_at`) VALUES
	(13, 7, 122, 0.00, 3500.00, '2025-10-29 14:36:21', '2025-10-29 14:36:21');

-- Dumping structure for table notifo.filter_platforms
CREATE TABLE IF NOT EXISTS `filter_platforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_id` int(11) NOT NULL,
  `user_platform_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_filter_userplatform` (`filter_id`,`user_platform_id`),
  KEY `fk_filter_platform_userplatform` (`user_platform_id`),
  CONSTRAINT `fk_filter_platform_filter` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_filter_platform_userplatform` FOREIGN KEY (`user_platform_id`) REFERENCES `user_platforms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table notifo.filter_platforms: ~1 rows (approximately)
INSERT INTO `filter_platforms` (`id`, `filter_id`, `user_platform_id`, `created_at`) VALUES
	(1, 13, 9, '2025-10-29 18:36:36');

-- Dumping structure for table notifo.platforms
CREATE TABLE IF NOT EXISTS `platforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table notifo.platforms: ~4 rows (approximately)
INSERT INTO `platforms` (`id`, `name`, `slug`, `base_url`, `is_active`, `created_at`) VALUES
	(1, 'Tap.az', 'tapaz', 'https://tap.az', 1, '2025-10-21 09:50:24');
INSERT INTO `platforms` (`id`, `name`, `slug`, `base_url`, `is_active`, `created_at`) VALUES
	(2, 'Kontakt Home', 'kontakt', 'https://kontakt.az', 1, '2025-10-21 09:50:24');
INSERT INTO `platforms` (`id`, `name`, `slug`, `base_url`, `is_active`, `created_at`) VALUES
	(3, 'Irşad Electronics', 'irshad', 'https://irshad.az', 1, '2025-10-21 09:50:24');
INSERT INTO `platforms` (`id`, `name`, `slug`, `base_url`, `is_active`, `created_at`) VALUES
	(4, 'Lalafo', 'lalafo', 'https://lalafo.az', 1, '2025-10-21 09:50:24');

-- Dumping structure for table notifo.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `platform_id` int(10) unsigned NOT NULL,
  `platform_listing_id` varchar(255) NOT NULL,
  `title` varchar(512) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'AZN',
  `url` varchar(1024) NOT NULL,
  `image_url` varchar(1024) DEFAULT NULL,
  `extra_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra_info`)),
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `is_notifo` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_platform_listing` (`platform_id`,`platform_listing_id`),
  KEY `idx_platform` (`platform_id`),
  KEY `idx_time` (`time`),
  KEY `idx_price` (`price`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table notifo.products: ~180 rows (approximately)
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(1, 1, '46042094', 'Apple iPhone 16 Pro Max Black Titanium 512GB/8GB', 2250.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46042094', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F28%2F13%2F01%2F19%2F8e154db9-629e-43c9-857a-b2106714d84c%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:38"}', '2025-11-01 15:38:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(2, 1, '45636895', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 2549.99, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45636895', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F05%2F02%2F31%2F01%2Fb0a22d9a-6c41-4b24-ad81-4b0404c0dda1%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:15"}', '2025-11-01 18:15:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(3, 1, '45989962', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1880.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45989962', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F21%2F18%2F35%2F21%2F02bd1188-b147-415a-a981-8776278c8ec2%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:35"}', '2025-11-01 10:35:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(4, 1, '45642078', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2549.99, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45642078', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F05%2F02%2F32%2F09%2F3011856c-18a4-4656-935b-e7a9e2aa1989%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:34"}', '2025-11-01 15:34:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(5, 1, '45798196', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1899.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45798196', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F27%2F20%2F52%2F35%2F5cee8bb3-b598-496d-b9be-64fbea2ed8cb%2F66008_-f1hpkebL9FYqnHCOa3oWQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:21"}', '2025-11-01 12:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(6, 1, '46075614', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2150.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46075614', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F17%2F10%2F08%2F2651c11a-79d2-4bf7-ace6-8c9fab55fc5a%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:13"}', '2025-11-01 17:13:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(7, 1, '45506620', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1999.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45506620', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F17%2F21%2F32%2F01%2F0f18bb7a-6931-4278-bc7c-335acd4156c8%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 01:57"}', '2025-11-01 01:57:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(8, 1, '46076628', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1750.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46076628', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F19%2F07%2F54%2F9c3989e9-ba3d-4062-99c0-95ec8110648d%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:21"}', '2025-11-01 19:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(9, 1, '46076642', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1999.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46076642', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F19%2F21%2F10%2F53b05f3d-c0d2-4aad-8c2b-abae9bf07305%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:21"}', '2025-11-01 19:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(10, 1, '45972215', 'Apple iPhone 4S White 8GB', 119.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45972215', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F19%2F16%2F11%2F38%2Fe0c46836-3a1d-4dbf-8b7f-34ec9dfeea14%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:17"}', '2025-11-01 19:17:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(11, 1, '46046448', 'Apple iPhone 15 Pro Max Natural Titanium 512GB/8GB', 1540.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46046448', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F28%2F21%2F22%2F06%2Ffbe6ccc8-7555-4483-9359-d6dcf3530c9f%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:16"}', '2025-11-01 19:16:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(12, 1, '45836483', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2050.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45836483', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F02%2F18%2F16%2F03%2F599e49f1-47af-4804-81bc-6782fa4024f6%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:15"}', '2025-11-01 19:15:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(13, 1, '45961857', 'Apple iPhone 16 Pink 128GB/8GB', 1669.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45961857', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F18%2F12%2F03%2F11%2Fe266e603-84c1-4763-b242-8827fdf15107%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:07"}', '2025-11-01 19:07:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(14, 1, '45649381', 'Apple iPhone 16 Pro Desert Titanium 128GB/8GB', 2239.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45649381', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F09%2F11%2F54%2F26%2F3368d658-031e-4371-b5eb-e6fd3bb646a1%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:07"}', '2025-11-01 19:07:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(15, 1, '46004005', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1950.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46004005', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F23%2F14%2F48%2F42%2F5db82a0d-8005-4653-a86c-5ad81f8134dc%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:07"}', '2025-11-01 19:07:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(16, 1, '43517212', '"Apple iPhone 16 Pro Max" üçün arxalıq', 25.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/43517212', 'https://tap.azstatic.com/uploads/medium/2025%2F01%2F02%2F00%2F15%2F05%2F1d063a8f-a2a8-458f-960c-2a116793e3b3%2F15247_eRuz4Do5pS0g3SY6jF6RZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:05"}', '2025-11-01 19:05:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(17, 1, '46056328', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 2499.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46056328', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F10%2F39%2F11%2Faf596139-7e75-47b8-84e4-02e0bef7d5ca%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:03"}', '2025-11-01 19:03:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(18, 1, '46056250', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2049.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46056250', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F10%2F30%2F10%2F7cf403c1-ce9d-4575-8bef-ac802eb8e58b%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:03"}', '2025-11-01 19:03:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(19, 1, '46056234', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46056234', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F10%2F27%2F51%2F8941f27d-4a6e-4207-9972-e6ca730a058a%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:03"}', '2025-11-01 19:03:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(20, 1, '46056184', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1799.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46056184', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F10%2F21%2F46%2F17bdc271-6be6-4524-bfef-091edd3bc336%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:03"}', '2025-11-01 19:03:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(21, 1, '46056172', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 2099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46056172', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F10%2F19%2F38%2F60ab03f8-79ca-474b-afc8-696c00d3ae9a%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:03"}', '2025-11-01 19:03:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(22, 1, '45915848', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 1799.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45915848', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F12%2F16%2F56%2F41%2F8eba353e-1053-4df1-849d-11b407220305%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 19:00"}', '2025-11-01 19:00:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(23, 1, '44200894', 'Apple iPhone 16 Pro Max Black Titanium 512GB/8GB', 3229.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44200894', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F19%2F01%2F58%2F01%2F1baf0f3c-203b-4cad-8ced-09f1fc3fefe1%2F66008_-f1hpkebL9FYqnHCOa3oWQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:57"}', '2025-11-01 18:57:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(24, 1, '44200780', 'Apple iPhone 16 Pro Black Titanium 512GB/8GB', 3049.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44200780', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F19%2F01%2F56%2F45%2F008549e5-36a2-4fcb-8d99-3008ee6553b9%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:57"}', '2025-11-01 18:57:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(25, 1, '45933342', 'Apple iPhone 16 Pro Max White Titanium 256GB/8GB', 1999.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45933342', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F15%2F14%2F49%2Fcb57762b-eecb-44e8-82cc-e802a6b9a5eb%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:56"}', '2025-11-01 18:56:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(26, 1, '45090179', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 1920.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45090179', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F02%2F15%2F32%2F15%2Ff16f6d6b-23e9-41b6-94a9-c057c4e54b8c%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:56"}', '2025-11-01 18:56:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(27, 1, '46021775', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 1999.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46021775', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F25%2F20%2F02%2F41%2Fb1072263-3a64-40b3-85d0-7762e5f0db83%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:51"}', '2025-11-01 18:51:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(28, 1, '45311622', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 1899.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45311622', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F29%2F16%2F03%2F59%2F2d86c291-1f33-4c1f-b357-17040b4b7678%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:49"}', '2025-11-01 18:49:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(29, 1, '45887489', 'Apple iPhone 17 Pro Cosmic Orange 256GB/12GB', 2899.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45887489', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F09%2F01%2F47%2F23%2F89189c51-0c94-4741-ae86-06a59e5cd19d%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:48"}', '2025-11-01 18:48:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(30, 1, '46000693', 'Apple iPhone 17 Pro Silver 256GB/12GB', 2900.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46000693', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F23%2F01%2F20%2F22%2F695b5734-7f34-4bd3-929b-e0b3ede21c04%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:48"}', '2025-11-01 18:48:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(31, 1, '45799660', 'Apple iPhone 17 Pro Deep Blue 256GB/12GB', 2899.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45799660', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F28%2F00%2F20%2F15%2F574f11ea-e0d7-44c5-8c7d-42fbfe244edf%2F4513_SdFmiiX51JZHxZnCDO0xMg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:48"}', '2025-11-01 18:48:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(32, 1, '46000703', 'Apple iPhone 17 Pro Max Silver 256GB/12GB', 3250.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46000703', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F23%2F01%2F21%2F11%2F23fcbf4c-f981-4fdc-bc12-6022a4190e5f%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:46"}', '2025-11-01 18:46:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(33, 1, '45799664', 'Apple iPhone 17 Pro Max Deep Blue 256GB/12GB', 3250.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45799664', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F28%2F00%2F21%2F16%2F23e8d97c-89e0-4f94-97e8-cdb79d1404f5%2F4513_SdFmiiX51JZHxZnCDO0xMg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:45"}', '2025-11-01 18:45:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(34, 1, '45887492', 'Apple iPhone 17 Pro Max Cosmic Orange 256GB/12GB', 3250.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45887492', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F09%2F01%2F48%2F12%2Fac4e3bbd-fa98-49e5-a78f-cf4500f59812%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:45"}', '2025-11-01 18:45:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(35, 1, '46076319', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2050.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46076319', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F18%2F41%2F24%2F94fa7398-e63c-48e6-b139-9d02bdfae7f9%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:42"}', '2025-11-01 18:42:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(36, 1, '45838971', 'Apple iPhone Air Space Black 256GB/8GB', 2150.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45838971', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F03%2F00%2F29%2F08%2Feab5d8de-58f8-46a2-a1ac-a4caf6ef59bd%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:42"}', '2025-11-01 18:42:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(37, 1, '46040632', 'Asus Rog Strix', 1950.00, 'AZN', 'https://tap.az/elanlar/elektronika/noutbuklar/46040632', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F28%2F10%2F34%2F17%2Fd8b24fb0-09fd-479b-b479-8ea5266b8462%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:41"}', '2025-11-01 18:41:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(38, 1, '44295193', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1749.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44295193', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F22%2F14%2F41%2F23%2F6f1c5374-f2ee-4707-bc3c-1867b218dcc6%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:39"}', '2025-11-01 18:39:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(39, 1, '45936216', 'Vivo X200 Pro Cosmos Black 256GB/12GB', 2200.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45936216', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F15%2F03%2F10%2F53%2F599bc3c2-30b9-465b-acd6-a0fa8d33dc33%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:30"}', '2025-11-01 18:30:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(40, 1, '46076148', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1799.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46076148', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F18%2F15%2F30%2F7f7d9afa-d672-4216-a982-0f5a0defe66f%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:25"}', '2025-11-01 18:25:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(41, 1, '45924111', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2060.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45924111', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F13%2F16%2F53%2F08%2F13e48ac1-2fac-4f64-b8c4-fe72396dddae%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:24"}', '2025-11-01 18:24:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(42, 1, '46076180', 'Apple iPhone 16 Pro Max White Titanium 256GB/8GB', 2200.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46076180', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F18%2F19%2F26%2Fb9a95207-c29f-458e-97d9-607d178e91a1%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"sumqayıt","raw_created":"sumqayıt, bugün, 18:22"}', '2025-11-01 18:22:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(43, 1, '46076113', 'Apple iPhone 16 Pro Max White Titanium 256GB/8GB', 2200.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46076113', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F18%2F17%2F59%2Fa0d557d9-e202-4c31-abc6-8270b0f571ee%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"sumqayıt","raw_created":"sumqayıt, bugün, 18:18"}', '2025-11-01 18:18:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(44, 1, '42642651', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 3199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42642651', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F14%2F02%2F09%2Fac559446-c9bb-4085-9ed2-e6ab6b461a1b%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:15"}', '2025-11-01 18:15:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(45, 1, '42642627', 'Apple iPhone 16 Pro Max Black Titanium 512GB/8GB', 3199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42642627', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F14%2F00%2F39%2F33efa476-48f3-457b-af7f-886e23a7c175%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:15"}', '2025-11-01 18:15:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(46, 1, '42589839', 'Apple iPhone 16 Pro Black Titanium 128GB/8GB', 2199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42589839', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F15%2F01%2F01%2F09%2F053aac45-dce5-4b47-94de-ccd38567639b%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:15"}', '2025-11-01 18:15:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(47, 1, '42589821', 'Apple iPhone 16 White 128GB/8GB', 1629.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42589821', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F15%2F00%2F58%2F51%2Ff8b2e706-326d-4159-84d2-887602a014e6%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:15"}', '2025-11-01 18:15:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(48, 1, '42641412', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 2550.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42641412', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F12%2F16%2F21%2F3f2ca15e-3874-4197-9e11-097451b11e46%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:13"}', '2025-11-01 18:13:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(49, 1, '42641385', 'Apple iPhone 16 Pro Natural Titanium 256GB/8GB', 2439.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42641385', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F12%2F14%2F33%2F3ea05f99-15e6-4388-9347-d6b269974c67%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:13"}', '2025-11-01 18:13:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(50, 1, '42641381', 'Apple iPhone 16 Pro Natural Titanium 128GB/8GB', 2139.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42641381', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F12%2F14%2F03%2F41d8e5dd-a324-4277-b911-767ff537aaff%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:13"}', '2025-11-01 18:13:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(51, 1, '45998624', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2000.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45998624', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F22%2F19%2F32%2F25%2Fd64bd308-48da-48a3-b55f-da80eb4fe931%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 18:08"}', '2025-11-01 18:08:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(52, 1, '46075809', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1950.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46075809', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F17%2F34%2F16%2Fc6481a1e-24f2-4ecd-957e-029cba2cc419%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:38"}', '2025-11-01 17:38:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(53, 1, '46067084', 'Apple iPhone 16 Pro Black Titanium 128GB/8GB', 2219.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46067084', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F31%2F14%2F51%2F14%2F16100844-33eb-4cea-9c5c-c705a33a1d7a%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:32"}', '2025-11-01 17:32:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(54, 1, '46067073', 'Apple iPhone 16 Pro Desert Titanium 128GB/8GB', 2219.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46067073', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F31%2F14%2F50%2F13%2Fa0987078-6f30-4e0e-a810-2c4dc8661b01%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:32"}', '2025-11-01 17:32:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(55, 1, '46013125', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 2999.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46013125', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F24%2F17%2F27%2F47%2F40b8b61f-0dae-4382-b77a-4b73c494eb7c%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:31"}', '2025-11-01 17:31:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(56, 1, '45820212', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45820212', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F30%2F16%2F59%2F41%2F49e24ec0-a09f-4c63-a8e7-4c30e971796b%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:29"}', '2025-11-01 17:29:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(57, 1, '43664339', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2699.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/43664339', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F17%2F12%2F51%2F51%2F42317521-3fea-4671-a8ee-5544b43b03f8%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:26"}', '2025-11-01 17:26:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(58, 1, '42818537', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2579.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42818537', 'https://tap.azstatic.com/uploads/medium/2025%2F08%2F02%2F14%2F59%2F20%2F72d46b59-b3be-4472-9059-9da2c8fde4c7%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:09"}', '2025-11-01 17:09:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(59, 1, '46047928', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2500.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46047928', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F29%2F00%2F56%2F01%2F0abe550d-dbee-45b4-8d98-1c39765221d5%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 17:09"}', '2025-11-01 17:09:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(60, 1, '45979742', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 2000.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45979742', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F20%2F14%2F50%2F16%2Ff8d369fc-8766-4d2f-9170-a5e02a778c87%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:51"}', '2025-11-01 16:51:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(61, 1, '45822693', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2400.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45822693', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F30%2F22%2F06%2F33%2F53680eee-c404-4096-a2c8-ecc31c8973b3%2F4513_SdFmiiX51JZHxZnCDO0xMg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:42"}', '2025-11-01 16:42:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(62, 1, '46061322', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1980.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46061322', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F19%2F10%2F37%2F67f4038b-8914-441d-964e-80d2728727d2%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:41"}', '2025-11-01 16:41:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(63, 1, '42720495', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2699.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42720495', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F30%2F16%2F22%2F47%2Ff52189b6-7e14-46e9-ba62-3627d313d6d1%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:36"}', '2025-11-01 16:36:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(64, 1, '46075298', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1899.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46075298', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F16%2F31%2F13%2Fb2dfaae9-cca0-4821-a0a7-26e7f36f5503%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:35"}', '2025-11-01 16:35:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(65, 1, '45814089', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45814089', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F29%2F20%2F10%2F12%2F6d2018d0-3bbf-438f-9ebc-0a49a530f920%2F4513_SdFmiiX51JZHxZnCDO0xMg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:32"}', '2025-11-01 16:32:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(66, 1, '42966161', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2699.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42966161', 'https://tap.azstatic.com/uploads/medium/2024%2F10%2F29%2F14%2F37%2F02%2F45036d22-3a4b-44a7-99cf-2a21216aa714%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:25"}', '2025-11-01 16:25:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(67, 1, '45864755', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2149.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45864755', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F06%2F12%2F16%2F29%2Ff2f71c4d-eca6-4b23-8702-d468ff5aadd0%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:24"}', '2025-11-01 16:24:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(68, 1, '42966170', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 2699.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42966170', 'https://tap.azstatic.com/uploads/medium/2024%2F10%2F29%2F14%2F41%2F01%2F91c0f646-17a8-4480-b830-8d10cbab8ee4%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:22"}', '2025-11-01 16:22:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(69, 1, '45926105', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45926105', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F13%2F21%2F02%2F54%2Fd526d041-88f8-4798-850c-0a2edcb8fa46%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:21"}', '2025-11-01 16:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(70, 1, '45908555', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45908555', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F11%2F17%2F58%2F03%2F50728c91-f474-4a26-aeb3-125b16a932c5%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:20"}', '2025-11-01 16:20:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(71, 1, '46075152', 'Apple iPhone 16 Pro Max Black Titanium 512GB/8GB', 2449.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46075152', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F16%2F17%2F18%2Fe2cb9789-bfd6-49c7-97f2-ef50c5532ab9%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:19"}', '2025-11-01 16:19:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(72, 1, '45919667', 'Apple iPhone 16 Pro Max White Titanium 256GB/8GB', 2000.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45919667', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F13%2F07%2F32%2F25%2F89314636-8514-4a26-94e8-78b8a2d30258%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:18"}', '2025-11-01 16:18:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(73, 1, '45862828', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2100.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45862828', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F06%2F02%2F28%2F02%2F075b6c86-5dc9-4434-a19f-a70591fe062b%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:15"}', '2025-11-01 16:15:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(74, 1, '45948637', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45948637', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F16%2F16%2F33%2F49%2F37b20585-eaf6-4f4d-adc3-2d9eeccac0e7%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:13"}', '2025-11-01 16:13:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(75, 1, '46075107', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2000.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46075107', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F16%2F09%2F02%2F6e86d5c3-04c4-486a-b841-7ff0f5d7bbd2%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:12"}', '2025-11-01 16:12:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(76, 1, '46017173', 'Apple iPhone 16 Pro Max Black Titanium 512GB/8GB', 2399.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46017173', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F25%2F11%2F00%2F31%2F4b31632a-2f1a-40ec-948c-96f96b7862e3%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:12"}', '2025-11-01 16:12:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(77, 1, '46075033', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2100.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46075033', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F16%2F03%2F16%2F79be8038-1fac-495d-a71b-70764758b26f%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:06"}', '2025-11-01 16:06:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(78, 1, '44581795', 'Apple iPhone 15 Pro Max Black Titanium 256GB/8GB', 1550.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44581795', 'https://tap.azstatic.com/uploads/medium/2025%2F05%2F02%2F12%2F30%2F46%2F7eefc579-1b84-447a-afa7-31c3893502f2%2F90941_pEdzVXN_qIkjJHk8mVJfRA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 16:05"}', '2025-11-01 16:05:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(79, 1, '46047555', 'Xiaomi 14 Ultra Black 512GB/16GB', 1900.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46047555', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F28%2F23%2F41%2F50%2Fc2ee7cc4-19e2-474f-b0ee-d583e68fab9a%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:49"}', '2025-11-01 15:49:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(80, 1, '46074828', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 1950.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46074828', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F15%2F39%2F09%2F5f552e24-e9a3-483f-b5d8-e32583bdc796%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:56"}', '2025-11-01 15:56:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(81, 1, '46031642', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2100.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46031642', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F27%2F01%2F37%2F00%2F17467dfc-1a8f-4faf-8270-18d36b74f3d6%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:16"}', '2025-11-01 15:16:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(82, 1, '46003414', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1849.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46003414', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F23%2F13%2F49%2F52%2Fa303cf7e-fba6-4a24-a46f-37ee6c405143%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:10"}', '2025-11-01 15:10:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(83, 1, '45810934', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 2100.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45810934', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F29%2F14%2F04%2F48%2Fff30f701-7fb5-4bed-84d9-9d89b0e1bf65%2F66008_-f1hpkebL9FYqnHCOa3oWQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:10"}', '2025-11-01 15:10:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(84, 1, '44463030', 'Apple iPhone 16 Pro Natural Titanium 256GB/8GB', 2599.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44463030', 'https://tap.azstatic.com/uploads/medium/2025%2F04%2F18%2F13%2F15%2F09%2F0182d05b-9d03-462f-8b52-25ed9ffd8ba6%2F90941_pEdzVXN_qIkjJHk8mVJfRA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:06"}', '2025-11-01 15:06:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(85, 1, '46073895', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1800.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46073895', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F13%2F57%2F01%2Fa1cacd2b-9269-4589-9ff4-0307bdd3695c%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:05"}', '2025-11-01 15:05:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(86, 1, '42653852', 'Apple iPhone 16 Pro White Titanium 128GB/8GB', 2219.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42653852', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F31%2F17%2F6752d2f5-f44e-4cbb-b4ac-e9b7409e3e55%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(87, 1, '43180599', 'Apple iPhone 16 Ultramarine 128GB/8GB', 1649.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/43180599', 'https://tap.azstatic.com/uploads/medium/2024%2F11%2F22%2F19%2F55%2F32%2F1b92d252-31c3-4afe-a963-5a0649086b67%2F15247_eRuz4Do5pS0g3SY6jF6RZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(88, 1, '42653933', 'Apple iPhone 16 Pro Natural Titanium 256GB/8GB', 2569.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42653933', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F33%2F59%2F7d7c96fa-1cfe-4756-a607-b6795d033265%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(89, 1, '42653928', 'Apple iPhone 16 Pro Desert Titanium 256GB/8GB', 2569.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42653928', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F38%2F37%2F0cec1b9a-e59a-4bcd-bb64-46252c28fe16%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(90, 1, '42653924', 'Apple iPhone 16 Pro White Titanium 256GB/8GB', 2569.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42653924', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F37%2F37%2F507d4746-f6a8-412e-bca8-d7decd2fa2c8%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(91, 1, '42653918', 'Apple iPhone 16 Pro Black Titanium 256GB/8GB', 2569.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42653918', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F36%2F36%2F4fbd8d5d-21f7-4d47-ae18-d21b3046001b%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(92, 1, '42653869', 'Apple iPhone 16 Pro Natural Titanium 128GB/8GB', 2219.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42653869', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F26%2F47%2F04d53db4-4cf2-4237-966e-c42846f5e3ab%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(93, 1, '42654158', 'Apple iPhone 16 Pro Desert Titanium 1TB/8GB', 3299.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654158', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F15%2F14%2F22%2Fa81dd36f-b857-41fe-b37e-043edb44932d%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(94, 1, '42653983', 'Apple iPhone 16 Pro Desert Titanium 512GB/8GB', 3099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42653983', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F55%2F09%2Fa8e491f8-04d2-484c-9ddb-cfb3cd6a99ef%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:02"}', '2025-11-01 15:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(95, 1, '42654025', 'Apple iPhone 16 Pro White Titanium 512GB/8GB', 3099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654025', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F56%2F40%2Fba1280cc-6dd9-49c2-8be4-e62c5e4a5985%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(96, 1, '42654185', 'Apple iPhone 16 Pro White Titanium 1TB/8GB', 3299.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654185', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F15%2F00%2F06%2F0be8c8a1-e7c9-47db-aa7c-c255618f3ee0%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(97, 1, '42654189', 'Apple iPhone 16 Pro Black Titanium 1TB/8GB', 3299.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654189', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F15%2F01%2F13%2F9db4cd28-4615-4634-9d9f-1684ea6443d5%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(98, 1, '42654392', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 2719.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654392', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F16%2F34%2F39%2F4bd159f7-881b-49c6-b2dc-dd4439ccd535%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(99, 1, '42654383', 'Apple iPhone 16 Pro Max White Titanium 256GB/8GB', 2719.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654383', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F16%2F22%2F21%2Fb1bd7bea-cdf2-43fc-b93d-69b1b785c8b8%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(100, 1, '43180536', 'Apple iPhone 16 White 128GB/8GB', 1649.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/43180536', 'https://tap.azstatic.com/uploads/medium/2024%2F11%2F22%2F19%2F49%2F11%2Fd2d6451c-22e6-485e-966e-32bce79830bd%2F15247_eRuz4Do5pS0g3SY6jF6RZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(101, 1, '42654375', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2719.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654375', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F16%2F20%2F35%2F74544155-66d7-489a-89b3-f2119db3bf1f%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(102, 1, '42654172', 'Apple iPhone 16 Pro Natural Titanium 1TB/8GB', 3299.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654172', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F15%2F07%2F41%2Fab815a6e-c524-49b3-98f4-ef2a4dd458da%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(103, 1, '42654411', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 3149.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654411', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F28%2F17%2F45%2F40%2F9c9b27eb-cb42-40fb-9193-145be514e9e5%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(104, 1, '42654440', 'Apple iPhone 16 Pro Max Black Titanium 512GB/8GB', 3149.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654440', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F28%2F17%2F46%2F46%2F2301af94-60f8-44d1-9818-69d3bfef041c%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(105, 1, '42654465', 'Apple iPhone 16 Pro Max Natural Titanium 512GB/8GB', 3149.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654465', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F28%2F17%2F49%2F25%2Ff0d1c5d2-9bb5-4584-85b0-fe05254d48a9%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(106, 1, '42654451', 'Apple iPhone 16 Pro Max White Titanium 512GB/8GB', 3149.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654451', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F28%2F17%2F48%2F05%2F706cadcd-1fb9-4cad-8b69-9073eac0bf40%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(107, 1, '42654517', 'Apple iPhone 16 Pro Max Black Titanium 1TB/8GB', 3499.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654517', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F28%2F17%2F58%2F29%2F24a9deb6-c86e-4e7e-91a8-d830fb62cbe8%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(108, 1, '42654531', 'Apple iPhone 16 Pro Max Natural Titanium 1TB/8GB', 3499.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654531', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F28%2F17%2F59%2F08%2Fd30f7d06-daa9-459a-8c52-81f239f74517%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(109, 1, '42654520', 'Apple iPhone 16 Pro Max White Titanium 1TB/8GB', 3499.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654520', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F28%2F17%2F56%2F32%2F961ee33e-6885-435b-87b6-c95cab8b125e%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:01"}', '2025-11-01 15:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(110, 1, '42654499', 'Apple iPhone 16 Pro Max Desert Titanium 1TB/8GB', 3499.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654499', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F28%2F17%2F57%2F15%2F84151994-d842-441e-a0bd-30c44336f816%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 15:00"}', '2025-11-01 15:00:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(111, 1, '46074396', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1999.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46074396', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F14%2F53%2F24%2F48c8b556-82d8-412e-8c44-0c229d94be14%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:54"}', '2025-11-01 14:54:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(112, 1, '46067016', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1849.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46067016', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F31%2F14%2F43%2F17%2F066c2631-8623-4f00-8002-c66622d38737%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:44"}', '2025-11-01 14:44:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(113, 1, '42653992', 'Apple iPhone 16 Pro Natural Titanium 512GB/8GB', 3099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42653992', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F55%2F51%2Fb4f4255d-8f75-420b-9b37-179aefcfcc16%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:41"}', '2025-11-01 14:41:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(114, 1, '42654087', 'Apple iPhone 16 Pro Black Titanium 512GB/8GB', 3099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42654087', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F25%2F14%2F58%2F06%2Fd78fd08b-a042-4b53-a08c-cd6f9e469105%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:41"}', '2025-11-01 14:41:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(115, 1, '46074229', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 1799.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46074229', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F14%2F36%2F05%2F360a3856-98bc-4336-a3c2-d1adcb3ee883%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:38"}', '2025-11-01 14:38:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(116, 1, '46074194', 'Apple iPhone 16 Pro Max Black Titanium 512GB/8GB', 2250.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46074194', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F14%2F32%2F14%2Fea0e8ffc-9473-47d6-868f-027a842562fd%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:34"}', '2025-11-01 14:34:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(117, 1, '44100954', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2639.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44100954', 'https://tap.azstatic.com/uploads/medium/2025%2F03%2F08%2F00%2F32%2F52%2Ff04087b4-afee-4c26-af8d-9c709af5a5ea%2F83603_NnVipO7k_8o2mR0vhpmgbA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:29"}', '2025-11-01 14:29:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(118, 1, '43180556', 'Apple iPhone 16 Teal 128GB/8GB', 1599.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/43180556', 'https://tap.azstatic.com/uploads/medium/2024%2F11%2F22%2F19%2F50%2F51%2F6def82f5-531e-4e6b-87c0-fb95d4015054%2F67900_VsfyEqu9G0cxtdUTwCN1tQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:15"}', '2025-11-01 14:15:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(119, 1, '42642924', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 3139.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42642924', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F14%2F27%2F19%2Ff53d564e-19a2-46dd-8897-27883efc4fc8%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:11"}', '2025-11-01 14:11:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(120, 1, '42642899', 'Apple iPhone 16 Pro Desert Titanium 256GB/8GB', 2439.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42642899', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F14%2F24%2F42%2F31d5ceac-a2e0-4a6b-b842-c507b473989b%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:11"}', '2025-11-01 14:11:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(121, 1, '42642897', 'Apple iPhone 16 Pro Desert Titanium 128GB/8GB', 2139.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42642897', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F14%2F24%2F13%2F043bfd62-9c5b-43fd-929c-503a8df89476%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:11"}', '2025-11-01 14:11:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(122, 1, '42641375', 'Apple iPhone 16 Pink 128GB/8GB', 1589.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42641375', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F12%2F13%2F05%2F0ebc9eb2-697b-4e5f-b849-186bbd6c8cbc%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:11"}', '2025-11-01 14:11:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(123, 1, '46005858', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2050.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46005858', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F23%2F18%2F12%2F51%2F7d4b1e1f-97b8-45e0-9265-1353374dc930%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:07"}', '2025-11-01 14:07:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(124, 1, '45644743', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2149.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45644743', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F08%2F17%2F59%2F45%2Feef8bd13-a1b3-4b24-aacf-8ca767c9267d%2F66008_-f1hpkebL9FYqnHCOa3oWQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:02"}', '2025-11-01 14:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(125, 1, '44039352', '"Apple iPhone" ekranları', 110.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44039352', 'https://tap.azstatic.com/uploads/medium/2025%2F02%2F28%2F19%2F00%2F32%2F12e6800a-f470-411d-b6ae-250da42b5326%2F83603_NnVipO7k_8o2mR0vhpmgbA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 13:35"}', '2025-11-01 13:35:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(126, 1, '45027769', 'Çat ekranların təmiri', 20.00, 'AZN', 'https://tap.az/elanlar/xidmetler/texnika-temiri/45027769', 'https://tap.azstatic.com/uploads/medium/2025%2F06%2F24%2F14%2F24%2F46%2Fc334b3af-7587-47bf-9c46-773d138a31a0%2F4513_SdFmiiX51JZHxZnCDO0xMg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 13:34"}', '2025-11-01 13:34:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(127, 1, '45990572', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 2050.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45990572', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F21%2F19%2F48%2F38%2F2e44cf80-a9ee-4f1f-b515-0a70b2e6d69c%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:55"}', '2025-11-01 12:55:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(128, 1, '45920966', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2050.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45920966', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F27%2F11%2F39%2F45%2Fd42c216d-40fc-4831-bc2c-88fdd1e12e1d%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:55"}', '2025-11-01 12:55:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(129, 1, '42820505', 'Apple iPhone 16 Pro Desert Titanium 128GB/8GB', 2159.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42820505', 'https://tap.azstatic.com/uploads/medium/2024%2F10%2F12%2F11%2F11%2F41%2Fe5273f3a-ee26-4687-98ba-553b3a539856%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:55"}', '2025-11-01 12:55:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(130, 1, '46004509', '"Apple iPhone" adapteri və kabeli', 34.99, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46004509', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F23%2F15%2F37%2F11%2F0a3b1823-d216-4c0e-be05-a7d0e2197cee%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:38"}', '2025-11-01 12:38:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(131, 1, '46013344', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2629.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46013344', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F24%2F17%2F57%2F43%2Ff9111534-b77b-41a1-b719-6b8c8c856c0f%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:38"}', '2025-11-01 12:38:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(132, 1, '45868932', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1750.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45868932', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F24%2F18%2F50%2F28%2Fb5fc720d-dd5c-45eb-82c8-eecc13d4338c%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:37"}', '2025-11-01 12:37:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(133, 1, '46002718', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 2060.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46002718', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F23%2F12%2F32%2F18%2F834a157c-3748-4be7-8937-14a1d606286b%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:34"}', '2025-11-01 12:34:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(134, 1, '46057578', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2080.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46057578', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F12%2F41%2F46%2F6c5d5135-bfd3-4364-91c7-841d1779aa62%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:21"}', '2025-11-01 12:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(135, 1, '46073009', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1500.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46073009', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F12%2F15%2F38%2F31075a83-52a4-46f7-8f69-fcb71759d7bb%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:17"}', '2025-11-01 12:17:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(136, 1, '42939928', 'Apple iPhone 16 Pro Desert Titanium 128GB/8GB', 2225.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42939928', 'https://tap.azstatic.com/uploads/medium/2024%2F10%2F26%2F11%2F25%2F32%2F36a15a6a-de75-4725-9053-d2ab2fa318c0%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:16"}', '2025-11-01 12:16:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(137, 1, '44783443', 'Apple iPhone 16 Pro Max White Titanium 256GB/8GB', 2779.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44783443', 'https://tap.azstatic.com/uploads/medium/2025%2F05%2F25%2F11%2F45%2F03%2F77ea7b7f-8dcd-4305-a225-ce82a11a5141%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:14"}', '2025-11-01 12:14:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(138, 1, '45833397', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2060.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45833397', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F02%2F12%2F51%2F32%2F4e6a89a8-a553-49ab-9ea2-8268f2b1878e%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:13"}', '2025-11-01 12:13:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(139, 1, '42589844', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2639.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42589844', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F15%2F01%2F02%2F29%2F1fb4c1bb-3578-486b-9c66-818fb7e59233%2F11375_qXr7-N1ppBcS2a5TEaxWRQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:10"}', '2025-11-01 12:10:00', 1, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(140, 1, '46059768', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2150.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46059768', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F16%2F17%2F45%2Fbe9cf517-0a43-410d-8d77-5577765b9aad%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"qusar","raw_created":"qusar, bugün, 12:37"}', '2025-11-01 12:37:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(141, 1, '42640115', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2550.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42640115', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F10%2F10%2F49%2F138a4aca-924c-4714-acee-dfa0a2c223e4%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:05"}', '2025-11-01 12:05:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(142, 1, '42640099', 'Apple iPhone 16 Pro Black Titanium 128GB/8GB', 2139.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42640099', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F10%2F08%2F45%2F9fc4b468-282f-4e31-aefa-cbf631c8417f%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:05"}', '2025-11-01 12:05:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(143, 1, '46072824', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46072824', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F11%2F57%2F27%2Fe91f04d6-cf57-4a9b-9d87-64a919196c09%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 11:59"}', '2025-11-01 11:59:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(144, 1, '46046893', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1970.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46046893', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F28%2F22%2F18%2F23%2Fbb34e0f1-8fdc-4839-b74c-2a9ed54132ea%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 11:56"}', '2025-11-01 11:56:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(145, 1, '46072711', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1999.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46072711', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F11%2F42%2F34%2F8fcd582a-9ec1-4494-ac26-6047e9874b38%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 11:46"}', '2025-11-01 11:46:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(146, 1, '46072662', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 1700.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46072662', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F11%2F38%2F33%2Fcd113316-da38-4e13-8614-cc95a452d216%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 14:50"}', '2025-11-01 14:50:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(147, 1, '45624503', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 3199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45624503', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F06%2F08%2F00%2F01%2F00138fca-bdd0-41f5-8e2f-56a5d6159a5a%2F4513_SdFmiiX51JZHxZnCDO0xMg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 11:30"}', '2025-11-01 11:30:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(148, 1, '45985335', '"Apple iPhone 16 pro" type C kabel', 30.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45985335', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F21%2F10%2F19%2F11%2F410894ff-1afe-45a9-86dc-f8e91003219f%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 11:29"}', '2025-11-01 11:29:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(149, 1, '45753220', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2549.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45753220', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F22%2F11%2F29%2F06%2F62543e16-7c69-4993-900f-ca3ed1bbe791%2F4513_SdFmiiX51JZHxZnCDO0xMg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:28"}', '2025-11-01 12:28:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(150, 1, '45624495', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 2549.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45624495', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F06%2F07%2F53%2F51%2Fe6448065-ab2c-4981-ab95-29a0a152e10a%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:28"}', '2025-11-01 12:28:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(151, 1, '42636040', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2779.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42636040', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F20%2F17%2F08%2F37%2F0ce7e5b5-6b17-459c-aa89-bdc1a7170057%2F26954_DWgEQQqRrb1W5yDQKFgsVA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 11:26"}', '2025-11-01 11:26:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(152, 1, '45979588', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1820.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45979588', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F20%2F14%2F34%2F02%2F00bcefdd-b4b5-4e09-9f23-54b713df4d0e%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:19"}', '2025-11-01 12:19:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(153, 1, '44200720', 'Apple iPhone 16 Pro Desert Titanium 128GB/8GB', 2199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44200720', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F19%2F01%2F54%2F44%2F17e1ef5a-d261-4282-bb3b-94c8ddb65754%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:38"}', '2025-11-01 10:38:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(154, 1, '44200772', 'Apple iPhone 16 Pro Desert Titanium 256GB/8GB', 2579.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44200772', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F19%2F01%2F57%2F01%2F62c48066-7ca4-4d1b-aefa-4d81fb3d068e%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:36"}', '2025-11-01 10:36:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(155, 1, '44200877', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2749.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44200877', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F19%2F02%2F03%2F25%2F3e461cec-ca68-43af-bef9-06494a9ebad4%2F4513_SdFmiiX51JZHxZnCDO0xMg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:36"}', '2025-11-01 10:36:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(156, 1, '44200416', 'Apple iPhone 16 Pink 128GB/8GB', 1599.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44200416', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F19%2F02%2F08%2F09%2F3c457dec-9bc3-4604-a2de-9c92d62976c4%2F66008_-f1hpkebL9FYqnHCOa3oWQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:35"}', '2025-11-01 10:35:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(157, 1, '44200390', 'Apple iPhone 16 Ultramarine 128GB/8GB', 1599.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44200390', 'https://tap.azstatic.com/uploads/medium/2025%2F03%2F19%2F17%2F22%2F45%2F7b62f8c6-9249-4ead-ab9b-8cce4d2f901b%2F2746_FhBLeET6_RWLOHbwaKgtUw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:35"}', '2025-11-01 10:35:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(158, 1, '44200569', 'Apple iPhone 16 Ultramarine 128GB/8GB', 1599.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/44200569', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F19%2F01%2F59%2F27%2Ff914b7fb-b589-46d4-949c-511a655927a9%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:34"}', '2025-11-01 10:34:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(159, 1, '46072150', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2729.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46072150', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F10%2F26%2F01%2F542d8603-a742-4458-8c3e-343230dcec42%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:42"}', '2025-11-01 10:42:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(160, 1, '46003772', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1700.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46003772', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F23%2F14%2F22%2F39%2F14cdabc7-0408-4e1f-832c-f0a8dff4d19a%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 10:06"}', '2025-11-01 10:06:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(161, 1, '38298617', '"Apple iPhone" batareyaları', 20.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/38298617', 'https://tap.azstatic.com/uploads/medium/2023%2F06%2F26%2F13%2F15%2F56%2Fd6731a7b-b719-4b07-bd11-44ac7c4bef00%2F93736_LScBOfEmOOYc-v0Rgc4UdA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 09:53"}', '2025-11-01 09:53:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(162, 1, '39425821', 'Telefon ekranları', 1.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/39425821', 'https://tap.azstatic.com/uploads/medium/2023%2F10%2F17%2F18%2F20%2F57%2F33e3d58d-5696-4755-a8de-8fd78f6f3c00%2F3812_mTYyutwlYKXmj9HMCH9hhA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 09:53"}', '2025-11-01 09:53:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(163, 1, '37780648', '"Apple iPhone" ekranı', 30.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/37780648', 'https://tap.azstatic.com/uploads/medium/2023%2F05%2F28%2F12%2F22%2F37%2F3b1407bb-d787-4163-95b0-bba27f3e4031%2F77274_L-Ack9VmSWTM8X9rITrk_g.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 09:52"}', '2025-11-01 09:52:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(164, 1, '41888538', 'Telefon və planşetlərin təmiri', 5.00, 'AZN', 'https://tap.az/elanlar/xidmetler/texnika-temiri/41888538', 'https://tap.azstatic.com/uploads/medium/2024%2F06%2F27%2F13%2F26%2F11%2Fed431785-7906-4294-bd91-852288f7109c%2F12183_ogtQftp0VNM0b8HrfrDIcQ.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 09:51"}', '2025-11-01 09:51:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(165, 1, '40734200', '"Apple iPhone" arxa şüşəsi', 20.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/40734200', 'https://tap.azstatic.com/uploads/medium/2025%2F07%2F06%2F22%2F17%2F36%2F42d37658-0d87-4ba2-8920-a0c7d3829673%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 09:51"}', '2025-11-01 09:51:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(166, 1, '42642918', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2550.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42642918', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F14%2F26%2F34%2F79070b5c-714f-4ba4-b5ef-39bbe931257b%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 09:28"}', '2025-11-01 09:28:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(167, 1, '42640121', 'Apple iPhone 16 Pro Max Black Titanium 512GB/8GB', 3139.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/42640121', 'https://tap.azstatic.com/uploads/medium/2024%2F09%2F21%2F10%2F11%2F22%2F6acf78b9-c827-4e5f-93f9-83c475700b95%2F76402_Kt6M8xdUQ8mUvNPSzi54jw.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 09:28"}', '2025-11-01 09:28:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(168, 1, '45160774', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2050.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45160774', 'https://tap.azstatic.com/uploads/medium/2025%2F11%2F01%2F08%2F52%2F18%2F0eddbd0a-8a38-4e45-ab5c-a073a8f1d703%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 09:02"}', '2025-11-01 09:02:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(169, 1, '46041181', 'Apple iPhone 16 Pro Max Natural Titanium 512GB/8GB', 2100.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46041181', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F28%2F11%2F29%2F28%2Fb407d63f-7cd9-42ca-b996-19769933d7ac%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 05:21"}', '2025-11-01 05:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(170, 1, '46041170', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2049.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46041170', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F28%2F11%2F28%2F09%2F8ac92fd0-891a-43b9-b29b-5955b133b037%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 05:21"}', '2025-11-01 05:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(171, 1, '46013464', 'Apple iPhone 16 Pro Max Natural Titanium 256GB/8GB', 2249.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46013464', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F24%2F18%2F16%2F57%2F6fbe1d89-9f4a-4c31-9134-af8ed07c18b1%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 05:21"}', '2025-11-01 05:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(172, 1, '46009672', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2199.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46009672', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F24%2F10%2F59%2F20%2F9ddca558-6dbc-43d0-83b3-a366e823757b%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 05:21"}', '2025-11-01 05:21:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(173, 1, '45616216', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2549.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45616216', 'https://tap.azstatic.com/uploads/medium/2025%2F09%2F05%2F01%2F22%2F19%2F721c5fcb-cda4-43b8-8984-259d234c76e6%2F92313_wLbwyJGJi75X1LikQGRJwg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 12:28"}', '2025-11-01 12:28:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(174, 1, '45961476', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 2099.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45961476', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F18%2F11%2F14%2F55%2F1010aec0-473d-4698-aa42-2fc2bbb347e1%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 04:13"}', '2025-11-01 04:13:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(175, 1, '46012098', 'Apple iPhone 16 Pro Max Desert Titanium 512GB/8GB', 2299.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46012098', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F24%2F15%2F30%2F13%2F6016d544-74ea-44c7-96ba-8f38acf93a97%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 04:12"}', '2025-11-01 04:12:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(176, 1, '46062094', 'Apple iPhone 16 Pro Max Black Titanium 256GB/8GB', 2100.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46062094', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F30%2F20%2F57%2F54%2Fd4219005-d007-4c86-934a-4d34b06e0085%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 03:43"}', '2025-11-01 03:43:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(177, 1, '45973165', 'Apple iPhone 17 Pro Cosmic Orange 1TB/12GB', 4290.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45973165', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F19%2F18%2F07%2F09%2Fd38bbf93-6e14-4dfe-8e1d-e9581356043e%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 01:59"}', '2025-11-01 01:59:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(178, 1, '45973159', 'Apple iPhone 17 Pro Cosmic Orange 512GB/12GB', 3444.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/45973159', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F19%2F18%2F06%2F25%2F1fd5fb7b-276f-4f3e-b68a-caadb43c444f%2F37302_ksBAd98Yipnr_0BzNr1yHg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 01:59"}', '2025-11-01 01:59:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(179, 1, '46031197', 'Apple iPhone 16 Pro Max Desert Titanium 256GB/8GB', 1999.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46031197', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F26%2F23%2F56%2F25%2Fd969fda9-cc35-4ba4-ac11-e7ac55d0d491%2F13017_XQnsOqZNTk7pAJTxuXLkPA.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 00:01"}', '2025-11-01 00:01:00', 0, 122);
INSERT INTO `products` (`id`, `platform_id`, `platform_listing_id`, `title`, `price`, `currency`, `url`, `image_url`, `extra_info`, `time`, `is_notifo`, `category_id`) VALUES
	(180, 1, '46070771', 'Apple iPhone 13 Pro Max Gold 128GB/6GB', 600.00, 'AZN', 'https://tap.az/elanlar/elektronika/telefonlar/46070771', 'https://tap.azstatic.com/uploads/medium/2025%2F10%2F31%2F23%2F02%2F43%2Fce3c773c-0e9c-4643-8129-3d97c8901559%2F89649_IdiJWhN4F5E3SSESYyyqZg.jpg', '{"city":"bakı","raw_created":"bakı, bugün, 11:52"}', '2025-11-01 11:52:00', 0, 122);

-- Dumping structure for table notifo.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table notifo.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
	(7, 'Anar Orujov', 'anarorujov@gmail.com', '$2b$10$bG2L0xH8cpLY42msF/ANC.oKDkv2b8ZjLGFFTCbK4II7qSiq2oAE.', '2025-10-27 16:38:46');

-- Dumping structure for table notifo.user_platforms
CREATE TABLE IF NOT EXISTS `user_platforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `is_connected` tinyint(1) DEFAULT 1,
  `connected_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_platform` (`user_id`,`platform_id`),
  KEY `platform_id` (`platform_id`),
  CONSTRAINT `user_platforms_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_platforms_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table notifo.user_platforms: ~1 rows (approximately)
INSERT INTO `user_platforms` (`id`, `user_id`, `platform_id`, `auth_token`, `is_connected`, `connected_at`) VALUES
	(9, 7, 1, NULL, 1, '2025-10-27 16:39:15');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
