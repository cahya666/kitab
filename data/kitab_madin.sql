/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50512
Source Host           : localhost:3306
Source Database       : kitab_madin

Target Server Type    : MYSQL
Target Server Version : 50512
File Encoding         : 65001

Date: 2014-08-07 14:24:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbpaketkitab`
-- ----------------------------
DROP TABLE IF EXISTS `tbpaketkitab`;
CREATE TABLE `tbpaketkitab` (
  `idPaket` int(11) NOT NULL DEFAULT '0',
  `PID` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`idPaket`,`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbpaketkitab
-- ----------------------------
INSERT INTO `tbpaketkitab` VALUES ('11', '1-001');
INSERT INTO `tbpaketkitab` VALUES ('11', '1-002');
INSERT INTO `tbpaketkitab` VALUES ('11', '1-003');
INSERT INTO `tbpaketkitab` VALUES ('11', '1-004');
INSERT INTO `tbpaketkitab` VALUES ('11', '1-005');
INSERT INTO `tbpaketkitab` VALUES ('11', '1-006');
INSERT INTO `tbpaketkitab` VALUES ('21', '2-001');
INSERT INTO `tbpaketkitab` VALUES ('21', '2-002');
INSERT INTO `tbpaketkitab` VALUES ('21', '2-003');
INSERT INTO `tbpaketkitab` VALUES ('21', '2-004');
INSERT INTO `tbpaketkitab` VALUES ('21', '2-005');
INSERT INTO `tbpaketkitab` VALUES ('21', '2-006');
INSERT INTO `tbpaketkitab` VALUES ('31', '3-001');
INSERT INTO `tbpaketkitab` VALUES ('31', '3-002');
INSERT INTO `tbpaketkitab` VALUES ('31', '3-003');
INSERT INTO `tbpaketkitab` VALUES ('31', '3-004');
INSERT INTO `tbpaketkitab` VALUES ('31', '3-005');
INSERT INTO `tbpaketkitab` VALUES ('31', '3-006');
INSERT INTO `tbpaketkitab` VALUES ('31', '3-008');
INSERT INTO `tbpaketkitab` VALUES ('32', '3-001');
INSERT INTO `tbpaketkitab` VALUES ('32', '3-002');
INSERT INTO `tbpaketkitab` VALUES ('32', '3-003');
INSERT INTO `tbpaketkitab` VALUES ('32', '3-004');
INSERT INTO `tbpaketkitab` VALUES ('32', '3-005');
INSERT INTO `tbpaketkitab` VALUES ('32', '3-007');
INSERT INTO `tbpaketkitab` VALUES ('32', '3-008');
INSERT INTO `tbpaketkitab` VALUES ('41', '4-001');
INSERT INTO `tbpaketkitab` VALUES ('41', '4-002');
INSERT INTO `tbpaketkitab` VALUES ('41', '4-003');
INSERT INTO `tbpaketkitab` VALUES ('41', '4-005');
INSERT INTO `tbpaketkitab` VALUES ('41', '4-006');
INSERT INTO `tbpaketkitab` VALUES ('41', '4-007');
INSERT INTO `tbpaketkitab` VALUES ('42', '4-001');
INSERT INTO `tbpaketkitab` VALUES ('42', '4-002');
INSERT INTO `tbpaketkitab` VALUES ('42', '4-004');
INSERT INTO `tbpaketkitab` VALUES ('42', '4-005');
INSERT INTO `tbpaketkitab` VALUES ('42', '4-006');
INSERT INTO `tbpaketkitab` VALUES ('42', '4-007');
INSERT INTO `tbpaketkitab` VALUES ('51', '5-001');
INSERT INTO `tbpaketkitab` VALUES ('51', '5-002');
INSERT INTO `tbpaketkitab` VALUES ('51', '5-004');
INSERT INTO `tbpaketkitab` VALUES ('51', '5-005');
INSERT INTO `tbpaketkitab` VALUES ('51', '5-006');
INSERT INTO `tbpaketkitab` VALUES ('51', '5-007');
INSERT INTO `tbpaketkitab` VALUES ('52', '5-001');
INSERT INTO `tbpaketkitab` VALUES ('52', '5-003');
INSERT INTO `tbpaketkitab` VALUES ('52', '5-004');
INSERT INTO `tbpaketkitab` VALUES ('52', '5-005');
INSERT INTO `tbpaketkitab` VALUES ('52', '5-006');
INSERT INTO `tbpaketkitab` VALUES ('52', '5-007');
INSERT INTO `tbpaketkitab` VALUES ('61', '6-001');
INSERT INTO `tbpaketkitab` VALUES ('61', '6-002');
INSERT INTO `tbpaketkitab` VALUES ('61', '6-003');
INSERT INTO `tbpaketkitab` VALUES ('61', '6-004');
INSERT INTO `tbpaketkitab` VALUES ('71', '7-001');
INSERT INTO `tbpaketkitab` VALUES ('71', '7-002');
INSERT INTO `tbpaketkitab` VALUES ('71', '7-003');
INSERT INTO `tbpaketkitab` VALUES ('71', '7-004');
INSERT INTO `tbpaketkitab` VALUES ('71', '7-005');
INSERT INTO `tbpaketkitab` VALUES ('81', '8-001');
INSERT INTO `tbpaketkitab` VALUES ('81', '8-002');
INSERT INTO `tbpaketkitab` VALUES ('81', '8-003');
INSERT INTO `tbpaketkitab` VALUES ('91', '9-001');
INSERT INTO `tbpaketkitab` VALUES ('91', '9-002');
INSERT INTO `tbpaketkitab` VALUES ('91', '9-003');

-- ----------------------------
-- Table structure for `tb_jual_global`
-- ----------------------------
DROP TABLE IF EXISTS `tb_jual_global`;
CREATE TABLE `tb_jual_global` (
  `id_Trans` varchar(20) NOT NULL DEFAULT '',
  `Tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `NIS` varchar(20) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Trans`),
  KEY `ixNIS` (`NIS`) USING BTREE,
  CONSTRAINT `ixNIS` FOREIGN KEY (`NIS`) REFERENCES `tb_santri` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_jual_global
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_jual_rinci`
-- ----------------------------
DROP TABLE IF EXISTS `tb_jual_rinci`;
CREATE TABLE `tb_jual_rinci` (
  `id_Trans` varchar(20) NOT NULL DEFAULT '',
  `PID` varchar(10) NOT NULL DEFAULT '',
  `no` int(11) DEFAULT NULL,
  `HPP` int(11) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL,
  `Buy` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`id_Trans`,`PID`),
  KEY `ixPID` (`PID`) USING BTREE,
  CONSTRAINT `ixPID` FOREIGN KEY (`PID`) REFERENCES `tb_matpel` (`PID`) ON UPDATE CASCADE,
  CONSTRAINT `ixTrans` FOREIGN KEY (`id_Trans`) REFERENCES `tb_jual_global` (`id_Trans`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_jual_rinci
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_matpel`
-- ----------------------------
DROP TABLE IF EXISTS `tb_matpel`;
CREATE TABLE `tb_matpel` (
  `PID` varchar(10) NOT NULL,
  `MatPel` varchar(50) DEFAULT NULL,
  `HPP` int(11) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  `Barcode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_matpel
-- ----------------------------
INSERT INTO `tb_matpel` VALUES ('1-001', 'FIQIH (FASHOLATAN)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('1-002', 'QIRO’ATUL KUTUB (SAFINATUN NAJAH)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('1-003', 'AKHLAQ (BIRRUL WALIDAIKUM)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('1-004', 'HADITS (BUDI LUHUR)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('1-005', 'PEGO (ALA NGALAH)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('1-006', 'TAHSINUL KHOT(ALA NGALAH)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('2-001', 'NAHWU (NAHWU JAWAN)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('2-002', 'PEGON', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('2-003', 'AKHLAQ (MATLAB)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('2-004', 'TAUHID (SULAMUD DIYANAH)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('2-005', 'FIQIH (MABADIUL FIQHIYAH I)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('2-006', 'QIRO’ATUL KUTUB (SULAM TAUFIQ)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('3-001', 'MATAN AJURUMIYAH & NADHOM IMRITHI', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('3-002', 'IMLA’', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('3-003', 'BHS. ARAB (MADARIJ DURUSUL AROBIYAH I)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('3-004', 'TAJWID (TUHFATUL ATFAL)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('3-005', 'TAFSIR (IBRIZ I)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('3-006', 'AKHLAQ (AKHLAQUL BANIN I)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('3-007', 'AKHLAQ (AKHLAQUL BANAT I)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('3-008', 'FIQIH (MABADIUL FIQHIYAH III)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('4-001', 'NAHWU (AWAMILUL JURJAN)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('4-002', 'BHS. ARAB (MADARIJ DURUSUL AROBIYAH II)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('4-003', 'AKHLAQ (AKHLAQUL BANIN II)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('4-004', 'AKHLAQ (AKHLAQUL BANAT II)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('4-005', 'KHULASOH NURUL YAQIN II', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('4-006', 'TAJWID (MATAN JAZARIYAH)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('4-007', 'TAFSIR (IBRIZ II)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('5-001', 'NAHWU (DURROTUL YATIMAH)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('5-002', 'AKHLAQ (AKHLAQUL BANIN III)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('5-003', 'AKHLAQ (AKHLAQUL BANAT III)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('5-004', 'KHULASOH NURUL YAQIN 3', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('5-005', 'TAJWID (HIDAYATUL MUSTAFID)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('5-006', 'TAFSIR (IBRIZ III)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('5-007', 'HADITS (BULUGHUL MAROM)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('6-001', 'NAHWU (IMRITHI)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('6-002', 'HADITS (BULUGHUL MAROM)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('6-003', 'SHOROF (MAQSHUD)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('6-004', 'TAUHID (TIJANNUD DARORI)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('7-001', 'NAHWU (ALFIYAH IBNU MALIK I)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('7-002', 'QOWAIDUL I’ROB', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('7-003', 'ILMU HADITS (NADMUL BAIQUNI)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('7-004', 'TAUHID (FATHUL MAJID I)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('7-005', 'USHUL FIQIH (MABADI’UL AWALIYAH)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('8-001', 'NAHWU (ALFIYAH IBNU MALIK II)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('8-002', 'QOIDAH FIQHIYAH (AS-SULAM)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('8-003', 'TAUHID (FATHUL MAJID II)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('9-001', 'BALAGHOH (JAWAHIRUL MAKNUN)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('9-002', 'ILMU HADITS (MANHALUL LATIF)', null, null, null, '');
INSERT INTO `tb_matpel` VALUES ('9-003', 'ILMU FALAK (FATHUL ROUF)', null, null, null, '');

-- ----------------------------
-- Table structure for `tb_paket`
-- ----------------------------
DROP TABLE IF EXISTS `tb_paket`;
CREATE TABLE `tb_paket` (
  `_idPaket` int(11) NOT NULL,
  `Paket` varchar(20) DEFAULT NULL,
  `Barcode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`_idPaket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_paket
-- ----------------------------
INSERT INTO `tb_paket` VALUES ('11', '1 Putra/Putri', '11111111');
INSERT INTO `tb_paket` VALUES ('21', '2 Putra/Putri', '22221111');
INSERT INTO `tb_paket` VALUES ('31', '3 Putra', '33331111');
INSERT INTO `tb_paket` VALUES ('32', '3 Putri', '33332222');
INSERT INTO `tb_paket` VALUES ('41', '4 Putra', '44441111');
INSERT INTO `tb_paket` VALUES ('42', '4 Putri', '44442222');
INSERT INTO `tb_paket` VALUES ('51', '5 Putra', '55551111');
INSERT INTO `tb_paket` VALUES ('52', '5 Putri', '55552222');
INSERT INTO `tb_paket` VALUES ('61', '6 Putra/Putri', '66661111');
INSERT INTO `tb_paket` VALUES ('71', 'W I Putra/Putri', '77771111');
INSERT INTO `tb_paket` VALUES ('81', 'W II Putra/Putri', '88881111');
INSERT INTO `tb_paket` VALUES ('91', 'W III Putra/Putri', '99991111');

-- ----------------------------
-- Table structure for `tb_santri`
-- ----------------------------
DROP TABLE IF EXISTS `tb_santri`;
CREATE TABLE `tb_santri` (
  `NIS` varchar(20) NOT NULL DEFAULT '',
  `idPaket` int(11) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `KelasLama` varchar(15) DEFAULT NULL,
  `KelasBaru` varchar(15) DEFAULT NULL,
  `Kamar` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`NIS`),
  KEY `ixKelasSantri` (`idPaket`) USING BTREE,
  CONSTRAINT `fkSantriPaket` FOREIGN KEY (`idPaket`) REFERENCES `tb_paket` (`_idPaket`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_santri
-- ----------------------------
INSERT INTO `tb_santri` VALUES ('123', '31', 'sulastro', '2 A', '3 A', 'E 4');
INSERT INTO `tb_santri` VALUES ('321', '32', 'sunarmi', '2 F', '3 D', 'D 4');

-- ----------------------------
-- View structure for `vwpaketkitab`
-- ----------------------------
DROP VIEW IF EXISTS `vwpaketkitab`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwpaketkitab` AS select `tbpaketkitab`.`PID` AS `PID`,`tbpaketkitab`.`idPaket` AS `idPaket`,`tb_matpel`.`MatPel` AS `MatPel`,`tb_matpel`.`HPP` AS `HPP`,`tb_matpel`.`Harga` AS `Harga`,`tb_matpel`.`Stok` AS `Stok`,`tb_matpel`.`Barcode` AS `Barcode1`,`tb_paket`.`Paket` AS `Paket`,`tb_paket`.`Barcode` AS `Barcode2` from ((`tbpaketkitab` join `tb_paket` on((`tb_paket`.`_idPaket` = `tbpaketkitab`.`idPaket`))) join `tb_matpel` on((`tb_matpel`.`PID` = `tbpaketkitab`.`PID`))) ;

-- ----------------------------
-- View structure for `vw_santri`
-- ----------------------------
DROP VIEW IF EXISTS `vw_santri`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_santri` AS select `tb_paket`.`Paket` AS `Paket`,`tb_paket`.`Barcode` AS `Barcode`,`tb_santri`.`NIS` AS `NIS`,`tb_santri`.`idPaket` AS `idPaket`,`tb_santri`.`Nama` AS `Nama`,`tb_santri`.`KelasLama` AS `KelasLama`,`tb_santri`.`KelasBaru` AS `KelasBaru`,`tb_santri`.`Kamar` AS `Kamar` from (`tb_santri` join `tb_paket` on((`tb_paket`.`_idPaket` = `tb_santri`.`idPaket`))) ;
