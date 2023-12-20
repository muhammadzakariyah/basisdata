/*
SQLyog Ultimate v9.50 
MySQL - 5.5.5-10.1.16-MariaDB : Database - rumah_sakit
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rumah_sakit` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rumah_sakit`;

/*Table structure for table `dokter` */

DROP TABLE IF EXISTS `dokter`;

CREATE TABLE `dokter` (
  `kode_dokter` varchar(6) NOT NULL,
  `nama_dokter` varchar(50) DEFAULT NULL,
  `spesialis` varchar(30) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telpon` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`kode_dokter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dokter` */

insert  into `dokter`(`kode_dokter`,`nama_dokter`,`spesialis`,`alamat`,`telpon`) values ('D01','Muhammad Yusuf','Penyakit Dalam','Yogyakarta','089995345'),('D02','Taufik','Jantung','Sleman','082534533'),('D03','Ismail','Anak','Sleman','087823222'),('D04','Tuti Hartati','Umum','Solo','087234222');

/*Table structure for table `kamar` */

DROP TABLE IF EXISTS `kamar`;

CREATE TABLE `kamar` (
  `kode_kamar` varchar(6) NOT NULL,
  `nama_kamar` varchar(30) DEFAULT NULL,
  `kode_kelas` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`kode_kamar`),
  KEY `kode_kelas` (`kode_kelas`),
  CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas_kamar` (`kode_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kamar` */

insert  into `kamar`(`kode_kamar`,`nama_kamar`,`kode_kelas`) values ('K01','Melati 1','1'),('K02','Melati 2','1'),('K03','Melati 3','2'),('K04','Flamboyan 1','2'),('K05','Flamboyan 2','1'),('K06','Flamboyan 3','3'),('K07','Anggrek 1','4'),('K08','Anggrek 2','2'),('K09','Anggrek 3','3'),('K10','Anggrek 4','4'),('K11','Mawar 1','3'),('K12','Mawar 2','4'),('K13','Mawar 3','3');

/*Table structure for table `kelas_kamar` */

DROP TABLE IF EXISTS `kelas_kamar`;

CREATE TABLE `kelas_kamar` (
  `kode_kelas` varchar(3) NOT NULL,
  `kelas` varchar(10) DEFAULT NULL,
  `harga_permalam` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kelas_kamar` */

insert  into `kelas_kamar`(`kode_kelas`,`kelas`,`harga_permalam`) values ('1','VVIP',200000),('2','VIP',150000),('3','Standard',100000),('4','Ekonomi',50000);

/*Table structure for table `opname` */

DROP TABLE IF EXISTS `opname`;

CREATE TABLE `opname` (
  `kode_opname` int(6) NOT NULL AUTO_INCREMENT,
  `kode_pasien` varchar(6) DEFAULT NULL,
  `kode_dokter` varchar(6) DEFAULT NULL,
  `kode_kamar` varchar(6) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `sakit` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kode_opname`),
  KEY `kode_pasien` (`kode_pasien`),
  KEY `kode_dokter` (`kode_dokter`),
  KEY `kode_kamar` (`kode_kamar`),
  CONSTRAINT `opname_ibfk_1` FOREIGN KEY (`kode_pasien`) REFERENCES `pasien` (`kode_pasien`),
  CONSTRAINT `opname_ibfk_2` FOREIGN KEY (`kode_dokter`) REFERENCES `dokter` (`kode_dokter`),
  CONSTRAINT `opname_ibfk_3` FOREIGN KEY (`kode_kamar`) REFERENCES `kamar` (`kode_kamar`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `opname` */

insert  into `opname`(`kode_opname`,`kode_pasien`,`kode_dokter`,`kode_kamar`,`tanggal_masuk`,`tanggal_keluar`,`sakit`) values (1,'P01','D02','K01','2018-02-28','2018-03-09','Jantung'),(2,'P02','D03','K10','2018-03-03','2018-03-21','Hati'),(3,'P03','D02','K13','2018-03-01','2018-03-11','Jantung'),(4,'P04','D04','K07','2018-03-03','2018-03-14','Demam Berdarah'),(5,'P05','D01','K05','2018-03-03','2018-03-15','Liver'),(6,'P06','D04','K08','2018-03-03','2018-03-13','Demam'),(7,'P07','D03','K11','2018-03-03','2018-03-16','Pusing');

/*Table structure for table `pasien` */

DROP TABLE IF EXISTS `pasien`;

CREATE TABLE `pasien` (
  `kode_pasien` varchar(6) NOT NULL,
  `nama_pasien` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telpon` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`kode_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pasien` */

insert  into `pasien`(`kode_pasien`,`nama_pasien`,`alamat`,`telpon`) values ('P01','Beni','Wates','089923422'),('P02','Budi','Sleman','083453332'),('P03','Cepi','Gamping','085623429'),('P04','Citra','Gejayan','088543258'),('P05','Desi','Solo','089912341'),('P06','Feri','Klaten','089912332'),('P07','Rangga','Magelang','087672341');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
