/*
 Navicat Premium Data Transfer

 Source Server         : window
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : windowapp

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 10/05/2024 12:08:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_activity
-- ----------------------------
DROP TABLE IF EXISTS `activity_activity`;
CREATE TABLE `activity_activity`  (
  `aid` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime(6) NOT NULL,
  `number` int NOT NULL,
  `type` int NOT NULL,
  `user_id` int NOT NULL,
  `contact_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `activity_activity_user_id_0667c221_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `activity_activity_user_id_0667c221_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_activity
-- ----------------------------
INSERT INTO `activity_activity` VALUES (2, '想去自驾，找几个会开车的小伙伴', '2024-04-11 00:44:47.223976', 4, 0, 1, '');
INSERT INTO `activity_activity` VALUES (3, '英雄联盟手游5黑，大师最好', '2024-04-11 00:45:30.582869', 5, 1, 4, '');
INSERT INTO `activity_activity` VALUES (4, '想打游戏', '2024-04-11 06:27:30.555187', 2, 0, 4, '');
INSERT INTO `activity_activity` VALUES (5, '想去海边', '2024-04-13 02:57:29.759685', 2, 0, 4, '');
INSERT INTO `activity_activity` VALUES (6, '想去爬山，有没有一起的', '2024-04-14 07:13:29.781140', 2, 0, 3, '');
INSERT INTO `activity_activity` VALUES (7, '猫猫交流会', '2024-04-14 07:14:01.422447', 2, 0, 3, '');
INSERT INTO `activity_activity` VALUES (8, '五一去看海', '2024-04-17 11:56:49.309339', 2, 0, 9, '');
INSERT INTO `activity_activity` VALUES (9, '周末爬山', '2024-04-18 02:14:30.418793', 2, 0, 10, '');
INSERT INTO `activity_activity` VALUES (10, '周末爬山', '2024-05-04 10:50:59.249033', 2, 0, 15, 'QQ：1502698032');

-- ----------------------------
-- Table structure for activity_activity_images
-- ----------------------------
DROP TABLE IF EXISTS `activity_activity_images`;
CREATE TABLE `activity_activity_images`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `images_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `activity_activity_images_activity_id_images_id_e43edfae_uniq`(`activity_id` ASC, `images_id` ASC) USING BTREE,
  INDEX `activity_activity_im_images_id_3cdd37c4_fk_activity_`(`images_id` ASC) USING BTREE,
  CONSTRAINT `activity_activity_im_activity_id_8189c161_fk_activity_` FOREIGN KEY (`activity_id`) REFERENCES `activity_activity` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `activity_activity_im_images_id_3cdd37c4_fk_activity_` FOREIGN KEY (`images_id`) REFERENCES `activity_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_activity_images
-- ----------------------------

-- ----------------------------
-- Table structure for activity_discuss
-- ----------------------------
DROP TABLE IF EXISTS `activity_discuss`;
CREATE TABLE `activity_discuss`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `activity_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activity_discuss_activity_id_7089e37c_fk_activity_activity_aid`(`activity_id` ASC) USING BTREE,
  INDEX `activity_discuss_user_id_62687205_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `activity_discuss_activity_id_7089e37c_fk_activity_activity_aid` FOREIGN KEY (`activity_id`) REFERENCES `activity_activity` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `activity_discuss_user_id_62687205_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_discuss
-- ----------------------------
INSERT INTO `activity_discuss` VALUES (2, '5黑5黑', '2024-04-12 01:14:34.240397', 3, 3);
INSERT INTO `activity_discuss` VALUES (3, '我想去', '2024-04-14 07:38:25.943764', 2, 5);
INSERT INTO `activity_discuss` VALUES (4, '888', '2024-05-04 10:46:45.976485', 2, 15);
INSERT INTO `activity_discuss` VALUES (5, '还有人吗', '2024-05-10 03:30:41.743655', 10, 16);

-- ----------------------------
-- Table structure for activity_images
-- ----------------------------
DROP TABLE IF EXISTS `activity_images`;
CREATE TABLE `activity_images`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `activity_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activity_images_activity_id_2026c84f_fk_activity_activity_aid`(`activity_id` ASC) USING BTREE,
  CONSTRAINT `activity_images_activity_id_2026c84f_fk_activity_activity_aid` FOREIGN KEY (`activity_id`) REFERENCES `activity_activity` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_images
-- ----------------------------
INSERT INTO `activity_images` VALUES (1, 'static/activity_img/game1.jpg', '手动图片添加', '2024-04-11 08:56:41.000000', 3);
INSERT INTO `activity_images` VALUES (2, 'static/activity_img/base.jpg', '默认图片', '2024-04-11 09:18:00.000000', 2);
INSERT INTO `activity_images` VALUES (4, 'static/activity_img/4_4_20240411142730560188.jpg', 'image_0', '2024-04-11 06:27:30.560188', 4);
INSERT INTO `activity_images` VALUES (5, 'static/activity_img/5_4_20240413105729762687.jpg', 'image_0', '2024-04-13 02:57:29.762687', 5);
INSERT INTO `activity_images` VALUES (6, 'static/activity_img/6_3_20240414151329784142.jpg', 'image_0', '2024-04-14 07:13:29.785141', 6);
INSERT INTO `activity_images` VALUES (7, 'static/activity_img/7_3_20240414151401426519.jpg', 'image_0', '2024-04-14 07:14:01.427022', 7);
INSERT INTO `activity_images` VALUES (8, 'static/activity_img/8_9_20240417195649311349.jpg', 'image_0', '2024-04-17 11:56:49.312350', 8);
INSERT INTO `activity_images` VALUES (9, 'static/activity_img/9_10_20240418101430421793.jpg', 'image_0', '2024-04-18 02:14:30.421793', 9);
INSERT INTO `activity_images` VALUES (10, 'static/activity_img/10_15_20240504185059251182.jpg', 'image_0', '2024-05-04 10:50:59.252188', 10);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add user', 6, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can change user', 6, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user', 6, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can view user', 6, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add comment', 8, 'add_comment');
INSERT INTO `auth_permission` VALUES (26, 'Can change comment', 8, 'change_comment');
INSERT INTO `auth_permission` VALUES (27, 'Can delete comment', 8, 'delete_comment');
INSERT INTO `auth_permission` VALUES (28, 'Can view comment', 8, 'view_comment');
INSERT INTO `auth_permission` VALUES (29, 'Can add like', 9, 'add_like');
INSERT INTO `auth_permission` VALUES (30, 'Can change like', 9, 'change_like');
INSERT INTO `auth_permission` VALUES (31, 'Can delete like', 9, 'delete_like');
INSERT INTO `auth_permission` VALUES (32, 'Can view like', 9, 'view_like');
INSERT INTO `auth_permission` VALUES (33, 'Can add collect', 10, 'add_collect');
INSERT INTO `auth_permission` VALUES (34, 'Can change collect', 10, 'change_collect');
INSERT INTO `auth_permission` VALUES (35, 'Can delete collect', 10, 'delete_collect');
INSERT INTO `auth_permission` VALUES (36, 'Can view collect', 10, 'view_collect');
INSERT INTO `auth_permission` VALUES (37, 'Can add post', 7, 'add_post');
INSERT INTO `auth_permission` VALUES (38, 'Can change post', 7, 'change_post');
INSERT INTO `auth_permission` VALUES (39, 'Can delete post', 7, 'delete_post');
INSERT INTO `auth_permission` VALUES (40, 'Can view post', 7, 'view_post');
INSERT INTO `auth_permission` VALUES (41, 'Can add images', 11, 'add_images');
INSERT INTO `auth_permission` VALUES (42, 'Can change images', 11, 'change_images');
INSERT INTO `auth_permission` VALUES (43, 'Can delete images', 11, 'delete_images');
INSERT INTO `auth_permission` VALUES (44, 'Can view images', 11, 'view_images');
INSERT INTO `auth_permission` VALUES (45, 'Can add help', 12, 'add_help');
INSERT INTO `auth_permission` VALUES (46, 'Can change help', 12, 'change_help');
INSERT INTO `auth_permission` VALUES (47, 'Can delete help', 12, 'delete_help');
INSERT INTO `auth_permission` VALUES (48, 'Can view help', 12, 'view_help');
INSERT INTO `auth_permission` VALUES (49, 'Can add images', 13, 'add_images');
INSERT INTO `auth_permission` VALUES (50, 'Can change images', 13, 'change_images');
INSERT INTO `auth_permission` VALUES (51, 'Can delete images', 13, 'delete_images');
INSERT INTO `auth_permission` VALUES (52, 'Can view images', 13, 'view_images');
INSERT INTO `auth_permission` VALUES (53, 'Can add activity', 14, 'add_activity');
INSERT INTO `auth_permission` VALUES (54, 'Can change activity', 14, 'change_activity');
INSERT INTO `auth_permission` VALUES (55, 'Can delete activity', 14, 'delete_activity');
INSERT INTO `auth_permission` VALUES (56, 'Can view activity', 14, 'view_activity');
INSERT INTO `auth_permission` VALUES (57, 'Can add images', 15, 'add_images');
INSERT INTO `auth_permission` VALUES (58, 'Can change images', 15, 'change_images');
INSERT INTO `auth_permission` VALUES (59, 'Can delete images', 15, 'delete_images');
INSERT INTO `auth_permission` VALUES (60, 'Can view images', 15, 'view_images');
INSERT INTO `auth_permission` VALUES (61, 'Can add images', 16, 'add_images');
INSERT INTO `auth_permission` VALUES (62, 'Can change images', 16, 'change_images');
INSERT INTO `auth_permission` VALUES (63, 'Can delete images', 16, 'delete_images');
INSERT INTO `auth_permission` VALUES (64, 'Can view images', 16, 'view_images');
INSERT INTO `auth_permission` VALUES (65, 'Can add goods', 17, 'add_goods');
INSERT INTO `auth_permission` VALUES (66, 'Can change goods', 17, 'change_goods');
INSERT INTO `auth_permission` VALUES (67, 'Can delete goods', 17, 'delete_goods');
INSERT INTO `auth_permission` VALUES (68, 'Can view goods', 17, 'view_goods');
INSERT INTO `auth_permission` VALUES (69, 'Can add message', 18, 'add_message');
INSERT INTO `auth_permission` VALUES (70, 'Can change message', 18, 'change_message');
INSERT INTO `auth_permission` VALUES (71, 'Can delete message', 18, 'delete_message');
INSERT INTO `auth_permission` VALUES (72, 'Can view message', 18, 'view_message');
INSERT INTO `auth_permission` VALUES (73, 'Can add attachment', 19, 'add_attachment');
INSERT INTO `auth_permission` VALUES (74, 'Can change attachment', 19, 'change_attachment');
INSERT INTO `auth_permission` VALUES (75, 'Can delete attachment', 19, 'delete_attachment');
INSERT INTO `auth_permission` VALUES (76, 'Can view attachment', 19, 'view_attachment');
INSERT INTO `auth_permission` VALUES (77, 'Can add room', 20, 'add_room');
INSERT INTO `auth_permission` VALUES (78, 'Can change room', 20, 'change_room');
INSERT INTO `auth_permission` VALUES (79, 'Can delete room', 20, 'delete_room');
INSERT INTO `auth_permission` VALUES (80, 'Can view room', 20, 'view_room');
INSERT INTO `auth_permission` VALUES (81, 'Can add shopping cart', 21, 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES (82, 'Can change shopping cart', 21, 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES (83, 'Can delete shopping cart', 21, 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES (84, 'Can view shopping cart', 21, 'view_shoppingcart');
INSERT INTO `auth_permission` VALUES (85, 'Can add discuss', 22, 'add_discuss');
INSERT INTO `auth_permission` VALUES (86, 'Can change discuss', 22, 'change_discuss');
INSERT INTO `auth_permission` VALUES (87, 'Can delete discuss', 22, 'delete_discuss');
INSERT INTO `auth_permission` VALUES (88, 'Can view discuss', 22, 'view_discuss');
INSERT INTO `auth_permission` VALUES (89, 'Can add shopping cart', 23, 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES (90, 'Can change shopping cart', 23, 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES (91, 'Can delete shopping cart', 23, 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES (92, 'Can view shopping cart', 23, 'view_shoppingcart');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2024-01-01 09:56:14.166716', '2', 'lisi', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (2, '2024-04-07 05:40:16.420227', '2', 'lisi', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"Pic\", \"Friends\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (3, '2024-04-08 06:03:31.115629', '1', '1 - 今天是阴天', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2024-04-09 03:18:19.328084', '3', 'zhangsan', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"Pic\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (5, '2024-04-10 11:32:44.746769', '1', '1 - 找个人帮我送个文件', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (6, '2024-04-10 11:33:21.752086', '2', '2 - 找个人帮忙搬行李', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (7, '2024-04-10 12:05:53.468835', '2', '2 - 找个人帮忙搬行李', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (8, '2024-04-10 12:05:58.439522', '1', '1 - 找个人帮我送个文件', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (9, '2024-04-11 00:44:17.614256', '1', '1 - 周末爬山，3个人最好', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (10, '2024-04-11 00:44:47.224977', '2', '2 - 想去自驾，找几个会开车的小伙伴', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (11, '2024-04-11 00:45:30.583873', '3', '3 - 英雄联盟手游5黑，大师最好', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (12, '2024-04-11 02:12:42.811934', '1', '1 - 水杯，还没用过', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (13, '2024-04-11 02:13:15.073692', '2', '2 - 英语学习资料', 1, '[{\"added\": {}}]', 17, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (14, 'activity', 'activity');
INSERT INTO `django_content_type` VALUES (22, 'activity', 'discuss');
INSERT INTO `django_content_type` VALUES (15, 'activity', 'images');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (19, 'chat', 'attachment');
INSERT INTO `django_content_type` VALUES (18, 'chat', 'message');
INSERT INTO `django_content_type` VALUES (20, 'chat', 'room');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (17, 'goods', 'goods');
INSERT INTO `django_content_type` VALUES (16, 'goods', 'images');
INSERT INTO `django_content_type` VALUES (23, 'goods', 'shoppingcart');
INSERT INTO `django_content_type` VALUES (12, 'help', 'help');
INSERT INTO `django_content_type` VALUES (13, 'help', 'images');
INSERT INTO `django_content_type` VALUES (10, 'post', 'collect');
INSERT INTO `django_content_type` VALUES (8, 'post', 'comment');
INSERT INTO `django_content_type` VALUES (11, 'post', 'images');
INSERT INTO `django_content_type` VALUES (9, 'post', 'like');
INSERT INTO `django_content_type` VALUES (7, 'post', 'post');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (21, 'user', 'shoppingcart');
INSERT INTO `django_content_type` VALUES (6, 'user', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-01-01 07:19:03.677365');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-01-01 07:19:03.741175');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-01-01 07:19:04.079925');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-01-01 07:19:04.149758');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-01-01 07:19:04.154777');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-01-01 07:19:04.161015');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-01-01 07:19:04.178490');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-01-01 07:19:04.181491');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-01-01 07:19:04.186492');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-01-01 07:19:04.190642');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-01-01 07:19:04.196011');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-01-01 07:19:04.209960');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-01-01 07:19:04.215298');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-01-01 07:19:04.219584');
INSERT INTO `django_migrations` VALUES (15, 'user', '0001_initial', '2024-01-01 07:19:04.696547');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2024-01-01 07:19:04.847537');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-01-01 07:19:04.854191');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-01 07:19:04.860790');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2024-01-01 07:19:04.901781');
INSERT INTO `django_migrations` VALUES (20, 'post', '0001_initial', '2024-04-08 05:20:04.025560');
INSERT INTO `django_migrations` VALUES (21, 'post', '0002_post_images', '2024-04-08 05:35:23.396173');
INSERT INTO `django_migrations` VALUES (22, 'post', '0003_remove_post_images_images_post_images', '2024-04-08 06:00:16.210706');
INSERT INTO `django_migrations` VALUES (23, 'post', '0004_alter_images_image', '2024-04-09 02:43:45.855072');
INSERT INTO `django_migrations` VALUES (24, 'user', '0002_alter_userinfo_pic', '2024-04-09 02:43:45.865348');
INSERT INTO `django_migrations` VALUES (25, 'post', '0005_alter_images_image', '2024-04-09 04:34:26.579817');
INSERT INTO `django_migrations` VALUES (26, 'user', '0003_alter_userinfo_pic', '2024-04-09 04:34:26.589041');
INSERT INTO `django_migrations` VALUES (27, 'help', '0001_initial', '2024-04-10 11:30:44.948918');
INSERT INTO `django_migrations` VALUES (28, 'help', '0002_rename_post_images_help_remove_images_status_and_more', '2024-04-10 12:05:36.994735');
INSERT INTO `django_migrations` VALUES (29, 'activity', '0001_initial', '2024-04-11 00:42:42.441063');
INSERT INTO `django_migrations` VALUES (30, 'activity', '0002_alter_images_image', '2024-04-11 01:15:23.069641');
INSERT INTO `django_migrations` VALUES (31, 'goods', '0001_initial', '2024-04-11 01:50:32.600915');
INSERT INTO `django_migrations` VALUES (32, 'chat', '0001_initial', '2024-04-11 03:56:28.210429');
INSERT INTO `django_migrations` VALUES (33, 'activity', '0003_discuss', '2024-04-11 06:57:23.948263');
INSERT INTO `django_migrations` VALUES (34, 'user', '0004_remove_userinfo_friends_shoppingcart', '2024-04-11 06:57:24.056671');
INSERT INTO `django_migrations` VALUES (35, 'goods', '0002_shoppingcart', '2024-04-12 01:20:56.232927');
INSERT INTO `django_migrations` VALUES (36, 'user', '0005_delete_shoppingcart', '2024-04-12 01:20:56.249161');
INSERT INTO `django_migrations` VALUES (37, 'goods', '0003_remove_goods_number_remove_shoppingcart_quantity_and_more', '2024-04-13 08:07:09.116904');
INSERT INTO `django_migrations` VALUES (38, 'user', '0006_userinfo_contact_info', '2024-05-03 11:39:36.637707');
INSERT INTO `django_migrations` VALUES (39, 'user', '0007_remove_userinfo_contact_info', '2024-05-03 11:43:06.495932');
INSERT INTO `django_migrations` VALUES (40, 'help', '0003_images_contact_info', '2024-05-04 03:55:44.307198');
INSERT INTO `django_migrations` VALUES (41, 'help', '0004_remove_images_contact_info_help_contact_info', '2024-05-04 03:55:44.351937');
INSERT INTO `django_migrations` VALUES (42, 'activity', '0004_activity_contact_info', '2024-05-04 09:15:40.612175');
INSERT INTO `django_migrations` VALUES (43, 'goods', '0004_goods_contact_info', '2024-05-04 09:15:40.650970');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1fbk97p2ayn8o8vuzf5d6jdmrbc4uhhb', '.eJxVjEEOgjAQRe_StWnoOEwHl-45QzO0U0ENJBRWxrtrExa6fe_9_zJB9m0Me9E1TMlcjDOnXzZIfOhcRbrLfFtsXOZtnQZbE3vYYvsl6fN6tH8Ho5Sxrjn6hG6AJra5A_ANIUbFjlgBhXJmgoY98ZcSA-qZxLfgHZIwOvP-AMeBNps:1rKCcZ:r5uL4vvSPNJ7-rKnUPkQDoKcZnaSic8kaDlDeMWycg4', '2024-01-15 07:21:59.475795');
INSERT INTO `django_session` VALUES ('44k0wx2esuhcsstewbzdn17ppsyx2b5e', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1rvWj0:nOyuVdIaANNQT11K7HDLbGE68k1lwEFWuOw_Y_Jl3aA', '2024-04-27 06:18:54.199958');
INSERT INTO `django_session` VALUES ('48aeiu3r3jerwp9nsqd1gja4m7ygyz8h', '.eJxVjMsOwiAQRf-FtSEMdBjq0r3fQAaGStXQpI-V8d-1SRe6veec-1KRt7XGbSlzHEWdFaA6_Y6J86O0ncid223SeWrrPCa9K_qgi75OUp6Xw_07qLzUb80gCENHMCBYZ6D4QgDJI4DFIFwkmD6gp2wIO2vJJCb2rg-SyA1OvT_cqjbe:1s3CtF:tQD4-kZS5ymOTNZHoBuFQ6p1e2TDVuDHILykQfkI4eQ', '2024-05-18 10:45:13.757879');
INSERT INTO `django_session` VALUES ('4d5iuojgsqg4rgdwyhtafj8kg7ahepud', 'e30:1ru1wH:JAWVqATt353UTFzK12Ua88uUebT9HGYoY8Yk6mQZPh8', '2024-04-23 03:14:25.026209');
INSERT INTO `django_session` VALUES ('4pi6dcr6ous53kg2ra08o8eo3k3a0isa', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru1xe:hjg9n17rqEu4JXvkZ0wPd7aoxL9w7SryHlcXqI8fOCY', '2024-04-23 03:15:50.925380');
INSERT INTO `django_session` VALUES ('55ja8ngrpz86vkdwfzulttb1ytjh52vt', '.eJxVjMsOwiAQRf-FtSFQaAGX7v0GMjPM2KqBpI-V8d-1SRe6veec-1IZtnXM28Jznoo6K-vU6XdEoAfXnZQ71FvT1Oo6T6h3RR900ddW-Hk53L-DEZbxW8fknfOMPQ2WQ0ApJgZmBDsU9CISwViyIESp7w0P0olNicBz6dg49f4AJvs5KA:1s3C5H:kZbd3ozELgejEFwQICfZUjQMVJOJg7luGzT_dv0eSnQ', '2024-05-18 09:53:35.329698');
INSERT INTO `django_session` VALUES ('5liw5lngh4se74b299wgb08piv5zastq', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1rx2gr:c6JBTtIS21eF_R1MfKuFollqco5Z87QXiEhFGWFWluU', '2024-05-01 10:38:57.942215');
INSERT INTO `django_session` VALUES ('6hnyq5hd6kkoo6fb7h4qe3l8g2sdpe5a', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruPON:znhDhTzWiEIlGbkzD1D11cSFoI7WVdSSSdTnVPLtzUw', '2024-04-24 04:16:59.812370');
INSERT INTO `django_session` VALUES ('83gzghqchhaj8qu9vln4280g0d56wgbw', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1rthaH:9zfkasBFX2Vp3cPNi19nULTiOFgWHBMxfPPAu8PHXv8', '2024-04-22 05:30:21.208376');
INSERT INTO `django_session` VALUES ('88qfjnncvhcjcwe4etcgdehamz9s8k8l', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2Fo:_YNNEDXPSL7I5dHXhZ0ERKTWrTyk0qZe4KTapPuWrZQ', '2024-04-23 03:34:36.014167');
INSERT INTO `django_session` VALUES ('8x465t545hsrijwjlc9at0a2bg2121e2', '.eJxVjMEOwiAQRP-FsyG4LVnq0bvfQHZhkaqBpLQn479Lkx50jm_ezFt52tbstyaLn6O6KKtOv4wpPKXsRXxQuVcdalmXmfWu6KNt-lajvK6H-3eQqeW-TuiiI4dmOMPIEUfDiCIwsaWOBmIgAy5Zm4SHIMkBBEM9iXEyTn2-4_44VA:1rvpX4:IMMC7k59sdNyYWJcKRXl9k4rjnnq_qaNgtjotI64O6E', '2024-04-28 02:23:50.963069');
INSERT INTO `django_session` VALUES ('8y3wjjfmrd2e47pw7a36g0fop4cqdtjr', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru216:BBgRA84iIqoQkO-CWjVf_gxfbME9eIoZzrphK4wb5UM', '2024-04-23 03:19:24.897523');
INSERT INTO `django_session` VALUES ('988gz7awtlnqc384j1qr34llx4ebuldm', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1rti3T:cPWajyfcIUy3ibE4dtA0tUbdNkgiZAgVz-Tg2Tlj-pg', '2024-04-22 06:00:31.575287');
INSERT INTO `django_session` VALUES ('bg719wkpxs8hyqp5zanft222ge0uwcdy', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1rvflr:0RE6bsGjNWZCTrdNBDF09YV3mZE-5G3QROwoJ_APLyQ', '2024-04-27 15:58:27.002020');
INSERT INTO `django_session` VALUES ('c6d1dh95cwtv4lzbi406gtssgj5l91vx', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ru2N1:vM6xtDPysuciKxOTjVXK153uxsPC3JY0dA2hwNB64Yw', '2024-04-23 03:42:03.023868');
INSERT INTO `django_session` VALUES ('cpjza5726shh8npv4gev9h8c7gs177ju', 'e30:1rtRRW:561srmleRxScwr8T_Jlph2zdpBwRKIxH9ANcOc9lxTY', '2024-04-21 12:16:14.418785');
INSERT INTO `django_session` VALUES ('d8ma5h2aruz09he2e2bluls647l53mtm', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru1xo:tjcWruVyxGDR3eozmf5QbtQAMDvbDPrHx9h6Yaeu4sY', '2024-04-23 03:16:00.757036');
INSERT INTO `django_session` VALUES ('e7pijn3sjbiryitfuq6jhc2whidd434g', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1rx2r2:G3mTdXcKDn35vJj7imMEaFtCUEpHzbII4fwHTa8aD-c', '2024-05-01 10:49:28.630186');
INSERT INTO `django_session` VALUES ('ed0uc57jshb3ctbyks27fzpef78s63b3', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruPJt:rol77o2hddPye1SAO-NKLa1DAabLpGudbQQt8CRCThE', '2024-04-24 04:12:21.522866');
INSERT INTO `django_session` VALUES ('er5tr2zbya54i886422obgjse9qj5350', '.eJxVjDsOwyAQBe9CHSEvf1Km9xkQ7EJwEmHJ2FWUu0dILpL2zcx7sxCPvYaj5y0sxK7MscvvliI-cxuAHrHdV45r27cl8aHwk3Y-r5Rft9P9O6ix11EbLBKycwqM9pEmOZlkCWUBW1Alk6VCYcih18I58KAJrCrKChQyGvb5AuCNN1U:1rx3M4:ftXzUmqy5FUzG8Kr5pJwj_gYJzDMkqTaqCHS7NXNA4M', '2024-05-01 11:21:32.272293');
INSERT INTO `django_session` VALUES ('fxxrj9ftu4c9u7fx6myy5wwk963dm1c9', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ruie0:4F0Uln2OSTFbkwarLvDGw2feHVhk7WXSYLJUmPRlf_0', '2024-04-25 00:50:24.428185');
INSERT INTO `django_session` VALUES ('gcop25olkb94pfwk6d2whmf0dlvhv8wa', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1runaw:GGYIyyZRIm_ywQR-dxNxlhYP7Hia9dJlTT2ZC1dgT2U', '2024-04-25 06:07:34.080272');
INSERT INTO `django_session` VALUES ('gu5oz1vg3h35msl5ltj29fq9jthwx4je', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1rtgp4:Z4vDghLk8TxnQLbg45XUbaQGbikf4yKhqldVq5xC6Yc', '2024-04-22 04:41:34.918549');
INSERT INTO `django_session` VALUES ('gwv5xahmhefzyaxfliejo64w67eknb7a', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1rtRhD:VAwpT-To448C1LTFP1lnkOnqjfQjRRzvoZZTfjRiITw', '2024-04-21 12:32:27.681567');
INSERT INTO `django_session` VALUES ('h7jn3jqcj9q2ztpn2wjdhweibpn0bw7s', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1rvrL9:1l5YoM_yRlR7q7ZTBziQrpHahpljuOJVI8Y1nsdTMlI', '2024-04-28 04:19:39.778143');
INSERT INTO `django_session` VALUES ('ilhe5ko1ju0ozn3kinqcp1s6w36x9haw', '.eJxVjMsOwiAQRf-FtSE8Bgou3fsNZBhAqgaS0q6M_65NutDtPefcFwu4rTVsIy9hTuzMLDv9bhHpkdsO0h3brXPqbV3myHeFH3Twa0_5eTncv4OKo35r4cBKA5AjkAYSlFUqWhmjHU4m6iILSVCOBCLIJL3yICbntIVMyWv2_gDIujcM:1rx2zz:xPuyq-KSX15Mc0f3Udwd15v3HvhgXA_YWytardbcQEY', '2024-05-01 10:58:43.564637');
INSERT INTO `django_session` VALUES ('iz5h356xz0x4jf83254neujnotx94fh1', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruUZF:6FGaRF41bBKSi_lrVFBGrUDM9RVEoa9kRuH7jgicRsA', '2024-04-24 09:48:33.704907');
INSERT INTO `django_session` VALUES ('k0vkybyxxjamqywpmi55fjf59viktpcy', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ry3zR:MOhiVK_DBmTiian0bneEuaEU0qDbQTd9cBVpweTkW0s', '2024-05-04 06:14:21.691728');
INSERT INTO `django_session` VALUES ('k4nbqs33gcbhiq51e8ymbob557q0lxbi', '.eJxVjL0OwiAURt-F2RB-L9TR3WcgFy5I1dCktJPx3ZWkgw7f8p2T82IB962Gvec1zMTOzLHT7xcxPXIbgO7YbgtPS9vWOfKh8IN2fl0oPy-H-xeo2OvIgk9-igKkNgqEkqATeBSJvLUonMxOT8LQd9lKX5SSqjhNqIqJBIW9P6ZCNrQ:1rx39u:qMW5ZVYPqJaWp1kCqdSuoorOeiZ5iYeInTVlfv43gys', '2024-05-01 11:08:58.160764');
INSERT INTO `django_session` VALUES ('k59aj94zjsag09b186gi1m68ydv7gm88', '.eJxVjDkOwjAURO_iGlneE1PS5wzWXxwcQI4UJxXi7iRSCiimmfdm3iLBtpa0tbykicVV6CAuvyUCPXM9CD-g3mdJc12XCeWhyJM2OcycX7fT_Tso0Mq-pghKd7rzqBBC37uRRwSjyZAzTGw9ATpWeU9wNirjLXkEMM5S9F58vhkBOEE:1s5Gx7:C7JhM1qXqI9_FVGznsilq3ThBqL3Dv9FV_9YLWBOW2Q', '2024-05-24 03:29:45.955247');
INSERT INTO `django_session` VALUES ('kdcefqpkx7uapxdn199zzfcp2aln7xyy', '.eJxVjDsOwjAQBe_iGlnejTcylPScIdqPQwLIlvKpIu4OkVJA-2bmba7jdRm6dc5TN5q7OAB3-h2F9ZnLTuzB5V691rJMo_hd8Qed_a1afl0P9-9g4Hn41hhaoGQZkFkUWRoyEkQKpCGIpMSgGvHctD2DWRNi0p4wasoRoXXvDwKXN9Q:1s3BsV:n78pb3I34Atep1Q2-lxBQpIKDIhDmBr5ZkcL2dMiAoo', '2024-05-18 09:40:23.448083');
INSERT INTO `django_session` VALUES ('kuaixjhwf2224p59ftxith1n0d65hna3', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ruPMa:7Qx_niCloHtT86G0Ul-KOqerJEaNO5_uaItv10IywLk', '2024-04-24 04:15:08.763949');
INSERT INTO `django_session` VALUES ('l6fwp7p1hgiyk8knkfa9hkj472zglc6o', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1rvfvS:DwRr9jQjXKd-85O5TOIQARGO6HqPmQUwXO4OXqZnCKY', '2024-04-27 16:08:22.557708');
INSERT INTO `django_session` VALUES ('l92w89hth26s11tahnaeqa8do6uh0eeo', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruUYZ:MiQnZ6YjDDu5l01YQ3k8JPaZD48IdXFj2WBNmISO6ss', '2024-04-24 09:47:51.470576');
INSERT INTO `django_session` VALUES ('mal9bf28zy83b5clueem9gtu9eysp15i', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2EZ:Am9Bgrz0-GtRc_0HuceNH-D5yJA7pDeHxsG5PZVtXHc', '2024-04-23 03:33:19.483893');
INSERT INTO `django_session` VALUES ('me96xc8nnts5mf771wemgicbg1xm303n', 'e30:1rv5TA:u7cMz2JlfRGnUw8xgK7n8_Y904k0l8hivF4UmXLNMp0', '2024-04-26 01:12:44.669811');
INSERT INTO `django_session` VALUES ('ni2l2zwieory20we2hqv8uptx5koa4t5', '.eJxVjMEOwiAQRP-FsyG4LVnq0bvfQHZhkaqBpLQn479Lkx50jm_ezFt52tbstyaLn6O6KKtOv4wpPKXsRXxQuVcdalmXmfWu6KNt-lajvK6H-3eQqeW-TuiiI4dmOMPIEUfDiCIwsaWOBmIgAy5Zm4SHIMkBBEM9iXEyTn2-4_44VA:1rvp9j:94KlXaUEyJD1-vIoWl6Vx0e0yAcOKonkk6_y9WcLBZY', '2024-04-28 01:59:43.706966');
INSERT INTO `django_session` VALUES ('oen9ky6gq4q6f0xfpya30kt8xs1hn0g1', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru221:aDkV4COY1bL2Gm1poR9V_X4uRZ3HDc6i3rW3MmC_X0A', '2024-04-23 03:20:21.632507');
INSERT INTO `django_session` VALUES ('p5mg70d1lk0fnmimo7pskv8xxt3wrcpc', '.eJxVjDsOwjAQBe_iGllZ_2JT0nOGaNfexQHkSPlUiLtDpBTQvpl5LzXgttZhW3gexqLOCow6_Y6E-cFtJ-WO7TbpPLV1Hknvij7ooq9T4eflcP8OKi71W2frQkIHUcRaAEviQoHOxJ4Zk1BHviPbsxHnqfTAIkQxJAjWExpS7w8ERDha:1s3C26:SMiuXAO5x_17ECosr81cutX56YJsxnEoXOatMT5c5Sg', '2024-05-18 09:50:18.114325');
INSERT INTO `django_session` VALUES ('pggr0o30fgwdajxn7gdslmrl8jwm40u2', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru13U:rvNngco7T4W6E8AXGAxoqYUr4YfEt32EOOq6KKO0A6g', '2024-04-23 02:17:48.295733');
INSERT INTO `django_session` VALUES ('q6mj9287s4ecb8rqwi85zc9pavsbpkwi', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1rvfwA:bGB1VXyBjtdMi7WtVXfVV18njMrpdhItc-EhEcj6yYQ', '2024-04-27 16:09:06.228224');
INSERT INTO `django_session` VALUES ('q7bckzh9kxv5s7u6apghctao7xy8yjag', '.eJxVjEEOgjAQRe_StWnoOEwHl-45QzO0U0ENJBRWxrtrExa6fe_9_zJB9m0Me9E1TMlcjDOnXzZIfOhcRbrLfFtsXOZtnQZbE3vYYvsl6fN6tH8Ho5Sxrjn6hG6AJra5A_ANIUbFjlgBhXJmgoY98ZcSA-qZxLfgHZIwOvP-AMeBNps:1rKF0L:YXYNtuk0ifmtUEYy_hVt0erW2OdstMjaBmALugTtNrM', '2024-01-15 09:54:41.370811');
INSERT INTO `django_session` VALUES ('qbxztzmchz5q103sjydavvsd4rv61lp4', '.eJxVjMsKwyAQAP_FcxF144Mee-83yOpuatqiEJNT6L8XIYf2OjPMISLuW4l75zUuJK5CK3H5hQnzi-sw9MT6aDK3uq1LkiORp-3y3ojft7P9GxTsZXwhGK8NBmXdBKgcWwyE6LNzOenEZg7WImhSSTuYiJ0CIDNnnyBbFJ8v6sU33w:1rxHBI:V5R-bhrBb0u4KiQT-Vhaybkh3fSt9YDOAT2xnPWWZKo', '2024-05-02 02:07:20.326078');
INSERT INTO `django_session` VALUES ('qrg3a07j6c4fz61jasv8bt2rkwed7pi2', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2Hk:c5npFDhu57So0TOtf8emI3jNaBauM8uh68dy_KXiGzo', '2024-04-23 03:36:36.308902');
INSERT INTO `django_session` VALUES ('r6ni2k45nat8lmx072vyx4ajkw6utpdl', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruUWv:uwwuceegSGMDUqMYi8_KKn2SCWFHLGFHD66hK9yjZgw', '2024-04-24 09:46:09.865462');
INSERT INTO `django_session` VALUES ('rhm2u73s3kai2l2zs4vzucs2eks8xegb', '.eJxVjEEOgjAQRe_StWnoOEwHl-45QzO0U0ENJBRWxrtrExa6fe_9_zJB9m0Me9E1TMlcjDOnXzZIfOhcRbrLfFtsXOZtnQZbE3vYYvsl6fN6tH8Ho5Sxrjn6hG6AJra5A_ANIUbFjlgBhXJmgoY98ZcSA-qZxLfgHZIwOvP-AMeBNps:1roFZs:G8iHRwwu6BE5DYanZCG8j8pWqtMvGRolmuZsdFgeoVM', '2024-04-07 04:35:24.799672');
INSERT INTO `django_session` VALUES ('rkd2dwgn4rw9pyws1um1b8e3ecwlmxgn', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2D5:uBG4GKyDbj8M32V0te2sHUBRz2NL31VpX-wgC5IFynY', '2024-04-23 03:31:47.136071');
INSERT INTO `django_session` VALUES ('rof3n3uvtfr3e75et6q1dglezs3rdi05', 'e30:1rtRRr:fG9NZGIV5_0eC-MKbCebQHdBAUHpxSkf2AM1wuLwZp0', '2024-04-21 12:16:35.650174');
INSERT INTO `django_session` VALUES ('sae2b0vq9nhx0c5yn0lwinwwfq6d9ku8', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru1xd:j3R8WnQVo_WW4O5wn-bWpoumtgAbLkFp_Mle0pCxFV4', '2024-04-23 03:15:49.646791');
INSERT INTO `django_session` VALUES ('sko758el9h9wm5eumzy33e75hzvwzlln', '.eJxVjMsOwiAQRf-FtSG8BoJL934DgZlBqoYmpV0Z_12bdKHbe865L5Hytra0DV7SROIsojj9biXjg_sO6J77bZY493WZitwVedAhrzPx83K4fwctj_atlffOqegVlMAaVUXQlQkwFjAEoQblDDIwaR2sAcsUsOZMxNY6z-L9AdpLODM:1rxJGV:FN7kDSinU-j41UfZ2q1MsaxrC4-d-EZN0t8GXbhes0w', '2024-05-02 04:20:51.743378');
INSERT INTO `django_session` VALUES ('sor9b2pjryck9g8dvh2xx3r6sm6owos8', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru221:aDkV4COY1bL2Gm1poR9V_X4uRZ3HDc6i3rW3MmC_X0A', '2024-04-23 03:20:21.685525');
INSERT INTO `django_session` VALUES ('t97on4uf61nchz140voun5hb91hdcoy3', 'e30:1rtRQH:XWrkPUK56vNvp83WbYzzWpLk77y4JJZdbGePrSAnQIE', '2024-04-21 12:14:57.669467');
INSERT INTO `django_session` VALUES ('tg3qhpl7ql9x7w961j882q7a246fe7uh', '.eJxVjMsOwiAQRf-FtSG8BoJL934DgZlBqoYmpV0Z_12bdKHbe865L5Hytra0DV7SROIsojj9biXjg_sO6J77bZY493WZitwVedAhrzPx83K4fwctj_atlffOqegVlMAaVUXQlQkwFjAEoQblDDIwaR2sAcsUsOZMxNY6z-L9AdpLODM:1rx3qb:OnUzzAupFOWcg9k_gRMVLdd8KL3CpfzNLu5RPKrlnu8', '2024-05-01 11:53:05.917349');
INSERT INTO `django_session` VALUES ('w0ttdgrxtehncylbmuften9x7o18zzso', '.eJxVjMsOwiAQRf-FtSEwvMSl-34DAWaQqoGktCvjv2uTLnR7zzn3xULc1hq2QUuYkV2Y1Oz0O6aYH9R2gvfYbp3n3tZlTnxX-EEHnzrS83q4fwc1jvqti4veCo1gigRtEwlfFCiQGbyxEg1QJmFIEXogl4QCj-CTVVZkJ87s_QHwKTdC:1s3Cqi:qTOQoZCmqVQ_mkhjPpl4kCLIJVSWG-sPcVpTQWxodEs', '2024-05-18 10:42:36.025180');
INSERT INTO `django_session` VALUES ('xnf4viyy41xqyfdyq0k8gc22x8a7svuf', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru1yJ:HwQ02hqxQi4RVrcLUW8wIexWqzkRsbBf--2w35--4Js', '2024-04-23 03:16:31.207188');
INSERT INTO `django_session` VALUES ('xs2x0gtpzlzj9xjj4tis4xm1w827igp7', 'e30:1rv5St:U8ngZ8ZNY-Tz7qApCtkctYcs6OrZQjT9NEqCEOMxeuY', '2024-04-26 01:12:27.431833');
INSERT INTO `django_session` VALUES ('yrqll6j6oajfz7ehfqvni04eknr1c396', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2IY:acffffgdJnPBzey44FcKBbqB6vQHaObhbSzmXWWnCt8', '2024-04-23 03:37:26.186618');
INSERT INTO `django_session` VALUES ('ze91lp8tsbawk5zrjt51814n2n3xcdta', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2G2:rqpXzL018caQc7n3BFlrnG2PNqAvOzN_FEy-ENX6S1A', '2024-04-23 03:34:50.660042');
INSERT INTO `django_session` VALUES ('zfylnjezl3lobq6z9rezwmwmwykbopoc', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1rungd:8fhTSoaanoLgFgpZlDy79b8M6JSOTjC-f5wOGfhkpxw', '2024-04-25 06:13:27.689495');
INSERT INTO `django_session` VALUES ('zjmn5658bn4gatwffpddei55f17g8msi', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1rvTBq:vt2o5SEVuuuNndfdI1V9qRDZwfirHeX7f47B1Bn5ikg', '2024-04-27 02:32:26.735162');
INSERT INTO `django_session` VALUES ('zx01p9udkv9b0buz82wj1b18iirzgfjm', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1rv5UA:wBWMR4g5V-2qjUVGKJYhlKC2SX4zm9ZLSiXGAngm3_o', '2024-04-26 01:13:46.270616');

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods`  (
  `gid` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime(6) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `user_id` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `contact_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `goods_goods_user_id_b4661309_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `goods_goods_user_id_b4661309_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
INSERT INTO `goods_goods` VALUES (1, '水杯，还没用过', '2024-04-11 02:12:42.809812', 22.20, 1, 0, '');
INSERT INTO `goods_goods` VALUES (2, '英语学习资料', '2024-04-11 02:13:15.072689', 12.00, 2, 0, '');
INSERT INTO `goods_goods` VALUES (3, '壁纸', '2024-04-13 03:04:28.388834', 2.99, 4, 0, '');
INSERT INTO `goods_goods` VALUES (5, '收纳盒', '2024-04-14 06:54:33.793293', 38.00, 3, 1, '');
INSERT INTO `goods_goods` VALUES (6, '咖啡', '2024-04-14 06:54:59.587362', 23.00, 3, 0, '');
INSERT INTO `goods_goods` VALUES (7, '插线板', '2024-04-14 06:55:16.701023', 19.00, 3, 1, '');
INSERT INTO `goods_goods` VALUES (8, '化妆品', '2024-04-14 06:55:41.246310', 49.90, 3, 1, '');
INSERT INTO `goods_goods` VALUES (10, '书籍出售', '2024-04-17 11:57:19.962706', 26.30, 9, 1, '');
INSERT INTO `goods_goods` VALUES (11, '全新，低价出售', '2024-04-20 03:59:07.299754', 20.90, 9, 0, '');
INSERT INTO `goods_goods` VALUES (12, '山地自行车，买了两年。', '2024-05-04 09:21:23.242974', 300.00, 4, 1, 'QQ：1502698032');
INSERT INTO `goods_goods` VALUES (13, '售卖书本', '2024-05-04 09:59:23.084193', 12.99, 13, 1, 'QQ：1502698032');

-- ----------------------------
-- Table structure for goods_goods_images
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods_images`;
CREATE TABLE `goods_goods_images`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_id` int NOT NULL,
  `images_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `goods_goods_images_goods_id_images_id_cef9cae2_uniq`(`goods_id` ASC, `images_id` ASC) USING BTREE,
  INDEX `goods_goods_images_images_id_be31ec67_fk_goods_images_id`(`images_id` ASC) USING BTREE,
  CONSTRAINT `goods_goods_images_goods_id_5ad1b6a7_fk_goods_goods_gid` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_goods_images_images_id_be31ec67_fk_goods_images_id` FOREIGN KEY (`images_id`) REFERENCES `goods_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_goods_images
-- ----------------------------

-- ----------------------------
-- Table structure for goods_images
-- ----------------------------
DROP TABLE IF EXISTS `goods_images`;
CREATE TABLE `goods_images`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `goods_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_images_goods_id_d09a40fd_fk_goods_goods_gid`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `goods_images_goods_id_d09a40fd_fk_goods_goods_gid` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_images
-- ----------------------------
INSERT INTO `goods_images` VALUES (1, 'static/goods_pics/cup.jpg', '默认图片', '2024-04-11 10:17:03.000000', 1);
INSERT INTO `goods_images` VALUES (2, 'static/goods_pics/base.jpg', '默认图片', '2024-04-11 10:17:33.000000', 2);
INSERT INTO `goods_images` VALUES (3, 'static/goods_pics/3_4_20240413110428392867.jpg', 'image_0', '2024-04-13 03:04:28.393869', 3);
INSERT INTO `goods_images` VALUES (4, 'static/goods_pics/5_3_20240414145433798760.jpg', 'image_0', '2024-04-14 06:54:33.798760', 5);
INSERT INTO `goods_images` VALUES (5, 'static/goods_pics/6_3_20240414145459591053.jpg', 'image_0', '2024-04-14 06:54:59.591557', 6);
INSERT INTO `goods_images` VALUES (6, 'static/goods_pics/7_3_20240414145516704006.jpg', 'image_0', '2024-04-14 06:55:16.704006', 7);
INSERT INTO `goods_images` VALUES (7, 'static/goods_pics/8_3_20240414145541250973.jpg', 'image_0', '2024-04-14 06:55:41.250973', 8);
INSERT INTO `goods_images` VALUES (9, 'static/goods_pics/10_9_20240417195719965728.jpg', 'image_0', '2024-04-17 11:57:19.965728', 10);
INSERT INTO `goods_images` VALUES (10, 'static/goods_pics/11_9_20240420115907299754.jpg', 'image_0', '2024-04-20 03:59:07.299754', 11);
INSERT INTO `goods_images` VALUES (11, 'static/goods_pics/12_4_20240504172123245975.jpg', 'image_0', '2024-05-04 09:21:23.245975', 12);
INSERT INTO `goods_images` VALUES (12, 'static/goods_pics/13_13_20240504175923088225.jpg', 'image_0', '2024-05-04 09:59:23.088225', 13);

-- ----------------------------
-- Table structure for goods_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `goods_shoppingcart`;
CREATE TABLE `goods_shoppingcart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(10, 2) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `goods_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_shoppingcart_goods_id_dc0a8abb_fk_goods_goods_gid`(`goods_id` ASC) USING BTREE,
  INDEX `goods_shoppingcart_user_id_2b0a6087_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `goods_shoppingcart_goods_id_dc0a8abb_fk_goods_goods_gid` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_shoppingcart_user_id_2b0a6087_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_shoppingcart
-- ----------------------------
INSERT INTO `goods_shoppingcart` VALUES (6, 12.00, '2024-04-14 07:04:07.966133', 2, 3);
INSERT INTO `goods_shoppingcart` VALUES (7, 2.99, '2024-04-14 07:04:22.587893', 3, 3);
INSERT INTO `goods_shoppingcart` VALUES (8, 22.20, '2024-04-14 07:36:02.586126', 1, 3);
INSERT INTO `goods_shoppingcart` VALUES (14, 23.00, '2024-04-17 11:32:24.041329', 6, 8);
INSERT INTO `goods_shoppingcart` VALUES (22, 20.90, '2024-05-04 09:43:01.017309', 11, 11);
INSERT INTO `goods_shoppingcart` VALUES (27, 22.20, '2024-05-10 03:30:50.373983', 1, 16);

-- ----------------------------
-- Table structure for help_help
-- ----------------------------
DROP TABLE IF EXISTS `help_help`;
CREATE TABLE `help_help`  (
  `hid` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `status` int NOT NULL,
  `contact_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`hid`) USING BTREE,
  INDEX `help_help_user_id_70b521ce_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `help_help_user_id_70b521ce_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of help_help
-- ----------------------------
INSERT INTO `help_help` VALUES (1, '帮忙做个图', '2024-04-10 11:32:44.744069', 1, 0, '');
INSERT INTO `help_help` VALUES (2, '找个人帮忙搬行李', '2024-04-10 11:33:21.750085', 3, 0, '');
INSERT INTO `help_help` VALUES (3, '帮忙写作业', '2024-04-10 15:20:03.497612', 4, 0, '');
INSERT INTO `help_help` VALUES (4, '找个人帮我送个文件', '2024-04-10 15:22:38.614605', 4, 1, '');
INSERT INTO `help_help` VALUES (5, '来个同学帮我带一份饭', '2024-04-17 11:12:39.042838', 7, 1, '');
INSERT INTO `help_help` VALUES (6, '找个人帮我带饭', '2024-04-17 11:55:49.017457', 9, 0, '');
INSERT INTO `help_help` VALUES (7, '找个同学帮我带饭', '2024-04-18 02:13:58.278242', 10, 0, '');
INSERT INTO `help_help` VALUES (8, '找个人帮我带杯奶茶', '2024-04-20 07:25:49.096276', 4, 1, '');
INSERT INTO `help_help` VALUES (9, '反反复复', '2024-05-04 03:54:24.812631', 4, 1, '');
INSERT INTO `help_help` VALUES (10, '明天找个拼车搭子', '2024-05-04 09:03:00.321165', 4, 1, '1502698032');
INSERT INTO `help_help` VALUES (11, '明天找个拼车搭子', '2024-05-04 10:00:34.065938', 13, -1, 'QQ：1502698032');
INSERT INTO `help_help` VALUES (12, '租车搭子', '2024-05-04 10:50:25.892973', 15, -1, 'QQ：1502698032');
INSERT INTO `help_help` VALUES (13, '借把伞', '2024-05-10 03:32:09.842413', 16, 0, 'QQ：1502698032');

-- ----------------------------
-- Table structure for help_help_images
-- ----------------------------
DROP TABLE IF EXISTS `help_help_images`;
CREATE TABLE `help_help_images`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `help_id` int NOT NULL,
  `images_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `help_help_images_help_id_images_id_1513b9fd_uniq`(`help_id` ASC, `images_id` ASC) USING BTREE,
  INDEX `help_help_images_images_id_d3e6d5d3_fk_help_images_id`(`images_id` ASC) USING BTREE,
  CONSTRAINT `help_help_images_help_id_112a5349_fk_help_help_hid` FOREIGN KEY (`help_id`) REFERENCES `help_help` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `help_help_images_images_id_d3e6d5d3_fk_help_images_id` FOREIGN KEY (`images_id`) REFERENCES `help_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of help_help_images
-- ----------------------------

-- ----------------------------
-- Table structure for help_images
-- ----------------------------
DROP TABLE IF EXISTS `help_images`;
CREATE TABLE `help_images`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `help_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `help_images_help_id_f47fa1cb_fk_help_help_hid`(`help_id` ASC) USING BTREE,
  CONSTRAINT `help_images_help_id_f47fa1cb_fk_help_help_hid` FOREIGN KEY (`help_id`) REFERENCES `help_help` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of help_images
-- ----------------------------
INSERT INTO `help_images` VALUES (1, 'static/help_img/01.jpg', '手动添加图片', '2024-04-10 20:33:35.000000', 1);
INSERT INTO `help_images` VALUES (2, 'static/help_img/4_4_20240410232238614605.jpg', 'image_0', '2024-04-10 15:22:38.614605', 4);
INSERT INTO `help_images` VALUES (3, 'static/help_img/5_7_20240417191239045865.jpg', 'image_0', '2024-04-17 11:12:39.045865', 5);
INSERT INTO `help_images` VALUES (4, 'static/help_img/6_9_20240417195549021484.jpg', 'image_0', '2024-04-17 11:55:49.021484', 6);
INSERT INTO `help_images` VALUES (5, 'static/help_img/7_10_20240418101358282244.jpg', 'image_0', '2024-04-18 02:13:58.283244', 7);
INSERT INTO `help_images` VALUES (6, 'static/help_img/8_4_20240420152549099259.jpg', 'image_0', '2024-04-20 07:25:49.099259', 8);
INSERT INTO `help_images` VALUES (7, 'static/help_img/10_4_20240504170300321165.jpg', 'image_0', '2024-05-04 09:03:00.321165', 10);
INSERT INTO `help_images` VALUES (8, 'static/help_img/11_13_20240504180034068962.jpg', 'image_0', '2024-05-04 10:00:34.068962', 11);
INSERT INTO `help_images` VALUES (9, 'static/help_img/12_15_20240504185025897005.jpg', 'image_0', '2024-05-04 10:50:25.897005', 12);
INSERT INTO `help_images` VALUES (10, 'static/help_img/13_16_20240510113209845482.jpg', 'image_0', '2024-05-10 03:32:09.845482', 13);

-- ----------------------------
-- Table structure for post_collect
-- ----------------------------
DROP TABLE IF EXISTS `post_collect`;
CREATE TABLE `post_collect`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_collect_user_id_75c7a202_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  INDEX `post_collect_post_id_e6f18935_fk_post_post_pid`(`post_id` ASC) USING BTREE,
  CONSTRAINT `post_collect_post_id_e6f18935_fk_post_post_pid` FOREIGN KEY (`post_id`) REFERENCES `post_post` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_collect_user_id_75c7a202_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_collect
-- ----------------------------
INSERT INTO `post_collect` VALUES (2, '2024-04-10 04:47:32.122576', 3, 1);
INSERT INTO `post_collect` VALUES (5, '2024-04-11 02:54:10.098085', 4, 16);
INSERT INTO `post_collect` VALUES (6, '2024-04-17 11:05:39.774521', 6, 20);
INSERT INTO `post_collect` VALUES (7, '2024-04-17 11:21:48.283042', 8, 1);
INSERT INTO `post_collect` VALUES (8, '2024-04-17 11:53:17.296326', 9, 18);
INSERT INTO `post_collect` VALUES (9, '2024-04-18 02:16:02.065338', 10, 16);
INSERT INTO `post_collect` VALUES (10, '2024-04-18 04:01:29.668786', 10, 1);
INSERT INTO `post_collect` VALUES (12, '2024-04-18 04:23:38.501188', 9, 1);
INSERT INTO `post_collect` VALUES (13, '2024-05-04 10:43:01.441484', 14, 33);

-- ----------------------------
-- Table structure for post_comment
-- ----------------------------
DROP TABLE IF EXISTS `post_comment`;
CREATE TABLE `post_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_comment_user_id_cbfe4e66_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  INDEX `post_comment_post_id_ddc2d815_fk_post_post_pid`(`post_id` ASC) USING BTREE,
  CONSTRAINT `post_comment_post_id_ddc2d815_fk_post_post_pid` FOREIGN KEY (`post_id`) REFERENCES `post_post` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_comment_user_id_cbfe4e66_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_comment
-- ----------------------------
INSERT INTO `post_comment` VALUES (1, '天气不错', '2024-04-10 13:21:37.000000', 3, 1);
INSERT INTO `post_comment` VALUES (2, '起风了', '2024-04-10 06:35:50.924205', 3, 1);
INSERT INTO `post_comment` VALUES (6, '这个周吗', '2024-04-11 07:25:10.754844', 4, 1);
INSERT INTO `post_comment` VALUES (7, '天气真好', '2024-04-17 11:05:47.619805', 6, 20);
INSERT INTO `post_comment` VALUES (8, '真好看', '2024-04-17 11:21:57.680041', 8, 1);
INSERT INTO `post_comment` VALUES (9, '好好', '2024-04-17 11:30:29.970112', 8, 22);
INSERT INTO `post_comment` VALUES (10, '真帅', '2024-04-17 11:48:42.473743', 8, 21);
INSERT INTO `post_comment` VALUES (11, 'zhenghao', '2024-04-18 02:07:56.343418', 10, 1);
INSERT INTO `post_comment` VALUES (12, '你好', '2024-05-04 09:26:50.044991', 4, 29);
INSERT INTO `post_comment` VALUES (13, '你好', '2024-05-04 09:28:35.503316', 4, 29);
INSERT INTO `post_comment` VALUES (14, '真好', '2024-05-04 09:29:19.608554', 4, 29);
INSERT INTO `post_comment` VALUES (15, '啊啊啊啊', '2024-05-04 09:29:59.032438', 4, 29);
INSERT INTO `post_comment` VALUES (16, '啊啊啊啊', '2024-05-04 09:30:02.443079', 4, 29);
INSERT INTO `post_comment` VALUES (17, '啊啊啊啊', '2024-05-04 09:30:04.010235', 4, 29);
INSERT INTO `post_comment` VALUES (18, '丰富', '2024-05-04 09:30:12.345496', 4, 29);
INSERT INTO `post_comment` VALUES (19, '点多的', '2024-05-04 09:31:35.240708', 4, 29);
INSERT INTO `post_comment` VALUES (20, '今天是周末', '2024-05-04 09:41:19.916758', 11, 32);
INSERT INTO `post_comment` VALUES (21, 'zhenhao', '2024-05-04 09:54:27.437550', 13, 21);
INSERT INTO `post_comment` VALUES (22, 'zhanhao', '2024-05-04 10:43:07.983802', 14, 33);
INSERT INTO `post_comment` VALUES (23, 'nihao', '2024-05-04 10:45:46.589279', 15, 33);
INSERT INTO `post_comment` VALUES (24, '加油', '2024-05-10 03:30:10.131633', 16, 36);

-- ----------------------------
-- Table structure for post_images
-- ----------------------------
DROP TABLE IF EXISTS `post_images`;
CREATE TABLE `post_images`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_images_post_id_de04fec2_fk_post_post_pid`(`post_id` ASC) USING BTREE,
  CONSTRAINT `post_images_post_id_de04fec2_fk_post_post_pid` FOREIGN KEY (`post_id`) REFERENCES `post_post` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_images
-- ----------------------------
INSERT INTO `post_images` VALUES (1, '/static/post_img/01.jpg', '无', '2024-04-08 14:06:11.000000', 1);
INSERT INTO `post_images` VALUES (3, 'static/post_img/16_4_20240410185623533129.jpg', 'image_0', '2024-04-10 10:56:23.533129', 16);
INSERT INTO `post_images` VALUES (5, 'static/post_img/20_5_20240414102714211319.jpg', 'image_0', '2024-04-14 02:27:14.211319', 20);
INSERT INTO `post_images` VALUES (6, 'static/post_img/21_3_20240414122110386140.jpg', 'image_0', '2024-04-14 04:21:10.390133', 21);
INSERT INTO `post_images` VALUES (7, 'static/post_img/22_3_20240414171630198511.jpg', 'image_0', '2024-04-14 09:16:30.198511', 22);
INSERT INTO `post_images` VALUES (10, 'static/post_img/29_9_20240417195521313087.jpg', 'image_0', '2024-04-17 11:55:21.314103', 29);
INSERT INTO `post_images` VALUES (11, 'static/post_img/30_10_20240418101323554271.jpg', 'image_0', '2024-04-18 02:13:23.554271', 30);
INSERT INTO `post_images` VALUES (12, 'static/post_img/31_4_20240420171536865065.jpg', 'image_0', '2024-04-20 09:15:36.865065', 31);
INSERT INTO `post_images` VALUES (13, 'static/post_img/31_4_20240420171536876569.jpg', 'image_1', '2024-04-20 09:15:36.876569', 31);
INSERT INTO `post_images` VALUES (14, 'static/post_img/32_4_20240504164118093536.jpg', 'image_0', '2024-05-04 08:41:18.093536', 32);
INSERT INTO `post_images` VALUES (15, 'static/post_img/33_13_20240504175841141792.jpg', 'image_0', '2024-05-04 09:58:41.141792', 33);
INSERT INTO `post_images` VALUES (16, 'static/post_img/34_15_20240504184954509595.jpg', 'image_0', '2024-05-04 10:49:54.509595', 34);
INSERT INTO `post_images` VALUES (17, 'static/post_img/35_15_20240504200222321279.jpg', 'image_0', '2024-05-04 12:02:22.321279', 35);
INSERT INTO `post_images` VALUES (18, 'static/post_img/36_15_20240505161938814643.jpg', 'image_0', '2024-05-05 08:19:38.814643', 36);
INSERT INTO `post_images` VALUES (19, 'static/post_img/37_16_20240510113141532313.jpg', 'image_0', '2024-05-10 03:31:41.532313', 37);

-- ----------------------------
-- Table structure for post_like
-- ----------------------------
DROP TABLE IF EXISTS `post_like`;
CREATE TABLE `post_like`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_like_user_id_82e0cc2b_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  INDEX `post_like_post_id_80ef3233_fk_post_post_pid`(`post_id` ASC) USING BTREE,
  CONSTRAINT `post_like_post_id_80ef3233_fk_post_post_pid` FOREIGN KEY (`post_id`) REFERENCES `post_post` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_like_user_id_82e0cc2b_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_like
-- ----------------------------
INSERT INTO `post_like` VALUES (2, '2024-04-10 04:15:30.360301', 3, 1);
INSERT INTO `post_like` VALUES (9, '2024-04-10 09:48:43.591186', 4, 1);
INSERT INTO `post_like` VALUES (11, '2024-04-10 10:57:42.191918', 4, 16);
INSERT INTO `post_like` VALUES (12, '2024-04-13 16:08:28.268769', 1, 1);
INSERT INTO `post_like` VALUES (13, '2024-04-13 16:08:30.163659', 1, 16);
INSERT INTO `post_like` VALUES (14, '2024-04-14 02:27:23.403020', 5, 20);
INSERT INTO `post_like` VALUES (15, '2024-04-14 09:16:36.329266', 3, 22);
INSERT INTO `post_like` VALUES (16, '2024-04-14 09:16:37.474152', 3, 21);
INSERT INTO `post_like` VALUES (17, '2024-04-17 10:39:04.870503', 4, 20);
INSERT INTO `post_like` VALUES (18, '2024-04-17 10:51:03.992469', 4, 19);
INSERT INTO `post_like` VALUES (19, '2024-04-17 11:05:38.737450', 6, 20);
INSERT INTO `post_like` VALUES (21, '2024-04-17 11:17:28.890949', 7, 1);
INSERT INTO `post_like` VALUES (22, '2024-04-17 11:21:46.645005', 8, 1);
INSERT INTO `post_like` VALUES (23, '2024-04-17 11:30:21.854784', 8, 22);
INSERT INTO `post_like` VALUES (24, '2024-04-17 11:48:30.633617', 8, 21);
INSERT INTO `post_like` VALUES (25, '2024-04-17 11:53:13.699709', 9, 1);
INSERT INTO `post_like` VALUES (26, '2024-04-18 02:07:43.789309', 10, 1);
INSERT INTO `post_like` VALUES (27, '2024-04-18 04:04:22.940106', 10, 16);
INSERT INTO `post_like` VALUES (28, '2024-04-18 04:11:31.152072', 10, 27);
INSERT INTO `post_like` VALUES (29, '2024-04-20 09:22:13.617473', 4, 31);
INSERT INTO `post_like` VALUES (30, '2024-05-04 08:41:21.766736', 4, 32);
INSERT INTO `post_like` VALUES (31, '2024-05-04 09:26:34.247525', 4, 29);
INSERT INTO `post_like` VALUES (32, '2024-05-04 09:40:43.112905', 11, 32);
INSERT INTO `post_like` VALUES (34, '2024-05-04 09:53:53.598788', 13, 32);
INSERT INTO `post_like` VALUES (35, '2024-05-04 10:43:00.320764', 14, 33);
INSERT INTO `post_like` VALUES (36, '2024-05-04 10:45:39.626669', 15, 33);
INSERT INTO `post_like` VALUES (37, '2024-05-05 08:19:18.996431', 15, 35);
INSERT INTO `post_like` VALUES (38, '2024-05-09 03:59:04.642946', 15, 36);
INSERT INTO `post_like` VALUES (39, '2024-05-10 03:29:55.351936', 16, 36);

-- ----------------------------
-- Table structure for post_post
-- ----------------------------
DROP TABLE IF EXISTS `post_post`;
CREATE TABLE `post_post`  (
  `pid` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `post_post_user_id_b9c97aef_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `post_post_user_id_b9c97aef_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_post
-- ----------------------------
INSERT INTO `post_post` VALUES (1, '今天是阴天', '2024-04-08 06:03:31.114630', 1);
INSERT INTO `post_post` VALUES (16, '页面刷新测试', '2024-04-10 10:56:23.529129', 4);
INSERT INTO `post_post` VALUES (18, '没有图片', '2024-04-13 17:41:58.353293', 1);
INSERT INTO `post_post` VALUES (19, '丰富', '2024-04-13 17:42:09.067895', 1);
INSERT INTO `post_post` VALUES (20, '今天天气真好', '2024-04-14 02:27:14.208241', 5);
INSERT INTO `post_post` VALUES (21, '阳光大男孩', '2024-04-14 04:21:10.386140', 3);
INSERT INTO `post_post` VALUES (22, '毕设做完了', '2024-04-14 09:16:30.195051', 3);
INSERT INTO `post_post` VALUES (27, '昨天下雨了', '2024-04-17 11:33:55.910588', 8);
INSERT INTO `post_post` VALUES (29, '起风了', '2024-04-17 11:55:21.311082', 9);
INSERT INTO `post_post` VALUES (30, '下了一晚上的雨', '2024-04-18 02:13:23.550936', 10);
INSERT INTO `post_post` VALUES (31, '今天喝奶茶', '2024-04-20 09:15:36.865065', 4);
INSERT INTO `post_post` VALUES (32, '今天是周六', '2024-05-04 08:41:18.088529', 4);
INSERT INTO `post_post` VALUES (33, '后天答辩', '2024-05-04 09:58:41.138791', 13);
INSERT INTO `post_post` VALUES (34, '马上就要答辩了', '2024-05-04 10:49:54.504061', 15);
INSERT INTO `post_post` VALUES (35, '很好很好', '2024-05-04 12:02:22.316892', 15);
INSERT INTO `post_post` VALUES (36, '明天答辩', '2024-05-05 08:19:38.808318', 15);
INSERT INTO `post_post` VALUES (37, '今天下雨了', '2024-05-10 03:31:41.529313', 16);

-- ----------------------------
-- Table structure for post_post_images
-- ----------------------------
DROP TABLE IF EXISTS `post_post_images`;
CREATE TABLE `post_post_images`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `images_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `post_post_images_post_id_images_id_650fa3ee_uniq`(`post_id` ASC, `images_id` ASC) USING BTREE,
  INDEX `post_post_images_images_id_28813971_fk_post_images_id`(`images_id` ASC) USING BTREE,
  CONSTRAINT `post_post_images_images_id_28813971_fk_post_images_id` FOREIGN KEY (`images_id`) REFERENCES `post_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_post_images_post_id_81d638b3_fk_post_post_pid` FOREIGN KEY (`post_id`) REFERENCES `post_post` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_post_images
-- ----------------------------

-- ----------------------------
-- Table structure for user_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo`;
CREATE TABLE `user_userinfo`  (
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `career` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uid` int NOT NULL AUTO_INCREMENT,
  `pic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userinfo
-- ----------------------------
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$PaeXvrzosbA5JgVIIDFFUH$lxcUSW2XA430Bo4ulbhhtX1LolN6/MczcL1LwUnf3EY=', '2024-04-13 16:09:06.228224', 1, 'zeze', '', '', 'xzx149517@126.com', 1, 1, '2024-01-01 07:19:57.324801', '学生', 1, 'static/user_pics/base.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('123456', '2024-01-01 09:55:00.000000', 0, 'lisi', '', '', '', 0, 1, '2024-01-01 09:55:00.000000', '学生', 2, 'static/user_pics/表情.jpg', NULL, 'lisi');
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$msBsdoRTiez5aE6OLKCM5y$uKqGTcuYOw5W4Fqw6L640kytgFMjLJ/Nuex/Z2d1BkQ=', '2024-04-14 04:19:39.775216', 0, 'zhangsan', '', '', '', 0, 1, '2024-04-07 12:05:00.000000', '学生', 3, 'static/user_pics/3_20240414121959928480.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$nDw71K0Jnc9NTdW86oNL96$sSPxkFLw8Gs1dSBh8KDCZtBhczimW0VKy0mSBDLciIE=', '2024-04-20 06:14:21.691728', 0, 'lli', '', '', '', 0, 1, '2024-04-09 03:40:21.375758', '学生', 4, 'static/user_pics/base.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$8SLhNOiV58yxmPn6d4gJRu$wg081oINuLGAG5cDL/Am4r3Abdt62EH2mpzo0c7P8dM=', '2024-04-14 02:23:50.957039', 0, 'zhangjiu', '', '', '', 0, 1, '2024-04-14 01:58:56.216224', '学生', 5, 'static/user_pics/5_20240414101839024761.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$9reYLPiFkeyFfrbEGYyFb0$4lHwANklysh42Sv+O/buMD7QqgQDqahtPqRaB1Eg5Sw=', '2024-04-17 10:58:43.561636', 0, 'zhangsan1', '', '', '', 0, 1, '2024-04-17 10:58:29.981054', '学生', 6, 'static/user_pics/base.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$Ym6diSmK4skic65pmqZeVu$vi5yi3kEbLQq7tfGH005pvLs2yqaKMCs96CmYXklpAU=', '2024-04-17 11:08:58.157587', 0, 'lisi2', '', '', '', 0, 1, '2024-04-17 11:08:40.700178', '学生', 7, 'static/user_pics/7_20240417190920157182.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$tqjhhsgsS1UzjnZ7i4EG0p$pB1GfBD5XnUhoGMY0o9ZC+ycZ6M6kgKbamaGdC3y86s=', '2024-04-17 11:21:32.269292', 0, 'xiaoli', '', '', '', 0, 1, '2024-04-17 11:21:19.322192', '学生', 8, 'static/user_pics/8_20240417193247653813.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$LjkLLeVU0APPKDDJ0QySxw$eub46ei4ycrYwQLIVGBzJDmNSBXldDdLlwlJCnpAdDQ=', '2024-04-18 04:20:51.743378', 0, 'wangwu2', '', '', '', 0, 1, '2024-04-17 11:52:52.192633', '学生', 9, 'static/user_pics/9_20240417195752615875.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$CKid2FLKo80GKNpdDGRwcY$RZwpxDDsv8VL7qe9HJZB50C64sBm0XmgaFk7TezVamA=', '2024-04-18 02:07:20.321039', 0, 'lisi3', '', '', '', 0, 1, '2024-04-18 02:07:04.472711', '学生', 10, 'static/user_pics/10_20240418101123492798.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$KGQ1YmncLPcwcjOpXq6Pa5$ugTstvNpbG2U0Eyhe7n5Jj9AqajSeYHKzdtnDXaqKN4=', '2024-05-04 09:40:23.445083', 0, 'llili', '', '', '', 0, 1, '2024-05-04 09:40:01.392671', '学生', 11, 'static/user_pics/11_20240504174405434924.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$LBWYEnPRJunNOjdpZmCffk$TlyrWPCiTEPo1wnRQMqZkBpJwDDmwyAiaUNOW1yHJrU=', '2024-05-04 09:53:35.326697', 0, 'zhousan', '', '', '', 0, 1, '2024-05-04 09:53:23.566948', '学生', 13, 'static/user_pics/13_20240504175644933658.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$u1pcuFLEWMJUGGUCuzO2hn$m0bi59SV+L2QaclAr++ubqKQLM5U1Yxw9KEXVlrXiEk=', '2024-05-04 10:42:36.020663', 0, '1112', '', '', '', 0, 1, '2024-05-04 10:42:17.735004', '学生', 14, 'static/user_pics/base.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$cLxtX9kIXyAETTqhPZa7Jr$sKGcSeQbgx6GuNtIUC3aqPX2rn/g6TrjQJyMrM6Mm3U=', '2024-05-04 10:45:13.754878', 0, 'zezemu', '', '', '', 0, 1, '2024-05-04 10:44:51.894138', '学生', 15, 'static/user_pics/15_20240504184756815526.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$fspuwSDd93J8LUpEWadTQX$foWG30gulEjTrPuCYthOEWSfgzBRDv2U/uo0OQtaF9Y=', '2024-05-10 03:29:45.955247', 0, 'wangliu', '', '', '', 0, 1, '2024-05-10 03:29:25.526086', '学生', 16, 'static/user_pics/16_20240510113248704161.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for user_userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo_groups`;
CREATE TABLE `user_userinfo_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userinfo_groups_userinfo_id_group_id_427ab23f_uniq`(`userinfo_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `user_userinfo_groups_group_id_660e8d76_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `user_userinfo_groups_group_id_660e8d76_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userinfo_groups_userinfo_id_80ed863e_fk_user_userinfo_uid` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userinfo_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo_user_permissions`;
CREATE TABLE `user_userinfo_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userinfo_user_permi_userinfo_id_permission_i_8245f325_uniq`(`userinfo_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `user_userinfo_user_p_permission_id_a994ee6a_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `user_userinfo_user_p_permission_id_a994ee6a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userinfo_user_p_userinfo_id_76f2e887_fk_user_user` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userinfo_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
