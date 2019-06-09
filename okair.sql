/*
Navicat MySQL Data Transfer

Source Server         : okair
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : okair

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-07-10 08:51:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `assetstrans`
-- ----------------------------
DROP TABLE IF EXISTS `assetstrans`;
CREATE TABLE `assetstrans` (
  `id` varchar(40) NOT NULL,
  `assetsId` varchar(40) NOT NULL,
  `batchNo` varchar(45) NOT NULL,
  `transType` varchar(8) NOT NULL DEFAULT '1' COMMENT '资产流转方向，1：入库、2：出库、3：报废\\出售、4：转移',
  `count` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `price` decimal(12,2) DEFAULT '0.00' COMMENT '单价',
  `handlerEmp` varchar(45) DEFAULT ' ',
  `instockTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `targetEmp` varchar(45) DEFAULT ' ' COMMENT '接手员工',
  `comment` varchar(45) DEFAULT ' ',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createUser` varchar(45) DEFAULT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assetstrans
-- ----------------------------
INSERT INTO `assetstrans` VALUES ('00e81b8d-076d-4cbb-b6fa-c0ca184d4bd2', '1c382f50-3944-4cec-9fc7-2b7715a5918b', 'CAR020103-000005-1502757244837', '4', '1.00', '10000.00', '5', '2017-08-15 00:00:00', '8', '', '2017-08-15 08:35:43', ' ');
INSERT INTO `assetstrans` VALUES ('06f2fb5f-100a-4d83-8c1f-bb45350e2629', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451756047952', '1', '9.00', '75.00', '11', '2016-01-03 00:00:00', null, '', '2016-01-03 01:34:07', null);
INSERT INTO `assetstrans` VALUES ('09dbf196-61a0-4e66-ab84-deaa828352b2', '1c382f50-3944-4cec-9fc7-2b7715a5918b', 'CAR020103-000005-1502757244837', '2', '3.00', '10000.00', '1', '2017-08-15 00:00:00', '2', '', '2017-08-15 08:34:23', ' ');
INSERT INTO `assetstrans` VALUES ('2dc29d61-a5c9-4d87-9136-c4023290f60d', '1f6c1cb1-0eeb-4b6a-83b4-33f26efbbbd3', 'NOR010102-000006-1512144624328', '2', '2.00', '4980.00', '', '2018-01-10 08:26:11', '3', '', '2018-01-10 08:26:11', ' ');
INSERT INTO `assetstrans` VALUES ('46d93cee-ea58-4077-a4c3-f76a1ca8545c', 'e25fe510-8c5e-4375-866c-5bb6e7a3781e', 'CAR020202-000004-1502757850034', '4', '1.00', '50000.00', '6', '2017-08-15 00:00:00', '4', '', '2017-08-15 08:45:17', ' ');
INSERT INTO `assetstrans` VALUES ('4cca5f39-69b9-4e12-9ad0-842dddb6c5af', '3ea47311-dfa8-484d-8457-a18affd214a0', 'NOR010502-000003-1452188787399', '1', '10.00', '4899.00', '10', '2016-01-08 00:00:00', null, '', '2016-01-08 01:46:27', null);
INSERT INTO `assetstrans` VALUES ('609a13f7-5f18-4310-9c1e-517ab479bf8e', '7e32980d-fd4f-4b58-9b3d-576a85565f24', 'FIN040201-000003-1515570901359', '1', '2.00', '3.00', '11', '2018-01-10 00:00:00', ' ', '', '2018-01-10 15:55:01', ' ');
INSERT INTO `assetstrans` VALUES ('64f1354d-316b-4d07-a39a-89f257b73249', '1f6c1cb1-0eeb-4b6a-83b4-33f26efbbbd3', 'NOR010102-000006-1512144624328', '1', '2.00', '4980.00', ' ', '2017-12-02 00:10:24', ' ', '', '2017-12-02 00:10:24', ' ');
INSERT INTO `assetstrans` VALUES ('6ca84140-44a9-4ec9-9986-dde43cf609ce', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451754124317', '2', '3.00', '70.00', '10', '2016-01-07 00:00:00', '2', '', '2016-01-07 11:11:09', null);
INSERT INTO `assetstrans` VALUES ('6f0afc75-088d-407e-8bbe-1d14193343dd', '1f6c1cb1-0eeb-4b6a-83b4-33f26efbbbd3', 'NOR010102-000006-1515467329965', '1', '2.00', '2.00', '6', '2018-01-09 00:00:00', ' ', '', '2018-01-09 11:08:49', ' ');
INSERT INTO `assetstrans` VALUES ('78106761-f91a-45b2-8cbb-aa7eb2ff86e9', '3c9b3a49-2ac3-4d5d-99e4-85de2e455cfb', 'NOR010502-000004-1512145300831', '1', '10.00', '2000.00', ' ', '2017-12-02 00:21:40', ' ', '', '2017-12-02 00:21:40', ' ');
INSERT INTO `assetstrans` VALUES ('871d3305-4c8d-4959-9f62-a7f2402390f2', '1c382f50-3944-4cec-9fc7-2b7715a5918b', 'CAR020103-000005-1502757244837', '2', '3.00', '10000.00', '1', '2017-08-15 00:00:00', '5', '', '2017-08-15 08:34:44', ' ');
INSERT INTO `assetstrans` VALUES ('87f4c9ab-42a8-49c8-a89b-cac2b8a1301d', '1c382f50-3944-4cec-9fc7-2b7715a5918b', 'CAR020103-000005-1502757244837', '4', '1.00', '10000.00', '5', '2017-08-15 00:00:00', '12', '', '2017-08-15 08:37:18', ' ');
INSERT INTO `assetstrans` VALUES ('a03345a9-4cbe-42db-8346-220b9ba6315c', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451754124317', '4', '1.00', '70.00', '2', '2016-12-29 00:00:00', '3', '', '2016-12-29 15:41:59', null);
INSERT INTO `assetstrans` VALUES ('b3dccc6d-1f75-409b-b7a9-31d757c1bf40', '1c382f50-3944-4cec-9fc7-2b7715a5918b', 'CAR020103-000005-1502757244837', '1', '10.00', '10000.00', '1', '2017-08-15 00:00:00', ' ', '', '2017-08-15 08:34:04', ' ');
INSERT INTO `assetstrans` VALUES ('ba50d5a6-40d5-4fad-8ec9-5d4bc452cbd2', 'e25fe510-8c5e-4375-866c-5bb6e7a3781e', 'CAR020202-000004-1502757850034', '2', '3.00', '50000.00', '7', '2017-08-15 00:00:00', '6', '', '2017-08-15 08:44:56', ' ');
INSERT INTO `assetstrans` VALUES ('bc7f8ee4-8a21-41c5-a671-d98414e16aad', '6a07a98b-0f29-4852-9bf8-72fa584f09c1', 'PER030102-000001-1515645634992', '2', '3.00', '3.00', '', '2018-01-11 12:51:52', '3', '', '2018-01-11 12:51:52', ' ');
INSERT INTO `assetstrans` VALUES ('bcbe7b1d-5016-4594-b701-03e453bc365e', '3ea47311-dfa8-484d-8457-a18affd214a0', 'NOR010502-000003-1482997201881', '1', '10.00', '4900.00', '10', '2016-12-29 00:00:00', null, '', '2016-12-29 15:40:01', null);
INSERT INTO `assetstrans` VALUES ('c9b0c18e-2cd0-4c06-a903-cd310bd4062a', 'e25fe510-8c5e-4375-866c-5bb6e7a3781e', 'CAR020202-000004-1502757850034', '1', '15.00', '50000.00', '7', '2017-08-15 00:00:00', ' ', '', '2017-08-15 08:44:10', ' ');
INSERT INTO `assetstrans` VALUES ('cb633070-c52b-430e-8b08-b7e1a8f65b30', 'e25fe510-8c5e-4375-866c-5bb6e7a3781e', 'CAR020202-000004-1502757850034', '4', '1.00', '50000.00', '10', '2017-08-15 00:00:00', '7', '', '2017-08-15 08:55:09', ' ');
INSERT INTO `assetstrans` VALUES ('d46b324c-0acc-4f95-a7d5-c67bf735e616', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451754124317', '2', '2.00', '70.00', '10', '2016-01-07 00:00:00', '1', '222', '2016-01-07 11:12:33', null);
INSERT INTO `assetstrans` VALUES ('d4cf94fc-b39a-4367-9697-d85f00dfd83f', '3ea47311-dfa8-484d-8457-a18affd214a0', 'NOR010502-000003-1483000431710', '1', '5.00', '4900.00', '10', '2016-12-29 00:00:00', null, '', '2016-12-29 16:33:51', null);
INSERT INTO `assetstrans` VALUES ('d6fc1074-9261-488e-82bb-9d4f088746df', '6a07a98b-0f29-4852-9bf8-72fa584f09c8', 'NOR010102-000002-1452353456339', '1', '15.00', '1980.00', '11', '2016-01-09 00:00:00', null, '', '2016-01-09 23:30:56', null);
INSERT INTO `assetstrans` VALUES ('d76726bf-00c7-4d67-9e2f-3c7bb7b62d02', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451831236261', '2', '9.00', '100.00', '11', '2016-01-08 00:00:00', '5', '', '2016-01-08 00:12:28', null);
INSERT INTO `assetstrans` VALUES ('e06f1bcb-9d14-41ce-ae76-255a7379f90c', '3ea47311-dfa8-484d-8457-a18affd214a0', 'NOR010502-000003-1452188787399', '2', '1.00', '4899.00', '10', '2017-01-10 00:00:00', '5', '', '2017-01-10 14:55:44', null);
INSERT INTO `assetstrans` VALUES ('e438070c-aabc-49f6-b5f7-b7b88fb13221', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451831236261', '4', '1.00', '100.00', '5', '2017-08-15 00:00:00', '1', '', '2017-08-15 09:25:48', null);
INSERT INTO `assetstrans` VALUES ('ec8a6cf6-5f19-4759-9c5c-d0150e95b845', '3ea47311-dfa8-484d-8457-a18affd214a2', 'FIN040102-000002-1515571174123', '1', '3.00', '4.00', '11', '2018-01-10 00:00:00', ' ', '', '2018-01-10 15:59:34', ' ');
INSERT INTO `assetstrans` VALUES ('ee62d29e-b795-43d2-84d9-b20277a6f810', 'e25fe510-8c5e-4375-866c-5bb6e7a3781e', 'CAR020202-000004-1502757850034', '2', '6.00', '50000.00', '7', '2017-08-15 00:00:00', '10', '', '2017-08-15 08:44:31', ' ');
INSERT INTO `assetstrans` VALUES ('f3f4c5b6-4954-4e23-83a9-b583a2440fdc', '1f6c1cb1-0eeb-4b6a-83b4-33f26efbbbd3', 'NOR010102-000006-1515479846448', '1', '2.00', '3.00', '11', '2018-01-09 00:00:00', ' ', '', '2018-01-09 14:37:26', ' ');
INSERT INTO `assetstrans` VALUES ('f442df9f-83a6-4e07-b83c-d50c18e1eff7', '3ea47311-dfa8-484d-8457-a18affd214a0', 'NOR010502-000003-1452188787399', '2', '1.00', '4899.00', '10', '2016-12-29 00:00:00', '3', '', '2016-12-29 15:41:00', null);
INSERT INTO `assetstrans` VALUES ('f5e1ebe3-ab8b-4bdc-994c-cddd1f764dfe', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451754124317', '1', '10.00', '70.00', '10', '2016-01-03 00:00:00', null, null, null, null);
INSERT INTO `assetstrans` VALUES ('f8ba34fe-ba9d-4e92-ac0d-a46322f16bb8', '3ea47311-dfa8-484d-8457-a18affd214a0', 'NOR010502-000003-1452188787399', '4', '1.00', '4899.00', '5', '2017-08-15 00:00:00', '4', '', '2017-08-15 09:26:06', null);
INSERT INTO `assetstrans` VALUES ('f9d04b0c-dcfd-4aec-b52a-9840246b5044', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451754124317', '4', '2.00', '70.00', '10', '2016-01-08 00:00:00', '4', '', '2016-01-08 00:58:02', null);
INSERT INTO `assetstrans` VALUES ('fadc6ffa-a221-452b-ab31-ad9e123db43c', '212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001-1451831236261', '1', '9.00', '100.00', '11', '2016-01-03 00:00:00', null, '测试', '2016-01-03 22:27:16', null);
INSERT INTO `assetstrans` VALUES ('ff107572-87b3-4d81-9913-a0fe2dc3d398', '6a07a98b-0f29-4852-9bf8-72fa584f09c1', 'PER030102-000001-1515645634992', '1', '3.00', '3.00', '11', '2018-01-11 00:00:00', ' ', '', '2018-01-11 12:40:35', ' ');

-- ----------------------------
-- Table structure for `assets_car`
-- ----------------------------
DROP TABLE IF EXISTS `assets_car`;
CREATE TABLE `assets_car` (
  `id` varchar(40) NOT NULL,
  `assetsCode` varchar(32) NOT NULL,
  `assetsType` int(11) NOT NULL,
  `nameCn` varchar(45) DEFAULT ' ',
  `engineInfo` varchar(64) NOT NULL DEFAULT ' ',
  `carBrand` varchar(45) NOT NULL DEFAULT ' ',
  `carModel` varchar(45) NOT NULL DEFAULT ' ',
  `powerType` varchar(16) DEFAULT ' ' COMMENT '动力类型',
  `sitCount` int(11) DEFAULT '0',
  `autoTrans` tinyint(4) DEFAULT '1',
  `comment` text,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createUser` varchar(45) DEFAULT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_car
-- ----------------------------
INSERT INTO `assets_car` VALUES ('1c382f50-3944-4cec-9fc7-2b7715a5918b', 'CAR020103-000005', '42', '路虎', 'SEF252', '路虎', '极光', '-1', '5', '1', '', '2017-08-11 16:36:30', ' ');
INSERT INTO `assets_car` VALUES ('1e4a018e-3175-45ff-a675-98528395b932', 'CAR020301-000008', '47', '大板车', 'DS7585', '奔驰', 'FT-Y', '18', '20', '0', '大班车', '2017-08-11 15:31:11', ' ');
INSERT INTO `assets_car` VALUES ('2431283d-deeb-447b-9a2b-956d3b221378', 'CAR020103-000010', '42', '去去去', '1456151', '凄凄切切', '凄凄切切', '18', '5', '1', '', '2017-08-12 14:17:51', ' ');
INSERT INTO `assets_car` VALUES ('33473c4b-6ff9-4146-b0ce-44d3bb41a07b', 'CAR020203-000011', '45', '什么 啊', '123', '那你看', '那你看', '16', '5', '1', '', '2017-08-12 17:04:32', ' ');
INSERT INTO `assets_car` VALUES ('546523e2-e1e8-4d35-88a9-7671aca6a551', 'CAR020202-000003', '44', '大牵引', 'SDSA45852', '红旗', '冲锋', '16', '2', '0', '', '2017-08-11 16:29:02', ' ');
INSERT INTO `assets_car` VALUES ('7007cc8f-62c1-464a-b8cf-59ff039d0b72', 'CAR020103-000008', '42', 'SUV', 'DS5241', '路虎', '揽胜', '18', '5', '0', '', '2017-08-11 16:45:55', ' ');
INSERT INTO `assets_car` VALUES ('b9b0d626-698d-4695-a5c6-126ae94a8555', 'CAR020204-000007', '46', '灭火车', 'WDF8546', '奔驰', '救火员', '16', '2', '0', '', '2017-08-11 16:42:21', ' ');
INSERT INTO `assets_car` VALUES ('b9be6355-d3c6-440a-8a29-58cca88a548f', 'CAR020202-000012', '44', 'test', 'test', 'test', 'test', '15', '5', '1', 'test', '2017-08-13 15:24:31', ' ');
INSERT INTO `assets_car` VALUES ('c93ea3f8-bce8-48de-9978-5277dc145f86', 'CAR020302-000009', '48', '抢我', 'AAA2525', '抢我', '抢我', '16', '5', '0', 'AAA', '2017-08-12 14:14:52', ' ');
INSERT INTO `assets_car` VALUES ('e25fe510-8c5e-4375-866c-5bb6e7a3781e', 'CAR020202-000004', '44', '大牵引车', 'SED4585', '东方', '赫赫', '16', '3', '0', '', '2017-08-11 16:32:00', ' ');
INSERT INTO `assets_car` VALUES ('f011ffd7-4983-4b99-8c3f-abd41b878a91', 'CAR020102-000006', '41', '夏利', 'SDS525', '现代', '跃进', '15', '5', '0', '', '2017-08-11 16:38:36', ' ');
INSERT INTO `assets_car` VALUES ('f5e1ebe3-ab8b-4bdc-994c-cddd1f764df1', 'CAR020101-000001', '40', '领导用车', 'DD238474736262534', '奥迪', 'A6L', '15', '5', '1', null, '2016-01-10 16:12:08', ' ');
INSERT INTO `assets_car` VALUES ('f5e1ebe3-ab8b-4bdc-994c-cddd1f764df2', 'CAR020101-000002', '40', '部门经理用车', 'DE22384858843', '本田', '雅阁', '15', '5', '1', null, '2016-01-10 16:12:08', ' ');

-- ----------------------------
-- Table structure for `assets_finance`
-- ----------------------------
DROP TABLE IF EXISTS `assets_finance`;
CREATE TABLE `assets_finance` (
  `id` varchar(40) NOT NULL,
  `assetsCode` varchar(32) NOT NULL COMMENT '资产编码',
  `assetsType` int(11) NOT NULL COMMENT '资产类型',
  `nameCn` varchar(45) NOT NULL DEFAULT ' ' COMMENT '名称',
  `unitAmount` decimal(10,2) DEFAULT '0.00' COMMENT '单位金额',
  `financeType` varchar(45) DEFAULT ' ' COMMENT '金融资产类型',
  `organization` varchar(45) DEFAULT ' ' COMMENT '托管机构',
  `cycle` int(11) DEFAULT '0' COMMENT '托管周期（单位：月）',
  `autoCycle` int(11) DEFAULT '1' COMMENT '自动续期，1：自动，0：不自动',
  `refBankNo` varchar(45) DEFAULT ' ' COMMENT '关联银行账号',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `createUser` varchar(45) DEFAULT ' ' COMMENT '创建用户',
  `comment` text COMMENT '其他说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_finance
-- ----------------------------
INSERT INTO `assets_finance` VALUES ('3ea47311-dfa8-484d-8457-a18affd214a1', 'FIN040102-000001', '63', '公司流动资金', '1000000.00', '20', '建设银行', '1', '1', '622500389344483', '2016-01-10 16:15:04', ' ', null);
INSERT INTO `assets_finance` VALUES ('3ea47311-dfa8-484d-8457-a18affd214a2', 'FIN040102-000002', '63', '子公司流动资产', '100000.00', '21', '交通银行', '1', '0', '6883737474838', '2016-01-10 16:15:04', ' ', '');
INSERT INTO `assets_finance` VALUES ('7e32980d-fd4f-4b58-9b3d-576a85565f24', 'FIN040201-000003', '66', 'qq', '11.00', '20', '钱钱钱钱钱钱钱钱钱钱钱钱钱', '1', '0', 'qw', '2018-01-09 09:38:20', ' ', '');

-- ----------------------------
-- Table structure for `assets_normal`
-- ----------------------------
DROP TABLE IF EXISTS `assets_normal`;
CREATE TABLE `assets_normal` (
  `id` varchar(40) NOT NULL,
  `assetsCode` varchar(32) NOT NULL,
  `assetsType` int(11) NOT NULL,
  `nameCn` varchar(45) DEFAULT ' ',
  `normalBrand` varchar(45) DEFAULT ' ' COMMENT '资产品牌',
  `normalModel` varchar(45) DEFAULT ' ' COMMENT '资产型号',
  `packageType` int(11) DEFAULT '0' COMMENT '包装类型',
  `supplier` varchar(45) DEFAULT ' ' COMMENT '供货商',
  `supplierTel` varchar(45) DEFAULT ' ' COMMENT '供货商电话',
  `consumptive` tinyint(4) DEFAULT '0' COMMENT '是否为耗材',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createUser` varchar(45) DEFAULT ' ',
  `comment` varchar(45) DEFAULT NULL COMMENT '资产说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_normal
-- ----------------------------
INSERT INTO `assets_normal` VALUES ('1f6c1cb1-0eeb-4b6a-83b4-33f26efbbbd3', 'NOR010102-000006', '30', 'HP打印机', '惠普', 'A4打印机', '14', '京东', '1233', '0', '2017-11-27 17:19:29', ' ', '联网打印');
INSERT INTO `assets_normal` VALUES ('212ee9df-c755-44ba-9bb2-a5d3a61b3ec0', 'NOR010203-000001', '26', '办公椅', '宜家', 'DM-22123', '13', '宜家北京', '22383837', '1', null, null, '测试信息录入');
INSERT INTO `assets_normal` VALUES ('3c9b3a49-2ac3-4d5d-99e4-85de2e455cfb', 'NOR010502-000004', '37', 'HP笔记本电脑', '佳能', 'i5 8G 256SSD', '14', '京东', '123', '0', '2017-11-27 17:13:05', ' ', '好电脑');
INSERT INTO `assets_normal` VALUES ('3ea47311-dfa8-484d-8457-a18affd214a0', 'NOR010502-000003', '37', '教师用电脑', '联想', 'Thinkpad E431', '13', '联想中国', '233432423', '0', '2016-01-08 01:45:50', null, '快要淘汰了');
INSERT INTO `assets_normal` VALUES ('6a07a98b-0f29-4852-9bf8-72fa584f09c8', 'NOR010102-000002', '21', 'HP激光打印', 'HP', 'DE33384', '13', 'HP中国', '01023384848', '0', '2016-01-08 01:42:02', null, '');
INSERT INTO `assets_normal` VALUES ('d1ba7bfb-1d16-4ae5-bb85-8c74c5166b7e', 'NOR010501-000007', '36', 'SVN服务器', '群晖', '218j', '14', '京东', '23333323', '0', '2017-11-28 16:34:19', ' ', '');
INSERT INTO `assets_normal` VALUES ('dca0a9e6-bbf5-46ef-a796-e12240533028', 'NOR010502-000005', '37', '联想E470c', '联想ThinkPad', 'E470c i5 14寸 8G 500G', '14', '京东', '1233', '0', '2017-11-27 17:15:50', ' ', '也不错');
INSERT INTO `assets_normal` VALUES ('f8e094dd-b055-4f59-8946-d8858d91bfe6', 'NOR010101-000008', '20', '阿斯', 'qw', 'qw', '7', 'qwwwwwwwwwwwww', '11111111111', '0', '2018-01-08 12:03:23', ' ', '');

-- ----------------------------
-- Table structure for `assets_permanent`
-- ----------------------------
DROP TABLE IF EXISTS `assets_permanent`;
CREATE TABLE `assets_permanent` (
  `id` varchar(40) NOT NULL,
  `assetsCode` varchar(32) NOT NULL,
  `assetsType` int(11) NOT NULL,
  `city` varchar(45) DEFAULT ' ' COMMENT '所在城市',
  `address` varchar(128) DEFAULT ' ' COMMENT '具体地址',
  `scale` int(11) DEFAULT '0' COMMENT '出资比例',
  `util` varchar(8) DEFAULT ' ' COMMENT '购置单位',
  `area` decimal(10,2) DEFAULT '0.00' COMMENT '面积',
  `equityType` int(11) DEFAULT '0' COMMENT '房屋类型',
  `nameCn` varchar(45) DEFAULT ' ' COMMENT '资产名称',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createUser` varchar(45) DEFAULT ' ',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_permanent
-- ----------------------------
INSERT INTO `assets_permanent` VALUES ('6a07a98b-0f29-4852-9bf8-72fa584f09c1', 'PER030102-000001', '52', '2', '南开区华苑小区', '100', '总公司', '100.00', '23', '职工宿舍', '2016-01-10 16:19:05', ' ', null);
INSERT INTO `assets_permanent` VALUES ('6a07a98b-0f29-4852-9bf8-72fa584f09c2', 'PER030102-000002', '52', '2', '西青区时代奥城', '80', '分公司', '80.00', '23', '领导宿舍', '2016-01-10 16:19:05', ' ', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `nameCn` varchar(45) NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '01', null, '普通资产', null);
INSERT INTO `category` VALUES ('2', '02', null, '车辆', null);
INSERT INTO `category` VALUES ('3', '03', null, '不动产', null);
INSERT INTO `category` VALUES ('4', '04', null, '金融资产', null);
INSERT INTO `category` VALUES ('5', '0101', '1', '办公设备', null);
INSERT INTO `category` VALUES ('6', '0102', '1', '家具', null);
INSERT INTO `category` VALUES ('7', '0103', '1', '办公耗材', null);
INSERT INTO `category` VALUES ('8', '0104', '1', '测量仪器', null);
INSERT INTO `category` VALUES ('9', '0105', '1', '电脑', null);
INSERT INTO `category` VALUES ('10', '0106', '1', '卫生洁具', null);
INSERT INTO `category` VALUES ('11', '0201', '2', '普通车辆', null);
INSERT INTO `category` VALUES ('12', '0202', '2', '工程车辆', null);
INSERT INTO `category` VALUES ('13', '0203', '2', '通勤班车', null);
INSERT INTO `category` VALUES ('14', '0301', '3', '住宅', null);
INSERT INTO `category` VALUES ('15', '0302', '3', '办公', null);
INSERT INTO `category` VALUES ('16', '0303', '3', '仓储', null);
INSERT INTO `category` VALUES ('17', '0401', '4', '银行', null);
INSERT INTO `category` VALUES ('18', '0402', '4', '金融投资', null);
INSERT INTO `category` VALUES ('19', '0403', '4', '借贷', null);
INSERT INTO `category` VALUES ('20', '010101', '5', '复印机', null);
INSERT INTO `category` VALUES ('21', '010102', '5', '打印机', null);
INSERT INTO `category` VALUES ('22', '010103', '5', '碎纸机', null);
INSERT INTO `category` VALUES ('23', '010104', '5', '传真机', null);
INSERT INTO `category` VALUES ('24', '010201', '6', '老板桌', null);
INSERT INTO `category` VALUES ('25', '010202', '6', '老板椅', null);
INSERT INTO `category` VALUES ('26', '010203', '6', '办公椅', null);
INSERT INTO `category` VALUES ('27', '010204', '6', '办公桌', null);
INSERT INTO `category` VALUES ('28', '010205', '6', '会议桌', null);
INSERT INTO `category` VALUES ('29', '010206', '6', '白板', null);
INSERT INTO `category` VALUES ('30', '010301', '7', '水笔（黑）', null);
INSERT INTO `category` VALUES ('31', '010302', '7', '打印纸', null);
INSERT INTO `category` VALUES ('32', '010303', '7', '硒鼓', null);
INSERT INTO `category` VALUES ('33', '010304', '7', '记事本', null);
INSERT INTO `category` VALUES ('34', '010401', '8', '激光测距仪', null);
INSERT INTO `category` VALUES ('35', '010402', '8', '声波测距仪', null);
INSERT INTO `category` VALUES ('36', '010501', '9', '台式机', null);
INSERT INTO `category` VALUES ('37', '010502', '9', '笔记本电脑', null);
INSERT INTO `category` VALUES ('38', '010601', '10', '吸尘器', null);
INSERT INTO `category` VALUES ('39', '010602', '10', '其他清扫设备', null);
INSERT INTO `category` VALUES ('40', '020101', '11', '三厢轿车', null);
INSERT INTO `category` VALUES ('41', '020102', '11', '两厢轿车', null);
INSERT INTO `category` VALUES ('42', '020103', '11', 'SUV车辆', null);
INSERT INTO `category` VALUES ('43', '020201', '12', '皮卡', null);
INSERT INTO `category` VALUES ('44', '020202', '12', '牵引车', null);
INSERT INTO `category` VALUES ('45', '020203', '12', '载重车辆', null);
INSERT INTO `category` VALUES ('46', '020204', '12', '特种灭火车', null);
INSERT INTO `category` VALUES ('47', '020301', '13', 'MPV', null);
INSERT INTO `category` VALUES ('48', '020302', '13', '17座轻型客车', null);
INSERT INTO `category` VALUES ('49', '020303', '13', '中型客车', null);
INSERT INTO `category` VALUES ('50', '020304', '13', '大型客车', null);
INSERT INTO `category` VALUES ('51', '030101', '14', '洋房', null);
INSERT INTO `category` VALUES ('52', '030102', '14', '高层', null);
INSERT INTO `category` VALUES ('53', '030103', '14', '独栋别墅', null);
INSERT INTO `category` VALUES ('54', '030104', '14', 'Loft', null);
INSERT INTO `category` VALUES ('55', '030201', '15', '写字间', null);
INSERT INTO `category` VALUES ('56', '030202', '15', '办公楼', null);
INSERT INTO `category` VALUES ('57', '030203', '15', '商住两用', null);
INSERT INTO `category` VALUES ('58', '030301', '16', '维修车间', null);
INSERT INTO `category` VALUES ('59', '030302', '16', '露天堆场', null);
INSERT INTO `category` VALUES ('60', '030303', '16', '低温冷藏', null);
INSERT INTO `category` VALUES ('61', '030304', '16', '封闭式仓库', null);
INSERT INTO `category` VALUES ('62', '040101', '17', '活期存款', null);
INSERT INTO `category` VALUES ('63', '040102', '17', '定期存款', null);
INSERT INTO `category` VALUES ('64', '040103', '17', '理财产品', null);
INSERT INTO `category` VALUES ('65', '040104', '17', '协议存款', null);
INSERT INTO `category` VALUES ('66', '040201', '18', '债券', null);
INSERT INTO `category` VALUES ('67', '040202', '18', '股票', null);
INSERT INTO `category` VALUES ('68', '040203', '18', '基金', null);
INSERT INTO `category` VALUES ('69', '040301', '19', '短期债权', null);
INSERT INTO `category` VALUES ('70', '040302', '19', '长期债权', null);

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empNo` varchar(45) NOT NULL,
  `namecn` varchar(45) NOT NULL,
  `reportTo` int(11) DEFAULT NULL,
  `dept` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'BD0010001', '刘青', null, '北京开发部');
INSERT INTO `employee` VALUES ('2', 'BD0010002', '王海川', '1', '北京开发部');
INSERT INTO `employee` VALUES ('3', 'BD0020003', '楚风韩', null, '北京人力资源部');
INSERT INTO `employee` VALUES ('4', 'BD0010004', '王光伟', '1', '北京开发部');
INSERT INTO `employee` VALUES ('5', 'BD0030005', '曲苗', null, '北京财务部');
INSERT INTO `employee` VALUES ('6', 'BD0010006', '君迪', '1', '北京开发部');
INSERT INTO `employee` VALUES ('7', 'TD0010001', '田武圣', null, '天津开发部');
INSERT INTO `employee` VALUES ('8', 'TD0010002', '王川', '7', '天津开发部');
INSERT INTO `employee` VALUES ('9', 'TD0010003', '刘青', '7', '天津开发部');
INSERT INTO `employee` VALUES ('10', 'TD0020004', '林晓', null, '天津行政事业部');
INSERT INTO `employee` VALUES ('11', 'BD0040007', '王枭', null, '北京行政事业部');
INSERT INTO `employee` VALUES ('12', 'TD0030005', '吴光明', null, '天津财务部');

-- ----------------------------
-- Table structure for `sysdictvalue`
-- ----------------------------
DROP TABLE IF EXISTS `sysdictvalue`;
CREATE TABLE `sysdictvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeCode` varchar(16) NOT NULL,
  `value` varchar(45) NOT NULL,
  `display` varchar(45) NOT NULL,
  `desc` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysdictvalue
-- ----------------------------
INSERT INTO `sysdictvalue` VALUES ('1', 'city', '01', '北京', null);
INSERT INTO `sysdictvalue` VALUES ('2', 'city', '02', '上海', null);
INSERT INTO `sysdictvalue` VALUES ('3', 'city', '03', '天津', null);
INSERT INTO `sysdictvalue` VALUES ('4', 'city', '04', '成都', null);
INSERT INTO `sysdictvalue` VALUES ('5', 'city', '05', '广州', null);
INSERT INTO `sysdictvalue` VALUES ('6', 'packageType', '01', '桶', null);
INSERT INTO `sysdictvalue` VALUES ('7', 'packageType', '02', '瓶', null);
INSERT INTO `sysdictvalue` VALUES ('8', 'packageType', '03', '箱', null);
INSERT INTO `sysdictvalue` VALUES ('9', 'packageType', '04', '袋', null);
INSERT INTO `sysdictvalue` VALUES ('10', 'packageType', '05', '盒', null);
INSERT INTO `sysdictvalue` VALUES ('11', 'packageType', '06', '罐', null);
INSERT INTO `sysdictvalue` VALUES ('12', 'packageType', '07', '散装', null);
INSERT INTO `sysdictvalue` VALUES ('13', 'packageType', '08', '套', null);
INSERT INTO `sysdictvalue` VALUES ('14', 'packageType', '09', '台', null);
INSERT INTO `sysdictvalue` VALUES ('15', 'powerType', '01', '汽油', null);
INSERT INTO `sysdictvalue` VALUES ('16', 'powerType', '02', '柴油', null);
INSERT INTO `sysdictvalue` VALUES ('17', 'powerType', '03', '纯电', null);
INSERT INTO `sysdictvalue` VALUES ('18', 'powerType', '04', '混动', null);
INSERT INTO `sysdictvalue` VALUES ('19', 'financeType', '01', '股票', null);
INSERT INTO `sysdictvalue` VALUES ('20', 'financeType', '02', '定期', null);
INSERT INTO `sysdictvalue` VALUES ('21', 'financeType', '03', '债券', null);
INSERT INTO `sysdictvalue` VALUES ('22', 'financeType', '04', '理财', null);
INSERT INTO `sysdictvalue` VALUES ('23', 'equityType', '01', '私有', null);
INSERT INTO `sysdictvalue` VALUES ('24', 'equityType', '02', '公产', null);
INSERT INTO `sysdictvalue` VALUES ('25', 'equityType', '03', '企业产', null);

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `nickName` varchar(45) DEFAULT NULL,
  `role` varchar(16) NOT NULL DEFAULT 'admin',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'admin', '1234', '系统管理员', '系统管理', '2015-12-23 16:09:30');
INSERT INTO `sysuser` VALUES ('2', 'normal', 'ZwsUcorZkCrsujLiL6T2vQ==', '普通资产管理员', '普通资产', '2015-12-23 16:11:18');
INSERT INTO `sysuser` VALUES ('3', 'permanent', 'ZwsUcorZkCrsujLiL6T2vQ==', '固定资产管理员', '固定资产', '2015-12-23 16:11:18');
INSERT INTO `sysuser` VALUES ('4', 'car', 'ZwsUcorZkCrsujLiL6T2vQ==', '车辆管理', '车辆资产', '2015-12-23 16:11:19');
INSERT INTO `sysuser` VALUES ('5', 'finance', 'ZwsUcorZkCrsujLiL6T2vQ==', '财务总监', '财务资产', '2015-12-23 16:11:19');

-- ----------------------------
-- View structure for `allassets`
-- ----------------------------
DROP VIEW IF EXISTS `allassets`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allassets` AS select `assets_normal`.`id` AS `id`,`assets_normal`.`assetsCode` AS `assetsCode`,`assets_normal`.`assetsType` AS `assetsType`,`assets_normal`.`nameCn` AS `nameCn`,`assets_normal`.`comment` AS `comment` from `assets_normal` union select `assets_car`.`id` AS `id`,`assets_car`.`assetsCode` AS `assetsCode`,`assets_car`.`assetsType` AS `assetsType`,`assets_car`.`nameCn` AS `nameCn`,`assets_car`.`comment` AS `comment` from `assets_car` union select `assets_finance`.`id` AS `id`,`assets_finance`.`assetsCode` AS `assetsCode`,`assets_finance`.`assetsType` AS `assetsType`,`assets_finance`.`nameCn` AS `nameCn`,`assets_finance`.`comment` AS `comment` from `assets_finance` union select `assets_permanent`.`id` AS `id`,`assets_permanent`.`assetsCode` AS `assetsCode`,`assets_permanent`.`assetsType` AS `assetsType`,`assets_permanent`.`nameCn` AS `nameCn`,`assets_permanent`.`comment` AS `comment` from `assets_permanent` ;

-- ----------------------------
-- View structure for `alltranslist`
-- ----------------------------
DROP VIEW IF EXISTS `alltranslist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `alltranslist` AS select `assetstrans`.`id` AS `id`,`assetstrans`.`assetsId` AS `assetsid`,(select `allassets`.`assetsType` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetstype`,`assetstrans`.`batchNo` AS `batchno`,`assetstrans`.`transType` AS `transtype`,`assetstrans`.`count` AS `count`,`assetstrans`.`price` AS `price`,`assetstrans`.`handlerEmp` AS `handleremp`,ifnull((select `employee`.`namecn` from `employee` where (`assetstrans`.`handlerEmp` = `employee`.`id`)),'') AS `handlerEmpName`,`assetstrans`.`instockTime` AS `instocktime`,ifnull(`assetstrans`.`targetEmp`,-(1)) AS `targetemp`,ifnull((select `employee`.`namecn` from `employee` where (`assetstrans`.`targetEmp` = `employee`.`id`)),'') AS `targetEmpName`,ifnull(`assetstrans`.`comment`,'') AS `comment`,ifnull(`assetstrans`.`createTime`,now()) AS `createtime`,ifnull(`assetstrans`.`createUser`,'') AS `createuser` from `assetstrans` order by `assetstrans`.`createTime` ;

-- ----------------------------
-- View structure for `categoryparent`
-- ----------------------------
DROP VIEW IF EXISTS `categoryparent`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `categoryparent` AS select distinct `c1`.`parentId` AS `parentId`,(select `c2`.`nameCn` from `category` `c2` where (`c2`.`id` = `c1`.`parentId`)) AS `nameCn` from `category` `c1` where (`c1`.`parentId` is not null) ;

-- ----------------------------
-- View structure for `checkinlist`
-- ----------------------------
DROP VIEW IF EXISTS `checkinlist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `checkinlist` AS select `assetstrans`.`id` AS `id`,`assetstrans`.`assetsId` AS `assetsid`,(select `allassets`.`nameCn` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetsNameCn`,(select `allassets`.`assetsCode` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetsCode`,(select `allassets`.`assetsType` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetstype`,`assetstrans`.`batchNo` AS `batchno`,`assetstrans`.`transType` AS `transtype`,`assetstrans`.`count` AS `count`,(`assetstrans`.`count` - ifnull((select sum(`alltranslist`.`count`) from `alltranslist` where ((`alltranslist`.`batchno` = `assetstrans`.`batchNo`) and (`alltranslist`.`transtype` = 2)) group by `alltranslist`.`batchno`),0)) AS `currentAmount`,`assetstrans`.`price` AS `price`,ifnull(`assetstrans`.`handlerEmp`,'') AS `handleremp`,ifnull((select `employee`.`namecn` from `employee` where (`assetstrans`.`handlerEmp` = `employee`.`id`)),'') AS `handlerEmpName`,ifnull(`assetstrans`.`instockTime`,now()) AS `instocktime`,ifnull(`assetstrans`.`targetEmp`,'') AS `targetemp`,ifnull((select `employee`.`namecn` from `employee` where (`assetstrans`.`targetEmp` = `employee`.`id`)),'') AS `targetEmpName`,ifnull(`assetstrans`.`comment`,'') AS `comment`,ifnull(`assetstrans`.`createTime`,now()) AS `createtime`,ifnull(`assetstrans`.`createUser`,'') AS `createuser` from `assetstrans` where (`assetstrans`.`transType` = 1) ;

-- ----------------------------
-- View structure for `checkoutlist`
-- ----------------------------
DROP VIEW IF EXISTS `checkoutlist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `checkoutlist` AS select `assetstrans`.`id` AS `id`,`assetstrans`.`assetsId` AS `assetsid`,(select `allassets`.`nameCn` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetsNameCn`,(select `allassets`.`assetsCode` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetsCode`,(select `allassets`.`assetsType` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetstype`,`assetstrans`.`batchNo` AS `batchno`,`assetstrans`.`transType` AS `transtype`,(`assetstrans`.`count` - ifnull((select sum(`alltranslist`.`count`) from `alltranslist` where ((`alltranslist`.`batchno` = `assetstrans`.`batchNo`) and ((`alltranslist`.`transtype` = 3) or (`alltranslist`.`transtype` = 4))) group by `alltranslist`.`batchno`),0)) AS `currentAmount`,`assetstrans`.`count` AS `count`,`assetstrans`.`price` AS `price`,`assetstrans`.`handlerEmp` AS `handleremp`,ifnull((select `employee`.`namecn` from `employee` where (`assetstrans`.`handlerEmp` = `employee`.`id`)),'') AS `handlerEmpName`,`assetstrans`.`instockTime` AS `instocktime`,`assetstrans`.`targetEmp` AS `targetemp`,ifnull((select `employee`.`namecn` from `employee` where (`assetstrans`.`targetEmp` = `employee`.`id`)),'') AS `targetEmpName`,ifnull(`assetstrans`.`comment`,'') AS `comment`,ifnull(`assetstrans`.`createTime`,now()) AS `createtime`,ifnull(`assetstrans`.`createUser`,'') AS `createuser` from `assetstrans` where (`assetstrans`.`transType` = 2) ;

-- ----------------------------
-- View structure for `destroylist`
-- ----------------------------
DROP VIEW IF EXISTS `destroylist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `destroylist` AS select `assetstrans`.`id` AS `id`,`assetstrans`.`assetsId` AS `assetsid`,(select `allassets`.`assetsType` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetstype`,`assetstrans`.`batchNo` AS `batchno`,`assetstrans`.`transType` AS `transtype`,`assetstrans`.`count` AS `count`,`assetstrans`.`price` AS `price`,`assetstrans`.`handlerEmp` AS `handleremp`,(select `employee`.`namecn` from `employee` where (`assetstrans`.`handlerEmp` = `employee`.`id`)) AS `handlerEmpName`,`assetstrans`.`instockTime` AS `instocktime`,`assetstrans`.`targetEmp` AS `targetemp`,(select `employee`.`namecn` from `employee` where (`assetstrans`.`targetEmp` = `employee`.`id`)) AS `targetEmpName`,`assetstrans`.`comment` AS `comment`,`assetstrans`.`createTime` AS `createtime`,`assetstrans`.`createUser` AS `createuser` from `assetstrans` where (`assetstrans`.`transType` = 3) ;

-- ----------------------------
-- View structure for `dicttype`
-- ----------------------------
DROP VIEW IF EXISTS `dicttype`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dicttype` AS select distinct `sysdictvalue`.`typeCode` AS `typeCode` from `sysdictvalue` ;

-- ----------------------------
-- View structure for `empdept`
-- ----------------------------
DROP VIEW IF EXISTS `empdept`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empdept` AS select distinct `employee`.`dept` AS `dept` from `employee` order by `employee`.`dept` ;

-- ----------------------------
-- View structure for `shiftlist`
-- ----------------------------
DROP VIEW IF EXISTS `shiftlist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shiftlist` AS select `assetstrans`.`id` AS `id`,`assetstrans`.`assetsId` AS `assetsid`,(select `allassets`.`assetsType` from `allassets` where (`allassets`.`id` = `assetstrans`.`assetsId`)) AS `assetstype`,`assetstrans`.`batchNo` AS `batchno`,`assetstrans`.`transType` AS `transtype`,`assetstrans`.`count` AS `count`,`assetstrans`.`price` AS `price`,`assetstrans`.`handlerEmp` AS `handleremp`,(select `employee`.`namecn` from `employee` where (`assetstrans`.`handlerEmp` = `employee`.`id`)) AS `handlerEmpName`,`assetstrans`.`instockTime` AS `instocktime`,`assetstrans`.`targetEmp` AS `targetemp`,(select `employee`.`namecn` from `employee` where (`assetstrans`.`targetEmp` = `employee`.`id`)) AS `targetEmpName`,`assetstrans`.`comment` AS `comment`,`assetstrans`.`createTime` AS `createtime`,`assetstrans`.`createUser` AS `createuser` from `assetstrans` where (`assetstrans`.`transType` = 4) ;

-- ----------------------------
-- View structure for `sysuserrole`
-- ----------------------------
DROP VIEW IF EXISTS `sysuserrole`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sysuserrole` AS select distinct `sysuser`.`role` AS `role` from `sysuser` order by `sysuser`.`role` ;
