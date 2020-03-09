/*
Navicat MySQL Data Transfer

Source Server         : myConn
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : badminton_mall

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2020-03-09 08:49:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('2', 'admin', '96e79218965eb72c92a549dd5a330112', '管理员', '0');
INSERT INTO `admin_user` VALUES ('3', 'admin1', '96e79218965eb72c92a549dd5a330112', 'admin1', '0');
INSERT INTO `admin_user` VALUES ('5', 'admin2', '96e79218965eb72c92a549dd5a330112', 'admin2', '0');

-- ----------------------------
-- Table structure for business_user
-- ----------------------------
DROP TABLE IF EXISTS `business_user`;
CREATE TABLE `business_user` (
  `business_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(50) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `locked` tinyint(4) unsigned zerofill DEFAULT '0000' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`business_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_user
-- ----------------------------
INSERT INTO `business_user` VALUES ('1', 'business', 'business', '96e79218965eb72c92a549dd5a330112', '0000');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页轮播图主键id',
  `carousel_url` varchar(100) NOT NULL DEFAULT '' COMMENT '轮播图',
  `redirect_url` varchar(100) NOT NULL DEFAULT '''##''' COMMENT '点击后的跳转地址(默认不跳转)',
  `carousel_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int(11) NOT NULL DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES ('1', 'http://localhost:8080/upload/20200307_19181692.jpg', 'http://localhost:8080/goods/detail/10896', '0', '0', '2020-03-07 20:27:01', '0', '2020-03-07 20:27:01', '0');
INSERT INTO `carousel` VALUES ('2', 'http://localhost:8080/upload/20200307_19264852.jpg', 'http://localhost:8080/goods/detail/10897', '0', '0', '2020-03-07 20:27:01', '0', '2020-03-07 20:27:01', '0');
INSERT INTO `carousel` VALUES ('3', 'http://localhost:8080/upload/20200308_22163195.jpg', '##', '0', '1', '2020-03-08 22:16:34', '0', '2020-03-08 22:17:02', '0');

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item` (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `goods_count` int(11) NOT NULL DEFAULT '1' COMMENT '数量(最大为5)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`cart_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_item
-- ----------------------------
INSERT INTO `cart_item` VALUES ('1', '9', '10896', '5', '1', '2020-03-07 22:02:27', '2020-03-07 22:02:38');
INSERT INTO `cart_item` VALUES ('2', '9', '10897', '1', '1', '2020-03-07 23:18:54', '2020-03-07 23:18:54');
INSERT INTO `cart_item` VALUES ('3', '9', '10898', '1', '1', '2020-03-07 23:19:00', '2020-03-07 23:19:00');

-- ----------------------------
-- Table structure for consumer_user
-- ----------------------------
DROP TABLE IF EXISTS `consumer_user`;
CREATE TABLE `consumer_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
  `password_md5` varchar(32) NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
  `introduce_sign` varchar(100) NOT NULL DEFAULT '' COMMENT '个性签名',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '收货地址',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '注销标识字段(0-正常 1-已注销)',
  `locked_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of consumer_user
-- ----------------------------
INSERT INTO `consumer_user` VALUES ('9', '小二', '13111111111', '96e79218965eb72c92a549dd5a330112', '首位体验用户', '湖北省荆州市长江大学文理学院西校区', '0', '0', '2020-03-06 12:03:26');

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父分类id',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int(11) DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('1', '1', '0', '羽毛球', '100', '0', '2020-03-07 18:33:58', '0', '2020-03-07 18:33:58', '0');
INSERT INTO `goods_category` VALUES ('2', '1', '0', '羽毛球鞋', '98', '0', '2020-03-07 18:34:29', '0', '2020-03-07 18:34:29', '0');
INSERT INTO `goods_category` VALUES ('3', '2', '1', 'REZC5系列羽毛球', '10', '0', '2020-03-07 18:39:42', '0', '2020-03-07 18:39:42', '0');
INSERT INTO `goods_category` VALUES ('4', '2', '1', '李宁系列羽毛球', '9', '0', '2020-03-07 18:43:26', '0', '2020-03-07 18:43:26', '0');
INSERT INTO `goods_category` VALUES ('5', '2', '1', 'EASWNN羽毛球系列', '8', '0', '2020-03-07 18:44:55', '0', '2020-03-07 18:44:55', '0');
INSERT INTO `goods_category` VALUES ('6', '2', '2', 'EASWNN专业羽毛球鞋', '10', '0', '2020-03-07 18:45:22', '0', '2020-03-07 18:45:22', '0');
INSERT INTO `goods_category` VALUES ('7', '2', '2', '李宁系列羽毛球鞋', '9', '0', '2020-03-07 18:46:30', '0', '2020-03-07 18:46:30', '0');
INSERT INTO `goods_category` VALUES ('8', '2', '2', 'YONEX/尤尼克斯新款羽毛球鞋', '8', '0', '2020-03-07 18:47:31', '0', '2020-03-07 18:47:31', '0');
INSERT INTO `goods_category` VALUES ('9', '1', '0', '羽毛球拍', '99', '0', '2020-03-07 18:50:39', '0', '2020-03-07 18:50:39', '0');
INSERT INTO `goods_category` VALUES ('10', '2', '9', 'YONEX/尤尼克斯羽毛球拍', '10', '0', '2020-03-07 18:51:19', '0', '2020-03-07 18:51:19', '0');
INSERT INTO `goods_category` VALUES ('11', '2', '9', 'VICTOR/威克多羽毛球拍', '9', '0', '2020-03-07 18:51:50', '0', '2020-03-07 18:51:50', '0');
INSERT INTO `goods_category` VALUES ('12', '2', '9', '李宁专业羽毛球拍', '8', '0', '2020-03-07 18:52:10', '0', '2020-03-07 18:52:10', '0');
INSERT INTO `goods_category` VALUES ('13', '1', '0', '羽毛球衣', '97', '0', '2020-03-07 18:53:25', '0', '2020-03-07 18:53:25', '0');
INSERT INTO `goods_category` VALUES ('14', '2', '13', '新款YY男女同款羽毛球服', '10', '0', '2020-03-07 18:54:10', '0', '2020-03-07 18:54:10', '0');
INSERT INTO `goods_category` VALUES ('15', '2', '13', '尤尼克斯羽毛球衣', '9', '0', '2020-03-07 18:54:37', '0', '2020-03-07 18:54:37', '0');
INSERT INTO `goods_category` VALUES ('16', '2', '13', '李宁国家队羽毛球衣', '8', '0', '2020-03-07 18:55:10', '0', '2020-03-07 18:55:10', '0');
INSERT INTO `goods_category` VALUES ('17', '1', '0', '羽毛球包', '96', '0', '2020-03-07 18:56:38', '0', '2020-03-07 18:56:38', '0');
INSERT INTO `goods_category` VALUES ('18', '2', '17', 'REZ羽毛球包', '10', '0', '2020-03-07 18:57:12', '0', '2020-03-07 18:57:12', '0');
INSERT INTO `goods_category` VALUES ('19', '2', '17', 'VICTOR/威克多', '9', '0', '2020-03-07 18:57:40', '0', '2020-03-07 18:57:40', '0');
INSERT INTO `goods_category` VALUES ('20', '2', '17', '李宁羽毛球包', '8', '0', '2020-03-07 18:58:04', '0', '2020-03-07 18:58:04', '0');
INSERT INTO `goods_category` VALUES ('21', '1', '0', '运动护具', '95', '0', '2020-03-07 19:05:16', '0', '2020-03-07 19:05:16', '0');
INSERT INTO `goods_category` VALUES ('22', '2', '21', 'REZ专业运动护膝', '10', '0', '2020-03-07 19:06:17', '0', '2020-03-07 19:06:17', '0');
INSERT INTO `goods_category` VALUES ('23', '2', '21', 'REZ专业运动护腕', '9', '0', '2020-03-07 19:06:36', '0', '2020-03-07 19:06:36', '0');
INSERT INTO `goods_category` VALUES ('24', '2', '21', '一隼专业髌骨带', '8', '0', '2020-03-07 19:07:19', '0', '2020-03-07 19:07:19', '0');
INSERT INTO `goods_category` VALUES ('25', '3', '3', '专业级', '10', '0', '2020-03-07 19:15:51', '0', '2020-03-07 19:15:51', '0');
INSERT INTO `goods_category` VALUES ('26', '3', '3', '业余级', '0', '0', '2020-03-07 19:16:09', '0', '2020-03-07 19:16:09', '0');
INSERT INTO `goods_category` VALUES ('27', '3', '6', '专业级', '0', '0', '2020-03-07 19:20:33', '0', '2020-03-07 19:20:33', '0');
INSERT INTO `goods_category` VALUES ('28', '3', '6', '业余级', '0', '0', '2020-03-07 19:20:49', '0', '2020-03-07 19:20:49', '0');
INSERT INTO `goods_category` VALUES ('29', '3', '10', '专业级', '0', '0', '2020-03-07 19:21:21', '0', '2020-03-07 19:21:21', '0');
INSERT INTO `goods_category` VALUES ('30', '3', '10', '业余级', '0', '0', '2020-03-07 19:21:34', '0', '2020-03-07 19:21:34', '0');
INSERT INTO `goods_category` VALUES ('31', '3', '14', '专业级', '0', '0', '2020-03-07 19:21:51', '0', '2020-03-07 19:21:51', '0');
INSERT INTO `goods_category` VALUES ('32', '3', '14', '业余级', '0', '0', '2020-03-07 19:22:03', '0', '2020-03-07 19:22:03', '0');
INSERT INTO `goods_category` VALUES ('33', '3', '18', '专业级', '0', '0', '2020-03-07 19:22:29', '0', '2020-03-07 19:22:29', '0');
INSERT INTO `goods_category` VALUES ('34', '3', '18', '业余级', '0', '0', '2020-03-07 19:22:42', '0', '2020-03-07 19:22:42', '0');
INSERT INTO `goods_category` VALUES ('35', '3', '22', '专业级', '0', '0', '2020-03-07 19:23:00', '0', '2020-03-07 19:23:00', '0');
INSERT INTO `goods_category` VALUES ('36', '3', '22', '业余级', '0', '0', '2020-03-07 19:23:15', '0', '2020-03-07 19:23:15', '0');

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `goods_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品表主键id',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名',
  `goods_intro` varchar(200) NOT NULL DEFAULT '' COMMENT '商品简介',
  `goods_category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联分类id',
  `goods_cover_img` varchar(200) NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
  `goods_carousel` varchar(500) NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品轮播图',
  `goods_detail_content` text NOT NULL COMMENT '商品详情',
  `original_price` int(11) NOT NULL DEFAULT '1' COMMENT '商品价格',
  `selling_price` int(11) NOT NULL DEFAULT '1' COMMENT '商品实际售价',
  `stock_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存数量',
  `tag` varchar(20) NOT NULL DEFAULT '' COMMENT '商品标签',
  `goods_sell_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品上架状态 0-下架 1-上架',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '添加者主键id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品添加时间',
  `update_user` int(11) NOT NULL DEFAULT '0' COMMENT '修改者主键id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品修改时间',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10902 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES ('10896', 'REZC5系列羽毛球 C5', 'C5S水鸭全圆/C5N水鸭大方/C5SW水鸭全圆', '25', 'http://localhost:8080/upload/20200307_19181692.jpg', 'http://localhost:8080/upload/20200307_19181692.jpg', '<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/orgin/goods/2019/03/12/56660db4c8c8833abf5ca678e49bc9ba.jpg_X_RESIZE_800_800.jpg\" /> \n</p>\n<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/orgin/goods/2018/09/30/004864ff7aa3b8fb5e2af4412bfeaecc.jpg_X_RESIZE_800_800.jpg\" /> \n</p>\n<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/orgin/goods/2018/09/30/2ad1e46c2e424f95d8497113090351d7.jpg_X_RESIZE_800_800.jpg\" /> \n</p>', '6', '10', '95', '专业羽毛球', '0', '0', '2020-03-07 19:18:18', '0', '2020-03-07 21:08:36');
INSERT INTO `goods_info` VALUES ('10897', 'YONEX疾光800羽毛球拍NF800', '专业级球拍，给你更好的体验', '29', 'http://localhost:8080/upload/20200307_19264852.jpg', 'http://localhost:8080/upload/20200307_19264852.jpg', '<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/orgin/goods/2019/08/29/1b99a738e81acbd0526110d7684d598e.jpg_X_RESIZE_800_800.jpg\" /> \n</p>\n<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/orgin/goods/2019/08/29/61767689c7667bb7f39e3f778fa9c281.jpg_X_RESIZE_800_800.jpg\" /><img src=\"http://imgm.tiyushe.com/upload/images/orgin/goods/2019/08/29/2c67cbcb68add96d40d0305061733254.jpg_X_RESIZE_800_800.jpg\" /> \n</p>', '200', '300', '99', '专业羽毛球拍', '0', '0', '2020-03-07 19:26:49', '0', '2020-03-07 21:08:13');
INSERT INTO `goods_info` VALUES ('10898', 'EASWNN/一隼 专业羽毛球鞋', '一隼CNS2.0 全新上市全面預售', '27', 'http://localhost:8080/upload/20200307_2104321.jpg', 'http://localhost:8080/upload/20200307_2104321.jpg', '<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/orgin/goods/2019/12/11/ba51d6fceb6abbbd48251586266995ed.jpg_X_RESIZE_800_800.jpg\" />\n</p>\n<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/edit/2019/12/11/a862f75756853cc1caaf3e09e3d94c3c.jpg\" />\n</p>', '200', '248', '99', '专业球鞋', '0', '0', '2020-03-07 21:04:35', '0', '2020-03-07 21:04:35');
INSERT INTO `goods_info` VALUES ('10899', '新款YY男女同款羽毛球服', '新款YY男女同款羽毛球服', '32', 'http://localhost:8080/upload/20200307_21073274.jpg', 'http://localhost:8080/upload/20200307_21073274.jpg', '<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/edit/2019/05/27/943a859ba170663cf26f7e7295e16d4e.jpg\" />\n</p>\n<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/edit/2019/05/27/943a859ba170663cf26f7e7295e16d4e.jpg\" />\n</p>\n<p>\n	<br />\n</p>', '280', '380', '10', '修身球衣', '0', '0', '2020-03-07 21:07:34', '0', '2020-03-07 21:07:34');
INSERT INTO `goods_info` VALUES ('10900', 'REZ羽毛球包', 'REZ羽毛球包 妙趣而来 首款组合配饰球包 手提球拍包RBG18093黑迷彩 REZ羽毛球包现货发售', '33', 'http://localhost:8080/upload/20200307_21105254.jpg', 'http://localhost:8080/upload/20200307_21105254.jpg', '<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/orgin/goods/2019/09/19/99cf36ff1ac3faade9d6c18a516e10ea.jpg_X_RESIZE_800_800.jpg\" />\n</p>\n<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/edit/2019/09/19/72f1df34e676768fbc547cf7af67458d.jpg\" />\n</p>', '100', '160', '100', '专业羽毛球包', '0', '0', '2020-03-07 21:10:54', '0', '2020-03-07 21:10:54');
INSERT INTO `goods_info` VALUES ('10901', 'REZ专业运护膝', 'REZ专业运动护膝加压保护护膝专业羽球护膝PKD-1', '35', 'http://localhost:8080/upload/20200307_2112494.jpg', 'http://localhost:8080/upload/20200307_2112494.jpg', '<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/edit/2019/12/10/2d39330d31ae6dbcc670214eaf2ff00e.jpg\" />\n</p>\n<p>\n	<img src=\"http://imgm.tiyushe.com/upload/images/edit/2019/12/10/b7ab58b6c5947ff64eb6abab03a7f0c1.jpg\" />\n</p>\n<p>\n	<br />\n</p>', '40', '60', '30', '专业护膝', '0', '0', '2020-03-07 21:12:51', '0', '2020-03-07 21:12:51');

-- ----------------------------
-- Table structure for index_config
-- ----------------------------
DROP TABLE IF EXISTS `index_config`;
CREATE TABLE `index_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
  `config_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
  `config_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销商品 4-(首页)新品上线 5-(首页)为你推荐',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id 默认为0',
  `redirect_url` varchar(100) NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
  `config_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  `update_user` int(11) DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of index_config
-- ----------------------------
INSERT INTO `index_config` VALUES ('25', '羽毛球', '3', '10896', '##', '0', '0', '2020-03-07 21:18:30', '0', '2020-03-07 21:18:30', '0');
INSERT INTO `index_config` VALUES ('26', '球拍', '3', '10897', '##', '0', '0', '2020-03-07 21:19:38', '0', '2020-03-07 21:19:38', '0');
INSERT INTO `index_config` VALUES ('27', '羽毛球鞋', '3', '10898', '##', '0', '0', '2020-03-07 21:20:49', '0', '2020-03-07 21:20:49', '0');
INSERT INTO `index_config` VALUES ('28', '羽毛球衣', '3', '10899', '##', '0', '0', '2020-03-07 21:21:12', '0', '2020-03-07 21:21:12', '0');
INSERT INTO `index_config` VALUES ('29', '羽毛球包', '3', '10900', '##', '0', '0', '2020-03-07 21:21:33', '0', '2020-03-07 21:21:33', '0');
INSERT INTO `index_config` VALUES ('30', '运动护膝', '3', '10901', '##', '0', '0', '2020-03-07 21:21:57', '0', '2020-03-07 21:21:57', '0');
INSERT INTO `index_config` VALUES ('31', '羽毛球', '4', '10896', '##', '0', '0', '2020-03-07 21:24:19', '0', '2020-03-07 21:24:19', '0');
INSERT INTO `index_config` VALUES ('32', '羽毛球拍', '4', '10897', '##', '0', '0', '2020-03-07 21:24:49', '0', '2020-03-07 21:24:49', '0');
INSERT INTO `index_config` VALUES ('33', '羽毛球鞋', '4', '10898', '##', '0', '0', '2020-03-07 21:25:04', '0', '2020-03-07 21:25:04', '0');
INSERT INTO `index_config` VALUES ('34', '羽毛球衣', '4', '10899', '##', '0', '0', '2020-03-07 21:25:35', '0', '2020-03-07 21:25:35', '0');
INSERT INTO `index_config` VALUES ('35', '羽毛球包', '4', '10900', '##', '0', '0', '2020-03-07 21:25:52', '0', '2020-03-07 21:25:52', '0');
INSERT INTO `index_config` VALUES ('36', '运动护膝', '4', '10901', '##', '0', '0', '2020-03-07 21:26:06', '0', '2020-03-07 21:26:06', '0');
INSERT INTO `index_config` VALUES ('37', '羽毛球', '5', '10896', '##', '0', '0', '2020-03-07 21:27:05', '0', '2020-03-07 21:27:05', '0');
INSERT INTO `index_config` VALUES ('38', '羽毛球拍', '5', '10897', '##', '0', '0', '2020-03-07 21:27:21', '0', '2020-03-07 21:27:21', '0');
INSERT INTO `index_config` VALUES ('39', '羽毛球鞋', '5', '10898', '##', '0', '0', '2020-03-07 21:27:39', '0', '2020-03-07 21:27:39', '0');
INSERT INTO `index_config` VALUES ('40', '羽毛球服', '5', '10899', '##', '0', '0', '2020-03-07 21:27:54', '0', '2020-03-07 21:27:54', '0');
INSERT INTO `index_config` VALUES ('41', '羽毛球包', '5', '10900', '##', '0', '0', '2020-03-07 21:28:09', '0', '2020-03-07 21:28:09', '0');
INSERT INTO `index_config` VALUES ('42', '运动护膝', '5', '10901', '##', '0', '0', '2020-03-07 21:28:26', '0', '2020-03-07 21:28:26', '0');

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表主键id',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户主键id',
  `total_price` int(11) NOT NULL DEFAULT '1' COMMENT '订单总价',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
  `pay_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.无 1.支付宝支付 2.微信支付',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
  `extra_info` varchar(100) NOT NULL DEFAULT '' COMMENT '订单body',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `user_address` varchar(100) NOT NULL DEFAULT '' COMMENT '收货人收货地址',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES ('26', '15835943468399522', '9', '548', '1', '1', '2020-03-07 23:19:29', '-3', '', '', '', '湖北省荆州市长江大学文理学院西校区', '0', '2020-03-07 23:19:06', '2020-03-07 23:30:31');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单关联购物项主键id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '下单时商品的名称(订单快照)',
  `goods_cover_img` varchar(200) NOT NULL DEFAULT '' COMMENT '下单时商品的主图(订单快照)',
  `selling_price` int(11) NOT NULL DEFAULT '1' COMMENT '下单时商品的价格(订单快照)',
  `goods_count` int(11) NOT NULL DEFAULT '1' COMMENT '数量(订单快照)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('35', '24', '10896', 'REZC5系列羽毛球 C5', 'http://localhost:8080/upload/20200307_19181692.jpg', '10', '5', '2020-03-07 23:09:02');
INSERT INTO `order_item` VALUES ('36', '26', '10897', 'YONEX疾光800羽毛球拍NF800', 'http://localhost:8080/upload/20200307_19264852.jpg', '300', '1', '2020-03-07 23:19:06');
INSERT INTO `order_item` VALUES ('37', '26', '10898', 'EASWNN/一隼 专业羽毛球鞋', 'http://localhost:8080/upload/20200307_2104321.jpg', '248', '1', '2020-03-07 23:19:06');
