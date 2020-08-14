/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2019-12-06 14:02:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activityId` int(12) NOT NULL auto_increment,
  `activityName` varchar(50) NOT NULL,
  `activityDes` varchar(500) NOT NULL,
  `discount` float default '1',
  `fullPrice` int(12) default NULL,
  `reducePrice` int(12) default NULL,
  `fullNum` int(12) default NULL,
  `reduceNum` int(12) default NULL,
  PRIMARY KEY  (`activityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO activity VALUES ('2', '全网活动', '限时减价', '1', '2000', '500', '5', '1');
INSERT INTO activity VALUES ('3', '全网活动', '限时减价', '1', '50', '10', '5', '1');
INSERT INTO activity VALUES ('4', '全网活动', '限时减价', '1', '50', '5', '5', '1');

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressID` int(12) NOT NULL auto_increment,
  `userId` int(12) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `detailAddr` varchar(50) NOT NULL,
  `conName` varchar(50) NOT NULL,
  `conTel` varchar(50) NOT NULL,
  PRIMARY KEY  (`addressID`),
  KEY `addressID` (`addressID`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO address VALUES ('1', '11', '河南省', '洛阳市', '洛龙区', '洛阳师范学院新校区', '许晨宇', '15237007470');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(12) NOT NULL auto_increment,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY  (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin VALUES ('1', 'xu', '12345678');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cateId` int(12) NOT NULL auto_increment,
  `cateName` varchar(50) NOT NULL,
  PRIMARY KEY  (`cateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO category VALUES ('1', '电脑');
INSERT INTO category VALUES ('2', '鼠标');
INSERT INTO category VALUES ('3', '键盘');
INSERT INTO category VALUES ('4', '显卡');

-- ----------------------------
-- Table structure for `chat`
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `chatId` int(20) NOT NULL auto_increment,
  `sendUser` int(12) NOT NULL,
  `receiveUser` int(12) NOT NULL,
  `MsgContent` varchar(255) NOT NULL,
  `MsgTime` datetime NOT NULL,
  PRIMARY KEY  (`chatId`),
  KEY `sendUser` (`sendUser`),
  KEY `receiveUser` (`receiveUser`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`sendUser`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`receiveUser`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat
-- ----------------------------

-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `collectTime` datetime NOT NULL,
  PRIMARY KEY  (`userId`,`goodsId`),
  KEY `collection_ibfk_2` (`goodsId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO collection VALUES ('11', '31', '2019-12-06 13:55:00');
INSERT INTO collection VALUES ('11', '33', '2019-12-06 13:53:35');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(12) NOT NULL auto_increment,
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `point` int(8) NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY  (`commentId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO comment VALUES ('1', '11', '1', '1', '1', '2019-08-23 14:50:29');

-- ----------------------------
-- Table structure for `deliver`
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver` (
  `deliverId` int(12) NOT NULL auto_increment,
  `orderId` int(12) NOT NULL,
  `sendId` int(12) NOT NULL,
  PRIMARY KEY  (`deliverId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deliver
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsId` int(12) NOT NULL auto_increment,
  `goodsName` varchar(50) NOT NULL,
  `price` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  `upTime` datetime NOT NULL,
  `category` int(12) NOT NULL,
  `detailCate` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `activityId` int(12) NOT NULL default '1',
  PRIMARY KEY  (`goodsId`),
  KEY `activityId` (`activityId`),
  KEY `category` (`category`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO goods VALUES ('1', '昂达GTX1070 ', '2699', '10', '2019-08-23 14:35:16', '4', '1', '昂达 GTX1070 8G 游戏显卡电脑办公台式机吃鸡独立显卡 优于1660ti', '2');
INSERT INTO goods VALUES ('2', '索泰(ZOTAC)', '3000', '20', '2019-08-28 10:11:13', '4', '1', '索泰(ZOTAC)RTX2060super 至尊PLUS/X GAMING显卡旗舰店/台式机独立显卡 RTX2060 至尊PLUS OC', '2');
INSERT INTO goods VALUES ('3', '盈通（yeston）', '2000', '20', '2019-09-18 15:48:06', '4', '1', '盈通（yeston）RX560D-4G D5大地之神 1200/6000MHz 4G/128bit/GDDR5显卡', '2');
INSERT INTO goods VALUES ('4', '昂达（ONDA）GT710', '2200', '23', '2019-09-13 16:11:09', '4', '1', '昂达（ONDA）GT710典范1GD3静音版 954/1000MHz 1G DDR3 PCI-E 2.0显卡', '2');
INSERT INTO goods VALUES ('5', '影驰（Galaxy）', '2500', '22', '2019-09-04 16:11:46', '4', '1', '影驰（Galaxy）GeForce RTX 2060 Super 骁将 8GB GD6 256-bit 自营电竞游戏显卡', '2');
INSERT INTO goods VALUES ('6', '七彩虹（Colorful）', '2080', '10', '2019-09-18 09:43:10', '4', '1', '七彩虹（Colorful）iGame GeForce GTX 1660Ti Ultra 6G GDDR6 电竞游戏显卡', '2');
INSERT INTO goods VALUES ('7', '明影GTX750TI2G', '2090', '20', '2019-09-11 09:44:05', '4', '1', '明影GTX750TI2G独立游戏显卡 逆水寒 守望先锋 逆战 吃鸡LOL独显显卡', '2');
INSERT INTO goods VALUES ('8', '铭瑄 （MAXSUN）', '3020', '50', '2019-03-05 00:00:00', '4', '1', '铭瑄 （MAXSUN） MS-RX580 2048SP 巨无霸 8G 1284MHz/7000MHz GDDR5/256bit 游戏显卡/吃鸡显卡', '2');
INSERT INTO goods VALUES ('9', '华硕（ASUS）', '5460', '30', '2019-05-03 00:00:00', '4', '1', '华硕（ASUS）DUAL-GTX1650-O4G 1485-1755MHZ 128bit 游戏电竞专业显卡 4G', '2');
INSERT INTO goods VALUES ('10', '影驰（Galaxy）', '1234', '40', '2019-02-03 00:00:00', '4', '1', '影驰（Galaxy）GeForce RTX 2060 Super 骁将 8GB GD6 256-bit 自营电竞游戏显卡', '2');
INSERT INTO goods VALUES ('11', '七彩虹（Colorful）', '5642', '12', '2019-03-02 00:00:00', '4', '1', '七彩虹（Colorful）iGame GeForce GTX 1660Ti Ultra 6G GDDR6 电竞游戏显卡', '2');
INSERT INTO goods VALUES ('12', '铭瑄 （MAXSUN）', '4561', '45', '2019-05-06 00:00:00', '4', '1', '铭瑄 （MAXSUN） MS-RX580 2048SP 巨无霸 8G 1284MHz/7000MHz GDDR5/256bit 游戏显卡/吃鸡显卡', '2');
INSERT INTO goods VALUES ('13', '明影GTX750TI', '8545', '42', '2019-01-01 00:00:00', '4', '1', '明影GTX750TI2G独立游戏显卡 逆水寒 守望先锋 逆战 吃鸡LOL独显显卡', '2');
INSERT INTO goods VALUES ('14', '丽台（LEADTEK）', '7855', '55', '2019-01-02 00:00:00', '4', '1', '丽台（LEADTEK）NVIDIA Quadro P2000 5GB GDDR5/160bit/140GBps/CUDA核心1024 建模渲染绘图专业显卡', '2');
INSERT INTO goods VALUES ('15', '磐镭 GTX1070 ', '5554', '46', '2019-01-03 00:00:00', '4', '1', '磐镭 GTX1070 8G 游戏显卡电脑办公台式机吃鸡独立显卡 优于1660ti', '2');
INSERT INTO goods VALUES ('16', '技嘉(GIGABYTE)', '6454', '85', '2019-01-04 00:00:00', '4', '1', '技嘉(GIGABYTE)GeForce GTX 1660Ti GAMING OC 6G 12000MHz 192bit GDDR6 6G 电竞游戏显卡', '2');
INSERT INTO goods VALUES ('17', '英伟达（NVIDIA）', '8546', '45', '2019-01-05 00:00:00', '4', '1', '英伟达（NVIDIA） GeForce RTX 2070 Founders Edition', '2');
INSERT INTO goods VALUES ('18', '蓝宝石RX Vega', '8465', '20', '2019-01-06 00:00:00', '4', '1', '蓝宝石RX Vega 56 8G 海外版OC 吃鸡游戏电竞显卡 【VEGA核心】VEGA56海外版', '2');
INSERT INTO goods VALUES ('19', '铭影GTX1060', '6542', '55', '2019-01-07 00:00:00', '4', '1', '铭影GTX1060 3G显卡战将 吃鸡游戏显卡 台式机电脑显卡1060系列显卡3g独立显卡 GTX1060 3GBD5战将', '2');
INSERT INTO goods VALUES ('20', '英菲克（INPHIC）', '99', '45', '2019-01-08 00:00:00', '3', '1', '英菲克（INPHIC）V680h真机械手感键盘鼠标套装有线游戏键鼠电脑台式笔记本USB外接网吧吃鸡键盘LOL 黑 自营', '3');
INSERT INTO goods VALUES ('21', '现代翼蛇（HYesir）', '29', '45', '2019-01-09 00:00:00', '3', '1', '现代翼蛇（HYesir）HY-KA7键盘 有线键盘 usb接口 防水泼 办公键盘 不掉色 经典爆款 黑 自营', '3');
INSERT INTO goods VALUES ('22', '魔炼者 1505 (MK5)', '199', '65', '2019-01-10 00:00:00', '3', '1', '魔炼者 1505 (MK5) 机械键盘 有线键盘 游戏键盘 108键背光键盘 电脑键盘 笔记本键盘 黑色自营 青轴', '3');
INSERT INTO goods VALUES ('23', '戴尔（DELL）', '54', '85', '2019-01-11 00:00:00', '3', '1', '戴尔（DELL）KB216 有线商务办公键盘（黑色）', '3');
INSERT INTO goods VALUES ('24', '罗技（Logitech）', '89', '54', '2019-01-12 00:00:00', '3', '1', '罗技（Logitech）MK275 键鼠套装 无线键鼠套装 办公键鼠套装 全尺寸 黑蓝色 自营 带无线2.4G接收器', '3');
INSERT INTO goods VALUES ('25', '迪兰（Dataland）', '6363', '63', '2019-01-13 00:00:00', '4', '1', '迪兰（Dataland）RX VEGA56 8G X-Serial战神 1177-1478/1600MHz 8GB/2048-bit HBM2 DX12独立游戏显卡', '2');
INSERT INTO goods VALUES ('26', '联想（Lenovo）', '25', '25', '2019-02-25 00:00:00', '2', '1', '联想（Lenovo）鼠标有线鼠标 办公鼠标 联想大红点M120Pro有线鼠标 笔记本台式机鼠标', '4');
INSERT INTO goods VALUES ('27', '罗技（G）G502', '339', '36', '2019-02-25 00:00:00', '2', '1', 'HERO主宰者有线鼠标 游戏鼠标 HERO引擎 RGB鼠标 电竞鼠标 16000DPI', '4');
INSERT INTO goods VALUES ('28', '罗技（Logitech）', '129', '56', '2019-02-25 00:00:00', '2', '1', '罗技（Logitech）M330 鼠标 无线鼠标 办公鼠标 静音鼠标 右手鼠标 黑色', '4');
INSERT INTO goods VALUES ('29', 'Razer雷蛇蝰蛇2000', '109', '47', '2019-02-25 00:00:00', '2', '1', 'Razer雷蛇蝰蛇2000 游戏鼠标 黑色版 电竞鼠标 绝地求生鼠标 吃鸡鼠标（简包）', '4');
INSERT INTO goods VALUES ('30', '小米（MI）', '99', '52', '2019-02-25 00:00:00', '2', '1', '小米（MI）小米便携鼠标 无线蓝牙 4.0 男女生家用/笔记本电脑办公/鼠标 银色', '4');
INSERT INTO goods VALUES ('31', '宏碁（acer）', '2399', '54', '2018-06-04 00:00:00', '1', '1', '爆款直降，满千减百，品质宏碁，特惠来袭，何必苦等11.11，早买早便宜！', '2');
INSERT INTO goods VALUES ('32', 'Apple MacBook Air ', '6788', '55', '2019-06-04 00:00:00', '1', '1', '宽屏笔记本电脑 128GB 闪存', '2');
INSERT INTO goods VALUES ('33', '联想（ThinkPad） ', '4399', '32', '2019-04-06 00:00:00', '1', '1', '宽屏笔记本电脑 128GB 闪存', '2');
INSERT INTO goods VALUES ('34', '联想（Lenovo）', '4599', '99', '2019-05-05 00:00:00', '1', '1', '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)14英寸笔记本电脑(i5-4210U 4G 500G 2G独显 Win8.1)', '2');
INSERT INTO goods VALUES ('35', '华硕（ASUS）', '4699', '55', '2019-02-05 00:00:00', '1', '1', '15.6英寸笔记本电脑（i5-5200U 4G 7200转500G 2G独显 D刻 蓝牙 Win8.1 黑色）', '2');
INSERT INTO goods VALUES ('36', '华硕（ASUS）', '4599', '52', '2019-08-09 00:00:00', '1', '1', '14英寸笔记本电脑 （i5-4200H 4G 1TB GT940M 2G独显 蓝牙4.0 D刻 Win8.1 黑色）', '2');
INSERT INTO goods VALUES ('37', '戴尔（DELL）灵越', '3399', '98', '2019-07-07 00:00:00', '1', '1', ' Ins14C-4528B 14英寸笔记本（i5-5200U 4G 500G GT820M 2G独显 Win8）黑', '2');
INSERT INTO goods VALUES ('38', '惠普(HP)WASD 暗影精灵', '2599', '65', '2017-07-07 00:00:00', '1', '1', '15.6英寸游戏笔记本电脑(i5-6300HQ 4G 1TB+128G SSD GTX950M 4G独显 Win10)', '2');
INSERT INTO goods VALUES ('39', 'MacBook', '4599', '56', '2017-07-07 00:00:00', '1', '1', 'Pro MF840CH/A 13.3英寸宽屏笔记本电脑 256GB 闪存', '2');
INSERT INTO goods VALUES ('40', '机械革命（MECHREVO）', '6799', '33', '2017-02-02 00:00:00', '1', '1', '15.6英寸游戏本(I7-4710MQ 8G 64GSSD+1T GTX960M 2G独显 IPS屏 WIN7)黑色', '2');
INSERT INTO goods VALUES ('41', '神舟（HASEE）', '5699', '55', '2017-07-07 00:00:00', '1', '1', '15.6英寸游戏本(i7-4710MQ 8G 1TB GTX960M 2G独显 1080P)黑色', '2');
INSERT INTO goods VALUES ('42', '微星（MSI）', '3699', '66', '2017-07-07 00:00:00', '1', '1', '15.6英寸游戏笔记本电脑（i5-4210H 8G 1T GTX960MG DDR5 2G 背光键盘）黑色', '2');
INSERT INTO goods VALUES ('43', '雷神（ThundeRobot）', '5699', '66', '2017-07-07 00:00:00', '1', '1', '15.6英寸游戏本 ( i7-4710MQ 4G 500G GTX950M 2G独显 包无亮点全高清屏) 金', '2');
INSERT INTO goods VALUES ('44', '惠普（HP）轻薄系列', '4999', '99', '2017-07-07 00:00:00', '1', '1', '15-r239TX 15.6英寸笔记本电脑（i5-5200U 4G 500G GT820M 2G独显 win8.1）金属灰', '2');
INSERT INTO goods VALUES ('45', '未来人类（Terrans Force）', '5999', '55', '2017-07-07 00:00:00', '1', '1', '15.6英寸游戏本（i7-5700HQ 16G 120G固态+1TB GTX970M 3G GDDR5独显）黑', '2');
INSERT INTO goods VALUES ('46', '戴尔（DELL）', '6999', '56', '2017-07-07 00:00:00', '1', '1', '（i3-4170 4G 500G DVD 三年上门服务 Win7）黑', '2');
INSERT INTO goods VALUES ('47', '联想（Lenovo）', '4899', '24', '2019-02-25 00:00:00', '1', '1', '（i5-4460 4G 500G GT720 1G独显 DVD 千兆网卡 Win10）23英寸', '2');
INSERT INTO goods VALUES ('48', 'Apple iPad mini 2 ', '2599', '25', '2019-02-25 00:00:00', '1', '1', '（配备 Retina 显示屏 7.9英寸 16G WLAN 机型 银色）', '2');
INSERT INTO goods VALUES ('49', '小米（MI）7.9英寸平板', '1999', '66', '2019-02-25 00:00:00', '1', '1', 'WIFI 64GB（NVIDIA Tegra K1 2.2GHz 2G 64G 2048*1536视网膜屏 800W）白色', '2');
INSERT INTO goods VALUES ('50', '罗技（G）', '99', '55', '2019-02-25 00:00:00', '2', '1', '罗技（G）G102有线鼠标 游戏鼠标 RGB鼠标 轻量化设计 吃鸡鼠标 绝地求生 黑色 自营 8000DPI', '4');

-- ----------------------------
-- Table structure for `imagepath`
-- ----------------------------
DROP TABLE IF EXISTS `imagepath`;
CREATE TABLE `imagepath` (
  `pathId` int(12) NOT NULL auto_increment,
  `goodId` int(12) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY  (`pathId`),
  KEY `goodid` (`goodId`),
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagepath
-- ----------------------------
INSERT INTO imagepath VALUES ('1', '1', '0001.jpg');
INSERT INTO imagepath VALUES ('2', '2', '0002.jpg');
INSERT INTO imagepath VALUES ('3', '3', '0003.jpg');
INSERT INTO imagepath VALUES ('4', '4', '0004.jpg');
INSERT INTO imagepath VALUES ('5', '5', '0005.jpg');
INSERT INTO imagepath VALUES ('6', '6', '0006.jpg');
INSERT INTO imagepath VALUES ('7', '7', '0007.jpg');
INSERT INTO imagepath VALUES ('8', '8', '0008.jpg');
INSERT INTO imagepath VALUES ('9', '9', '0009.jpg');
INSERT INTO imagepath VALUES ('10', '10', '0010.jpg');
INSERT INTO imagepath VALUES ('11', '11', '0011.jpg');
INSERT INTO imagepath VALUES ('12', '12', '0012.jpg');
INSERT INTO imagepath VALUES ('13', '13', '0013.jpg');
INSERT INTO imagepath VALUES ('14', '14', '0014.jpg');
INSERT INTO imagepath VALUES ('15', '15', '0015.jpg');
INSERT INTO imagepath VALUES ('16', '16', '0016.jpg');
INSERT INTO imagepath VALUES ('17', '17', '0017.jpg');
INSERT INTO imagepath VALUES ('18', '18', '0018.jpg');
INSERT INTO imagepath VALUES ('19', '19', '0019.jpg');
INSERT INTO imagepath VALUES ('20', '20', '0020.jpg');
INSERT INTO imagepath VALUES ('21', '21', '0021.jpg');
INSERT INTO imagepath VALUES ('22', '22', '0022.jpg');
INSERT INTO imagepath VALUES ('23', '23', '0023.jpg');
INSERT INTO imagepath VALUES ('24', '24', '0024.jpg');
INSERT INTO imagepath VALUES ('25', '25', '0025.jpg');
INSERT INTO imagepath VALUES ('26', '26', '0026.jpg');
INSERT INTO imagepath VALUES ('27', '27', '0027.jpg');
INSERT INTO imagepath VALUES ('28', '28', '0028.jpg');
INSERT INTO imagepath VALUES ('29', '29', '0029.jpg');
INSERT INTO imagepath VALUES ('30', '30', '0030.jpg');
INSERT INTO imagepath VALUES ('31', '31', '0031.jpg');
INSERT INTO imagepath VALUES ('32', '32', '0032.jpg');
INSERT INTO imagepath VALUES ('33', '33', '0033.jpg');
INSERT INTO imagepath VALUES ('34', '34', '0034.jpg');
INSERT INTO imagepath VALUES ('35', '35', '0035.jpg');
INSERT INTO imagepath VALUES ('36', '36', '0036.jpg');
INSERT INTO imagepath VALUES ('37', '37', '0037.jpg');
INSERT INTO imagepath VALUES ('38', '38', '0038.jpg');
INSERT INTO imagepath VALUES ('39', '39', '0039.jpg');
INSERT INTO imagepath VALUES ('40', '40', '0040.jpg');
INSERT INTO imagepath VALUES ('41', '41', '0041.jpg');
INSERT INTO imagepath VALUES ('42', '42', '0042.jpg');
INSERT INTO imagepath VALUES ('43', '43', '0043.jpg');
INSERT INTO imagepath VALUES ('44', '44', '0044.jpg');
INSERT INTO imagepath VALUES ('45', '45', '0045.jpg');
INSERT INTO imagepath VALUES ('46', '46', '0046.jpg');
INSERT INTO imagepath VALUES ('47', '47', '0047.jpg');
INSERT INTO imagepath VALUES ('48', '48', '0048.jpg');
INSERT INTO imagepath VALUES ('49', '49', '0049.jpg');
INSERT INTO imagepath VALUES ('50', '50', '0050.jpg');

-- ----------------------------
-- Table structure for `indent`
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `orderId` int(12) NOT NULL auto_increment,
  `userId` int(12) NOT NULL,
  `orderTime` datetime NOT NULL,
  `oldPrice` float NOT NULL,
  `newPrice` float NOT NULL,
  `isPay` tinyint(1) NOT NULL,
  `isSend` tinyint(1) NOT NULL,
  `isReceive` tinyint(1) NOT NULL,
  `isComplete` tinyint(1) NOT NULL,
  `addressId` int(12) NOT NULL,
  PRIMARY KEY  (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderGoods` (`orderTime`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO indent VALUES ('8', '11', '2019-09-03 17:20:24', '4599', '4599', '1', '1', '0', '0', '1');
INSERT INTO indent VALUES ('9', '11', '2019-12-06 13:53:16', '11187', '11187', '1', '0', '0', '0', '1');
INSERT INTO indent VALUES ('10', '11', '2019-12-06 13:56:10', '4999', '4999', '1', '0', '0', '0', '1');
INSERT INTO indent VALUES ('11', '11', '2019-12-06 14:01:33', '2399', '2399', '1', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemId` int(12) NOT NULL auto_increment,
  `orderId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  PRIMARY KEY  (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO orderitem VALUES ('11', '8', '34', '1');
INSERT INTO orderitem VALUES ('12', '9', '32', '1');
INSERT INTO orderitem VALUES ('13', '9', '33', '1');
INSERT INTO orderitem VALUES ('14', '10', '44', '1');
INSERT INTO orderitem VALUES ('15', '11', '31', '1');

-- ----------------------------
-- Table structure for `shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `userId` int(12) NOT NULL,
  `goodsid` int(12) NOT NULL,
  `cateDate` datetime NOT NULL,
  `goodsNum` int(12) NOT NULL,
  PRIMARY KEY  (`userId`,`goodsid`),
  KEY `userId` (`userId`),
  KEY `goodsid` (`goodsid`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(12) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `regTime` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY  (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('11', 'xu', '12345678', '2019-08-23 14:23:04', '1196305417@qq.com', '12345678989');
INSERT INTO user VALUES ('12', 'xcy', '12345678', '2019-12-06 12:31:11', '1196305417@qq.com', '15237007470');
