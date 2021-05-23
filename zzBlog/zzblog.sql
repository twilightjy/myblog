-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 47.98.134.66    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_article`
--

DROP TABLE IF EXISTS `tb_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '作者',
  `category_id` int DEFAULT NULL COMMENT '文章分类',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '发表时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_top` tinyint(1) DEFAULT NULL COMMENT '是否置顶 0否 1是',
  `is_draft` tinyint(1) DEFAULT '0' COMMENT '是否为草稿 0否 1是',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除  0否 1是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_article`
--

LOCK TABLES `tb_article` WRITE;
/*!40000 ALTER TABLE `tb_article` DISABLE KEYS */;
INSERT INTO `tb_article` VALUES (31,1,12,'https://www.static.talkxj.com/articles/1616249391415.jpg','测试文章','## 测试目录\n这是你的第一篇文章','2021-04-30 22:09:58','2021-05-01 23:39:20',0,0,0);
/*!40000 ALTER TABLE `tb_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_article_tag`
--

DROP TABLE IF EXISTS `tb_article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_article_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_tag_1` (`article_id`) USING BTREE,
  KEY `fk_article_tag_2` (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_article_tag`
--

LOCK TABLES `tb_article_tag` WRITE;
/*!40000 ALTER TABLE `tb_article_tag` DISABLE KEYS */;
INSERT INTO `tb_article_tag` VALUES (272,31,18),(273,33,19),(274,33,21);
/*!40000 ALTER TABLE `tb_article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (12,'测试分类','2021-03-20 22:02:43'),(13,'学习','2021-05-08 23:37:34'),(14,'生活','2021-05-08 23:37:40'),(15,'日记','2021-05-08 23:37:44'),(16,'分享','2021-05-08 23:37:53');
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_chat_record`
--

DROP TABLE IF EXISTS `tb_chat_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_chat_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像',
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '聊天内容',
  `ip_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ip来源',
  `type` tinyint DEFAULT NULL COMMENT '类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_chat_record`
--

LOCK TABLES `tb_chat_record` WRITE;
/*!40000 ALTER TABLE `tb_chat_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_chat_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comment`
--

DROP TABLE IF EXISTS `tb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '评论用户Id',
  `article_id` int DEFAULT NULL COMMENT '评论文章id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_id` int DEFAULT NULL COMMENT '回复用户id',
  `parent_id` int DEFAULT NULL COMMENT '父评论id',
  `is_delete` tinyint DEFAULT '0' COMMENT '是否删除  0否 1是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_comment_user` (`user_id`) USING BTREE,
  KEY `fk_comment_article` (`article_id`) USING BTREE,
  KEY `fk_comment_parent` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comment`
--

LOCK TABLES `tb_comment` WRITE;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` VALUES (264,1,31,'测试评论<img src= \'https://www.static.talkxj.com/emoji/goutou.jpg\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2021-04-20 23:41:53',NULL,NULL,0);
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_friend_link`
--

DROP TABLE IF EXISTS `tb_friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_friend_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接名',
  `link_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接头像',
  `link_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接地址',
  `link_intro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接介绍',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_friend_link_user` (`link_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_friend_link`
--

LOCK TABLES `tb_friend_link` WRITE;
/*!40000 ALTER TABLE `tb_friend_link` DISABLE KEYS */;
INSERT INTO `tb_friend_link` VALUES (13,'若尘无生','http://www.static.twilightjy.com/background/back9.jpg','http://zeromirror.top/','若尘无生','2021-05-04 02:04:07'),(15,'Skymo博客','https://cdn.jsdelivr.net/gh/yubifeng/blog-resource/bloghosting/website/static/favicon.ico','https://skymo.top/','记录生活，分享技术。','2021-05-06 21:30:32');
/*!40000 ALTER TABLE `tb_friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单icon',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_num` tinyint DEFAULT NULL COMMENT '排序',
  `parent_id` int DEFAULT NULL COMMENT '父id',
  `is_disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用 0否1是',
  `is_hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏  0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'首页','/','/home/Home.vue','el-icon-myshouye','2021-01-26 17:06:51','2021-01-26 17:06:53',1,NULL,0,0),(2,'文章管理','/article-submenu','Layout','el-icon-mywenzhang-copy','2021-01-25 20:43:07','2021-01-25 20:43:09',2,NULL,0,0),(3,'消息管理','/message-submenu','Layout','el-icon-myxiaoxi','2021-01-25 20:44:17','2021-01-25 20:44:20',3,NULL,0,0),(4,'系统管理','/system-submenu','Layout','el-icon-myshezhi','2021-01-25 20:45:57','2021-01-25 20:45:59',5,NULL,0,0),(5,'个人中心','/setting','/setting/Setting.vue','el-icon-myuser','2021-01-26 17:22:38','2021-01-26 17:22:41',7,NULL,0,0),(6,'添加文章','/articles','/article/Article.vue','el-icon-myfabiaowenzhang','2021-01-26 14:30:48','2021-01-26 14:30:51',1,2,0,0),(7,'修改文章','/articles/*','/article/Article.vue','el-icon-myfabiaowenzhang','2021-01-26 14:31:32','2021-01-26 14:31:34',2,2,0,1),(8,'文章列表','/article-list','/article/ArticleList.vue','el-icon-mywenzhangliebiao','2021-01-26 14:32:13','2021-01-26 14:32:16',3,2,0,0),(9,'分类管理','/categories','/category/Category.vue','el-icon-myfenlei','2021-01-26 14:33:42','2021-01-26 14:33:43',4,2,0,0),(10,'标签管理','/tags','/tag/Tag.vue','el-icon-myicontag','2021-01-26 14:34:33','2021-01-26 14:34:36',5,2,0,0),(11,'评论管理','/comments','/comment/Comment.vue','el-icon-mypinglunzu','2021-01-26 14:35:31','2021-01-26 14:35:34',1,3,0,0),(12,'留言管理','/messages','/message/Message.vue','el-icon-myliuyan','2021-01-26 14:36:09','2021-01-26 14:36:13',2,3,0,0),(13,'用户列表','/users','/user/User.vue','el-icon-myyonghuliebiao','2021-01-26 14:38:09','2021-01-26 14:38:12',1,202,0,0),(14,'角色管理','/roles','/role/Role.vue','el-icon-myjiaoseliebiao','2021-01-26 14:39:01','2021-01-26 14:39:03',2,202,0,0),(15,'资源管理','/resources','/resource/Resource.vue','el-icon-myxitong','2021-01-26 14:40:14','2021-01-26 14:40:16',2,4,0,0),(16,'菜单管理','/menus','/menu/Menu.vue','el-icon-mycaidan','2021-01-26 14:40:54','2021-01-26 14:40:56',1,4,0,0),(17,'友链管理','/links','/friendLink/FriendLink.vue','el-icon-mydashujukeshihuaico-','2021-01-26 14:41:35','2021-01-26 14:41:37',3,4,0,0),(18,'关于我','/about','/about/About.vue','el-icon-myguanyuwo','2021-01-26 14:42:05','2021-01-26 14:42:10',4,4,0,0),(19,'日志管理','/log-submenu','Layout','el-icon-myguanyuwo','2021-01-31 21:33:56','2021-01-31 21:33:59',6,NULL,0,0),(20,'操作日志','/operation/log','/log/Operation.vue','el-icon-myguanyuwo','2021-01-31 15:53:21','2021-01-31 15:53:25',1,19,0,0),(201,'在线用户','/online/users','/user/Online.vue','el-icon-myyonghuliebiao','2021-02-05 14:59:51','2021-02-05 14:59:53',7,202,0,0),(202,'用户管理','/users-submenu','Layout','el-icon-myyonghuliebiao','2021-02-06 23:44:59','2021-02-06 23:45:03',4,NULL,0,0);
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message`
--

DROP TABLE IF EXISTS `tb_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户地址',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `message_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `time` tinyint(1) DEFAULT NULL COMMENT '弹幕速度',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3439 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message`
--

LOCK TABLES `tb_message` WRITE;
/*!40000 ALTER TABLE `tb_message` DISABLE KEYS */;
INSERT INTO `tb_message` VALUES (3432,'127.0.0.1','','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','测试留言',8,'2021-03-20 23:40:48'),(3433,'127.0.0.1','','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','能用吗这个',9,'2021-04-29 20:22:36'),(3434,'127.0.0.1','','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','666',9,'2021-04-29 20:22:39'),(3435,'127.0.0.1','','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','666',9,'2021-05-03 16:23:47'),(3436,'223.91.108.22','河南省南阳市 移动','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','666',7,'2021-05-05 00:05:04'),(3437,'115.156.143.82','湖北省武汉市 教育网','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','阿哲冲冲冲',7,'2021-05-06 17:39:00'),(3438,'110.184.179.130','四川省成都市双流区 电信','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','666',8,'2021-05-06 19:13:56');
/*!40000 ALTER TABLE `tb_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_operation_log`
--

DROP TABLE IF EXISTS `tb_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_operation_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `opt_module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作模块',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作类型',
  `opt_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作url',
  `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作方法',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求方式',
  `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '返回数据',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户昵称',
  `ip_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_operation_log`
--

LOCK TABLES `tb_operation_log` WRITE;
/*!40000 ALTER TABLE `tb_operation_log` DISABLE KEYS */;
INSERT INTO `tb_operation_log` VALUES (314,'友链模块','新增或修改','/admin/links','cn.hust.controller.FriendLinkController.saveOrUpdateFriendLink','保存或修改友链','[{\"linkAddress\":\"https://skymo.top/\",\"linkAvatar\":\"https://cdn.jsdelivr.net/gh/yubifeng/blog-resource/bloghosting/website/static/favicon.ico\",\"linkIntro\":\"记录生活，分享技术。\",\"linkName\":\"Skymo博客\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.140.47','湖北省武汉市 教育网','2021-05-06 21:30:32'),(315,'博客信息模块','修改','/admin/about','cn.hust.controller.BlogInfoController.updateAbout','修改关于我信息','[\"面向github编程\\n业内著名CV工程师\\n一名大三想去大厂的java自学者\\n期待未来，追逐远方！\"]','PUT','{\"code\":20000,\"flag\":true,\"message\":\"修改成功\"}',1,'管理员','58.48.169.210','湖北省武汉市 电信','2021-05-06 21:43:32'),(316,'用户信息模块','修改','/admin/users/role','cn.hust.controller.UserInfoController.updateUserRole','修改用户角色','[{\"nickname\":\"测试\",\"roleIdList\":[],\"userInfoId\":2}]','PUT','{\"code\":20000,\"flag\":true,\"message\":\"修改成功！\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:24:56'),(317,'用户信息模块','修改','/admin/users/disable/2','cn.hust.controller.UserInfoController.updateUserSilence','修改用户禁用状态','[2,1]','PUT','{\"code\":20000,\"flag\":true,\"message\":\"修改成功！\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:25:07'),(318,'用户信息模块','修改','/admin/users/disable/2','cn.hust.controller.UserInfoController.updateUserSilence','修改用户禁用状态','[2,0]','PUT','{\"code\":20000,\"flag\":true,\"message\":\"修改成功！\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:25:08'),(319,'文章模块','新增或修改','/admin/articles','cn.hust.controller.ArticleController.saveArticle','添加或修改文章','[{\"articleContent\":\"问题描述：\\n\\n- 数组元素均为正整数\\n- 把 N 个数尽量分成 K 组，使每组数字的和尽量接近\\n- 分组不需要保护数组元素的原始顺序\\n- “尽量接近”的精确定义：最小化 max(sum(Mi)) Mi 是得到的 K 个分组\\n- A group of N integer numbers need to be divided fairly into K subgroups.\\n- A fair division is that the max of the sums of K subgroups is minimal\\n\\n解决思路：\\n\\n- 对输入数组进行排序，这里是从小到大排\\n- 用最大的K个来初始化分组的集合，得到K个集合，每个集合中有一个数字\\n- 从大到小遍历剩下的数字；每次遍历中，把当前数与分组之和相加，找出结果最小的那个分组，将当前数加入那个分组\\n\\n对特殊情况进行了处理\\nJava代码示例：\\n\\n```java\\nprivate static List<ArrayList<Integer>> fairDivision(int[] input, int k) {\\n        ArrayList<ArrayList<Integer>> resultList = new ArrayList<>(k);\\n        if (k > input.length || k < 0) {\\n            return resultList;\\n        } else if (k == input.length) {\\n            for (int c : input) {\\n                ArrayList<Integer> t = new ArrayList<>();\\n                t.add(c);\\n                resultList.add(t);\\n            }\\n            return resultList;\\n        }\\n \\n        for (int i = 0; i < k; i++) {\\n            resultList.add(new ArrayList<>());\\n        }\\n \\n        int[] sortedInput = input.clone();\\n        int inputLen = sortedInput.length;\\n        Arrays.sort(sortedInput);\\n \\n        // 从最大的开始填充到结果中\\n        for (int i = 0; i < k; i++) {\\n            resultList.get(i).add(sortedInput[inputLen - 1 - i]);\\n        }\\n        // 从大到小遍历剩下的数字\\n        for (int i = inputLen - 1 - k; i >= 0; i--) {\\n            ArrayList<Integer> tempSum = new ArrayList<>(k);\\n            for (List<Integer> l : resultList) {\\n                tempSum.add(getSum(l) + sortedInput[i]);\\n            }\\n            int minIndex = findMinIndex(tempSum); // 找出结果最小的那个分组\\n            resultList.get(minIndex).add(sortedInput[i]); // 将当前数加入那个分组\\n        }\\n \\n        return resultList;\\n    }\\n \\n    /**\\n     * @return The index of the min member\\n     */\\n    private static int findMinIndex(ArrayList<Integer> list) {\\n        int res = 0;\\n        int t = Integer.MAX_VALUE;\\n        for (int index = 0; index < list.size(); index++) {\\n            if (list.get(index) < t) {\\n                t = list.get(index);\\n                res = index;\\n            }\\n        }\\n        return res;\\n    }\\n \\n    /**\\n     * @return Sum of list members\\n     */\\n    private static int getSum(List<Integer> list) {\\n        int res = 0;\\n        for (int i : list) {\\n            res += i;\\n        }\\n        return res;\\n    }\\n```\\n\\n测试\\n\\n```java\\nprivate static void testAndPrint(int[] input, int k) {\\n    System.out.print(Arrays.toString(input) + \\\" --> \\\");\\n    for (List r : fairDivision(input, k)) {\\n        System.out.print(r);\\n    }\\n    System.out.println(\\\"; k=\\\" + k);\\n}\\n \\npublic static void main(String[] args) {\\n    int[] input1 = {6, 1, 6, 1, 2, 5};\\n    int[] input2 = {9, 2, 1};\\n    int[] input3 = {9, 2};\\n    int[] input4 = {19, 2, 6, 9, 2, 4, 7, 10};\\n \\n    testAndPrint(input4, 3);\\n    testAndPrint(input4, 4);\\n    testAndPrint(input4, 5);\\n    testAndPrint(input1, 6);\\n    testAndPrint(input1, 5);\\n    testAndPrint(input1, 3);\\n    testAndPrint(input1, 2);\\n    testAndPrint(input2, 2);\\n    testAndPrint(input3, 2);\\n    testAndPrint(input3, 1);\\n}\\n \\n/* output\\n[19, 2, 6, 9, 2, 4, 7, 10] --> [19][10, 6, 4][9, 7, 2, 2]; k=3\\n[19, 2, 6, 9, 2, 4, 7, 10] --> [19][10, 2, 2][9, 4][7, 6]; k=4\\n[19, 2, 6, 9, 2, 4, 7, 10] --> [19][10][9, 2][7, 2][6, 4]; k=5\\n[6, 1, 6, 1, 2, 5] --> [6][1][6][1][2][5]; k=6\\n[6, 1, 6, 1, 2, 5] --> [6][6][5][2][1, 1]; k=5\\n[6, 1, 6, 1, 2, 5] --> [6, 1][6, 1][5, 2]; k=3\\n[6, 1, 6, 1, 2, 5] --> [6, 5][6, 2, 1, 1]; k=2\\n[9, 2, 1] --> [9][2, 1]; k=2\\n[9, 2] --> [9][2]; k=2\\n[9, 2] --> [9, 2]; k=1\\n*/\\n```\\n\\n\",\"articleCover\":\"\",\"articleTitle\":\"2021-05-08\",\"isDraft\":1,\"isTop\":0,\"tagIdList\":[]}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:30:07'),(320,'标签模块','新增或修改','/admin/tags','cn.hust.controller.TagController.saveOrUpdateTag','添加或修改标签','[{\"tagName\":\"算法\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:30:23'),(321,'标签模块','新增或修改','/admin/tags','cn.hust.controller.TagController.saveOrUpdateTag','添加或修改标签','[{\"tagName\":\"面试\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:30:30'),(322,'标签模块','新增或修改','/admin/tags','cn.hust.controller.TagController.saveOrUpdateTag','添加或修改标签','[{\"tagName\":\"java\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:30:35'),(323,'标签模块','新增或修改','/admin/tags','cn.hust.controller.TagController.saveOrUpdateTag','添加或修改标签','[{\"tagName\":\"前端\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:30:42'),(324,'标签模块','新增或修改','/admin/tags','cn.hust.controller.TagController.saveOrUpdateTag','添加或修改标签','[{\"tagName\":\"物联网\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:30:46'),(325,'标签模块','新增或修改','/admin/tags','cn.hust.controller.TagController.saveOrUpdateTag','添加或修改标签','[{\"tagName\":\"安卓\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:30:54'),(326,'文章模块','新增或修改','/admin/articles','cn.hust.controller.ArticleController.saveArticle','添加或修改文章','[{\"articleContent\":\"问题描述：\\n\\n- 数组元素均为正整数\\n- 把 N 个数尽量分成 K 组，使每组数字的和尽量接近\\n- 分组不需要保护数组元素的原始顺序\\n- “尽量接近”的精确定义：最小化 max(sum(Mi)) Mi 是得到的 K 个分组\\n- A group of N integer numbers need to be divided fairly into K subgroups.\\n- A fair division is that the max of the sums of K subgroups is minimal\\n\\n解决思路：\\n\\n- 对输入数组进行排序，这里是从小到大排\\n- 用最大的K个来初始化分组的集合，得到K个集合，每个集合中有一个数字\\n- 从大到小遍历剩下的数字；每次遍历中，把当前数与分组之和相加，找出结果最小的那个分组，将当前数加入那个分组\\n\\n对特殊情况进行了处理\\nJava代码示例：\\n\\n```java\\nprivate static List<ArrayList<Integer>> fairDivision(int[] input, int k) {\\n        ArrayList<ArrayList<Integer>> resultList = new ArrayList<>(k);\\n        if (k > input.length || k < 0) {\\n            return resultList;\\n        } else if (k == input.length) {\\n            for (int c : input) {\\n                ArrayList<Integer> t = new ArrayList<>();\\n                t.add(c);\\n                resultList.add(t);\\n            }\\n            return resultList;\\n        }\\n \\n        for (int i = 0; i < k; i++) {\\n            resultList.add(new ArrayList<>());\\n        }\\n \\n        int[] sortedInput = input.clone();\\n        int inputLen = sortedInput.length;\\n        Arrays.sort(sortedInput);\\n \\n        // 从最大的开始填充到结果中\\n        for (int i = 0; i < k; i++) {\\n            resultList.get(i).add(sortedInput[inputLen - 1 - i]);\\n        }\\n        // 从大到小遍历剩下的数字\\n        for (int i = inputLen - 1 - k; i >= 0; i--) {\\n            ArrayList<Integer> tempSum = new ArrayList<>(k);\\n            for (List<Integer> l : resultList) {\\n                tempSum.add(getSum(l) + sortedInput[i]);\\n            }\\n            int minIndex = findMinIndex(tempSum); // 找出结果最小的那个分组\\n            resultList.get(minIndex).add(sortedInput[i]); // 将当前数加入那个分组\\n        }\\n \\n        return resultList;\\n    }\\n \\n    /**\\n     * @return The index of the min member\\n     */\\n    private static int findMinIndex(ArrayList<Integer> list) {\\n        int res = 0;\\n        int t = Integer.MAX_VALUE;\\n        for (int index = 0; index < list.size(); index++) {\\n            if (list.get(index) < t) {\\n                t = list.get(index);\\n                res = index;\\n            }\\n        }\\n        return res;\\n    }\\n \\n    /**\\n     * @return Sum of list members\\n     */\\n    private static int getSum(List<Integer> list) {\\n        int res = 0;\\n        for (int i : list) {\\n            res += i;\\n        }\\n        return res;\\n    }\\n```\\n\\n测试\\n\\n```java\\nprivate static void testAndPrint(int[] input, int k) {\\n    System.out.print(Arrays.toString(input) + \\\" --> \\\");\\n    for (List r : fairDivision(input, k)) {\\n        System.out.print(r);\\n    }\\n    System.out.println(\\\"; k=\\\" + k);\\n}\\n \\npublic static void main(String[] args) {\\n    int[] input1 = {6, 1, 6, 1, 2, 5};\\n    int[] input2 = {9, 2, 1};\\n    int[] input3 = {9, 2};\\n    int[] input4 = {19, 2, 6, 9, 2, 4, 7, 10};\\n \\n    testAndPrint(input4, 3);\\n    testAndPrint(input4, 4);\\n    testAndPrint(input4, 5);\\n    testAndPrint(input1, 6);\\n    testAndPrint(input1, 5);\\n    testAndPrint(input1, 3);\\n    testAndPrint(input1, 2);\\n    testAndPrint(input2, 2);\\n    testAndPrint(input3, 2);\\n    testAndPrint(input3, 1);\\n}\\n \\n/* output\\n[19, 2, 6, 9, 2, 4, 7, 10] --> [19][10, 6, 4][9, 7, 2, 2]; k=3\\n[19, 2, 6, 9, 2, 4, 7, 10] --> [19][10, 2, 2][9, 4][7, 6]; k=4\\n[19, 2, 6, 9, 2, 4, 7, 10] --> [19][10][9, 2][7, 2][6, 4]; k=5\\n[6, 1, 6, 1, 2, 5] --> [6][1][6][1][2][5]; k=6\\n[6, 1, 6, 1, 2, 5] --> [6][6][5][2][1, 1]; k=5\\n[6, 1, 6, 1, 2, 5] --> [6, 1][6, 1][5, 2]; k=3\\n[6, 1, 6, 1, 2, 5] --> [6, 5][6, 2, 1, 1]; k=2\\n[9, 2, 1] --> [9][2, 1]; k=2\\n[9, 2] --> [9][2]; k=2\\n[9, 2] --> [9, 2]; k=1\\n*/\\n```\\n\\n\",\"articleTitle\":\"2021-05-08\",\"categoryId\":12,\"isDraft\":1,\"isTop\":1,\"tagIdList\":[19,21]}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:35:43'),(327,'分类模块','新增或修改','/admin/categories','cn.hust.controller.CategoryController.saveOrUpdateCategory','添加或修改分类','[{\"categoryName\":\"学习\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:37:34'),(328,'分类模块','新增或修改','/admin/categories','cn.hust.controller.CategoryController.saveOrUpdateCategory','添加或修改分类','[{\"categoryName\":\"生活\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:37:40'),(329,'分类模块','新增或修改','/admin/categories','cn.hust.controller.CategoryController.saveOrUpdateCategory','添加或修改分类','[{\"categoryName\":\"日记\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:37:44'),(330,'分类模块','新增或修改','/admin/categories','cn.hust.controller.CategoryController.saveOrUpdateCategory','添加或修改分类','[{\"categoryName\":\"分享\"}]','POST','{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}',1,'管理员','115.156.141.42','湖北省武汉市 教育网','2021-05-08 23:37:53'),(331,'博客信息模块','修改','/admin/notice','cn.hust.controller.BlogInfoController.updateNotice','修改公告','[\"网站还未完善，尚在功能测试中，第三方登录功能不可用\"]','PUT','{\"code\":20000,\"flag\":true,\"message\":\"修改成功\"}',1,'管理员','115.156.143.122','湖北省武汉市 教育网','2021-05-13 23:53:39');
/*!40000 ALTER TABLE `tb_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_resource`
--

DROP TABLE IF EXISTS `tb_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_resource` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '资源名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求方式',
  `parent_id` int DEFAULT NULL COMMENT '父权限id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用 0否 1是',
  `is_anonymous` tinyint DEFAULT NULL COMMENT '是否匿名访问 0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_resource`
--

LOCK TABLES `tb_resource` WRITE;
/*!40000 ALTER TABLE `tb_resource` DISABLE KEYS */;
INSERT INTO `tb_resource` VALUES (165,'分类模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(166,'博客信息模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(167,'友链模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(168,'文章模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(169,'日志模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(170,'标签模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(171,'用户信息模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(172,'用户账号模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(173,'留言模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(174,'菜单模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(175,'角色模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(176,'评论模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(177,'资源模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(178,'查看博客信息','/','GET',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(179,'查看关于我信息','/about','GET',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(180,'查看后台信息','/admin','GET',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(181,'修改关于我信息','/admin/about','PUT',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(182,'查看后台文章','/admin/articles','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(183,'添加或修改文章','/admin/articles','POST',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(184,'恢复或删除文章','/admin/articles','PUT',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(185,'物理删除文章','/admin/articles','DELETE',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(186,'上传文章图片','/admin/articles/images','POST',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(187,'查看文章选项','/admin/articles/options','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(188,'修改文章置顶','/admin/articles/top/*','PUT',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(189,'根据id查看后台文章','/admin/articles/*','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(190,'查看后台分类列表','/admin/categories','GET',165,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(191,'添加或修改分类','/admin/categories','POST',165,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(192,'删除分类','/admin/categories','DELETE',165,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(193,'查询后台评论','/admin/comments','GET',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(194,'删除或恢复评论','/admin/comments','PUT',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(195,'物理删除评论','/admin/comments','DELETE',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(196,'查看后台友链列表','/admin/links','GET',167,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(197,'保存或修改友链','/admin/links','POST',167,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(198,'删除友链','/admin/links','DELETE',167,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(199,'查看菜单列表','/admin/menus','GET',174,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(200,'查看后台留言列表','/admin/messages','GET',173,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(201,'删除留言','/admin/messages','DELETE',173,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(202,'查看公告','/admin/notice','GET',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(203,'修改公告','/admin/notice','PUT',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(204,'查看操作日志','/admin/operation/logs','GET',169,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(205,'删除操作日志','/admin/operation/logs','DELETE',169,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(206,'查看资源列表','/admin/resources','GET',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(207,'新增或修改资源','/admin/resources','POST',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(208,'删除资源','/admin/resources','DELETE',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(209,'导入swagger接口','/admin/resources/import/swagger','GET',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(210,'保存或更新角色','/admin/role','POST',175,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(211,'查看角色菜单选项','/admin/role/menus','GET',174,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(212,'查看角色资源选项','/admin/role/resources','GET',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(213,'查询角色列表','/admin/roles','GET',175,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(214,'查看后台标签列表','/admin/tags','GET',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(215,'添加或修改标签','/admin/tags','POST',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(216,'删除标签','/admin/tags','DELETE',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(217,'查看用户菜单','/admin/user/menus','GET',174,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(218,'查看后台用户列表','/admin/users','GET',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(219,'修改用户禁用状态','/admin/users/disable/*','PUT',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(220,'查看在线用户','/admin/users/online','GET',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(221,'下线用户','/admin/users/online/*','DELETE',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(222,'修改管理员密码','/admin/users/password','PUT',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(223,'查询用户角色选项','/admin/users/role','GET',175,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(224,'修改用户角色','/admin/users/role','PUT',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(225,'查看首页文章','/articles','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(226,'查看文章归档','/articles/archives','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(227,'点赞文章','/articles/like','POST',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(228,'查看最新文章','/articles/newest','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(229,'搜索文章','/articles/search','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(230,'根据id查看文章','/articles/*','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(231,'查看分类列表','/categories','GET',165,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(232,'查看分类下对应的文章','/categories/*','GET',165,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(233,'查询评论','/comments','GET',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(234,'添加评论或回复','/comments','POST',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(235,'评论点赞','/comments/like','POST',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(236,'查询评论下的回复','/comments/replies/*','GET',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(237,'查看友链列表','/links','GET',167,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(238,'查看留言列表','/messages','GET',173,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(239,'添加留言','/messages','POST',173,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(240,'查看标签列表','/tags','GET',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(241,'查看分类下对应的文章','/tags/*','GET',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(242,'用户注册','/users','POST',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(243,'修改用户头像','/users/avatar','POST',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(244,'发送邮箱验证码','/users/code','GET',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(245,'修改用户资料','/users/info','PUT',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(246,'qq登录','/users/oauth/qq','POST',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(247,'微博登录','/users/oauth/weibo','POST',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(248,'修改密码','/users/password','PUT',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(249,'上传语音','/voice','POST',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1);
/*!40000 ALTER TABLE `tb_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色名',
  `role_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用  0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'管理员','admin','2021-01-11 17:21:57','2021-03-20 23:27:55',0),(2,'用户','user','2021-01-11 20:17:05','2021-03-16 23:20:20',0),(3,'测试','test','2021-01-11 20:17:23','2021-03-16 23:41:59',0);
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_menu`
--

DROP TABLE IF EXISTS `tb_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_menu`
--

LOCK TABLES `tb_role_menu` WRITE;
/*!40000 ALTER TABLE `tb_role_menu` DISABLE KEYS */;
INSERT INTO `tb_role_menu` VALUES (1181,3,1),(1182,3,202),(1183,3,13),(1184,3,14),(1185,3,201),(1243,1,1),(1244,1,2),(1245,1,6),(1246,1,7),(1247,1,8),(1248,1,9),(1249,1,10),(1250,1,3),(1251,1,11),(1252,1,12),(1253,1,202),(1254,1,13),(1255,1,14),(1256,1,201),(1257,1,4),(1258,1,16),(1259,1,15),(1260,1,17),(1261,1,18),(1262,1,19),(1263,1,20),(1264,1,5);
/*!40000 ALTER TABLE `tb_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_resource`
--

DROP TABLE IF EXISTS `tb_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role_resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `resource_id` int DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_resource`
--

LOCK TABLES `tb_role_resource` WRITE;
/*!40000 ALTER TABLE `tb_role_resource` DISABLE KEYS */;
INSERT INTO `tb_role_resource` VALUES (4092,1,165),(4093,1,190),(4094,1,191),(4095,1,192),(4096,1,231),(4097,1,232),(4098,1,166),(4099,1,178),(4100,1,179),(4101,1,180),(4102,1,181),(4103,1,202),(4104,1,203),(4105,1,249),(4106,1,167),(4107,1,196),(4108,1,197),(4109,1,198),(4110,1,237),(4111,1,168),(4112,1,182),(4113,1,183),(4114,1,184),(4115,1,185),(4116,1,186),(4117,1,187),(4118,1,188),(4119,1,189),(4120,1,225),(4121,1,226),(4122,1,227),(4123,1,228),(4124,1,229),(4125,1,230),(4126,1,169),(4127,1,204),(4128,1,205),(4129,1,170),(4130,1,214),(4131,1,215),(4132,1,216),(4133,1,240),(4134,1,241),(4135,1,171),(4136,1,219),(4137,1,220),(4138,1,221),(4139,1,224),(4140,1,243),(4141,1,245),(4142,1,172),(4143,1,218),(4144,1,222),(4145,1,242),(4146,1,244),(4147,1,246),(4148,1,247),(4149,1,248),(4150,1,173),(4151,1,200),(4152,1,201),(4153,1,238),(4154,1,239),(4155,1,174),(4156,1,199),(4157,1,211),(4158,1,217),(4159,1,175),(4160,1,210),(4161,1,213),(4162,1,223),(4163,1,176),(4164,1,193),(4165,1,194),(4166,1,195),(4167,1,233),(4168,1,234),(4169,1,235),(4170,1,236),(4171,1,177),(4172,1,206),(4173,1,207),(4174,1,208),(4175,1,209),(4176,1,212);
/*!40000 ALTER TABLE `tb_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tag`
--

DROP TABLE IF EXISTS `tb_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tag`
--

LOCK TABLES `tb_tag` WRITE;
/*!40000 ALTER TABLE `tb_tag` DISABLE KEYS */;
INSERT INTO `tb_tag` VALUES (18,'测试标签','2021-03-20 22:02:51'),(19,'算法','2021-05-08 23:30:22'),(20,'面试','2021-05-08 23:30:29'),(21,'java','2021-05-08 23:30:35'),(22,'前端','2021-05-08 23:30:42'),(23,'物联网','2021-05-08 23:30:46'),(24,'安卓','2021-05-08 23:30:54');
/*!40000 ALTER TABLE `tb_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_unique_view`
--

DROP TABLE IF EXISTS `tb_unique_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_unique_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL COMMENT '时间',
  `views_count` int NOT NULL COMMENT '访问量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_unique_view`
--

LOCK TABLES `tb_unique_view` WRITE;
/*!40000 ALTER TABLE `tb_unique_view` DISABLE KEYS */;
INSERT INTO `tb_unique_view` VALUES (223,'2021-05-03 08:00:00',40),(224,'2021-05-04 08:00:00',62),(225,'2021-05-05 08:00:00',37),(226,'2021-05-06 08:00:00',86),(227,'2021-05-07 08:00:00',66),(228,'2021-05-08 08:00:00',32),(229,'2021-05-09 08:00:00',41),(230,'2021-05-10 08:00:00',46),(231,'2021-05-11 08:00:00',39),(232,'2021-05-12 08:00:00',45),(233,'2021-05-13 08:00:00',37),(234,'2021-05-14 08:00:00',35),(235,'2021-05-15 08:00:00',22),(236,'2021-05-16 08:00:00',43),(237,'2021-05-17 08:00:00',23),(238,'2021-05-18 08:00:00',40),(239,'2021-05-19 08:00:00',14),(240,'2021-05-20 08:00:00',33),(241,'2021-05-21 08:00:00',40),(242,'2021-05-22 08:00:00',44);
/*!40000 ALTER TABLE `tb_unique_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_auth`
--

DROP TABLE IF EXISTS `tb_user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_info_id` int NOT NULL COMMENT '用户信息id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `login_type` tinyint(1) NOT NULL COMMENT '登录类型',
  `ip_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_auth`
--

LOCK TABLES `tb_user_auth` WRITE;
/*!40000 ALTER TABLE `tb_user_auth` DISABLE KEYS */;
INSERT INTO `tb_user_auth` VALUES (1,1,'admin@qq.com','$2a$10$H/5k4KtIwCuKEqHOlhKAyuMxrGxvk2t6tuWCxU.ScI7VpWdhjQ6Xq',0,'218.106.117.240','湖北省武汉市 联通','2021-05-01 10:48:18','2021-05-21 10:37:39'),(200,2,'controller@qq.com','$2a$10$H/5k4KtIwCuKEqHOlhKAyuMxrGxvk2t6tuWCxU.ScI7VpWdhjQ6Xq',0,'127.0.0.1',NULL,'2021-05-06 15:14:06','2021-05-06 15:14:11');
/*!40000 ALTER TABLE `tb_user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_info`
--

DROP TABLE IF EXISTS `tb_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户简介',
  `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '个人网站',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_info`
--

LOCK TABLES `tb_user_info` WRITE;
/*!40000 ALTER TABLE `tb_user_info` DISABLE KEYS */;
INSERT INTO `tb_user_info` VALUES (1,'管理员','http://www.static.twilightjy.com/avatar/myavatar.jpg','发表你的第一篇博客吧','http://www.twilightjy.com','2021-04-20 10:48:18','2021-04-21 16:10:33',0),(210,'小管理员','http://www.static.twilightjy.com/avatar/myavatar.jpg',NULL,NULL,'2021-05-06 15:15:15','2021-05-06 15:15:18',0);
/*!40000 ALTER TABLE `tb_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_role`
--

DROP TABLE IF EXISTS `tb_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_role`
--

LOCK TABLES `tb_user_role` WRITE;
/*!40000 ALTER TABLE `tb_user_role` DISABLE KEYS */;
INSERT INTO `tb_user_role` VALUES (2,23,3),(5,3,2),(6,4,2),(7,5,2),(8,7,2),(9,8,2),(10,9,2),(11,10,2),(12,11,2),(13,15,2),(14,16,2),(15,18,2),(16,19,2),(17,21,2),(18,22,2),(19,23,2),(20,24,2),(21,25,2),(22,26,2),(23,27,2),(24,28,2),(25,29,2),(26,30,2),(27,31,2),(28,33,2),(29,35,2),(30,36,2),(31,37,2),(32,38,2),(33,39,2),(34,40,2),(35,41,2),(36,42,2),(37,44,2),(38,45,2),(39,46,2),(40,47,2),(41,48,2),(42,49,2),(43,52,2),(44,54,2),(45,55,2),(46,56,2),(47,57,2),(48,58,2),(49,59,2),(50,60,2),(51,61,2),(52,62,2),(53,63,2),(54,64,2),(55,65,2),(56,67,2),(57,68,2),(58,69,2),(59,70,2),(60,71,2),(61,72,2),(62,73,2),(63,74,2),(64,75,2),(65,76,2),(66,77,2),(67,78,2),(68,79,2),(69,80,2),(70,81,2),(71,82,2),(72,83,2),(73,84,2),(74,85,2),(75,86,2),(76,87,2),(77,88,2),(78,89,2),(79,90,2),(80,91,2),(81,92,2),(100,105,2),(133,138,2),(134,139,2),(135,140,2),(136,141,2),(137,142,2),(138,143,2),(139,144,2),(140,145,2),(141,146,2),(142,147,2),(143,148,2),(144,149,2),(145,150,2),(146,151,2),(147,152,2),(148,153,2),(149,154,2),(150,155,2),(151,156,2),(152,157,2),(153,158,2),(154,159,2),(155,160,2),(156,161,2),(157,162,2),(158,163,2),(159,164,2),(160,165,2),(161,167,2),(162,166,2),(163,168,2),(164,169,2),(165,170,2),(166,171,2),(167,172,2),(168,173,2),(169,174,2),(170,175,2),(171,176,2),(172,177,2),(173,178,2),(174,179,2),(175,180,2),(176,181,2),(177,182,2),(178,183,2),(179,184,2),(180,185,2),(181,186,2),(182,187,2),(183,188,2),(184,189,2),(185,190,2),(186,191,2),(187,192,2),(188,193,2),(189,194,2),(191,196,2),(192,195,2),(193,198,2),(194,197,2),(195,199,2),(196,200,2),(197,201,2),(198,202,2),(199,203,2),(200,204,2),(201,205,2),(202,206,2),(203,207,2),(204,208,2),(205,209,2),(206,210,2),(217,1,1),(218,1,2);
/*!40000 ALTER TABLE `tb_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 17:14:16
