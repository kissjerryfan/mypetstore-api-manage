/*
 Navicat Premium Dump SQL

 Source Server         : mypetstore
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : mypetstore1

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 25/01/2025 15:24:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `firstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `addr2` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `state` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `country` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('j2ee', 'yourname@yourdomain.com', 'ABC', 'XYXX', NULL, '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('ki', '123456@qq.com', 'by', 'A', '0', '901 Yue Lu Road', 'cs UCUP02-206', 'cs', '1', '94303', 'china', '1111111');
INSERT INTO `account` VALUES ('kim', '123456@qq.com', 'by', 'A', '0', '901 Yue Lu Road', 'cs UCUP02-206', 'cs', '1', '94303', 'china', '1111111');
INSERT INTO `account` VALUES ('kimmm', '123456@qq.com', 'David', 'lastname', '', 'cs.road', '', 'CS', '', '111111', 'China', '12345678');
INSERT INTO `account` VALUES ('xx', '2279872858@qq.com', 'AB', 'XY', NULL, 'address1', 'address2', 'cs', 'china', 'xx', 'china', '1111111');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata`  (
  `favcategory` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `bannername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"../images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"../images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"../images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"../images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"../images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `itemid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `instock` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `totalcost` decimal(10, 2) NULL DEFAULT NULL,
  `pay` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('8209200312', 'EST-20', '1', 1, 5.50, '0');
INSERT INTO `cart` VALUES ('8209200312', 'EST-10', '1', 1, 18.50, '0');
INSERT INTO `cart` VALUES ('admin', 'EST-11', '1', 1, 18.50, '1');
INSERT INTO `cart` VALUES ('admin', 'EST-4', '1', 1, 18.50, '1');
INSERT INTO `cart` VALUES ('admin', 'EST-18', '1', 1, 193.50, '1');
INSERT INTO `cart` VALUES ('admin', 'EST-20', '1', 1, 5.50, '1');
INSERT INTO `cart` VALUES ('admin', 'EST-26', '1', 1, 125.50, '1');
INSERT INTO `cart` VALUES ('admin', 'EST-1', '1', 1, 16.50, '1');
INSERT INTO `cart` VALUES ('admin', 'EST-6', '1', 1, 18.50, '1');
INSERT INTO `cart` VALUES ('admin', 'EST-10', '1', 1, 18.50, '1');
INSERT INTO `cart` VALUES ('admin', 'EST-21', '1', 1, 5.29, '1');
INSERT INTO `cart` VALUES ('123', 'EST-6', '1', 4, 74.00, '0');
INSERT INTO `cart` VALUES ('123', 'EST-19', '1', 2, 31.00, '0');
INSERT INTO `cart` VALUES ('123', 'EST-18', '1', 3, 580.50, '0');
INSERT INTO `cart` VALUES ('123', 'EST-13', '1', 1, 18.50, '0');
INSERT INTO `cart` VALUES (NULL, 'EST-4', '1', 1, 12.00, NULL);
INSERT INTO `cart` VALUES ('j2ee', 'EST-18', '1', 3, 580.50, '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BIRDS', 'Birds', '<image src=\"../images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>');
INSERT INTO `category` VALUES ('CATS', 'Cats', '<image src=\"../images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>');
INSERT INTO `category` VALUES ('DOGS', 'Dogs', '<image src=\"../images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>');
INSERT INTO `category` VALUES ('FISH', 'Fish', '<image src=\"../images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>');
INSERT INTO `category` VALUES ('REPTILES', 'Reptiles', '<image src=\"../images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `itemid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('EST-1', 10000);
INSERT INTO `inventory` VALUES ('EST-10', 10000);
INSERT INTO `inventory` VALUES ('EST-11', 9999);
INSERT INTO `inventory` VALUES ('EST-12', 10000);
INSERT INTO `inventory` VALUES ('EST-13', 9998);
INSERT INTO `inventory` VALUES ('EST-14', 9999);
INSERT INTO `inventory` VALUES ('EST-15', 10000);
INSERT INTO `inventory` VALUES ('EST-16', 10000);
INSERT INTO `inventory` VALUES ('EST-17', 10000);
INSERT INTO `inventory` VALUES ('EST-18', 9999);
INSERT INTO `inventory` VALUES ('EST-19', 10000);
INSERT INTO `inventory` VALUES ('EST-2', 10000);
INSERT INTO `inventory` VALUES ('EST-20', 10000);
INSERT INTO `inventory` VALUES ('EST-21', 10000);
INSERT INTO `inventory` VALUES ('EST-22', 10000);
INSERT INTO `inventory` VALUES ('EST-23', 10000);
INSERT INTO `inventory` VALUES ('EST-24', 10000);
INSERT INTO `inventory` VALUES ('EST-25', 10000);
INSERT INTO `inventory` VALUES ('EST-26', 10000);
INSERT INTO `inventory` VALUES ('EST-27', 10000);
INSERT INTO `inventory` VALUES ('EST-28', 10000);
INSERT INTO `inventory` VALUES ('EST-3', 10000);
INSERT INTO `inventory` VALUES ('EST-4', 10000);
INSERT INTO `inventory` VALUES ('EST-5', 10000);
INSERT INTO `inventory` VALUES ('EST-6', 10000);
INSERT INTO `inventory` VALUES ('EST-7', 10000);
INSERT INTO `inventory` VALUES ('EST-8', 10000);
INSERT INTO `inventory` VALUES ('EST-9', 10000);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `productid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `listprice` decimal(10, 2) NULL DEFAULT NULL,
  `unitcost` decimal(10, 2) NULL DEFAULT NULL,
  `supplier` int NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `attr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `attr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `attr3` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `attr4` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `attr5` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_item_2`(`supplier` ASC) USING BTREE,
  INDEX `itemProd`(`productid` ASC) USING BTREE,
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('EST-1', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Large', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-10', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotted Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-11', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Venomless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-12', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Rattleless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-13', 'RP-LI-02', 18.50, 12.00, 1, 'P', 'Green Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-14', 'FL-DSH-01', 58.50, 12.00, 1, 'P', 'Tailless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-15', 'FL-DSH-01', 23.50, 12.00, 1, 'P', 'With tail', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-16', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-17', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-18', 'AV-CB-01', 193.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-19', 'AV-SB-02', 15.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-2', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Small', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-20', 'FI-FW-02', 5.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-21', 'FI-FW-02', 5.29, 1.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-22', 'K9-RT-02', 135.50, 100.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-23', 'K9-RT-02', 145.49, 100.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-24', 'K9-RT-02', 255.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-25', 'K9-RT-02', 325.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-26', 'K9-CW-01', 125.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-27', 'K9-CW-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-28', 'K9-RT-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-3', 'FI-SW-02', 18.50, 12.00, 1, 'P', 'Toothless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-4', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotted', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-5', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-6', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Male Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-7', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Female Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-8', 'K9-PO-02', 18.50, 12.00, 1, 'P', 'Male Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-9', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotless Male Puppy', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `itemid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `unitprice` decimal(10, 2) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES (1001, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1002, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1003, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1003, 2, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1003, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1004, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1004, 2, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1004, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1005, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1005, 2, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1005, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1006, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1006, 2, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1006, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1007, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1007, 2, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1007, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1008, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1008, 2, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1008, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1009, 1, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1009, 2, 'EST-4', 2, 18.50);
INSERT INTO `lineitem` VALUES (1009, 3, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1010, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1011, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1012, 1, 'EST-18', 4, 193.50);
INSERT INTO `lineitem` VALUES (1013, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1014, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1015, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1016, 1, 'EST-20', 1, 5.50);
INSERT INTO `lineitem` VALUES (1016, 2, 'EST-26', 1, 125.50);
INSERT INTO `lineitem` VALUES (1017, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1017, 2, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1018, 1, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1019, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1019, 2, 'EST-10', 1, 18.50);
INSERT INTO `lineitem` VALUES (1020, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1020, 2, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1020, 3, 'EST-21', 1, 5.29);
INSERT INTO `lineitem` VALUES (1021, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1022, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1023, 1, 'EST-14', 1, 58.50);
INSERT INTO `lineitem` VALUES (1024, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1024, 2, 'EST-11', 1, 18.50);
INSERT INTO `lineitem` VALUES (1026, 1, 'EST-6', 4, 18.50);
INSERT INTO `lineitem` VALUES (1026, 2, 'EST-19', 2, 15.50);
INSERT INTO `lineitem` VALUES (1026, 3, 'EST-18', 3, 193.50);
INSERT INTO `lineitem` VALUES (1026, 4, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1027, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1028, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1029, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1030, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1031, 1, 'EST-18', 3, 193.50);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `logintime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:03:00.248', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:03:00.248', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:03:00.248', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-FW-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:03:00.248', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-4');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:03:00.248', 'http://localhost:8080/mypetshop_war_exploded/removeItemFormCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:03:00.248', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:03:00.248', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:03:00.248', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@38be7237');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/viewSignin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/authCode?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/viewSignin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/authCode?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/viewMyAccount?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@404971f2');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 17:20:52.028', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('8209200312', '2021-11-05 17:22:32.162', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('8209200312', '2021-11-05 17:22:32.162', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('8209200312', '2021-11-05 17:22:32.162', 'http://localhost:8080/mypetshop_war_exploded/viewSignin?null');
INSERT INTO `log` VALUES ('8209200312', '2021-11-05 17:22:32.162', 'http://localhost:8080/mypetshop_war_exploded/authCode?null');
INSERT INTO `log` VALUES ('8209200312', '2021-11-05 17:22:32.162', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('8209200312', '2021-11-05 17:22:32.162', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('8209200312', '2021-11-05 17:22:32.162', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('8209200312', '2021-11-05 17:22:32.162', 'http://localhost:8080/mypetshop_war_exploded/authCode?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 20:15:47.794', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-FW-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-4');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewSignin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/authCode?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewSignin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/authCode?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewMyAccount?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewMyAccount?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewItem?itemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/images/bird2.gif?null');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewItem?itemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewItem?itemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewItem?itemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=REPTILES');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=RP-SN-01');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=REPTILES');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=REPTILES');
INSERT INTO `log` VALUES ('admin', '2021-11-05 21:06:21.521', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=REPTILES');
INSERT INTO `log` VALUES ('admin', '2021-11-06 17:13:40.465', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/viewMyAccount?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@75eda5bd');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-FW-02');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-20');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/removeItemFormCart?workingItemId=EST-20');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 13:35:13.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:00:32.172', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:06:05.005', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@517d7665');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-FW-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-4');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:28:48.815', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-FW-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-4');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@1ef0c669');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-FW-02');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-20');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=DOGS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=K9-CW-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-26');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/confirmShip?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-SW-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-1');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-1');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-1');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:51:25.943', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-1');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=DOGS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=K9-BD-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-6');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 14:56:22.457', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:01:46.584', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:01:46.584', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:01:46.584', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:01:46.584', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:01:46.584', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=DOGS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:01:46.584', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=K9-DL-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:01:46.584', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-10');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:02:10.726', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:02:10.726', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:02:10.726', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:02:10.726', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:02:10.726', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@655abc63');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:02:10.726', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:41:04.327', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:41:04.327', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:41:04.327', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@639e390b');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:41:04.327', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:41:04.327', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:41:04.327', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:41:04.327', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=DOGS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:41:04.327', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@639e390b');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:44:08.799', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:44:08.799', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:44:08.799', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-FW-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:44:08.799', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-4');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:44:08.799', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:44:08.799', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=FI-FW-02');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:44:08.799', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-21');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/updateCart?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=FISH');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/searchProducts?null');
INSERT INTO `log` VALUES ('admin', '2021-11-07 19:51:31.94', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/viewItem?itemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/images/bird2.gif?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/confirmShip?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/order?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/viewMyAccount?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@78afacca');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/searchProducts?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@78afacca');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/viewSignin?null');
INSERT INTO `log` VALUES ('admin', '2021-11-10 16:54:40.098', 'http://localhost:8080/mypetshop_war_exploded/authCode?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/register?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=DOGS');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=K9-BD-01');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-6');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-6');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-6');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-6');
INSERT INTO `log` VALUES ('123', '2022-01-11 21:58:42.595', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/css/jpetstore.css?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-SB-02');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/css/jpetstore.css?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-19');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/css/jpetstore.css?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:01:00.304', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/main?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-11 22:21:33.464', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 23:14:59.441', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('123', '2022-01-11 23:14:59.441', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/confirmOrder?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 00:50:55.231', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-CB-01');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-18');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=REPTILES');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=RP-LI-02');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-13');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-12 21:53:01.597', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 11:31:34.748', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 11:31:34.748', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 11:31:34.748', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 11:31:34.748', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 11:31:34.748', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 11:31:34.748', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 11:31:34.748', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@454deaaa');
INSERT INTO `log` VALUES ('123', '2022-01-14 11:31:34.748', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:03:33.064', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:03:33.064', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:03:33.064', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:03:33.064', 'http://localhost:8080/mypetshop_war_exploded/viewCart?user=domain.User@5447d126');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:03:33.064', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:03:33.064', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:03:33.064', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/signin?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/categoryInf?category=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/viewCategory?categoryId=BIRDS');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/viewProduct?productId=AV-SB-02');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/addItemToCart?workingItemId=EST-19');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/viewOrderForm?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/viewSignin?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/authCode?null');
INSERT INTO `log` VALUES ('123', '2022-01-14 18:22:16.485', 'http://localhost:8080/mypetshop_war_exploded/jqueryauto.js?null');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `managerName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('admin', '123456');
INSERT INTO `manager` VALUES ('admin2', '222');
INSERT INTO `manager` VALUES ('admin2', '222');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int NOT NULL,
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `shipaddr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `shipaddr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `shipcity` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `shipstate` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `shipzip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `shipcountry` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `billaddr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `billaddr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `billcity` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `billstate` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `billzip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `billcountry` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `courier` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `totalprice` decimal(10, 2) NOT NULL,
  `billtofirstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `billtolastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `shiptofirstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `shiptolastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `creditcard` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `exprdate` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cardtype` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `locale` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `orderdate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1002, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 193.50, 'ABC', 'XYX', 'Huey', 'White', '897 7876 7870', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1003, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 249.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1004, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 249.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1005, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 249.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1006, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 249.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1007, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 249.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1008, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 249.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1009, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 249.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1012, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 774.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1013, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1014, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1015, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1016, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 131.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1017, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 210.00, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1018, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 18.50, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1019, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 405.50, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1020, 'admin', 'HH', 'hh', 'zz', 'zzz', 's', 'English', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 410.79, 'ABC', 'XYX', 'Huey', 'White', '999 9999 9999 9999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1021, 'xx', 'address1', 'address2', 'cs', 'china', 'xx', 'china', '', '', '', '', '', '', 'UPS', 18.50, '', '', 'AB', 'XY', '', '', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1022, 'xx', 'address1', 'address2', 'cs', 'china', 'xx', 'china', '', '', '', '', '', '', 'UPS', 18.50, '', '', 'AB', 'XY', '', '', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1023, 'xx', 'address1', 'address2', 'cs', 'china', 'xx', 'china', '', '', '', '', '', '', 'UPS', 58.50, '', '', 'AB', 'XY', '', '', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1024, 'xx', 'address1', 'address2', 'cs', 'china', 'xx', 'china', '', '', '', '', '', '', 'UPS', 212.00, '', '', 'AB', 'XY', '', '', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1026, '123', 'x', '', '', '', '', '', '', '', '', '', '', '', 'UPS', 0.00, '', '', '', '', '999 999 999', '12/03', 'Visa', 'CA', NULL);
INSERT INTO `orders` VALUES (1027, 'j2ee', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '123', '1', 'new york', 'new york', '123321', 'USA', 'UPS', 387.00, 'jk', 'wong', 'ABC', 'XYXX', '999 999 999', '12/03', 'Visa', 'CA', '2025-1-25');
INSERT INTO `orders` VALUES (1028, 'j2ee', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '123', '1', 'new york', 'new york', '123321', 'USA', 'UPS', 387.00, 'jk', 'wong', 'ABC', 'XYXX', '999 999 999', '12/03', 'Visa', 'CA', '2025-1-25');
INSERT INTO `orders` VALUES (1029, 'j2ee', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '123', '1', 'new york', 'new york', '123321', 'USA', 'UPS', 387.00, 'jk', 'wong', 'ABC', 'XYXX', '999 999 999', '12/03', 'Visa', 'CA', '2025-1-25');
INSERT INTO `orders` VALUES (1030, 'j2ee', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '123', '1', 'new york', 'new york', '123321', 'USA', 'UPS', 387.00, 'jk', 'wong', 'ABC', 'XYXX', '999 999 999', '12/03', 'Visa', 'CA', '2025-1-25');
INSERT INTO `orders` VALUES (1031, 'j2ee', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '123', '1', 'new york', 'new york', '123321', 'USA', 'UPS', 580.50, 'jk', 'wong', 'ABC', 'XYXX', '999 999 999', '12/03', 'Visa', 'CA', '2025-1-25');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `timestamp` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES (1002, 1002, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1003, 1003, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1004, 1004, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1005, 1005, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1006, 1006, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1007, 1007, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1008, 1008, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1009, 1009, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1012, 1012, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1013, 1013, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1014, 1014, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1015, 1015, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1016, 1016, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1017, 1017, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1018, 1018, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1019, 1019, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1020, 1020, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1021, 1021, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1022, 1022, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1023, 1023, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1024, 1024, 'P', NULL);
INSERT INTO `orderstatus` VALUES (1026, 4, 'p', NULL);
INSERT INTO `orderstatus` VALUES (1027, 1, 'p', '2025-1-25');
INSERT INTO `orderstatus` VALUES (1028, 1, 'p', '2025-1-25');
INSERT INTO `orderstatus` VALUES (1029, 1, 'p', '2025-1-25');
INSERT INTO `orderstatus` VALUES (1030, 1, 'p', '2025-1-25');
INSERT INTO `orderstatus` VALUES (1031, 1, 'p', '2025-1-25');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `productCat`(`category` ASC) USING BTREE,
  INDEX `productName`(`name` ASC) USING BTREE,
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('AV-CB-01', 'BIRDS', 'Amazon Parrot', '<img src=\"../../images/bird2.gif\">Great companion for up to 75 yearas');
INSERT INTO `product` VALUES ('AV-SB-02', 'BIRDS', 'Finch', '<img src=\"../../images/bird1.gif\">Great stress reliever');
INSERT INTO `product` VALUES ('FI-FW-01', 'FISH', 'Koi', '<img src=\"../../images/fish3.gif\">Fresh Water fish from Japan');
INSERT INTO `product` VALUES ('FI-FW-02', 'FISH', 'Goldfish', '<img src=\"../../images/fish2.gif\">Fresh Water fish from China');
INSERT INTO `product` VALUES ('FI-SW-01', 'FISH', 'Angelfish', '<img src=\"../../images/fish1.gif\">Salt Water fish from South America');
INSERT INTO `product` VALUES ('FI-SW-02', 'FISH', 'Tiger Shark', '<img src=\"../../images/fish4.gif\">Salt Water fish from Australia');
INSERT INTO `product` VALUES ('FL-DLH-02', 'CATS', 'Persian', '<img src=\"../../images/cat1.gif\">Friendly house cat, doubles as a princess');
INSERT INTO `product` VALUES ('FL-DSH-01', 'CATS', 'Manx', '<img src=\"../../images/cat2.gif\">Great for reducing mouse populations');
INSERT INTO `product` VALUES ('K9-BD-01', 'DOGS', 'Bulldog', '<img src=\"../../images/dog2.gif\">Friendly dog from England');
INSERT INTO `product` VALUES ('K9-CW-01', 'DOGS', 'Chihuahua', '<img src=\"../../images/dog4.gif\">Great companion dog');
INSERT INTO `product` VALUES ('K9-DL-01', 'DOGS', 'Dalmation', '<img src=\"../../images/dog6.gif\">Great dog for a Fire Station');
INSERT INTO `product` VALUES ('K9-PO-02', 'DOGS', 'Poodle', '<img src=\"../../images/dog3.gif\">Cute dog from France');
INSERT INTO `product` VALUES ('K9-RT-01', 'DOGS', 'Golden Retriever', '<img src=\"../../images/dog1.gif\">Great family dog');
INSERT INTO `product` VALUES ('K9-RT-02', 'DOGS', 'Labrador Retriever', '<img src=\"../../images/dog5.gif\">Great hunting dog');
INSERT INTO `product` VALUES ('RP-LI-02', 'REPTILES', 'Iguana', '<img src=\"../../images/lizard1.gif\">Friendly green friend');
INSERT INTO `product` VALUES ('RP-SN-01', 'REPTILES', 'Rattlesnake', '<img src=\"../../images/lizard2.gif\">Doubles as a watch dog');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `langpref` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `favcategory` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mylistopt` tinyint(1) NULL DEFAULT NULL,
  `banneropt` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('j2ee', 'Chinese', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('ki', 'Chinese', 'CAT', 1, 1);
INSERT INTO `profile` VALUES ('kim', 'Chinese', 'CAT', 1, 1);
INSERT INTO `profile` VALUES ('kimmm', 'Chinese', 'BIRDS', 1, 1);
INSERT INTO `profile` VALUES ('xx', 'Chinese', 'BIRDS', NULL, NULL);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nextid` int NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('linenum', 1000);
INSERT INTO `sequence` VALUES ('ordernum', 1031);

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon`  (
  `username` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('j2ee', 'j2ee');
INSERT INTO `signon` VALUES ('ki', 'kkk');
INSERT INTO `signon` VALUES ('kim', 'kkk');
INSERT INTO `signon` VALUES ('kimmm', 'kkk');
INSERT INTO `signon` VALUES ('xx', 'ÔÙ\0²é	ìøB~');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `suppid` int NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `addr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `zip` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`suppid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES (2, 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `firstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `lastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `languagepre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `favoritecata` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `iflist` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ifbanner` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address2` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '8742', 'Huey', 'White', '1098435006@qq.com', '18182432956', 'HH', 'hh', 'zz', 'zzz', 's', 'English', 'fish', 'true', 'true', 'zzz', 'zzz');
INSERT INTO `user` VALUES (2, '8209200312', '8888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, '8209200324', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, '123', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
