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

 Date: 11/04/2024 11:06:04
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
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `activity_activity_user_id_0667c221_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `activity_activity_user_id_0667c221_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_activity
-- ----------------------------
INSERT INTO `activity_activity` VALUES (1, '周末爬山，3个人最好', '2024-04-11 00:44:17.613256', 3, 0, 3);
INSERT INTO `activity_activity` VALUES (2, '想去自驾，找几个会开车的小伙伴', '2024-04-11 00:44:47.223976', 4, 0, 1);
INSERT INTO `activity_activity` VALUES (3, '英雄联盟手游5黑，大师最好', '2024-04-11 00:45:30.582869', 5, 1, 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_images
-- ----------------------------
INSERT INTO `activity_images` VALUES (1, 'static/activity_img/game1.jpg', '手动图片添加', '2024-04-11 08:56:41.000000', 3);
INSERT INTO `activity_images` VALUES (2, 'static/activity_img/base.jpg', '默认图片', '2024-04-11 09:18:00.000000', 2);
INSERT INTO `activity_images` VALUES (3, 'static/activity_img/base.jpg', '默认图片', '2024-04-11 09:18:22.000000', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (14, 'activity', 'activity');
INSERT INTO `django_content_type` VALUES (15, 'activity', 'images');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (17, 'goods', 'goods');
INSERT INTO `django_content_type` VALUES (16, 'goods', 'images');
INSERT INTO `django_content_type` VALUES (12, 'help', 'help');
INSERT INTO `django_content_type` VALUES (13, 'help', 'images');
INSERT INTO `django_content_type` VALUES (10, 'post', 'collect');
INSERT INTO `django_content_type` VALUES (8, 'post', 'comment');
INSERT INTO `django_content_type` VALUES (11, 'post', 'images');
INSERT INTO `django_content_type` VALUES (9, 'post', 'like');
INSERT INTO `django_content_type` VALUES (7, 'post', 'post');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `django_session` VALUES ('4d5iuojgsqg4rgdwyhtafj8kg7ahepud', 'e30:1ru1wH:JAWVqATt353UTFzK12Ua88uUebT9HGYoY8Yk6mQZPh8', '2024-04-23 03:14:25.026209');
INSERT INTO `django_session` VALUES ('4pi6dcr6ous53kg2ra08o8eo3k3a0isa', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru1xe:hjg9n17rqEu4JXvkZ0wPd7aoxL9w7SryHlcXqI8fOCY', '2024-04-23 03:15:50.925380');
INSERT INTO `django_session` VALUES ('6hnyq5hd6kkoo6fb7h4qe3l8g2sdpe5a', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruPON:znhDhTzWiEIlGbkzD1D11cSFoI7WVdSSSdTnVPLtzUw', '2024-04-24 04:16:59.812370');
INSERT INTO `django_session` VALUES ('83gzghqchhaj8qu9vln4280g0d56wgbw', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1rthaH:9zfkasBFX2Vp3cPNi19nULTiOFgWHBMxfPPAu8PHXv8', '2024-04-22 05:30:21.208376');
INSERT INTO `django_session` VALUES ('88qfjnncvhcjcwe4etcgdehamz9s8k8l', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2Fo:_YNNEDXPSL7I5dHXhZ0ERKTWrTyk0qZe4KTapPuWrZQ', '2024-04-23 03:34:36.014167');
INSERT INTO `django_session` VALUES ('8y3wjjfmrd2e47pw7a36g0fop4cqdtjr', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru216:BBgRA84iIqoQkO-CWjVf_gxfbME9eIoZzrphK4wb5UM', '2024-04-23 03:19:24.897523');
INSERT INTO `django_session` VALUES ('988gz7awtlnqc384j1qr34llx4ebuldm', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1rti3T:cPWajyfcIUy3ibE4dtA0tUbdNkgiZAgVz-Tg2Tlj-pg', '2024-04-22 06:00:31.575287');
INSERT INTO `django_session` VALUES ('c6d1dh95cwtv4lzbi406gtssgj5l91vx', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ru2N1:vM6xtDPysuciKxOTjVXK153uxsPC3JY0dA2hwNB64Yw', '2024-04-23 03:42:03.023868');
INSERT INTO `django_session` VALUES ('cpjza5726shh8npv4gev9h8c7gs177ju', 'e30:1rtRRW:561srmleRxScwr8T_Jlph2zdpBwRKIxH9ANcOc9lxTY', '2024-04-21 12:16:14.418785');
INSERT INTO `django_session` VALUES ('d8ma5h2aruz09he2e2bluls647l53mtm', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru1xo:tjcWruVyxGDR3eozmf5QbtQAMDvbDPrHx9h6Yaeu4sY', '2024-04-23 03:16:00.757036');
INSERT INTO `django_session` VALUES ('ed0uc57jshb3ctbyks27fzpef78s63b3', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruPJt:rol77o2hddPye1SAO-NKLa1DAabLpGudbQQt8CRCThE', '2024-04-24 04:12:21.522866');
INSERT INTO `django_session` VALUES ('fxxrj9ftu4c9u7fx6myy5wwk963dm1c9', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ruie0:4F0Uln2OSTFbkwarLvDGw2feHVhk7WXSYLJUmPRlf_0', '2024-04-25 00:50:24.428185');
INSERT INTO `django_session` VALUES ('gu5oz1vg3h35msl5ltj29fq9jthwx4je', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1rtgp4:Z4vDghLk8TxnQLbg45XUbaQGbikf4yKhqldVq5xC6Yc', '2024-04-22 04:41:34.918549');
INSERT INTO `django_session` VALUES ('gwv5xahmhefzyaxfliejo64w67eknb7a', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1rtRhD:VAwpT-To448C1LTFP1lnkOnqjfQjRRzvoZZTfjRiITw', '2024-04-21 12:32:27.681567');
INSERT INTO `django_session` VALUES ('iz5h356xz0x4jf83254neujnotx94fh1', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruUZF:6FGaRF41bBKSi_lrVFBGrUDM9RVEoa9kRuH7jgicRsA', '2024-04-24 09:48:33.704907');
INSERT INTO `django_session` VALUES ('kuaixjhwf2224p59ftxith1n0d65hna3', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ruPMa:7Qx_niCloHtT86G0Ul-KOqerJEaNO5_uaItv10IywLk', '2024-04-24 04:15:08.763949');
INSERT INTO `django_session` VALUES ('l92w89hth26s11tahnaeqa8do6uh0eeo', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruUYZ:MiQnZ6YjDDu5l01YQ3k8JPaZD48IdXFj2WBNmISO6ss', '2024-04-24 09:47:51.470576');
INSERT INTO `django_session` VALUES ('mal9bf28zy83b5clueem9gtu9eysp15i', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2EZ:Am9Bgrz0-GtRc_0HuceNH-D5yJA7pDeHxsG5PZVtXHc', '2024-04-23 03:33:19.483893');
INSERT INTO `django_session` VALUES ('oen9ky6gq4q6f0xfpya30kt8xs1hn0g1', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru221:aDkV4COY1bL2Gm1poR9V_X4uRZ3HDc6i3rW3MmC_X0A', '2024-04-23 03:20:21.632507');
INSERT INTO `django_session` VALUES ('pggr0o30fgwdajxn7gdslmrl8jwm40u2', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru13U:rvNngco7T4W6E8AXGAxoqYUr4YfEt32EOOq6KKO0A6g', '2024-04-23 02:17:48.295733');
INSERT INTO `django_session` VALUES ('q7bckzh9kxv5s7u6apghctao7xy8yjag', '.eJxVjEEOgjAQRe_StWnoOEwHl-45QzO0U0ENJBRWxrtrExa6fe_9_zJB9m0Me9E1TMlcjDOnXzZIfOhcRbrLfFtsXOZtnQZbE3vYYvsl6fN6tH8Ho5Sxrjn6hG6AJra5A_ANIUbFjlgBhXJmgoY98ZcSA-qZxLfgHZIwOvP-AMeBNps:1rKF0L:YXYNtuk0ifmtUEYy_hVt0erW2OdstMjaBmALugTtNrM', '2024-01-15 09:54:41.370811');
INSERT INTO `django_session` VALUES ('qrg3a07j6c4fz61jasv8bt2rkwed7pi2', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2Hk:c5npFDhu57So0TOtf8emI3jNaBauM8uh68dy_KXiGzo', '2024-04-23 03:36:36.308902');
INSERT INTO `django_session` VALUES ('r6ni2k45nat8lmx072vyx4ajkw6utpdl', '.eJxVjMsOwiAQRf-FtSE8Bigu3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnAeL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbRwxWKyoGYMTgBsfK-YwQWUEkglyGSMFaM0I2GcizdmjYWWu9VxrE-wPYbDc6:1ruUWv:uwwuceegSGMDUqMYi8_KKn2SCWFHLGFHD66hK9yjZgw', '2024-04-24 09:46:09.865462');
INSERT INTO `django_session` VALUES ('rhm2u73s3kai2l2zs4vzucs2eks8xegb', '.eJxVjEEOgjAQRe_StWnoOEwHl-45QzO0U0ENJBRWxrtrExa6fe_9_zJB9m0Me9E1TMlcjDOnXzZIfOhcRbrLfFtsXOZtnQZbE3vYYvsl6fN6tH8Ho5Sxrjn6hG6AJra5A_ANIUbFjlgBhXJmgoY98ZcSA-qZxLfgHZIwOvP-AMeBNps:1roFZs:G8iHRwwu6BE5DYanZCG8j8pWqtMvGRolmuZsdFgeoVM', '2024-04-07 04:35:24.799672');
INSERT INTO `django_session` VALUES ('rkd2dwgn4rw9pyws1um1b8e3ecwlmxgn', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2D5:uBG4GKyDbj8M32V0te2sHUBRz2NL31VpX-wgC5IFynY', '2024-04-23 03:31:47.136071');
INSERT INTO `django_session` VALUES ('rof3n3uvtfr3e75et6q1dglezs3rdi05', 'e30:1rtRRr:fG9NZGIV5_0eC-MKbCebQHdBAUHpxSkf2AM1wuLwZp0', '2024-04-21 12:16:35.650174');
INSERT INTO `django_session` VALUES ('sae2b0vq9nhx0c5yn0lwinwwfq6d9ku8', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru1xd:j3R8WnQVo_WW4O5wn-bWpoumtgAbLkFp_Mle0pCxFV4', '2024-04-23 03:15:49.646791');
INSERT INTO `django_session` VALUES ('sor9b2pjryck9g8dvh2xx3r6sm6owos8', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru221:aDkV4COY1bL2Gm1poR9V_X4uRZ3HDc6i3rW3MmC_X0A', '2024-04-23 03:20:21.685525');
INSERT INTO `django_session` VALUES ('t97on4uf61nchz140voun5hb91hdcoy3', 'e30:1rtRQH:XWrkPUK56vNvp83WbYzzWpLk77y4JJZdbGePrSAnQIE', '2024-04-21 12:14:57.669467');
INSERT INTO `django_session` VALUES ('xnf4viyy41xqyfdyq0k8gc22x8a7svuf', '.eJxVjLsOAiEURP-F2hAeywKW9n4DuVwusmogWXYr478ryRbaTDHnzLxYgH0rYe-0hiWxM5Ps9NtFwAfVAdId6q1xbHVbl8iHwg_a-bUlel4O9--gQC_fNeHshLGoJWXlnYmogYxN3jnCSes4UgnIcRZqAkLIWWr0yURpwSr2_gD1zjiN:1ru1yJ:HwQ02hqxQi4RVrcLUW8wIexWqzkRsbBf--2w35--4Js', '2024-04-23 03:16:31.207188');
INSERT INTO `django_session` VALUES ('yrqll6j6oajfz7ehfqvni04eknr1c396', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2IY:acffffgdJnPBzey44FcKBbqB6vQHaObhbSzmXWWnCt8', '2024-04-23 03:37:26.186618');
INSERT INTO `django_session` VALUES ('ze91lp8tsbawk5zrjt51814n2n3xcdta', '.eJxVjDsOwjAQBe_iGln-LCympM8ZorV3jQPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFhdlFeH3y1SekjdAN-p3ppOrS7zFPWm6J12PTSW53V3_w4K9fKtDXmJ3jODw2TRUwpi5RzERARjEwA5i4wuGJePLiCfwIIgYM6WglfvD9ofNz4:1ru2G2:rqpXzL018caQc7n3BFlrnG2PNqAvOzN_FEy-ENX6S1A', '2024-04-23 03:34:50.660042');

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods`  (
  `gid` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime(6) NOT NULL,
  `number` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `goods_goods_user_id_b4661309_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `goods_goods_user_id_b4661309_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
INSERT INTO `goods_goods` VALUES (1, '水杯，还没用过', '2024-04-11 02:12:42.809812', 1, 22.20, 1);
INSERT INTO `goods_goods` VALUES (2, '英语学习资料', '2024-04-11 02:13:15.072689', 1, 12.00, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_images
-- ----------------------------
INSERT INTO `goods_images` VALUES (1, 'static/goods_pics/cup.jpg', '默认图片', '2024-04-11 10:17:03.000000', 1);
INSERT INTO `goods_images` VALUES (2, 'static/goods_pics/base.jpg', '默认图片', '2024-04-11 10:17:33.000000', 2);

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
  PRIMARY KEY (`hid`) USING BTREE,
  INDEX `help_help_user_id_70b521ce_fk_user_userinfo_uid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `help_help_user_id_70b521ce_fk_user_userinfo_uid` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of help_help
-- ----------------------------
INSERT INTO `help_help` VALUES (1, '帮忙做个图', '2024-04-10 11:32:44.744069', 1, 1);
INSERT INTO `help_help` VALUES (2, '找个人帮忙搬行李', '2024-04-10 11:33:21.750085', 3, -1);
INSERT INTO `help_help` VALUES (3, '帮忙写作业', '2024-04-10 15:20:03.497612', 4, 0);
INSERT INTO `help_help` VALUES (4, '找个人帮我送个文件', '2024-04-10 15:22:38.614605', 4, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of help_images
-- ----------------------------
INSERT INTO `help_images` VALUES (1, 'static/help_img/01.jpg', '手动添加图片', '2024-04-10 20:33:35.000000', 1);
INSERT INTO `help_images` VALUES (2, 'static/help_img/4_4_20240410232238614605.jpg', 'image_0', '2024-04-10 15:22:38.614605', 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_collect
-- ----------------------------
INSERT INTO `post_collect` VALUES (2, '2024-04-10 04:47:32.122576', 3, 1);
INSERT INTO `post_collect` VALUES (4, '2024-04-10 04:52:22.886558', 3, 2);
INSERT INTO `post_collect` VALUES (5, '2024-04-11 02:54:10.098085', 4, 16);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_comment
-- ----------------------------
INSERT INTO `post_comment` VALUES (1, '天气不错', '2024-04-10 13:21:37.000000', 3, 1);
INSERT INTO `post_comment` VALUES (2, '起风了', '2024-04-10 06:35:50.924205', 3, 1);
INSERT INTO `post_comment` VALUES (3, '搜索', '2024-04-10 10:36:25.044686', 4, 15);
INSERT INTO `post_comment` VALUES (4, '搜索', '2024-04-10 10:36:26.042050', 4, 15);
INSERT INTO `post_comment` VALUES (5, '冲冲冲', '2024-04-10 10:53:16.301316', 4, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_images
-- ----------------------------
INSERT INTO `post_images` VALUES (1, '/static/post_img/01.jpg', '无', '2024-04-08 14:06:11.000000', 1);
INSERT INTO `post_images` VALUES (2, 'static/post_img/15_4_20240410183431672442.jpg', 'image_0', '2024-04-10 10:34:31.672442', 15);
INSERT INTO `post_images` VALUES (3, 'static/post_img/16_4_20240410185623533129.jpg', 'image_0', '2024-04-10 10:56:23.533129', 16);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_like
-- ----------------------------
INSERT INTO `post_like` VALUES (2, '2024-04-10 04:15:30.360301', 3, 1);
INSERT INTO `post_like` VALUES (8, '2024-04-10 05:15:48.124421', 3, 2);
INSERT INTO `post_like` VALUES (9, '2024-04-10 09:48:43.591186', 4, 1);
INSERT INTO `post_like` VALUES (10, '2024-04-10 10:36:20.844378', 4, 15);
INSERT INTO `post_like` VALUES (11, '2024-04-10 10:57:42.191918', 4, 16);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_post
-- ----------------------------
INSERT INTO `post_post` VALUES (1, '今天是阴天', '2024-04-08 06:03:31.114630', 1);
INSERT INTO `post_post` VALUES (2, '今天是4月8号', '2024-04-08 07:35:04.509587', 3);
INSERT INTO `post_post` VALUES (3, '第一次测试', '2024-04-10 09:49:03.050145', 4);
INSERT INTO `post_post` VALUES (15, '修改后', '2024-04-10 10:34:31.659924', 4);
INSERT INTO `post_post` VALUES (16, '页面刷新测试', '2024-04-10 10:56:23.529129', 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userinfo
-- ----------------------------
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$PaeXvrzosbA5JgVIIDFFUH$lxcUSW2XA430Bo4ulbhhtX1LolN6/MczcL1LwUnf3EY=', '2024-04-09 03:16:31.204156', 1, 'zeze', '', '', 'xzx149517@126.com', 1, 1, '2024-01-01 07:19:57.324801', '学生', 1, 'static/user_pics/base.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('123456', '2024-01-01 09:55:00.000000', 0, 'lisi', '', '', '', 0, 1, '2024-01-01 09:55:00.000000', '学生', 2, 'static/user_pics/表情.jpg', NULL, 'lisi');
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$msBsdoRTiez5aE6OLKCM5y$uKqGTcuYOw5W4Fqw6L640kytgFMjLJ/Nuex/Z2d1BkQ=', '2024-04-11 00:50:24.423181', 0, 'zhangsan', '', '', '', 0, 1, '2024-04-07 12:05:00.000000', '学生', 3, 'static/user_pics/01.jpg', NULL, NULL);
INSERT INTO `user_userinfo` VALUES ('pbkdf2_sha256$720000$nDw71K0Jnc9NTdW86oNL96$sSPxkFLw8Gs1dSBh8KDCZtBhczimW0VKy0mSBDLciIE=', '2024-04-10 09:48:33.704907', 0, 'lli', '', '', '', 0, 1, '2024-04-09 03:40:21.375758', '学生', 4, 'static/user_pics/base.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for user_userinfo_friends
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo_friends`;
CREATE TABLE `user_userinfo_friends`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_userinfo_id` int NOT NULL,
  `to_userinfo_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userinfo_friends_from_userinfo_id_to_user_11e977ac_uniq`(`from_userinfo_id` ASC, `to_userinfo_id` ASC) USING BTREE,
  INDEX `user_userinfo_friend_to_userinfo_id_58c6f5d9_fk_user_user`(`to_userinfo_id` ASC) USING BTREE,
  CONSTRAINT `user_userinfo_friend_from_userinfo_id_c4902de2_fk_user_user` FOREIGN KEY (`from_userinfo_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userinfo_friend_to_userinfo_id_58c6f5d9_fk_user_user` FOREIGN KEY (`to_userinfo_id`) REFERENCES `user_userinfo` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userinfo_friends
-- ----------------------------
INSERT INTO `user_userinfo_friends` VALUES (1, 2, 2);

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
